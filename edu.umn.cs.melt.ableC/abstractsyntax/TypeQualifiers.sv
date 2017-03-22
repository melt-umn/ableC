grammar edu:umn:cs:melt:ableC:abstractsyntax;

{-- Type qualifiers (cv or cvr qualifiers) -}
nonterminal Qualifier with pp, host<Qualifier>, lifted<Qualifier>, qualname, qualIsPositive, qualIsNegative;

synthesized attribute qualname :: String;
synthesized attribute qualIsPositive :: Boolean;
synthesized attribute qualIsNegative :: Boolean;

abstract production constQualifier
top::Qualifier ::=
{
  propagate host, lifted;
  top.pp = text(top.qualname);
  top.qualname = "const";
  top.qualIsPositive = true;
  top.qualIsNegative = false;
}

abstract production volatileQualifier
top::Qualifier ::=
{
  propagate host, lifted;
  top.pp = text(top.qualname);
  top.qualname = "volatile";
  top.qualIsPositive = true;
  top.qualIsNegative = false;
}

abstract production restrictQualifier
top::Qualifier ::=
{
  propagate host, lifted;
  top.pp = text(top.qualname);
  top.qualname = "restrict";
  top.qualIsPositive = false;
  top.qualIsNegative = false;
}

abstract production uuRestrictQualifier
top::Qualifier ::=
{
  propagate host, lifted;
  top.pp = text(top.qualname);
  top.qualname = "__restrict";
  top.qualIsPositive = false;
  top.qualIsNegative = false;
}

{-- Specifiers that apply to specific types.
 - e.g. Function specifiers (inline, _Noreturn)
 -      Alignment specifiers (_Alignas)
 -}
nonterminal SpecialSpecifier with pp, host<SpecialSpecifier>, lifted<SpecialSpecifier>, env, returnType;

abstract production inlineQualifier
top::SpecialSpecifier ::=
{
  propagate host, lifted;
  top.pp = text("inline");
}

-- C11
abstract production noreturnQualifier
top::SpecialSpecifier ::=
{
  propagate host, lifted;
  top.pp = text("_Noreturn");
}

-- C11
abstract production alignasSpecifier
top::SpecialSpecifier ::= e::Expr
{
  propagate host, lifted;
  top.pp = concat([text("_Alignas"), parens(e.pp)]);
--  top.errors := e.errors;
}
