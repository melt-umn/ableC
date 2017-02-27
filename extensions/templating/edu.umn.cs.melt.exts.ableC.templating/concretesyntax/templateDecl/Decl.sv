grammar edu:umn:cs:melt:exts:ableC:templating:concretesyntax:templateDecl;

imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:concretesyntax:lexerHack as lh;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;

imports edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:templating:mda_test;

marking terminal Template_t /template[\ ]*</ lexer classes {Ckeyword};

concrete production templateDeclaration_c
top::ExternalDeclaration_c ::= Template_t params::TemplateParams_c '>' decl::TemplateDecl_c
{
  top.ast = decl.ast;
  decl.params = params.ast;
}
action {
  context = lh:closeScope(context); -- Opened by TemplateDecl_c
}

-- Seperate nonterminal so that we can open a scope and add newly defined parameter types to the context
closed nonterminal TemplateParams_c with location, ast<[Name]>;

concrete production templateParams_c
top::TemplateParams_c ::= params::Names_c
{
  top.ast = params.ast;
}
action {
  context = lh:addTypenamesToScope(params.ast, lh:openScope(context));
}

autocopy attribute params::[Name];

closed nonterminal TemplateDecl_c with location, ast<Decl>, params;

concrete production templateFunctionDecl_c
top::TemplateDecl_c ::= decl::FunctionDefinition_c
{
  top.ast = templateFunctionDecl(top.params, decl.ast);
}

closed nonterminal Names_c with location, ast<[Name]>;

concrete productions top::Names_c
| h::Identifier_t ',' t::Names_c
  { top.ast = fromId(h) :: t.ast; }
| h::Identifier_t
  { top.ast = [fromId(h)]; }
| 
  { top.ast = []; }