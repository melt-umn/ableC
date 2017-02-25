grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

aspect production injectGlobalDecls
top::Expr ::= globalDecls::[Pair<String Decl>] lifted::Expr
{
  propagate substituted;
}

aspect production injectGlobalDeclsStmt
top::Stmt ::= globalDecls::[Pair<String Decl>] lifted::Stmt
{
  propagate substituted;
}

aspect production injectGlobalDeclsTypeExpr
top::BaseTypeExpr ::= globalDecls::[Pair<String Decl>] lifted::BaseTypeExpr
{
  propagate substituted;
}
