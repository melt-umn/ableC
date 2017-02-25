grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

aspect production name
top::Name ::= n::String
{
  propagate substituted;
}

aspect production justName
top::MaybeName ::= n::Name
{
  propagate substituted;
}

aspect production nothingName
top::MaybeName ::=
{
  propagate substituted;
}