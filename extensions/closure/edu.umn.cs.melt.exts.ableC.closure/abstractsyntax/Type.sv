grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

abstract production closureTypeExpr
b::BaseTypeExpr ::= params::TypeNames res::TypeName
{
  b.typerep = closureType([], params.typereps, res.typerep);
  
  forwards to typedefTypeExpr([], name("_closure", location=builtIn()));
}

abstract production closureType
t::Type ::= qs::[Qualifier] params::[Type] res::Type
{
  t.withTypeQualifiers = closureType(t.addedTypeQualifiers ++ qs, params, res);
  
  t.callProd = just(applyExpr(_, _, location=_));
  
  forwards to
    noncanonicalType(
      typedefType(
        qs,
        "_closure",
        pointerType(
          [],
          tagType(
            [],
            refIdTagType(
              structSEU(),
              "_closure_s",
              "edu:umn:cs:melt:exts:ableC:closure:_closure_s")))));
}