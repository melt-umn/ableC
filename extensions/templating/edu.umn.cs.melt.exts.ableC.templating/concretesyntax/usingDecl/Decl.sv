grammar edu:umn:cs:melt:exts:ableC:templating:concretesyntax:usingDecl;

imports silver:langutil;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:concretesyntax:lexerHack as lh;

imports edu:umn:cs:melt:ableC:abstractsyntax as ast;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as ast;

imports edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

exports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:templateParameters;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:templating:mda_test;

marking terminal Using_t 'using' lexer classes {Ckeyword};

concrete production usingDeclaration_c
top::ExternalDeclaration_c ::= 'using' id::Identifier_t '<' params::TemplateParameters_c '>' '=' ty::TypeName_c ';'
{
  top.ast = templateTypeDecl(params.ast, ast:fromId(id), ty.ast);
}
action {
  context = lh:closeScope(context); -- Opened by TemplateDecl_c
  context = lh:addTypenamesToScope([ast:fromId(id)], context);
}