
function mkIntConst
Expr ::= n::Integer l::Location
{
  return
    realConstant(
      integerConstant (toString(n), false, noIntSuffix(),location=l),
      location=l
    );
}

function mkAdd
Expr ::= left::Expr  right::Expr  l::Location
{
  return
    binaryOpExpr (
      left,
      numOp(addOp(location=l),location=l),
      right,
      location=l
   ) ;
}

-- Expr --

-- 1, 2, etc.
function mkIntExpr
Expr ::= val::String l::Location
{ return realConstant(integerConstant(val, false, noIntSuffix(), 
            location=l), location=l) ;
}
