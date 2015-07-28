
import edu:umn:cs:melt:ableC:abstractsyntax:builtins as builtinfunctions;

nonterminal Root with pp, errors;

abstract production root
top::Root ::= d::Decls
{
  top.pp = terminate(line(), d.pps);
  top.errors := if null(d.globalDecls) then d.errors else error("Found globalDecls at root");
  d.env = builtinfunctions:initialEnv;
  d.isTopLevel = true;
  d.returnType = nothing();
}


