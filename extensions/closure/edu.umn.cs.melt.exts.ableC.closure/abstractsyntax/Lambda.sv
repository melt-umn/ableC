grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode ;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction:parsing;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:overload;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

imports edu:umn:cs:melt:exts:ableC:gc;

import silver:util:raw:treemap as tm;

global builtin::Location = builtinLoc("closure");

abstract production lambdaExpr
top::Expr ::= captured::CaptureList params::Parameters res::Expr
{
  propagate substituted;
  top.pp = pp"lambda {${captured.pp}} (${ppImplode(text(", "), params.pps)}) . (${res.pp})";

  local localErrors::[Message] =
    (if !null(lookupValue("GC_malloc", top.env)) then []
     else [err(top.location, "Closures require <gc.h> to be included.")]) ++
    captured.errors ++ params.errors ++ res.errors;
  
  top.typerep = closureType([], params.typereps, res.typerep);
  
  local paramNames::[Name] = map(name(_, location=builtin), map(fst, foldr(append, [], map((.valueContribs), params.defs))));
  captured.freeVariablesIn = removeAllBy(nameEq, paramNames, removeDuplicateNames(res.freeVariables));
  captured.globalEnv = addEnv(params.defs, globalEnv(top.env));
  
  res.env = addEnv(params.defs, openScope(top.env));
  res.returnType = just(res.typerep);
  
  local id::String = toString(genInt()); 
  local envStructName::String = s"_lambda_env_${id}_s";
  local funName::String = s"_lambda_fn_${id}";
  
  captured.structNameIn = envStructName;
  
  local envStructDcl::Decl =
    typeExprDecl(
      [],
      structTypeExpr(
        [],
        structDecl(
          [],
          justName(name(envStructName, location=builtin)),
          captured.envStructTrans,
          location=builtin)));
  
  local funDcl::Decl =
    subDecl(
      [typedefSubstitution("__res_type__", res.typerep),
       parametersSubstitution("__params__", params),
       stmtSubstitution("__env_copy__", captured.envCopyOutTrans),
       declRefSubstitution("__result__", res)],
      decls(
        parseDecls(s"""
proto_typedef __res_type__, __params__;
static __res_type__ ${funName}(void *_env_ptr, __params__) {
  struct ${envStructName} _env = *(struct ${envStructName}*)_env_ptr;
  __env_copy__;
  return __result__;
}
""")));
  
  local globalDecls::[Pair<String Decl>] =
    mkClosureStructGlobalDecls(params.typereps, res.typerep) ++
    [pair(envStructName, envStructDcl), pair(funName, funDcl)];

  local fwrd::Expr =
    subExpr(
      [typedefSubstitution("__closure_type__", top.typerep),
       stmtSubstitution("__env_copy__", captured.envCopyInTrans)],
      parseExpr(s"""
({proto_typedef __closure_type__;
  struct ${envStructName} _env;
  __env_copy__;
  
  struct ${envStructName} *_env_ptr = GC_malloc(sizeof(struct ${envStructName}));
  *_env_ptr = _env;
  
  __closure_type__ _result;
  _result.fn_name = "${funName}";
  _result.env = (void*)_env_ptr;
  _result.fn = ${funName};
  _result;})
"""));
  
  forwards to mkErrorCheck(localErrors, injectGlobalDeclsExpr(globalDecls, fwrd, location=top.location));
}

nonterminal CaptureList with env, pp, errors;

synthesized attribute envStructTrans::StructItemList occurs on CaptureList;
synthesized attribute envCopyInTrans::Stmt occurs on CaptureList;  -- Copys env vars into _env
synthesized attribute envCopyOutTrans::Stmt occurs on CaptureList; -- Copys _env out to vars

autocopy attribute globalEnv::Decorated Env occurs on CaptureList;
autocopy attribute freeVariablesIn::[Name] occurs on CaptureList;
autocopy attribute structNameIn::String occurs on CaptureList;

abstract production consCaptureList
top::CaptureList ::= n::Name rest::CaptureList
{
  top.pp =
    case rest of
      nilCaptureList() -> pp"${n.pp}"
    | _ -> pp"${n.pp}, ${rest.pp}"
    end;
  
  top.errors := n.valueLookupCheck ++ rest.errors;

  -- Strip qualifiers and convert arrays and functions to pointers
  local varType::Type =
    case n.valueItem.typerep.withoutTypeQualifiers of
      arrayType(elem, _, _, _) -> pointerType([], elem)
    | functionType(res, sub) ->
        pointerType([], noncanonicalType(parenType(functionType(res, sub))))
    | t -> t
    end;
  
  -- If true, then this variable is in scope for the lifted function and doesn't need to be captured
  local isGlobal::Boolean = !null(lookupValue(n.name, top.globalEnv));
  
  top.envStructTrans =
    if isGlobal then rest.envStructTrans else
      consStructItem(
        structItem(
          [],
          directTypeExpr(varType),
          consStructDeclarator(structField(n, baseTypeExpr(), []), nilStructDeclarator())),
        rest.envStructTrans);
  
  top.envCopyInTrans =
    if isGlobal then rest.envCopyInTrans else
      seqStmt(
        rest.envCopyInTrans,
        exprStmt(
          binaryOpExpr(
            memberExpr(
              declRefExpr(name("_env", location=builtin), location=builtin),
              false,
              n,
              location=builtin),
            assignOp(
              eqOp(location=builtin),
              location=builtin),
            declRefExpr(n, location=builtin),
          location=builtin)));
  
  top.envCopyOutTrans =
    if isGlobal then rest.envCopyOutTrans else
      seqStmt(
        rest.envCopyOutTrans,
        declStmt(
          variableDecls(
            [], [],
            directTypeExpr(addQualifiers([constQualifier()], varType)),
            consDeclarator(
              declarator(
                n,
                baseTypeExpr(),
                [],
                justInitializer(
                  exprInitializer(
                    memberExpr(
                      declRefExpr(name("_env", location=builtin), location=builtin),
                      false,
                      n,
                      location=builtin)))),
              nilDeclarator()))));
}

abstract production nilCaptureList
top::CaptureList ::=
{
  top.pp = pp"";
  top.errors := [];
  
  top.envStructTrans = nilStructItem();
  top.envCopyInTrans = nullStmt();
  top.envCopyOutTrans = nullStmt();
}

abstract production exprFreeVariables
top::CaptureList ::=
{
  top.pp = pp"free_variables";
  
  local contents::[Name] = removeDuplicateNames(top.freeVariablesIn);
  
  forwards to foldr(consCaptureList, nilCaptureList(), contents);
}