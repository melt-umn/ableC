grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

function foldSubstitution
Substitutions ::= l::[Substitution]
{
  return foldr(consSubstitution, nilSubstitution(), l);
}

function unfoldSubstitution
[Substitution] ::= l::Substitutions
{
  return
    case l of
      consSubstitution(h, t) -> h :: unfoldSubstitution(t)
    | nilSubstitution() -> []
    end;
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

function subName
Name ::= subs::[Substitution] base::Name
{
  base.substitutions = foldSubstitution(subs);
  return base.substituted;
}