
--exports edu:umn:cs:melt:ableC:abstractsyntax:overload;

import edu:umn:cs:melt:ableC:abstractsyntax:builtins as builtinfunctions;

nonterminal Root with pp, errors, env;

abstract production root
top::Root ::= d::Decls
{
  top.pp = terminate(line(), d.pps);
  top.errors := if null(d.globalDecls) then d.errors else error("Found globalDecls at root");
--  d.env = addEnv(builtinfunctions:initialEnv;
  d.env = addEnv(builtinfunctions:getInitialEnvDefs(), top.env);
  d.isTopLevel = true;
  d.returnType = nothing();
}

{- There seem to be some efficiency issues with the way globalDecls are
   compupted and used.  We may want to do this computation a level higher
   (at the TranslationUnit level) and then not rely on forwarding, but
   instead computed the expanded tree as a synthesized attribute.

   I'm not sure this would help much, but something to ponder.

nonterminal TranslationUnits with pp, errors;

abstract production consTranslationUnit
top::TranslationUnits ::= ts::TranslationUnit rest::TranslationUnits 
{
}

abstract production nilTranslationUnit
top::TranslationUnits ::= 
{
}

nonterminal TranslationUnit with pp, errors;

abstract production translationUnit
top::TranslationUnit ::= d::Decl
{
}

-}
