grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

abstract production unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  propagate substituted;
  
  op.op = e;
  
  forwards to
    case op.unaryProd of
      just(prod) -> prod(e, top.location)
    | nothing() -> unaryOpExprDefault(op, e, location=top.location)
    end;
}
abstract production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  propagate substituted;
  
  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  
  forwards to 
    case lType.subscriptProd of
      just(prod) -> prod(lhs, rhs, top.location)
    | nothing() -> arraySubscriptExprDefault(lhs, rhs, location=top.location)
    end;
}
abstract production callExpr
top::Expr ::= f::Expr  a::Exprs
{
  propagate substituted;
  
  a.env = addEnv(f.defs, f.env);
  
  local lType::Type = f.typerep;
  lType.otherTypes = a.typereps;
  
  local lType2::Type =
    case f of
      memberExpr(lhs, _, _) -> lhs.typerep
    end;
  lType2.otherName =
    case f of
      memberExpr(_, _, rhs) -> rhs.name
    end;
  lType2.otherTypes = a.typereps;
  
  forwards to 
    case f of
      memberExpr(lhs, deref, _) ->
        if deref
        then case lType2.memberDerefCallProd of
          just(prod) -> prod(lhs, a, top.location)
        | nothing() -> callExprDefault(f, a, location=top.location)
        end
        else case lType2.memberCallProd of
          just(prod) -> prod(lhs, a, top.location)
        | nothing() -> callExprDefault(f, a, location=top.location)
        end
    | _ ->
      case lType.callProd of
        just(prod) -> prod(f, a, top.location)
      | nothing() -> callExprDefault(f, a, location=top.location)
      end
    end;
}
abstract production memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  propagate substituted;
  
  local lType::Type = lhs.typerep;
  lType.otherName = rhs.name;
  
  forwards to 
    if deref
    then case lType.memberDerefProd of
      just(prod) -> prod(lhs, top.location)
    | nothing() -> memberExprDefault(lhs, deref, rhs, location=top.location)
    end
    else case lType.memberProd of
      just(prod) -> prod(lhs, top.location)
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
    case op.binaryProd of
      just(prod) -> prod(lhs, rhs, top.location)
    | nothing() -> binaryOpExprDefault(lhs, op, rhs, location=top.location)
    end;
}
