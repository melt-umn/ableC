-- n
fun mkIntConst Expr ::= n::Integer =
  realConstant(
    integerConstant (toString(n), false, noIntSuffix()));

-- "s"
fun mkStringConst Expr ::= s::String = stringLiteral(s"\"${escapeString(s)}\"");

production mkErrorCheck
top::Expr ::= msg::[Message] e::Expr
{
  forwards to
    if null(msg)
    then @e
    else if !containsErrors(msg, false)
    then warnExpr(msg, @e)
    else errorExpr(msg);
} 
