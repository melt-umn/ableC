grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

aspect default production
top::host:UnaryOp ::=
{
  top.unaryProd = nothing();
}

aspect production host:preIncOp
top::host:UnaryOp ::=
{
  top.unaryProd = getPreIncOpOverloadProd(top.host:op.host:typerep, top.host:op.env);
}
aspect production host:preDecOp
top::host:UnaryOp ::= 
{
  top.unaryProd = getPreDecOpOverloadProd(top.host:op.host:typerep, top.host:op.env);
}
aspect production host:postIncOp
top::host:UnaryOp ::= 
{
  top.unaryProd = getPostIncOpOverloadProd(top.host:op.host:typerep, top.host:op.env);
}
aspect production host:postDecOp
top::host:UnaryOp ::= 
{
  top.unaryProd = getPostDecOpOverloadProd(top.host:op.host:typerep, top.host:op.env);
}
aspect production host:addressOfOp
top::host:UnaryOp ::=
{
  top.unaryProd = getAddressOfOpOverloadProd(top.host:op.host:typerep, top.host:op.env);
}
aspect production host:positiveOp
top::host:UnaryOp ::=
{
  top.unaryProd = getPositiveOpOverloadProd(top.host:op.host:typerep, top.host:op.env);
}
aspect production host:negativeOp
top::host:UnaryOp ::=
{
  top.unaryProd = getNegativeOpOverloadProd(top.host:op.host:typerep, top.host:op.env);
}
aspect production host:bitNegateOp
top::host:UnaryOp ::=
{
  top.unaryProd = getBitNegateOpOverloadProd(top.host:op.host:typerep, top.host:op.env);
}
aspect production host:notOp
top::host:UnaryOp ::=
{
  top.unaryProd = getNotOpOverloadProd(top.host:op.host:typerep, top.host:op.env);
}
