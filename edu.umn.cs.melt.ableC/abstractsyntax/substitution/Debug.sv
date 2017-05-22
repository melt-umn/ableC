grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

aspect production txtExpr
e::Expr ::= txt::String
{
  propagate substituted;
}

aspect production txtDecl
d::Decl ::= txt::String
{
  propagate substituted;
}

aspect production txtStmt
s::Stmt ::= txt::String
{
  propagate substituted;
}


aspect production printEnv
e::Expr ::=
{
  propagate substituted;
}