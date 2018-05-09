grammar edu:umn:cs:melt:exts:silver:ableC:abstractsyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax:host as ableC;

abstract production escapeExpr
top::ableC:Expr ::= e::Expr
{
  forwards to ableC:errorExpr([], location=builtin);
}
