
--exports edu:umn:cs:melt:ableC:abstractsyntax:overload;

import edu:umn:cs:melt:ableC:abstractsyntax:builtins as builtinfunctions;

global fullErrorCheck::Boolean = true;

nonterminal Root with pp, host<Root>, lifted<Root>, errors, env;

abstract production root
top::Root ::= d::GlobalDecls
{
  propagate host, lifted;
  
  top.pp = terminate(line(), d.pps);
  top.errors := d.errors;
  
--  d.env = addEnv(builtinfunctions:initialEnv;
  d.env = addEnv(builtinfunctions:getInitialEnvDefs(), top.env);
  d.returnType = nothing();
}

synthesized attribute srcAst::Root;
synthesized attribute hostAst::Root;
synthesized attribute liftedAst::Root;
synthesized attribute srcPP::Document;
synthesized attribute hostPP::Document;
synthesized attribute liftedPP::Document;
synthesized attribute finalPP::Document;
nonterminal Compilation with srcAst, hostAst, liftedAst, srcPP, hostPP, liftedPP, finalPP, errors, env;

abstract production compilation
top::Compilation ::= srcAst::Root
{
  srcAst.env = top.env;
  production hostAst::Root = srcAst.host;
  hostAst.env = top.env;
  production liftedAst::Root = hostAst.lifted;
  liftedAst.env = top.env;
  
  top.errors :=
    if !null(srcAst.errors)
    then srcAst.errors
    else if !fullErrorCheck
    then []
    else if !null(hostAst.errors)
    then [nested(loc("", -1, -1, -1, -1, -1, -1), "Errors in host tree:", hostAst.errors)]
    else if !null(liftedAst.errors)
    then [nested(loc("", -1, -1, -1, -1, -1, -1), "Errors in lifted tree:", hostAst.errors)]
    else [];
  
  top.srcAst = srcAst;
  top.hostAst = hostAst;
  top.liftedAst = liftedAst;
  top.srcPP = srcAst.pp;
  top.hostPP = hostAst.pp;
  top.liftedPP = liftedAst.pp;
  top.finalPP = top.liftedPP;
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
