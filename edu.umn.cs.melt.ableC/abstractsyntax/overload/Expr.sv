grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

abstract production unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  propagate substituted;
  
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
  
  rhs.env = addEnv(lhs.defs, lhs.env);

  production attribute overloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  
  forwards to
    case lookupBy(stringEq, moduleName(top.env, lhs.typerep), overloads) of
      just(prod) -> prod(lhs, rhs, top.location)
    | nothing() -> arraySubscriptExprDefault(lhs, rhs, location=top.location)
    end;
}
abstract production callExpr
top::Expr ::= f::Expr  a::Exprs
{
  propagate substituted;
  
  a.env = addEnv(f.defs, f.env);

  production attribute memberOverloads::[Pair<String (Expr ::= Expr Boolean Name Exprs Location)>] with ++;
  production attribute overloads::[Pair<String (Expr ::= Expr Exprs Location)>] with ++;
  memberOverloads := [];
  overloads := [];
  
  local option1::Maybe<Expr> = 
    case f of
      memberExpr(l, d, r) ->
        case lookupBy(stringEq, moduleName(top.env, l.typerep), memberOverloads) of
          just(prod) -> just(prod(l, d, r, a, top.location)) 
        | nothing() -> nothing()
        end
    | _ -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.env, f.typerep), overloads) of
      just(prod) -> just(prod(f, a, top.location))
    | nothing() -> nothing()
    end;
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
  
  production attribute overloads::[Pair<String (Expr ::= Expr Boolean Name Location)>] with ++;
  overloads := [];
  
  forwards to
    case lookupBy(stringEq, moduleName(top.env, lhs.typerep), overloads) of
      just(prod) -> prod(lhs, deref, rhs, top.location)
    | nothing() -> memberExprDefault(lhs, deref, rhs, location=top.location)
    end;
}
abstract production binaryOpExpr
top::Expr ::= lhs::Expr  op::BinOp  rhs::Expr
{
  propagate substituted;
  
  rhs.env = addEnv(lhs.defs, lhs.env);
  op.lop = lhs;
  op.rop = rhs;
  
  forwards to
    case op.resolved of
      just(e) -> e
    | nothing() -> binaryOpExprDefault(lhs, op, rhs, location=top.location)
    end;
}
