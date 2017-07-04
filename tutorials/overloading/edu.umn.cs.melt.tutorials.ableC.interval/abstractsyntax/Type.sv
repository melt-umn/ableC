grammar edu:umn:cs:melt:tutorials:ableC:interval:abstractsyntax;

abstract production intervalTypeExpr 
top::BaseTypeExpr ::= q::Qualifiers
{
  propagate substituted;
  forwards to directTypeExpr(intervalType(q));
}

abstract production intervalType
top::Type ::= q::Qualifiers
{
  top.lpp = pp"interval";
  top.rpp = pp"";

  -- Forward to a reference to the struct with the refId specified in the header file
  forwards to
    tagType(
      q,
      refIdTagType(structSEU(), "_interval_s", s"edu:umn:cs:melt:exts:ableC:interval:interval"));
}
