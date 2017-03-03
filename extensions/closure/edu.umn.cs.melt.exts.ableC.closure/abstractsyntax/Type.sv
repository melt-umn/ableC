grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

abstract production closureTypeExpr
top::BaseTypeExpr ::= q::[Qualifier] params::TypeNames res::TypeName
{
  forwards to directTypeExpr(closureType(q, params.typereps, res.typerep));
}

abstract production closureType
top::Type ::= q::[Qualifier] params::[Type] res::Type
{
  top.withTypeQualifiers = closureType(top.addedTypeQualifiers ++ q, params, res);
  
  top.callProd = just(applyExpr(_, _, location=_));
  
  forwards to
    noncanonicalType(
      typedefType(
        q,
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