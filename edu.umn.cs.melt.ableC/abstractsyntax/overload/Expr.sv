grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

abstract production unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  top.globalDecls := e.globalDecls;
  top.defs = e.defs;
  top.freeVariables = e.freeVariables;
  
  forwards to getUnaryOverload(op, e.typerep)(e, top.location);
}
abstract production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.defs = lhs.defs ++ rhs.defs;
  top.freeVariables = lhs.freeVariables ++ removeDefsFromNames(rhs.defs, rhs.freeVariables);
  
  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  
  forwards to 
    if lType.subscriptProd.isJust
    then lType.subscriptProd.fromJust(lhs, rhs, top.location)
    else abs:arraySubscriptExpr(lhs, rhs, location=top.location);
}
abstract production callExpr
top::Expr ::= f::Expr  a::Exprs
{
  top.globalDecls := f.globalDecls ++ a.globalDecls;
  top.defs = f.defs ++ a.defs;
  top.freeVariables = f.freeVariables ++ removeDefsFromNames(f.defs, a.freeVariables);
  
  a.env = addEnv(f.defs, f.env);
  
  local lType::Type = f.typerep;
  lType.otherTypes = a.typereps;
  
  forwards to 
    if lType.callProd.isJust
    then lType.callProd.fromJust(f, a, top.location)
    else abs:callExpr(f, a, location=top.location);
}
abstract production binaryOpExpr
top::Expr ::= lhs::Expr  op::BinOp  rhs::Expr
{
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.defs = lhs.defs ++ rhs.defs;
  top.freeVariables =
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  
  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::Type = 
    case lhs of 
      arraySubscriptExpr(l, r) -> l.typerep
    | _ -> error("shouldn't happen")
    end;
  lType.otherType = 
    case lhs of 
      arraySubscriptExpr(l, r) -> r.typerep
    | _ -> error("shouldn't happen")
    end;
  lType.otherType2 = rhs.typerep;
  
  forwards to
    case lhs, op of -- TODO, it seems like this check belongs somewhere else
      arraySubscriptExpr(l, r), assignOp(ao) ->
        case lType.subscriptAssignProd of
          just(p) -> p(l, r, ao, rhs, top.location)
        | nothing() -> getBinaryOverload(top.env, top.returnType, lhs.typerep, op, rhs.typerep)(lhs, rhs, top.location)
        end
    | _, _ -> getBinaryOverload(top.env, top.returnType, lhs.typerep, op, rhs.typerep)(lhs, rhs, top.location)
    end;
}