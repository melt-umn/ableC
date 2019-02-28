grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

aspect production maybeDecl
top::Decl ::= include::(Boolean ::= Decorated Env) decl::Decl
{
  propagate substituted;
}
aspect production maybeValueDecl
top::Decl ::= name::String decl::Decl
{
  propagate substituted;
}
aspect production maybeTagDecl
top::Decl ::= name::String decl::Decl
{
  propagate substituted;
}
aspect production maybeRefIdDecl
top::Decl ::= name::String decl::Decl
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
aspect production injectGlobalDeclsDecl
top::Decl ::= decls::Decls
{
  propagate substituted;
}

aspect production completedTypeExpr
top::BaseTypeExpr ::= result::Type
{
  propagate substituted;
}
