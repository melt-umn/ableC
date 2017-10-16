
--exports edu:umn:cs:melt:ableC:abstractsyntax:overload;

global fullErrorCheck::Boolean = true;

nonterminal Root with pp, host<Root>, lifted<Root>, errors, env;
flowtype Root = decorate {env};

synthesized attribute srcAst::Root;
synthesized attribute hostAst::Root;
synthesized attribute liftedAst::Root;
synthesized attribute srcPP::Document;
synthesized attribute hostPP::Document;
synthesized attribute liftedPP::Document;
synthesized attribute finalPP::Document;
-- functions that given an error return false if the error should be dropped
synthesized attribute srcErrorFilters::[(Boolean ::= Message)] with ++;
synthesized attribute hostErrorFilters::[(Boolean ::= Message)] with ++;
synthesized attribute liftedErrorFilters::[(Boolean ::= Message)] with ++;
nonterminal Compilation with srcAst, hostAst, liftedAst, srcPP, hostPP, liftedPP, finalPP, errors, env, srcErrorFilters, hostErrorFilters, liftedErrorFilters;
flowtype Compilation = decorate {env}, srcAst {}, hostAst {env}, liftedAst {env}, srcPP {}, hostPP {env}, liftedPP {env}, finalPP {env};

