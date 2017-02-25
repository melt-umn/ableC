grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

function foldSubstitution
Substitutions ::= l::[Substitution]
{
  return foldr(consSubstitution, nilSubstitution(), l);
}

function subDecls
Decls ::= subs::[Substitution] base::Decls
{
  base.substitutions = foldSubstitution(subs);
  return base.substituted;
}

function subDecl
Decl ::= subs::[Substitution] base::Decl
{
  base.substitutions = foldSubstitution(subs);
  return base.substituted;
}

function subStmt
Stmt ::= subs::[Substitution] base::Stmt
{
  base.substitutions = foldSubstitution(subs);
  return base.substituted;
}

function subExpr
Expr ::= subs::[Substitution] base::Expr
{
  base.substitutions = foldSubstitution(subs);
  return base.substituted;
}