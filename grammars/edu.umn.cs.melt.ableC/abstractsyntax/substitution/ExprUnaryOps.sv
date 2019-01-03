
aspect production preIncExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production preDecExpr
top::Expr ::= e::Expr 
{
  propagate substituted;
}
aspect production postIncExpr
top::Expr ::= e::Expr 
{
  propagate substituted;
}
aspect production postDecExpr
top::Expr ::= e::Expr 
{
  propagate substituted;
}
aspect production addressOfExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production dereferenceExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production positiveExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production negativeExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production bitNegateExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production notExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production realExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production imagExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}

aspect production ovrld:preIncExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production ovrld:preDecExpr
top::Expr ::= e::Expr 
{
  propagate substituted;
}
aspect production ovrld:postIncExpr
top::Expr ::= e::Expr 
{
  propagate substituted;
}
aspect production ovrld:postDecExpr
top::Expr ::= e::Expr 
{
  propagate substituted;
}
aspect production ovrld:addressOfExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production ovrld:dereferenceExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production ovrld:positiveExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production ovrld:negativeExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production ovrld:bitNegateExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production ovrld:notExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}

aspect production inj:preIncExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production inj:preDecExpr
top::Expr ::= e::Expr 
{
  propagate substituted;
}
aspect production inj:postIncExpr
top::Expr ::= e::Expr 
{
  propagate substituted;
}
aspect production inj:postDecExpr
top::Expr ::= e::Expr 
{
  propagate substituted;
}
aspect production inj:addressOfExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production inj:dereferenceExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production inj:positiveExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production inj:negativeExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production inj:bitNegateExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production inj:notExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production inj:realExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production inj:imagExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}

aspect production sizeofExpr
top::Expr ::= e::ExprOrTypeName
{
  propagate substituted;
}
aspect production alignofExpr
top::Expr ::= e::ExprOrTypeName
{
  propagate substituted;
}

aspect production inj:sizeofExpr
top::Expr ::= e::ExprOrTypeName
{
  propagate substituted;
}
aspect production inj:alignofExpr
top::Expr ::= e::ExprOrTypeName
{
  propagate substituted;
}

