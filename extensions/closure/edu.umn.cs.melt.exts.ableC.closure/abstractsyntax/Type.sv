grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

abstract production closureTypeExpr
top::BaseTypeExpr ::= q::[Qualifier] params::Parameters res::TypeName
{
  propagate substituted;
  top.pp = pp"${terminate(space(), map((.pp), q))}closure<(${
    if null(params.pps) then pp"void" else ppImplode(pp", ", params.pps)}) -> ${res.pp}>";
  
  res.env = addEnv(params.defs, top.env);
  
  forwards to 
    if !null(params.errors) || !null(res.errors)
    then errorTypeExpr(params.errors ++ res.errors)
    else directTypeExpr(closureType(q, params.typereps, res.typerep));
}

abstract production closureType
top::Type ::= q::[Qualifier] params::[Type] res::Type
{
  propagate substituted;
  
  top.lpp = pp"${terminate(space(), map((.pp), q))}closure<(${
    if null(params)then pp"void" else
      ppImplode(
        pp", ",
        zipWith(cat,
          map((.lpp), params),
          map((.rpp), params)))}) -> ${res.lpp}${res.rpp}>";
  top.rpp = notext();
  
  top.withoutTypeQualifiers = closureType([], params, res);
  top.withTypeQualifiers = closureType(top.addedTypeQualifiers ++ q, params, res);
  
  top.callProd = just(applyExpr(_, _, location=_));
  
  local structName::String = s"_closure_${implode("_", map((.mangledName), params))}_${res.mangledName}_s";
  local closureStructDecl::Decl = parseDecl(s"""
struct __attribute__((refId("edu:umn:cs:melt:exts:ableC:closure:${structName}"))) ${structName} {
  const char *fn_name; // For debugging
  void *env; // Pointer to generated struct containing env
  __res_type__ (*fn)(void *env, __params__); // First param is above env struct pointer
};
""");
  
  forwards to
    injectGlobalDeclsType(
      consDecl(
        maybeDecl(
          \ env::Decorated Env -> null(lookupTag(structName, env)),
          subDecl(
            [parametersSubstitution("__params__", argTypesToParameters(params)),
             typedefSubstitution("__res_type__", res)],
            closureStructDecl)),
        nilDecl()),
      tagType(
        q,
        refIdTagType(
          structSEU(),
          structName,
          s"edu:umn:cs:melt:exts:ableC:closure:${structName}")));
}