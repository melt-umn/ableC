grammar edu:umn:cs:melt:ableC:abstractsyntax;

{-- Type qualifiers (cv or cvr qualifiers) -}
nonterminal Qualifier with pp, qualname;

synthesized attribute qualname :: String;

abstract production constQualifier
top::Qualifier ::=
{
  top.pp = text(top.qualname);
  top.qualname = "const";
}

abstract production volatileQualifier
top::Qualifier ::=
{
  top.pp = text(top.qualname);
  top.qualname = "volatile";
}

abstract production restrictQualifier
top::Qualifier ::=
{
  top.pp = text(top.qualname);
  top.qualname = "restrict";
}

abstract production uuRestrictQualifier
top::Qualifier ::=
{
  top.pp = text(top.qualname);
  top.qualname = "__restrict";
}

{-- Specifiers that apply to specific types.
 - e.g. Function specifiers (inline, _Noreturn)
 -      Alignment specifiers (_Alignas)
 -}
nonterminal SpecialSpecifier with pp, env, returnType;

abstract production inlineQualifier
top::SpecialSpecifier ::=
{
  top.pp = text("inline");
}

-- C11
abstract production noreturnQualifier
top::SpecialSpecifier ::=
{
  top.pp = text("_Noreturn");
}

-- C11
abstract production alignasSpecifier
top::SpecialSpecifier ::= e::Expr
{
  top.pp = concat([text("_Alignas"), parens(e.pp)]);
--  top.errors := e.errors;
}

function ppSpecial
Document ::= s::SpecialSpecifier  e::Decorated Env
{
  return decorate s with { env = e; } . pp;
}
