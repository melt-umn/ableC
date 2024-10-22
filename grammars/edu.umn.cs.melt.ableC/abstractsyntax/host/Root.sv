grammar edu:umn:cs:melt:ableC:abstractsyntax:host;
--exports edu:umn:cs:melt:ableC:abstractsyntax:overload;

import edu:umn:cs:melt:ableC:abstractsyntax:builtins as builtinfunctions;

global fullErrorCheck::Boolean = true;

tracked nonterminal Root with pp, host, errors, env;
flowtype Root = decorate {env};

abstract production root
top::Root ::= d::GlobalDecls
{
  propagate host, errors;
  
  top.pp = terminate(line(), d.pps);
  
--  d.env = addEnv(builtinfunctions:initialEnv;
  d.env = addEnv(builtinfunctions:getInitialEnvDefs(), top.env);
  d.controlStmtContext = initialControlStmtContext;
}

synthesized attribute srcAst::Root;
synthesized attribute hostAst::Root;
synthesized attribute srcPP::Document;
synthesized attribute hostPP::Document;
synthesized attribute finalPP::Document;
-- functions that given an error return false if the error should be dropped
synthesized attribute srcErrorFilters::[(Boolean ::= Message)] with ++;
synthesized attribute hostErrorFilters::[(Boolean ::= Message)] with ++;
tracked nonterminal Compilation with srcAst, hostAst, srcPP, hostPP, finalPP, errors, env, srcErrorFilters, hostErrorFilters;
flowtype Compilation = decorate {env}, srcAst {}, hostAst {env}, srcPP {}, hostPP {env}, finalPP {env};

abstract production compilation
top::Compilation ::= srcAst::Root
{
  srcAst.env = top.env;
  production hostAst::Root = srcAst.host;
  hostAst.env = top.env;
  top.srcErrorFilters := [];
  top.hostErrorFilters := [];

  local srcErrors :: [Message] =
    foldr(\f::(Boolean ::= Message) e::[Message] -> filter(f, e), srcAst.errors, top.srcErrorFilters);

  local hostErrors :: [Message] =
    foldr(\f::(Boolean ::= Message) e::[Message] -> filter(f, e), hostAst.errors, top.hostErrorFilters);
  
  top.errors :=
    if !null(srcErrors)
    then srcErrors
    else if !fullErrorCheck
    then []
    else if !null(hostErrors)
    then [nested(loc("", -1, -1, -1, -1, -1, -1), "Errors in host tree:", hostErrors)]
    else [];
  
  top.srcAst = srcAst;
  top.hostAst = hostAst;
  top.srcPP = srcAst.pp;
  top.hostPP = hostAst.pp;
  top.finalPP = top.hostPP;
}

{- There seem to be some efficiency issues with the way globalDecls are
   compupted and used.  We may want to do this computation a level higher
   (at the TranslationUnit level) and then not rely on forwarding, but
   instead computed the expanded tree as a synthesized attribute.

   I'm not sure this would help much, but something to ponder.

tracked nonterminal TranslationUnits with pp, errors;

abstract production consTranslationUnit
top::TranslationUnits ::= ts::TranslationUnit rest::TranslationUnits 
{
}

abstract production nilTranslationUnit
top::TranslationUnits ::= 
{
}

tracked nonterminal TranslationUnit with pp, errors;

abstract production translationUnit
top::TranslationUnit ::= d::Decl
{
}

-}
