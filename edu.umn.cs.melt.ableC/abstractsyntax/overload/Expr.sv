grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

abstract production unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  top.globalDecls := e.globalDecls;
  top.defs = e.defs;
  top.freeVariables = e.freeVariables;
  
  op.op = e;
  
  forwards to
    if op.unaryProd.isJust
    then op.unaryProd.fromJust(e, top.location)
    else unaryOpExprDefault(op, e, location=top.location);
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
    else arraySubscriptExprDefault(lhs, rhs, location=top.location);
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
    else callExprDefault(f, a, location=top.location);
}
abstract production memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  top.globalDecls := lhs.globalDecls;
  top.defs = lhs.defs;
  top.freeVariables = lhs.freeVariables;
  
  local lType::Type = lhs.typerep;
  lType.otherName = rhs.name;
  
  forwards to 
    if deref
    then if lType.memberDerefProd.isJust
         then lType.memberDerefProd.fromJust(lhs, top.location)
         else memberExprDefault(lhs, deref, rhs, location=top.location)
    else if lType.memberProd.isJust
         then lType.memberProd.fromJust(lhs, top.location)
         else memberExprDefault(lhs, deref, rhs, location=top.location);
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
  op.lop = lhs;
  op.rop = rhs;
  
  forwards to
    if op.binaryProd.isJust
    then op.binaryProd.fromJust(lhs, rhs, top.location)
    else binaryOpExprDefault(lhs, op, rhs, location=top.location);
}