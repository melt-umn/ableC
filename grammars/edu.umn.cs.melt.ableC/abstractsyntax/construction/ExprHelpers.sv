-- n
function mkIntConst
Expr ::= n::Integer
{ return
    realConstant(
      integerConstant (toString(n), false, noIntSuffix()));
}

-- "s"
function mkStringConst
Expr ::= s::String
{ return stringLiteral(s"\"${escapeString(s)}\"");
}

-- left + right
-- TODO: Deprecated, remove this!
function mkAdd
Expr ::= left::Expr  right::Expr 
{ return
    addExpr (
      left,
      right
   ) ;
}

-- left && right
-- TODO: Deprecated, remove this!
function mkAnd
Expr ::= left::Expr  right::Expr 
{ return
    andExpr (
      left,
      right
   ) ;
}

-- & e
-- TODO: Deprecated, remove this!
function mkAddressOf
Expr ::= e::Expr
{ return addressOfExpr(e);
}

-- Expr --

-- 1, 2, etc.
-- TODO: Duplicate of mkIntConst, remove
function mkIntExpr
Expr ::= val::String
{ return realConstant(integerConstant(val, false, noIntSuffix())) ;
}

function mkErrorCheck
Expr ::= msg::[Message] e::Expr
{
  return
    if null(msg)
    then e
    else if !containsErrors(msg, false)
    then warnExpr(msg, e)
    else errorExpr(msg);
} 
