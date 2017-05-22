grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

aspect production name
top::Name ::= n::String
{
  local substitutions::Substitutions = top.substitutions;
  substitutions.nameIn = n;
  top.substituted =
    case substitutions.nameSub of
      just(sub) -> sub
    | nothing() -> top
    end;
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