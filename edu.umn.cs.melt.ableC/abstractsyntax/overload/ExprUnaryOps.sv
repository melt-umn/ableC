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
  top.resolved =
    case lookupBy(stringEq, moduleName(top.op.env, top.op.typerep), overloads) of
      just(prod) -> just(prod(new(top.op)))
    | nothing() -> nothing()
    end;
}
aspect production preDecOp
top::UnaryOp ::= 
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved =
    case lookupBy(stringEq, moduleName(top.op.env, top.op.typerep), overloads) of
      just(prod) -> just(prod(new(top.op)))
    | nothing() -> nothing()
    end;
}
aspect production postIncOp
top::UnaryOp ::= 
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved =
    case lookupBy(stringEq, moduleName(top.op.env, top.op.typerep), overloads) of
      just(prod) -> just(prod(new(top.op)))
    | nothing() -> nothing()
    end;
}
aspect production postDecOp
top::UnaryOp ::= 
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved =
    case lookupBy(stringEq, moduleName(top.op.env, top.op.typerep), overloads) of
      just(prod) -> just(prod(new(top.op)))
    | nothing() -> nothing()
    end;
}
aspect production addressOfOp
top::UnaryOp ::=
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved =
    case lookupBy(stringEq, moduleName(top.op.env, top.op.typerep), overloads) of
      just(prod) -> just(prod(new(top.op)))
    | nothing() -> nothing()
    end;
}
aspect production dereferenceOp
top::UnaryOp ::=
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved =
    case lookupBy(stringEq, moduleName(top.op.env, top.op.typerep), overloads) of
      just(prod) -> just(prod(new(top.op)))
    | nothing() -> nothing()
    end;
}
aspect production positiveOp
top::UnaryOp ::=
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved =
    case lookupBy(stringEq, moduleName(top.op.env, top.op.typerep), overloads) of
      just(prod) -> just(prod(new(top.op)))
    | nothing() -> nothing()
    end;
}
aspect production negativeOp
top::UnaryOp ::=
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved =
    case lookupBy(stringEq, moduleName(top.op.env, top.op.typerep), overloads) of
      just(prod) -> just(prod(new(top.op)))
    | nothing() -> nothing()
    end;
}
aspect production bitNegateOp
top::UnaryOp ::=
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved =
    case lookupBy(stringEq, moduleName(top.op.env, top.op.typerep), overloads) of
      just(prod) -> just(prod(new(top.op)))
    | nothing() -> nothing()
    end;
}
aspect production notOp
top::UnaryOp ::=
{
  production attribute overloads::[Pair<String (Expr ::= Expr)>] with ++;
  overloads := [];
  top.resolved =
    case lookupBy(stringEq, moduleName(top.op.env, top.op.typerep), overloads) of
      just(prod) -> just(prod(new(top.op)))
    | nothing() -> nothing()
    end;
}