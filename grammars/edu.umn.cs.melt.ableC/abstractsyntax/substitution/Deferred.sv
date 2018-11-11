grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

aspect production deferredDecl
top::Decl ::= cond::(Boolean ::= Decorated Env) d::Decl
{
  propagate substituted;
}
