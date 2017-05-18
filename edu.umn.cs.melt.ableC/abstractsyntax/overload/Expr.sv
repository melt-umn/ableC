grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

abstract production unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  top.pp = if op.preExpr
           then parens( cat( op.pp, e.pp ) )
           else parens( cat( e.pp, op.pp ) );
  
  op.op = e;
  
  forwards to fromMaybe(unaryOpExprDefault(op, _, location=_), op.unaryProd)(e, top.location);
  {- The above is shorthand for
  forwards to
    case op.unaryProd of
      just(prod) -> prod(e, top.location)
    | nothing() -> unaryOpExprDefault(op, e, location=top.location)
    end;-}
}
abstract production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  top.pp = parens( ppConcat([ lhs.pp, brackets( rhs.pp )]) );
  
  forwards to
    fromMaybe(
      arraySubscriptExprDefault(_, _, location=_),
      getArraySubscriptOverload(lhs.typerep, top.env))(lhs, rhs, top.location);
}
abstract production callExpr
top::Expr ::= f::Expr  a::Exprs
{
  top.pp = parens( ppConcat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );
  
  a.env = addEnv(f.defs, f.env);
  -- Option 1: Apply a member to arguments (e.g. a.foo(b))
  local option1::Maybe<Expr> = 
    case f of
      memberExpr(l, d, r) ->
        applyMaybe5(getMemberCallOverload(l.typerep, top.env), l, d, r, a, top.location)
    | _ -> nothing()
    end;
  -- Option 2: Normal overloaded application
  local option2::Maybe<Expr> = applyMaybe3(getCallOverload(f.typerep, top.env), f, a, top.location);
  
  forwards to fromMaybe(callExprDefault(f, a, location=top.location), orElse(option1, option2));
}
abstract production memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  top.pp = parens(ppConcat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  
  forwards to
    fromMaybe(
      memberExprDefault(_, _, _, location=_),
      getMemberOverload(lhs.typerep, top.env))(lhs, deref, rhs, top.location);
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
  
  -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
  local option1::Maybe<Expr> =
    case lhs, op of
      arraySubscriptExpr(l, r), assignOp(aOp) ->
        applyMaybe5(getSubscriptAssignOverload(l.typerep, top.env), l, r, aOp, rhs, top.location)
    | memberExpr(l, d, r), assignOp(aOp) ->
        applyMaybe6(getMemberAssignOverload(l.typerep, top.env), l, d, r, aOp, rhs, top.location)
    | _, _ -> nothing()
    end;
  -- Option 2: Normal overloaded binary operators
  local option2::Maybe<Expr> = applyMaybe3(op.binaryProd, lhs, rhs, top.location);
  
  forwards to
    fromMaybe(binaryOpExprDefault(lhs, op, rhs, location=top.location), orElse(option1, option2));
}
