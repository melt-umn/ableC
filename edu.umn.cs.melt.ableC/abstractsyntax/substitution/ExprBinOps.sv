
aspect production assignOp
top::BinOp ::= op::AssignOp
{
  propagate substituted;
}


aspect production eqOp
top::AssignOp ::=
{
  propagate substituted;
}
aspect production mulEqOp
top::AssignOp ::=
{
  propagate substituted;
}
aspect production divEqOp
top::AssignOp ::=
{
  propagate substituted;
}
aspect production modEqOp
top::AssignOp ::=
{
  propagate substituted;
}
aspect production addEqOp
top::AssignOp ::=
{
  propagate substituted;
}
aspect production subEqOp
top::AssignOp ::=
{
  propagate substituted;
}
aspect production lshEqOp
top::AssignOp ::=
{
  propagate substituted;
}
aspect production rshEqOp
top::AssignOp ::=
{
  propagate substituted;
}
aspect production andEqOp
top::AssignOp ::=
{
  propagate substituted;
}
aspect production orEqOp
top::AssignOp ::=
{
  propagate substituted;
}
aspect production xorEqOp
top::AssignOp ::=
{
  propagate substituted;
}


aspect production boolOp
top::BinOp ::= op::BoolOp
{
  propagate substituted;
}


aspect production andBoolOp
top::BoolOp ::=
{
  propagate substituted;
}
aspect production orBoolOp
top::BoolOp ::=
{
  propagate substituted;
}


aspect production bitOp
top::BinOp ::= op::BitOp
{
  propagate substituted;
}


aspect production andBitOp
top::BitOp ::=
{
  propagate substituted;
}
aspect production orBitOp
top::BitOp ::=
{
  propagate substituted;
}
aspect production xorBitOp
top::BitOp ::=
{
  propagate substituted;
}
aspect production lshBitOp
top::BitOp ::=
{
  propagate substituted;
}
aspect production rshBitOp
top::BitOp ::=
{
  propagate substituted;
}


aspect production compareOp
top::BinOp ::= op::CompareOp
{
  propagate substituted;
}


aspect production equalsOp
top::CompareOp ::=
{
  propagate substituted;
}
aspect production notEqualsOp
top::CompareOp ::=
{
  propagate substituted;
}
aspect production gtOp
top::CompareOp ::=
{
  propagate substituted;
}
aspect production ltOp
top::CompareOp ::=
{
  propagate substituted;
}
aspect production gteOp
top::CompareOp ::=
{
  propagate substituted;
}
aspect production lteOp
top::CompareOp ::=
{
  propagate substituted;
}


aspect production numOp
top::BinOp ::= op::NumOp
{
  propagate substituted;
}


aspect production addOp
top::NumOp ::=
{
  propagate substituted;
}
aspect production subOp
top::NumOp ::=
{
  propagate substituted;
}
aspect production mulOp
top::NumOp ::=
{
  propagate substituted;
}
aspect production divOp
top::NumOp ::=
{
  propagate substituted;
}
aspect production modOp
top::NumOp ::=
{
  propagate substituted;
}

aspect production commaOp
top::BinOp ::=
{
  propagate substituted;
}


