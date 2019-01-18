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

function substDecls
Decls ::= subs::[Substitution] base::Decls
{
  base.substitutions = foldSubstitution(subs);
  return base.substituted;
}

function substDecl
Decl ::= subs::[Substitution] base::Decl
{
  base.substitutions = foldSubstitution(subs);
  return base.substituted;
}

function substTypeName
TypeName ::= subs::[Substitution] base::TypeName
{
  base.substitutions = foldSubstitution(subs);
  return base.substituted;
}

function substStmt
Stmt ::= subs::[Substitution] base::Stmt
{
  base.substitutions = foldSubstitution(subs);
  return base.substituted;
}

function substExpr
Expr ::= subs::[Substitution] base::Expr
{
  base.substitutions = foldSubstitution(subs);
  return base.substituted;
}

function substName
Name ::= subs::[Substitution] base::Name
{
  base.substitutions = foldSubstitution(subs);
  return base.substituted;
}
