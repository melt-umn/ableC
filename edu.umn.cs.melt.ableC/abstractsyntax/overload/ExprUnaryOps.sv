grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

synthesized attribute unaryProd::Maybe<(Expr ::= Expr Location)> occurs on UnaryOp;

aspect default production
top::UnaryOp ::=
{
  top.unaryProd = nothing();
}

aspect production preIncOp
top::UnaryOp ::=
{
  top.unaryProd = top.op.typerep.preIncProd;
}
aspect production preDecOp
top::UnaryOp ::= 
{
  top.unaryProd = top.op.typerep.preDecProd;
}
aspect production postIncOp
top::UnaryOp ::= 
{
  top.unaryProd = top.op.typerep.postIncProd;
}
aspect production postDecOp
top::UnaryOp ::= 
{
  top.unaryProd = top.op.typerep.postDecProd;
}
aspect production addressOfOp
top::UnaryOp ::=
{
  top.unaryProd = top.op.typerep.unaryAndProd;
}
aspect production dereferenceOp
top::UnaryOp ::=
{
  top.unaryProd = top.op.typerep.unaryStarProd;
}
aspect production positiveOp
top::UnaryOp ::=
{
  top.unaryProd = top.op.typerep.unaryPlusProd;
}
aspect production negativeOp
top::UnaryOp ::=
{
  top.unaryProd = top.op.typerep.unaryMinusProd;
}
aspect production bitNegateOp
top::UnaryOp ::=
{
  top.unaryProd = top.op.typerep.unaryTildaProd;
}
aspect production notOp
top::UnaryOp ::=
{
  top.unaryProd = top.op.typerep.unaryBangProd;
}