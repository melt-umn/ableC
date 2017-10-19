-- n
function mkIntConst
Expr ::= n::Integer l::Location
{ return
    realConstant(
      integerConstant (toString(n), false, noIntSuffix(),location=l),
      location=l
    );
}

-- left + right
function mkAdd
Expr ::= left::Expr  right::Expr  l::Location
{ return
    addExpr (
      left,
      right,
      location=l
   ) ;
}

-- left && right
function mkAnd
Expr ::= left::Expr  right::Expr  l::Location
{ return
    andExpr (
      left,
      right,
      location=l
   ) ;
}

-- & e
function mkAddressOf
Expr ::= e::Expr l::Location
{ return unaryOpExpr( addressOfOp(location=l), e, location=l );
}

-- Expr --

-- 1, 2, etc.
-- TODO: Duplicate of mkIntConst, remove
function mkIntExpr
Expr ::= val::String l::Location
{ return realConstant(integerConstant(val, false, noIntSuffix(), 
            location=l), location=l) ;
}

function mkErrorCheck
Expr ::= msg::[Message] e::Expr
{
  return
    if null(msg)
    then e
    else if !containsErrors(msg, false)
    then warnExpr(msg, e, location=e.location)
    else errorExpr(msg, location=e.location);
} 
