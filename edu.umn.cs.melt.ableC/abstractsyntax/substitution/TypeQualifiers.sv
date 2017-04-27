grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;




aspect production constQualifier
top::Qualifier ::=
{
  propagate substituted;
}

aspect production volatileQualifier
top::Qualifier ::=
{
  propagate substituted;
}

aspect production restrictQualifier
top::Qualifier ::=
{
  propagate substituted;
}

aspect production uuRestrictQualifier
top::Qualifier ::=
{
  propagate substituted;
}

aspect production pluggableQualifier
top::Qualifier ::= isPositive::Boolean appliesWithinRef::Boolean
                   compat::(Boolean ::= Qualifier)
{
  propagate substituted;
}



aspect production inlineQualifier
top::SpecialSpecifier ::=
{
  propagate substituted;
}

aspect production noreturnQualifier
top::SpecialSpecifier ::=
{
  propagate substituted;
}

aspect production alignasSpecifier
top::SpecialSpecifier ::= e::Expr
{
  propagate substituted;
}
