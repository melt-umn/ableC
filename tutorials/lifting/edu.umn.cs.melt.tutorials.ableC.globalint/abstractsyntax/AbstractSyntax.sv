grammar edu:umn:cs:melt:tutorials:ableC:globalint:abstractsyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction:parsing;

abstract production globalIntRefExpr
top::Expr ::= n::Name
{
  forwards to
    injectGlobalDeclsExpr(
      consDecl(
        maybeValueDecl(
          n.name,
          parseDecl(s"int ${n.name};")),
        nilDecl()),
      declRefExpr(n, location=builtin),
      location=builtin);
}

global builtin::Location = builtinLoc("globalint");