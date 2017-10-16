grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

aspect default production
top::UnaryOp ::=
{
  top.unaryProd = nothing();
}

aspect production preIncOp
top::UnaryOp ::=
{
  top.unaryProd = getPreIncOpOverload(top.op.typerep, top.op.env);
}
aspect production preDecOp
top::UnaryOp ::= 
{
  top.unaryProd = getPreDecOpOverload(top.op.typerep, top.op.env);
}
aspect production postIncOp
top::UnaryOp ::= 
{
  top.unaryProd = getPostIncOpOverload(top.op.typerep, top.op.env);
}
aspect production postDecOp
top::UnaryOp ::= 
{
  top.unaryProd = getPostDecOpOverload(top.op.typerep, top.op.env);
}
aspect production addressOfOp
top::UnaryOp ::=
{
  top.unaryProd = getAddressOfOpOverload(top.op.typerep, top.op.env);
}
aspect production positiveOp
top::UnaryOp ::=
{
  top.unaryProd = getPositiveOpOverload(top.op.typerep, top.op.env);
}
aspect production negativeOp
top::UnaryOp ::=
{
  top.unaryProd = getNegativeOpOverload(top.op.typerep, top.op.env);
}
aspect production bitNegateOp
top::UnaryOp ::=
{
  top.unaryProd = getBitNegateOpOverload(top.op.typerep, top.op.env);
}
aspect production notOp
top::UnaryOp ::=
{
  top.unaryProd = getNotOpOverload(top.op.typerep, top.op.env);
}
