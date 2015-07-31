grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode ;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

imports edu:umn:cs:melt:exts:ableC:gc;

import silver:util:raw:treemap as tm;

abstract production lambdaExpr
e::Expr ::= captured::EnvNameList paramType::TypeName param::Name res::Expr
{
  local localErrs :: [Message] =
    (if !null(lookupValue("_closure", e.env)) then []
     else [err(e.location, "Closures require closure.h to be included.")]) ++
    captured.errors ++ res.errors;
    
  e.globalDecls := pair(fnName.name, functionDeclaration(fnDecl)) :: forward.globalDecls;
  
  e.typerep =
    closureType(
      [],
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
      captured.defs ++ tagRefIdTypeItems,
    emptyEnv());
  
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
              
  local fnName::Name = name(s"_fn_${toString(genInt())}", location=builtIn());
  
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
                      "(_closure)GC_malloc(sizeof(_closure_s))", --TODO
                      location=builtIn())))),
              nilDeclarator()))),
        txtStmt("_result->env = _env;"), --TODO
        txtStmt(s"_result->fn = ${fnName.name};"), -- TODO
        txtStmt(s"_result->fn_name = \"${fnName.name}\";")]), --TODO
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
  top.errors := n.valueLookupCheck ++ rest.errors;
  
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
                isTypedef = false;})) ::
      rest.defs;
  
  top.envAllocTrans =
    if skip then rest.envAllocTrans else
      seqStmt(
        txtStmt("_env[" ++ toString(rest.len) ++ "] = (void *)GC_malloc(sizeof(void *));"), -- TODO
        rest.envAllocTrans);
  
  top.envCopyInTrans =
    if skip then rest.envCopyInTrans else
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
    if skip then rest.envCopyOutTrans else
      seqStmt(
        declStmt(variableDecls([], [], varBaseTypeExpr, consDeclarator(varDecl, nilDeclarator()))),
        rest.envCopyOutTrans);
  
  top.len = if skip then rest.len else rest.len + 1;
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