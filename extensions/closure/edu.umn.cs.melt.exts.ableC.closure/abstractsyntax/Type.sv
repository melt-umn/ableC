grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;
abstract production closureTypeExpr
top::BaseTypeExpr ::= q::[Qualifier] params::Parameters res::TypeName
{
  propagate substituted;
  
  res.env = addEnv(params.defs, top.env);
  
  local structName::String = s"_closure_${implode("_", map((.mangledName), params.typereps))}_${res.typerep.mangledName}_s";
  local closureStructDecl::Decl = parseDecl(s"""
struct __attribute__((refId("edu:umn:cs:melt:exts:ableC:closure:${structName}"))) ${structName} {
  const char *fn_name; // For debugging
  void *env; // Pointer to generated struct containing env
  __res_type__ (*fn)(void *env, __params__); // First param is above env struct pointer
};
""");
  local result::BaseTypeExpr =
    injectGlobalDeclsTypeExpr(
      consDecl(
        maybeDecl(
          \ env::Decorated Env -> null(lookupTag(structName, env)),
          subDecl(
            [parametersSubstitution("__params__", params),
             typedefSubstitution("__res_type__", res.typerep)],
            closureStructDecl)),
        nilDecl()),
      tagReferenceTypeExpr(q, structSEU(), name(structName, location=builtin)));
  result.env = top.env;
  result.returnType = top.returnType;
  
  forwards to 
    if !null(params.errors) || !null(res.errors)
    then errorTypeExpr(params.errors ++ res.errors)
    else directTypeExpr(closureType(q, params.typereps, res.typerep, result.typerep));
}

abstract production closureType
top::Type ::= q::[Qualifier] params::[Type] res::Type resolved::Type
{
  top.lpp = pp"${terminate(space(), map((.pp), q))}closure<(${
    ppImplode(
      pp", ",
      zipWith(cat,
        map((.lpp), params),
        map((.rpp), params)))}) -> ${res.lpp}${res.rpp}>";
  top.rpp = notext();
  
  top.withoutTypeQualifiers = closureType([], params, res, resolved.withoutTypeQualifiers);
  top.withTypeQualifiers = closureType(top.addedTypeQualifiers ++ q, params, res, resolved.withTypeQualifiers);
  resolved.addedTypeQualifiers = top.addedTypeQualifiers;
  
  top.callProd = just(applyExpr(_, _, location=_));
  
  local structName::String = s"_closure_${implode("_", map((.mangledName), params))}_${res.mangledName}_s";
  
  forwards to resolved;
}

function mkClosureType
Type ::= q::[Qualifier] params::[Type] res::Type env::Decorated Env
{
  local result::BaseTypeExpr =
    closureTypeExpr(q, argTypesToParameters(params), typeName(directTypeExpr(res), baseTypeExpr()));
  result.env = env;
  result.returnType = nothing();
  
  return result.typerep;
}