grammar edu:umn:cs:melt:tutorials:ableC:interval:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:overload as ovrld;

aspect function ovrld:getNegativeOpOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  overloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:interval:interval",
       \ e::Expr loc::Location -> negInterval(e, location=loc))];
}

aspect function ovrld:getBitNegateOpOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  overloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:interval:interval",
       \ e::Expr loc::Location -> invInterval(e, location=loc))];
}

aspect function ovrld:getAddOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  overloads <-
    [pair(
       pair(
         "edu:umn:cs:melt:exts:ableC:interval:interval",
         "edu:umn:cs:melt:exts:ableC:interval:interval"),
       \ lhs::Expr rhs::Expr loc::Location -> addInterval(lhs, rhs, location=loc))];
}

aspect function ovrld:getSubOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  overloads <-
    [pair(
       pair(
         "edu:umn:cs:melt:exts:ableC:interval:interval",
         "edu:umn:cs:melt:exts:ableC:interval:interval"),
       \ lhs::Expr rhs::Expr loc::Location -> subInterval(lhs, rhs, location=loc))];
}

aspect function ovrld:getMulOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  overloads <-
    [pair(
       pair(
         "edu:umn:cs:melt:exts:ableC:interval:interval",
         "edu:umn:cs:melt:exts:ableC:interval:interval"),
       \ lhs::Expr rhs::Expr loc::Location -> mulInterval(lhs, rhs, location=loc))];
}

aspect function ovrld:getDivOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  overloads <-
    [pair(
       pair(
         "edu:umn:cs:melt:exts:ableC:interval:interval",
         "edu:umn:cs:melt:exts:ableC:interval:interval"),
       \ lhs::Expr rhs::Expr loc::Location -> divInterval(lhs, rhs, location=loc))];
}

aspect function ovrld:getEqualsOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  overloads <-
    [pair(
       pair(
         "edu:umn:cs:melt:exts:ableC:interval:interval",
         "edu:umn:cs:melt:exts:ableC:interval:interval"),
       \ lhs::Expr rhs::Expr loc::Location -> eqInterval(lhs, rhs, location=loc))];
}

-- TODO: Check for header inclusion errors
abstract production newInterval
top::Expr ::= min::Expr max::Expr
{
  forwards to
    directCallExpr(name("new_interval", location=builtin), foldExpr([min, max]), location=builtin);
}

abstract production negInterval
top::Expr ::= i::Expr
{
  forwards to
    directCallExpr(name("neg_interval", location=builtin), foldExpr([i]), location=builtin);
}

abstract production invInterval
top::Expr ::= i::Expr
{
  forwards to
    directCallExpr(name("inv_interval", location=builtin), foldExpr([i]), location=builtin);
}

abstract production addInterval
top::Expr ::= i1::Expr i2::Expr
{
  forwards to
    directCallExpr(name("add_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
}

abstract production subInterval
top::Expr ::= i1::Expr i2::Expr
{
  forwards to
    directCallExpr(name("sub_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
}

abstract production mulInterval
top::Expr ::= i1::Expr i2::Expr
{
  forwards to
    directCallExpr(name("mul_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
}

abstract production divInterval
top::Expr ::= i1::Expr i2::Expr
{
  forwards to
    directCallExpr(name("div_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
}

abstract production eqInterval
top::Expr ::= i1::Expr i2::Expr
{
  forwards to
    directCallExpr(name("eq_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
}

global builtin::Location = builtinLoc("interval");