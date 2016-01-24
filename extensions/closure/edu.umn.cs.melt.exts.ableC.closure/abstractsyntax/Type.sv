grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

abstract production closureTypeExpr 
b::BaseTypeExpr ::= param::TypeName res::TypeName
{
  b.typerep = closureType([], param.typerep, res.typerep);
  
  forwards to typedefTypeExpr([], name("_closure", location=builtIn()));
}

-- Passing the refId is kind of a hack, because it is always the same.  However, the env isn't available to look it up
abstract production closureType
t::Type ::= qs::[Qualifier] param::Type res::Type
{
  t.withTypeQualifiers = closureType(t.addedTypeQualifiers ++ qs, param, res);
  
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