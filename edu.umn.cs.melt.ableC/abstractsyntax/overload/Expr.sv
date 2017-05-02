grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

abstract production unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  top.pp = if op.preExpr
           then parens( cat( op.pp, e.pp ) )
           else parens( cat( e.pp, op.pp ) );
  
  op.op = e;
  
  forwards to fromMaybe(unaryOpExprDefault(op, e, location=top.location), op.resolved);
}
abstract production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  top.pp = parens( ppConcat([ lhs.pp, brackets( rhs.pp )]) );
  
  rhs.env = addEnv(lhs.defs, lhs.env);

  production attribute overloads::[Pair<String Expr>] with ++;
  overloads := [];
  
  local resolved::Maybe<Expr> =
    case moduleName(top.env, lhs.typerep) of
      just(n) -> lookupBy(stringEq, n, overloads)
    | nothing() -> nothing()
    end;
  
  forwards to fromMaybe(arraySubscriptExprDefault(lhs, rhs, location=top.location), resolved);
}
abstract production callExpr
top::Expr ::= f::Expr  a::Exprs
{
  top.pp = parens( ppConcat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );
  
  a.env = addEnv(f.defs, f.env);

  production attribute memberOverloads::[Pair<String (Expr ::= Expr Boolean Name)>] with ++;
  production attribute overloads::[Pair<String Expr>] with ++;
  memberOverloads := [];
  overloads := [];
  
  local option1::Maybe<Expr> = 
    case f of
      memberExpr(l, d, r) ->
        do (bindMaybe, returnMaybe) {
          n :: String <- moduleName(top.env, l.typerep);
          prod :: (Expr ::= Expr Boolean Name) <- lookupBy(stringEq, n, memberOverloads);
          return prod(l, d, r);
        }
    | _ -> nothing()
    end;
  local option2::Maybe<Expr> =
    case moduleName(top.env, f.typerep) of
      just(n) -> lookupBy(stringEq, n, overloads)
    | nothing() -> nothing()
    end;
  
  forwards to fromMaybe(callExprDefault(f, a, location=top.location), orElse(option1, option2));
}
abstract production memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  top.pp = parens(ppConcat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  
  production attribute overloads::[Pair<String Expr>] with ++;
  overloads := [];
  
  local resolved::Maybe<Expr> =
    case moduleName(top.env, lhs.typerep) of
      just(n) -> lookupBy(stringEq, n, overloads)
    | nothing() -> nothing()
    end;
  
  forwards to fromMaybe(memberExprDefault(lhs, deref, rhs, location=top.location), resolved);
}
abstract production binaryOpExpr
top::Expr ::= lhs::Expr  op::BinOp  rhs::Expr
{
  -- case op here is a potential problem, since that emits a dep on op->forward, which eventually should probably include env
  -- Find a way to do this that doesn't cause problems if an op forwards.
  top.pp = parens( ppConcat([ 
    {-case op, lhs.pp of
    | assignOp(eqOp()), cat(cat(text("("), lhsNoParens), text(")")) -> lhsNoParens
    | _, _ -> lhs.pp
    end-} lhs.pp, space(), op.pp, space(), rhs.pp ]) );
  
  rhs.env = addEnv(lhs.defs, lhs.env);
  op.lop = lhs;
  op.rop = rhs;
  
  forwards to fromMaybe(binaryOpExprDefault(lhs, op, rhs, location=top.location), op.resolved);
}
