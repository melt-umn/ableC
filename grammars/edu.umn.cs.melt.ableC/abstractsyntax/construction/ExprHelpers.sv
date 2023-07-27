-- n
function mkIntConst
Expr ::= n::Integer l::Location
{ return
    realConstant(
      integerConstant (toString(n), false, noIntSuffix(),location=l),
      location=l);
}

-- "s"
function mkStringConst
Expr ::= s::String l::Location
{ return stringLiteral(s"\"${escapeString(s)}\"", location=l);
}

-- left + right
-- TODO: Deprecated, remove this!
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
-- TODO: Deprecated, remove this!
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
-- TODO: Deprecated, remove this!
function mkAddressOf
Expr ::= e::Expr l::Location
{ return addressOfExpr(e, location=l);
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
Expr ::= msg::[Message] e::Decorated! Expr with {}
{
  return
    if null(msg)
    then @e
    else if !containsErrors(msg, false)
    then warnExpr(msg, @e, location=e.location)
    else errorExpr(msg, location=e.location);
} 
