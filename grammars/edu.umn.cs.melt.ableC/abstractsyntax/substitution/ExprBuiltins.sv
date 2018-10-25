

aspect production typesCompatibleExpr
top::Expr ::= l::TypeName  r::TypeName
{
  propagate substituted;
}
aspect production vaArgExpr
top::Expr ::= e::Expr  ty::TypeName
{
  propagate substituted;
}

aspect production offsetofExpr
top::Expr ::= ty::TypeName  e::MemberDesignator
{
  propagate substituted;
}


aspect production initialMemberDesignator
top::MemberDesignator ::= id::Name
{
  propagate substituted;
}
aspect production fieldMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  id::Name
{
  propagate substituted;
}
aspect production derefMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  id::Name
{
  propagate substituted;
}
aspect production arrayMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  e::Expr
{
  propagate substituted;
}

aspect production isConstantExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}

aspect production vaArgPackExpr
top::Expr ::= 
{
  propagate substituted;
}

aspect production expectExpr
top::Expr ::= eval::Expr  expected::Expr
{
  propagate substituted;
}

aspect production vaStartExpr
top::Expr ::= lastParam::Name  valist::Name
{
  propagate substituted;
}
aspect production vaEndExpr
top::Expr ::= valist::Name
{
  propagate substituted;
}

