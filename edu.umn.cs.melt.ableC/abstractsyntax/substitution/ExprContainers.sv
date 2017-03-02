
aspect production justExpr
top::MaybeExpr ::= e::Expr
{
  propagate substituted;
}
aspect production nothingExpr
top::MaybeExpr ::=
{
  propagate substituted;
}

aspect production consExpr
top::Exprs ::= h::Expr  t::Exprs
{
  propagate substituted;
}
aspect production nilExpr
top::Exprs ::=
{
  propagate substituted;
}

aspect production exprExpr
top::ExprOrTypeName ::= e::Expr
{
  propagate substituted;
}
aspect production typeNameExpr
top::ExprOrTypeName ::= ty::TypeName
{
  propagate substituted;
}


