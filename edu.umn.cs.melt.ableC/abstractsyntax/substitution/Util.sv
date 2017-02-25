grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

function foldSubstitution
Substitutions ::= l::[Substitution]
{
  return foldr(consSubstitution, nilSubstitution(), l);
}

function subTypedefDecls
Decls ::= names::[String] subs::[Type] base::Decls
{
  base.substitutions = foldSubstitution(zipWith(typedefNameSubstitution, names, subs));
  return base.substituted;
}

function subTypedefDecl
Decl ::= names::[String] subs::[Type] base::Decl
{
  base.substitutions = foldSubstitution(zipWith(typedefNameSubstitution, names, subs));
  return base.substituted;
}

function subTypedefStmt
Stmt ::= names::[String] subs::[Type] base::Stmt
{
  base.substitutions = foldSubstitution(zipWith(typedefNameSubstitution, names, subs));
  return base.substituted;
}

function subTypedefExpr
Expr ::= names::[String] subs::[Type] base::Expr
{
  base.substitutions = foldSubstitution(zipWith(typedefNameSubstitution, names, subs));
  return base.substituted;
}