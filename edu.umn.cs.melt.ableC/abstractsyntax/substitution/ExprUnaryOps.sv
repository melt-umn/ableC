

aspect production preIncOp
top::UnaryOp ::=
{
  propagate substituted;
}
aspect production preDecOp
top::UnaryOp ::= 
{
  propagate substituted;
}
aspect production postIncOp
top::UnaryOp ::= 
{
  propagate substituted;
}
aspect production postDecOp
top::UnaryOp ::= 
{
  propagate substituted;
}
aspect production addressOfOp
top::UnaryOp ::=
{
  propagate substituted;
}
aspect production dereferenceOp
top::UnaryOp ::=
{
  propagate substituted;
}
aspect production positiveOp
top::UnaryOp ::=
{
  propagate substituted;
}
aspect production negativeOp
top::UnaryOp ::=
{
  propagate substituted;
}
aspect production bitNegateOp
top::UnaryOp ::=
{
  propagate substituted;
}
aspect production notOp
top::UnaryOp ::=
{
  propagate substituted;
}

aspect production warnNoOp
top::UnaryOp ::= msg::[Message]
{
  propagate substituted;
}

aspect production realOp
top::UnaryOp ::=
{
  propagate substituted;
}
aspect production imagOp
top::UnaryOp ::=
{
  propagate substituted;
}

aspect production sizeofOp
top::UnaryTypeOp ::=
{
  propagate substituted;
}
aspect production alignofOp
top::UnaryTypeOp ::=
{
  propagate substituted;
}

