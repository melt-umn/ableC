grammar edu:umn:cs:melt:tutorials:ableC:average:abstractsyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax:env; -- TODO: Why is this import needed?
imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;

imports silver:langutil;
imports silver:langutil:pp;

abstract production averageExpr
top::Expr ::= l::Expr r::Expr
{
  propagate substituted; -- Ignore this for now
  top.pp = pp"(${l.pp} ~~ ${r.pp})";

  local localErrors::[Message] =
    (if !l.typerep.isArithmeticType
     then [err(l.location, s"Average operand must have arithmetic type (got ${showType(l.typerep)})")]
     else []) ++
    (if !r.typerep.isArithmeticType
     then [err(l.location, s"Average operand must have arithmetic type (got ${showType(r.typerep)})")]
     else []);
  local fwrd::Expr =
    divExpr(addExpr(l, r, location=builtin), mkIntConst(2, builtin), location=builtin);
  
  {- Same as
  forwards to
    if !null(localErrors)
    then errorExpr(localErrors, location=top.location)
    else fwrd;-}
  forwards to mkErrorCheck(localErrors, fwrd);
}

global builtin::Location = builtinLoc("average");