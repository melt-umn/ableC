grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

aspect production maybeDecl
top::Decl ::= include::(Boolean ::= Decorated Env) decl::Decl
{
  propagate substituted;
}

aspect production injectGlobalDeclsExpr
top::Expr ::= decls::Decls lifted::Expr
{
  propagate substituted;
}

aspect production injectGlobalDeclsStmt
top::Stmt ::= decls::Decls lifted::Stmt
{
  propagate substituted;
}

aspect production injectGlobalDeclsTypeExpr
top::BaseTypeExpr ::= decls::Decls lifted::BaseTypeExpr
{
  propagate substituted;
}

aspect production injectGlobalDeclsType
top::Type ::= decls::Decls lifted::Type
{
  propagate substituted;
}