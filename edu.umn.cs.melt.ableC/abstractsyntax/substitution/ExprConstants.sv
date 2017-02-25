

aspect production realConstant
top::Expr ::= c::NumericConstant
{
  propagate substituted;
}
aspect production imaginaryConstant
top::Expr ::= c::NumericConstant
{
  propagate substituted;
}
aspect production characterConstant
top::Expr ::= num::String  c::CharPrefix
{
  propagate substituted;
}
aspect production integerConstant
top::NumericConstant ::= num::String  unsigned::Boolean  suffix::IntSuffix
{
  propagate substituted;
}
aspect production hexIntegerConstant
top::NumericConstant ::= num::String  unsigned::Boolean  suffix::IntSuffix
{
  propagate substituted;
}
aspect production octIntegerConstant
top::NumericConstant ::= num::String  unsigned::Boolean  suffix::IntSuffix
{
  propagate substituted;
}

aspect production floatConstant
top::NumericConstant ::= num::String  suffix::FloatSuffix
{
  propagate substituted;
}
aspect production hexFloatConstant
top::NumericConstant ::= num::String  suffix::FloatSuffix
{
  propagate substituted;
}