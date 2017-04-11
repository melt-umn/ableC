grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

abstract production unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  propagate substituted;
  top.pp = if op.preExpr
           then parens( cat( op.pp, e.pp ) )
           else parens( cat( e.pp, op.pp ) );
  
  op.op = e;
  
  forwards to
    case op.resolved of
      just(e) -> e
    | nothing() -> unaryOpExprDefault(op, e, location=top.location)
    end;
}
abstract production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  propagate substituted;
  top.pp = parens( concat([ lhs.pp, brackets( rhs.pp )]) );
  
  rhs.env = addEnv(lhs.defs, lhs.env);

  production attribute overloads::[Pair<String Expr>] with ++;
  overloads := [];
  
  forwards to
    case lookupBy(stringEq, moduleName(top.env, lhs.typerep), overloads) of
      just(fwrd) -> fwrd
    | nothing() -> arraySubscriptExprDefault(lhs, rhs, location=top.location)
    end;
}
abstract production callExpr
top::Expr ::= f::Expr  a::Exprs
{
  propagate substituted;
  top.pp = parens( concat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );
  
  a.env = addEnv(f.defs, f.env);

  production attribute memberOverloads::[Pair<String (Expr ::= Expr Boolean Name)>] with ++;
  production attribute overloads::[Pair<String Expr>] with ++;
  memberOverloads := [];
  overloads := [];
  
  local option1::Maybe<Expr> = 
    case f of
      memberExpr(l, d, r) ->
        case lookupBy(stringEq, moduleName(top.env, l.typerep), memberOverloads) of
          just(prod) -> just(prod(l, d, r))
        | nothing() -> nothing()
        end
    | _ -> nothing()
    end;
  local option2::Maybe<Expr> = lookupBy(stringEq, moduleName(top.env, f.typerep), overloads);
  
  forwards to
    case orElse(option1, option2) of
      just(e) -> e
    | nothing() -> callExprDefault(f, a, location=top.location)
    end;
}
abstract production memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  propagate substituted;
  top.pp = parens(concat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  
  production attribute overloads::[Pair<String Expr>] with ++;
  overloads := [];
  
  forwards to
    case lookupBy(stringEq, moduleName(top.env, lhs.typerep), overloads) of
      just(fwrd) -> fwrd
    | nothing() -> memberExprDefault(lhs, deref, rhs, location=top.location)
    end;
}
abstract production binaryOpExpr
top::Expr ::= lhs::Expr  op::BinOp  rhs::Expr
{
  propagate substituted;
  -- case op here is a potential problem, since that emits a dep on op->forward, which eventually should probably include env
  -- Find a way to do this that doesn't cause problems if an op forwards.
  top.pp = parens( concat([ 
    {-case op, lhs.pp of
    | assignOp(eqOp()), cat(cat(text("("), lhsNoParens), text(")")) -> lhsNoParens
    | _, _ -> lhs.pp
    end-} lhs.pp, space(), op.pp, space(), rhs.pp ]) );
  
  rhs.env = addEnv(lhs.defs, lhs.env);
  op.lop = lhs;
  op.rop = rhs;
  
  forwards to
    case op.resolved of
      just(e) -> e
    | nothing() -> binaryOpExprDefault(lhs, op, rhs, location=top.location)
    end;
}
