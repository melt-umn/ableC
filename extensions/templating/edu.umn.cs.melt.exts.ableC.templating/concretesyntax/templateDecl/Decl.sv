grammar edu:umn:cs:melt:exts:ableC:templating:concretesyntax:templateDecl;

imports silver:langutil;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:concretesyntax:lexerHack as lh;

imports edu:umn:cs:melt:ableC:abstractsyntax as ast;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as ast;

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
  context =
    if decl.isTypedef
    then lh:addTypenamesToScope(decl.declaredIdents, context)
    else lh:addIdentsToScope(decl.declaredIdents, context);
}

-- Seperate nonterminal so that we can open a scope and add newly defined parameter types to the context
closed nonterminal TemplateParams_c with location, ast<[ast:Name]>;

concrete production templateParams_c
top::TemplateParams_c ::= params::Names_c
{
  top.ast = params.ast;
}
action {
  context = lh:addTypenamesToScope(params.ast, lh:openScope(context));
}

autocopy attribute params::[ast:Name];

closed nonterminal TemplateDecl_c with location, params, ast<ast:Decl>, isTypedef, declaredIdents;

concrete production templateFunctionDecl_c
top::TemplateDecl_c ::= decl::FunctionDefinition_c
{
  top.ast = templateFunctionDecl(top.params, decl.ast);
  top.isTypedef = false;
  top.declaredIdents = [];
}

-- Typedef or variable decl with exactly 1 declarator
concrete production templateDecl_c
top::TemplateDecl_c ::= ds::DeclarationSpecifiers_c idcl::InitDeclarator_c  ';'
{
  ds.givenQualifiers = ds.typeQualifiers;
  
  local bt::ast:BaseTypeExpr =
    ast:figureOutTypeFromSpecifiers(ds.location, ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
  
  top.ast = 
    if ds.isTypedef then
      if !null(ds.storageClass) then
        templateTypedefDecl(
          top.params,
          ds.attributes, 
          ast:warnTypeExpr(
            [err(ds.location, "Typedef declaration also claims another storage class")],
            bt),
          head(idcl.ast))
      else
        templateTypedefDecl(top.params, ds.attributes, bt, head(idcl.ast))
    else
      templateVariableDecl(top.params, ds.storageClass, ds.attributes, bt, head(idcl.ast));
  
  top.isTypedef = ds.isTypedef;
  top.declaredIdents = [idcl.declaredIdent];
}

closed nonterminal Names_c with location, ast<[ast:Name]>;

concrete productions top::Names_c
| h::Identifier_t ',' t::Names_c
  { top.ast = ast:fromId(h) :: t.ast; }
| h::Identifier_t
  { top.ast = [ast:fromId(h)]; }
| 
  { top.ast = []; }