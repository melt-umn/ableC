grammar edu:umn:cs:melt:tutorials:ableC:average:abstractsyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;

imports silver:langutil;
imports silver:langutil:pp;

abstract production averageExpr
top::Expr ::= l::Expr r::Expr
{
  top.pp = pp"(${l.pp} ~~ ${r.pp})";

  local localErrors::[Message] =
    (if !l.typerep.isArithmeticType
     then [err(l.location, s"Average operand must have aritmetic type (got ${showType(l.typerep)})")]
     else []) ++
    (if !r.typerep.isArithmeticType
     then [err(l.location, s"Average operand must have aritmetic type (got ${showType(r.typerep)})")]
     else []);
  local fwrd::Expr =
    binaryOpExpr(
      binaryOpExpr(
        l,
        numOp(addOp(location=builtin), location=builtin),
        r,
        location=builtin),
      numOp(divOp(location=builtin), location=builtin),
      mkIntConst(2, builtin),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
  {- Same as
  forwards to
    if !null(localErrors)
    then errorExpr(localErrors, location=top.location)
    else fwrd;-}
}

global builtin::Location = builtinLoc("average");