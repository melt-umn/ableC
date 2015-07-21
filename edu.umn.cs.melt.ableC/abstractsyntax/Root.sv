
import edu:umn:cs:melt:ableC:abstractsyntax:builtins as builtinfunctions;

nonterminal Root with pp, errors;

abstract production root
top::Root ::= d::Decls
{
  top.pp = terminate(line(), d.pps);
  top.errors := d.errors;
  d.env = builtinfunctions:initialEnv;
  d.isTopLevel = true;
  d.returnType = nothing();
}


