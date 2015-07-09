grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode ;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

abstract production lambdaExpr
e::Expr ::= captured::EnvNameList paramType::TypeName param::Name res::Expr
{
  local localErrs :: [Message] =
    (if !null(lookupValue("_closure", e.env)) then []
     else [err(e.location, "Closures require closure.h to be included.")]) ++
    captured.errors ++ res.errors;
  
  e.typerep =
    closureType(
      paramType.typerep,
      res.typerep,
      case lookupTag("_closure", e.env) of
        enumTagItem(_) :: _ -> error("Expected _closure to be a struct")
      | refIdTagItem(_, refId) :: _ -> refId
      | _ -> "undefined _closure"
      end);
  
  res.env =
    addEnv(
      valueDef(
        param.name,
        parameterValueItem(
          decorate
            parameterDecl(
              [],
              directTypeExpr(paramType.typerep),
              baseTypeExpr(),
              justName(param),
              []) with {env = e.env;})) :: 
      valueDef(
        param.name,
        parameterValueItem(
          decorate
            parameterDecl(
              [],
              directTypeExpr(builtinType([], voidType())),
              pointerTypeExpr([], pointerTypeExpr([], baseTypeExpr())),
              justName(name("_env", location=builtIn())),
              []) with {env = e.env;})) :: captured.defs,
    emptyEnv());
  
  local fnDecl::FunctionDecl =
    functionDecl(
     [],
     [],
     directTypeExpr(res.typerep),
     functionTypeExprWithArgs(
       baseTypeExpr(),
       consParameters(
         parameterDecl(
           [],
           directTypeExpr(paramType.typerep),
           baseTypeExpr(),
           justName(param),
           []),
         consParameters(
           parameterDecl(
             [],
             directTypeExpr(builtinType([], voidType())),
             pointerTypeExpr([], pointerTypeExpr([], baseTypeExpr())),
             justName(name("_env", location=builtIn())),
             []),
           nilParameters())),
       false),
     name("_fn", location=builtIn()),
     [],
     nilDecl(),
     foldStmt([
       captured.envCopyOutTrans,
       declStmt(
          variableDecls(
            [],
            [],
            directTypeExpr(res.typerep),
            consDeclarator(
              declarator(
                name("_result", location=builtIn()),
                baseTypeExpr(),
                [],
                justInitializer(exprInitializer(res))),
              nilDeclarator()))),
       --captured.envCopyInTrans, -- Not needed, as everything is either a const pointer or a const
       returnStmt(
         justExpr(
           declRefExpr(
             name("_result", location=builtIn()),
             location=builtIn())))]));
  
  forwards to 
    if null(localErrs) then
      fwrd
    else
      errorExpr(localErrs, location=e.location);
  
  local fwrd::Expr =
    stmtExpr(
      foldStmt([
        declStmt(functionDeclaration(fnDecl)),
        declStmt(
          variableDecls(
            [],
            [],
            directTypeExpr(builtinType([], voidType())),
            consDeclarator(
              declarator(
                name("_env", location=builtIn()),
                pointerTypeExpr([], pointerTypeExpr([], baseTypeExpr())),
                [],
                justInitializer(
                  exprInitializer(
                    txtExpr(
                      "(void **)GC_malloc(sizeof(void *) * " ++ toString(captured.len) ++ ")", --TODO
                      location=builtIn())))),
              nilDeclarator()))),
        captured.envAllocTrans,
        captured.envCopyInTrans,
        declStmt(
          variableDecls(
            [],
            [],
            typedefTypeExpr(
              [],
              name("_closure", location=builtIn())),
            consDeclarator(
              declarator(
                name("_result", location=builtIn()),
                baseTypeExpr(),
                [],
                nothingInitializer()),
              nilDeclarator()))),
        txtStmt("_result.env = _env;"), --TODO
        txtStmt("_result.fn = _fn;")]), --TODO
      declRefExpr(
        name("_result", location=builtIn()),
        location=builtIn()),
      location=builtIn());
}

nonterminal EnvNameList with env, defs, errors;

synthesized attribute envAllocTrans::Stmt occurs on EnvNameList;   -- gc mallocs env slots
synthesized attribute envCopyInTrans::Stmt occurs on EnvNameList;  -- Copys env vars into _env
synthesized attribute envCopyOutTrans::Stmt occurs on EnvNameList; -- Copys _env out to vars

synthesized attribute len::Integer occurs on EnvNameList; -- Also uses for indexing

abstract production consEnvNameList
top::EnvNameList ::= n::Name rest::EnvNameList
{
  top.errors :=
    case lookupValue(n.name, top.env) of
      [] -> [err(n.location, n.name ++ " not in scope")]
    | _ -> []
    end ++ rest.errors;

  local varBaseTypeExpr::BaseTypeExpr =
    case lookupValue(n.name, top.env) of
      [] -> errorTypeExpr([err(n.location, n.name ++ " not in scope")])
    | v :: _ -> directTypeExpr(v.typerep)
    end; --TODO
  
  local envAccess::Expr =
    unaryOpExpr(
      dereferenceOp(location=builtIn()),
      explicitCastExpr(
        typeName(
          varBaseTypeExpr,
          pointerTypeExpr(
            [],
            baseTypeExpr())),
        arraySubscriptExpr(
          declRefExpr(
            name("_env", location=builtIn()),
            location=builtIn()),
          realConstant(
            integerConstant(
              toString(rest.len),
              false,
              noIntSuffix(),
              location=builtIn()),
            location=builtIn()),
          location=builtIn()),
        location=builtIn()),
      location=builtIn());

  local varDecl::Declarator =
    declarator(
      n,
      baseTypeExpr(),
      [],
      justInitializer(exprInitializer(envAccess)));
  
  top.defs =
    valueDef(
      n.name,
      declaratorValueItem(
        decorate
          declarator(
            n,
            baseTypeExpr(),
            [],
            nothingInitializer())
        with {env = top.env;
              baseType = attatchQualifiers([constQualifier()], n.valueItem.typerep);
              givenAttributes = [];
              isTopLevel = false;
              isTypedef = false;})) ::
    rest.defs;
  
  top.envAllocTrans =
    seqStmt(
      txtStmt("_env[" ++ toString(rest.len) ++ "] = (void *)GC_malloc(sizeof(void *));"), -- TODO
      rest.envAllocTrans);
  
  top.envCopyInTrans =
    seqStmt(
      exprStmt(
        binaryOpExpr(
          envAccess,
          assignOp(
            eqOp(location=builtIn()),
            location=builtIn()),
          declRefExpr(n, location=builtIn()),
        location=builtIn())),
      rest.envCopyInTrans);
  
  top.envCopyOutTrans =
    seqStmt(
      declStmt(variableDecls([], [], varBaseTypeExpr, consDeclarator(varDecl, nilDeclarator()))),
      rest.envCopyOutTrans);
  
  top.len = rest.len + 1;
}

abstract production nilEnvNameList
top::EnvNameList ::=
{
  top.errors := [];
  
  top.defs = [];  
  top.envCopyInTrans = nullStmt();
  top.envAllocTrans = nullStmt();
  top.envCopyOutTrans = nullStmt();
  top.len = 0;
}

{-
 - Adds qualifiers to a type
 -}
abstract production attatchQualifiers
top::Type ::= q::[Qualifier]  target::Type
{
  top.lpp = concat([ target.lpp, space(), ppImplode( space(), map( (.pp), q ) ) ]);
  top.rpp = target.rpp;
  top.withoutTypeQualifiers = target;
  
  forwards to target;
}

{-
 - New location for expressions which don't have real locations
 -}
abstract production builtIn
top::Location ::=
{
  forwards to loc("Built In", 0, 0, 0, 0, 0, 0);
}