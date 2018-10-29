grammar edu:umn:cs:melt:tutorials:ableC:interval:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;

abstract production newInterval
top::Expr ::= min::Expr max::Expr
{
  top.pp = pp"intr [${min.pp}, ${max.pp}]";

  local localErrors::[Message] =
    checkIntervalHeaderDef("new_interval", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(name("new_interval", location=builtin), foldExpr([min, max]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

-- Extension productions that are used to resolve overloaded operators
abstract production memberInterval
top::Expr ::= lhs::Expr deref::Boolean rhs::Name
{
  top.pp = parens(ppConcat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));

  local localErrors::[Message] =
    checkIntervalHeaderDef("new_interval", top.location, top.env) ++
    checkIntervalType(lhs.typerep, ".", top.location) ++
    (if rhs.name == "min" || rhs.name == "max"
     then []
     else [err(rhs.location, s"interval does not have member ${rhs.name}")]);
  local fwrd::Expr =
    memberExpr(
      explicitCastExpr(
        typeName(
          tagReferenceTypeExpr(
            nilQualifier(), structSEU(),
            name("_interval_s", location=builtin)),
          baseTypeExpr()),
        lhs,
        location=builtin),
      false, rhs,
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production negInterval
top::Expr ::= i::Expr
{
  top.pp = pp"-(${i.pp})";

  local localErrors::[Message] =
    checkIntervalHeaderDef("neg_interval", top.location, top.env) ++
    checkIntervalType(i.typerep, "-", top.location);
  local fwrd::Expr =
    directCallExpr(name("neg_interval", location=builtin), foldExpr([i]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production invInterval
top::Expr ::= i::Expr
{
  top.pp = pp"~(${i.pp})";
  
  local localErrors::[Message] =
    checkIntervalHeaderDef("inv_interval", top.location, top.env) ++
    checkIntervalType(i.typerep, "~", top.location);
  local fwrd::Expr =
    directCallExpr(name("inv_interval", location=builtin), foldExpr([i]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production addInterval
top::Expr ::= i1::Expr i2::Expr
{
  top.pp = pp"(${i1.pp}) + (${i2.pp})";

  local localErrors::[Message] =
    checkIntervalHeaderDef("add_interval", top.location, top.env) ++
    checkIntervalType(i1.typerep, "+", top.location) ++
    checkIntervalType(i2.typerep, "+", top.location);
  local fwrd::Expr =
    directCallExpr(name("add_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production subInterval
top::Expr ::= i1::Expr i2::Expr
{
  top.pp = pp"(${i1.pp}) - (${i2.pp})";

  local localErrors::[Message] =
    checkIntervalHeaderDef("sub_interval", top.location, top.env) ++
    checkIntervalType(i1.typerep, "-", top.location) ++
    checkIntervalType(i2.typerep, "-", top.location);
  local fwrd::Expr =
    directCallExpr(name("sub_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production mulInterval
top::Expr ::= i1::Expr i2::Expr
{
  top.pp = pp"(${i1.pp}) * (${i2.pp})";

  local localErrors::[Message] =
    checkIntervalHeaderDef("mul_interval", top.location, top.env) ++
    checkIntervalType(i1.typerep, "*", top.location) ++
    checkIntervalType(i2.typerep, "*", top.location);
  local fwrd::Expr =
    directCallExpr(name("mul_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production divInterval
top::Expr ::= i1::Expr i2::Expr
{
  top.pp = pp"(${i1.pp}) / (${i2.pp})";

  local localErrors::[Message] =
    checkIntervalHeaderDef("div_interval", top.location, top.env) ++
    checkIntervalType(i1.typerep, "/", top.location) ++
    checkIntervalType(i2.typerep, "/", top.location);
  local fwrd::Expr =
    directCallExpr(name("div_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production equalsInterval
top::Expr ::= i1::Expr i2::Expr
{
  top.pp = pp"(${i1.pp}) == (${i2.pp})";

  local localErrors::[Message] =
    checkIntervalHeaderDef("equals_interval", top.location, top.env) ++
    checkIntervalType(i1.typerep, "==", top.location) ++
    checkIntervalType(i2.typerep, "==", top.location);
  local fwrd::Expr =
    directCallExpr(name("equals_interval", location=builtin), foldExpr([i1, i2]), location=builtin);
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

-- Check that operand has interval type
function checkIntervalType
[Message] ::= t::Type op::String loc::Location
{
  return
    if typeAssignableTo(extType(nilQualifier(), intervalType()), t)
    then []
    else [err(loc, s"Operand to ${op} expected interval type (got ${showType(t)})")];
}

global builtin::Location = builtinLoc("interval");
