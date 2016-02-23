grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode ;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:overload;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

imports edu:umn:cs:melt:exts:ableC:gc;

import silver:util:raw:treemap as tm;

abstract production lambdaExpr
e::Expr ::= captured::EnvNameList params::Parameters res::Expr
{
  -- TODO: Replace the use of location index as a unique name creation
  -- mechanism once we have a better way to create unique names.
  forwards to lambdaExpr_i(captured, params, res, e.location.index, location=e.location);
}

abstract production lambdaExpr_i
e::Expr ::= captured::EnvNameList params::Parameters res::Expr fnNum::Integer
{

  local localErrs::[Message] =
    (if !null(lookupValue("_closure", e.env)) then []
     else [err(e.location, "Closures require closure.h to be included.")]) ++
    captured.errors ++ res.errors;
  
  e.globalDecls :=
    params.globalDecls ++
    (if null(localErrs)
     then [pair(theName, functionDeclaration(fnDecl))]
     else []);
  
  e.typerep = closureType([], params.typereps, res.typerep);
  
  local paramNames::[Name] = map(name(_, location=builtIn()), map(fst, foldr(append, [], map((.valueContribs), params.defs))));
  captured.freeVariablesIn = removeAllBy(nameEq, paramNames, removeDuplicateNames(res.freeVariables));
  
  res.env = addEnv(params.defs ++ captured.defs ++ tagRefIdTypeItems, emptyEnv());
  
  res.returnType = just(res.typerep);
  
  local tagRefIdTypeItems::[Def] =
    doubleMap(
      tagDef,
      tagItemNames,
      foldr(
        append,
        [],
        map(
          lookupTag(_, e.env),
          tagItemNames))) ++
    doubleMap(
      refIdDef,
      refIdItemNames,
      foldr(
        append,
        [],
        map(
          lookupRefId(_, e.env),
          refIdItemNames))) ++
    doubleMap(
      valueDef,
      typeValueItemNames,
      foldr(
        append,
        [],
        map(
          lookupValue(_, e.env),
          typeValueItemNames)));
  
  local tagItemNames::[String] =
    removeDuplicatesBy(
      stringEq,
      map(
        fst,
        foldr(
          append,
          [],
          map(
            tm:toList,
            e.env.tags))));
            
  local refIdItemNames::[String] =
    removeDuplicatesBy(
      stringEq,
      map(
        fst,
        foldr(
          append,
          [],
          map(
            tm:toList,
            e.env.refIds))));
            
  local typeValueItemNames::[String] =
    removeDuplicatesBy(
      stringEq,
      map(
        fst,
        filter(
          isItemTypedef,
          foldr(
            append,
            [],
            map(
              tm:toList,
              e.env.values)))));
  
  local theName::String = "_fn_" ++ toString(fnNum); 
  local fnName::Name = name(theName, location=builtIn());
  
  local fnDecl::FunctionDecl =
    functionDecl(
      [staticStorageClass()],
      [],
      directTypeExpr(res.typerep),
      functionTypeExprWithArgs(
        baseTypeExpr(),
        consParameters(
          parameterDecl(
            [],
            directTypeExpr(builtinType([], voidType())),
            pointerTypeExpr([], pointerTypeExpr([], baseTypeExpr())),
            justName(name("_env", location=builtIn())),
            []),
          params),
        false),
      fnName,
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
                justInitializer(
                  exprInitializer(
                    txtExpr(
                      "(_closure)GC_malloc(sizeof(struct _closure_s))", --TODO
                      location=builtIn())))),
              nilDeclarator()))),
        txtStmt("_result->env = _env;"), --TODO
        txtStmt(s"_result->fn = ${theName};"), -- TODO
        txtStmt(s"_result->fn_name = \"${theName}\";")]), --TODO
      declRefExpr(
        name("_result", location=builtIn()),
        location=builtIn()),
      location=builtIn());
}

nonterminal EnvNameList with env, defs, errors;

synthesized attribute envAllocTrans::Stmt occurs on EnvNameList;   -- gc mallocs env slots
synthesized attribute envCopyInTrans::Stmt occurs on EnvNameList;  -- Copys env vars into _env
synthesized attribute envCopyOutTrans::Stmt occurs on EnvNameList; -- Copys _env out to vars

synthesized attribute len::Integer occurs on EnvNameList; -- Also used for indexing

inherited attribute freeVariablesIn::[Name] occurs on EnvNameList;

abstract production consEnvNameList
top::EnvNameList ::= n::Name rest::EnvNameList
{
  top.errors :=
    n.valueLookupCheck ++
    (if skipDef then [wrn(n.location, n.name ++ " cannot be captured")] else []) ++
    rest.errors;
  
  -- If true, then don't generate load/store code for this variable
  local skip::Boolean = 
    case n.valueItem.typerep of
      functionType(_, _) -> true
    | noncanonicalType(_) -> false -- TODO
    | tagType(_, refIdTagType(_, sName, _)) -> null(lookupRefId(sName, top.env))
    | pointerType(_, functionType(_, _)) -> true -- Temporary hack until pp for function pointer variable defs is fixed
    | _ -> false
    end || n.name == "_env";
    
  -- If true, then don't capture this variable, even if though it is in the capture list
  local skipDef::Boolean = 
    case n.valueItem.typerep of
      noncanonicalType(_) -> false -- TODO
    | tagType(_, refIdTagType(_, sName, _)) -> null(lookupRefId(sName, top.env))
    | pointerType(_, functionType(_, _)) -> true -- Temporary hack until pp for function pointer variable defs is fixed
    | _ -> false
    end || n.name == "_env";

  local varBaseType::Type =
    if !null(n.valueLookupCheck)
    then errorType()
    else case n.valueItem.typerep of
           arrayType(t, _, _, _) -> pointerType([], t) -- Arrays get turned into pointers
         | t -> t
         end;
        
  local varBaseTypeExpr::BaseTypeExpr =
    if !null(n.valueLookupCheck)
    then errorTypeExpr(n.valueLookupCheck)
    else directTypeExpr(varBaseType);
    
  local isFunction::Boolean =
    case n.valueItem.typerep of
      functionType(_, _) -> true
    | _ -> false
    end;
    
  local isFunctionWithBody::Boolean =
    case n.valueItem of
      functionValueItem(functionDecl(_, _, _, _, _, _, _, _)) -> true
    | _ -> false
    end;
    
  local isNestedFunction::Boolean =
    case n.valueItem of
      functionValueItem(nestedFunctionDecl(_, _, _, _, _, _, _, _)) -> true
    | _ -> false
    end;
  
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
    if skipDef then rest.defs else
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
                baseType = addQualifiers([constQualifier()], varBaseType);
                givenAttributes = [];
                isTopLevel = false;
                isTypedef = false;
                returnType = error("returnType demanded by declarator in declaratorValueItem");})) ::
      rest.defs;
  
  top.envAllocTrans =
    if skip then rest.envAllocTrans else
      seqStmt(
        rest.envAllocTrans,
        txtStmt("_env[" ++ toString(rest.len) ++ "] = (void *)GC_malloc(sizeof(void *));")); -- TODO
  
  top.envCopyInTrans =
    if skip then rest.envCopyInTrans else
      seqStmt(
        rest.envCopyInTrans,
        exprStmt(
          binaryOpExpr(
            envAccess,
            assignOp(
              eqOp(location=builtIn()),
              location=builtIn()),
            declRefExpr(n, location=builtIn()),
          location=builtIn())));
  
  top.envCopyOutTrans =
    if skipDef || (isFunction && (!isFunctionWithBody || (isFunctionWithBody && !isNestedFunction))) then rest.envCopyOutTrans else
      seqStmt(
        rest.envCopyOutTrans,
        case n.valueItem of
          functionValueItem(functionDecl(_, fnquals, bty, mty, n, attrs, dcls, body)) ->
            declStmt(functionDeclaration(functionDecl([], fnquals, bty, mty, n, attrs, dcls, body)))
        | _ -> declStmt(variableDecls([], [], varBaseTypeExpr, consDeclarator(varDecl, nilDeclarator())))
        end);
  
  top.len = if skip || isNestedFunction then rest.len else rest.len + 1;
      
  rest.freeVariablesIn = error("freeVariablesIn demanded by tail of capture list");
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

abstract production envContents
top::EnvNameList ::=
{
  top.errors := []; -- Ignore warnings about variables being excluded
  
  local contents::[Name] =
    map(
      name(_, location=builtIn()),
      removeDuplicatesBy(
        stringEq,
        map(
          fst,
          filter(
            isNotItemTypedef,
            foldr(
              append,
              [],
              map(
                tm:toList,
                top.env.values))))));
  
  forwards to foldr(consEnvNameList, nilEnvNameList(), contents);
}

abstract production exprFreeVariables
top::EnvNameList ::=
{
  top.errors := []; -- Ignore warnings about variables being excluded
  
  -- Have to use envContents for defs to avoid circular dependency of body freeVariables on generated env
  top.defs =
    decorate envContents()
    with {env = top.env;
          freeVariablesIn = error("Free variables demanded by envContents");}.defs;
  
  local contents::[Name] = removeDuplicateNames(top.freeVariablesIn);
  
  forwards to foldr(consEnvNameList, nilEnvNameList(), contents);
}

function isItemTypedef
Boolean ::= i::Pair<String ValueItem>
{
  return i.snd.isItemTypedef;
}

function isNotItemTypedef
Boolean ::= i::Pair<String ValueItem>
{
  return !i.snd.isItemTypedef;
}

function fst
a ::= x::Pair<a b>
{
  return x.fst;
}

function removeDuplicatesBy
[a] ::= eq::(Boolean ::= a a) l::[a]
{
  return if null(l)
         then []
         else if containsBy(eq, head(l), tail(l))
         then removeDuplicatesBy(eq, tail(l))
         else head(l) :: removeDuplicatesBy(eq, tail(l));
}

function doubleMap
[a] ::= f::(a ::= b c) l1::[b] l2::[c]
{
  return if null(l1) || null(l2)
         then []
         else f(head(l1), head(l2)) :: doubleMap(f, tail(l1), tail(l2));
}

{-
 - New location for expressions which don't have real locations
 -}
abstract production builtIn
top::Location ::=
{
  forwards to loc("Built In", 0, 0, 0, 0, 0, 0);
}
