grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

abstract production closureTypeExpr
top::BaseTypeExpr ::= q::[Qualifier] params::Parameters res::TypeName
{
  propagate substituted;
  forwards to directTypeExpr(closureType(q, params.typereps, res.typerep));
}

abstract production closureType
top::Type ::= q::[Qualifier] params::[Type] res::Type
{
  top.lpp = pp"${terminate(space(), map((.pp), q))}closure<(${
    ppImplode(
      pp", ",
      zipWith(cat,
        map((.lpp), params),
        map((.rpp), params)))}) -> ${res.lpp}${res.rpp}>";
  top.rpp = notext();
  
  top.withoutTypeQualifiers = closureType([], params, res);
  top.withTypeQualifiers = closureType(top.addedTypeQualifiers ++ q, params, res);
  top.callProd = just(applyExpr(_, _, location=_));
  
  {-top.baseTypeExpr =
    closureTypeExpr(
      q,
      argTypesToParameters(params),
      typeName(res.baseTypeExpr, res.typeModifierExpr));
  
  top.typeModifierExpr = baseTypeExpr();-}
  
  forwards to
    tagType(q, refIdTagType(structSEU(), "_closure_s", "edu:umn:cs:melt:exts:ableC:closure:_closure_s"));
}
