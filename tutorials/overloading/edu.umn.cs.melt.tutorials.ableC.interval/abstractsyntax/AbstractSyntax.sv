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

abstract production newInterval
top::Expr ::= min::Expr max::Expr
{
  local localErrors::[Message] =
    checkIntervalHeaderDef("new_interval", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(name("new_interval", location=builtin), foldExpr([min, max]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production negInterval
top::Expr ::= i::Expr
{
  local localErrors::[Message] =
    checkIntervalHeaderDef("neg_interval", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(name("neg_interval", location=builtin), foldExpr([i]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production invInterval
top::Expr ::= i::Expr
{
  local localErrors::[Message] =
    checkIntervalHeaderDef("inv_interval", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(name("inv_interval", location=builtin), foldExpr([i]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production addInterval
top::Expr ::= i1::Expr i2::Expr
{
  local localErrors::[Message] =
    checkIntervalHeaderDef("add_interval", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(name("add_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production subInterval
top::Expr ::= i1::Expr i2::Expr
{
  local localErrors::[Message] =
    checkIntervalHeaderDef("sub_interval", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(name("sub_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production mulInterval
top::Expr ::= i1::Expr i2::Expr
{
  local localErrors::[Message] =
    checkIntervalHeaderDef("mul_interval", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(name("mul_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production divInterval
top::Expr ::= i1::Expr i2::Expr
{
  local localErrors::[Message] =
    checkIntervalHeaderDef("div_interval", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(name("div_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production eqInterval
top::Expr ::= i1::Expr i2::Expr
{
  local localErrors::[Message] =
    checkIntervalHeaderDef("eq_interval", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(name("eq_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

-- Check the given env for the given function name
function checkIntervalHeaderDef
[Message] ::= n::String loc::Location env::Decorated Env
{
  return
    if !null(lookupValue(n, env))
    then []
    else [err(loc, "Missing include of interval.xh")];
}

global builtin::Location = builtinLoc("interval");
