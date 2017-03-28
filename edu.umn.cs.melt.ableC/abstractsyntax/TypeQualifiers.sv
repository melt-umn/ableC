grammar edu:umn:cs:melt:ableC:abstractsyntax;

{-- Type qualifiers (cv or cvr qualifiers) -}
nonterminal Qualifier with pp, host<Qualifier>, lifted<Qualifier>, qualname, qualIsPositive, qualIsNegative, qualAppliesWithinRef;

synthesized attribute qualname :: String;
synthesized attribute qualIsPositive :: Boolean;
synthesized attribute qualIsNegative :: Boolean;
-- Variables refer to memory locations and thus there is an implicit ref
--   wrapping stated types (given `int x;', the type of x is ref(int)) which is
--   implicitly dereferenced when used as an r-value. This attribute specifies
--   where the qualifier applies, e.g. `const int' should be `const ref(int)'
--   but `nonzero int' should be `ref(nonzero int)'.
synthesized attribute qualAppliesWithinRef :: Boolean;

abstract production constQualifier
top::Qualifier ::=
{
  propagate host, lifted;
  top.pp = text(top.qualname);
  top.qualname = "const";
  top.qualIsPositive = true;
  top.qualIsNegative = false;
  top.qualAppliesWithinRef = false;
}

abstract production volatileQualifier
top::Qualifier ::=
{
  propagate host, lifted;
  top.pp = text(top.qualname);
  top.qualname = "volatile";
  top.qualIsPositive = true;
  top.qualIsNegative = false;
  top.qualAppliesWithinRef = true;
}

abstract production restrictQualifier
top::Qualifier ::=
{
  propagate host, lifted;
  top.pp = text(top.qualname);
  top.qualname = "restrict";
  top.qualIsPositive = false;
  top.qualIsNegative = false;
  top.qualAppliesWithinRef = true;
}

abstract production uuRestrictQualifier
top::Qualifier ::=
{
  propagate host, lifted;
  top.pp = text(top.qualname);
  top.qualname = "__restrict";
  top.qualIsPositive = false;
  top.qualIsNegative = false;
  top.qualAppliesWithinRef = true;
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
