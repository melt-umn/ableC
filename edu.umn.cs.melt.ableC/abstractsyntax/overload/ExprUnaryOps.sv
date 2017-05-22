grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

aspect default production
top::UnaryOp ::=
{
  top.resolved = nothing();
}

aspect production preIncOp
top::UnaryOp ::=
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved = getUnaryOverload(top.op, overloads);
}
aspect production preDecOp
top::UnaryOp ::= 
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved = getUnaryOverload(top.op, overloads);
}
aspect production postIncOp
top::UnaryOp ::= 
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved = getUnaryOverload(top.op, overloads);
}
aspect production postDecOp
top::UnaryOp ::= 
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved = getUnaryOverload(top.op, overloads);
}
aspect production addressOfOp
top::UnaryOp ::=
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved = getUnaryOverload(top.op, overloads);
}
aspect production dereferenceOp
top::UnaryOp ::=
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved = getUnaryOverload(top.op, overloads);
}
aspect production positiveOp
top::UnaryOp ::=
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved = getUnaryOverload(top.op, overloads);
}
aspect production negativeOp
top::UnaryOp ::=
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved = getUnaryOverload(top.op, overloads);
}
aspect production bitNegateOp
top::UnaryOp ::=
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved = getUnaryOverload(top.op, overloads);
}
aspect production notOp
top::UnaryOp ::=
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved = getUnaryOverload(top.op, overloads);
}