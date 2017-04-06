grammar edu:umn:cs:melt:exts:ableC:templating:concretesyntax:templateStructDecl;

imports silver:langutil;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:concretesyntax:lexerHack as lh;

imports edu:umn:cs:melt:ableC:abstractsyntax as ast;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as ast;

imports edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

exports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:templateKeyword;
exports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:templateParameters;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:templating:mda_test;

-- Template struct decl conflicts with function decl where the return type is a struct, which is an
-- unusual case.  To resolve this, we define our own 'struct' keyword, which causes a lexical
-- ambiguity with the host STRUCT keyword, which is then resolved for this case with a
-- disambiguation function.
terminal TemplateStruct_t 'struct' lexer classes {Ckeyword};

disambiguate STRUCT, TemplateStruct_t {
  pluck TemplateStruct_t;
}

concrete production templateStructDecl_c
top::ExternalDeclaration_c ::= Template_t params::TemplateParameters_c '>' TemplateStruct_t maa::MaybeAttributes_c id::Identifier_t '{' ss::StructDeclarationList_c '}'  ';'
{ 
  top.ast = templateStructDecl(params.ast, maa.ast, ast:fromId(id), ast:foldStructItem(ss.ast));
}
action {
  context = lh:closeScope(context); -- Opened by TemplateParams_c
  context = lh:addTypenamesToScope([ast:fromId(id)], context);
}

nonterminal MaybeAttributes_c with ast<[ast:Attribute]>;

concrete productions top::MaybeAttributes_c
| aa::Attributes_c
  { top.ast = aa.ast; }
| 
  { top.ast = []; }

{-
concrete production templateStructDecl_c
top::ExternalDeclaration_c ::= Template_t tsd::TemplateStructDecl_c
{ 
  top.ast = tsd.ast;
}
action {
  context = lh:closeScope(context); -- Opened by TemplateParams_c
  context = lh:addTypenamesToScope(tsd.declaredIdents, context);
}

nonterminal TemplateStructDecl_c with location, declaredIdents, ast<ast:Decl>;

concrete productions top::TemplateStructDecl_c
| params::TemplateParameters_c '>' TemplateStruct_t id::Identifier_t '{' ss::StructDeclarationList_c '}'  ';'
  {
    top.declaredIdents = [ast:fromId(id)];
    top.ast = templateStructDecl(params.ast, [], ast:fromId(id), ast:foldStructItem(ss.ast));
  }
| params::TemplateParameters_c '>' TemplateStruct_t aa::Attributes_c id::Identifier_t '{' ss::StructDeclarationList_c '}'  ';'
  {
    top.declaredIdents = [ast:fromId(id)];
    top.ast = templateStructDecl(params.ast, aa.ast, ast:fromId(id), ast:foldStructItem(ss.ast));
  }-}