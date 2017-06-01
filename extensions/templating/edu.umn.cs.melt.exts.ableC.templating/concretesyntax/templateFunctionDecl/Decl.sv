grammar edu:umn:cs:melt:exts:ableC:templating:concretesyntax:templateFunctionDecl;

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

concrete production templateFunctionDecl_c
top::ExternalDeclaration_c ::= Template_t params::TemplateParameters_c '>' dcl::TemplateInitialFunctionDefinition_c s::CompoundStatement_c
{
  top.ast = templateFunctionDecl(params.ast, dcl.ast);
  dcl.givenStmt = s.ast;
}
action {
  context = lh:closeScope(context); -- Opened by TemplateInitialFunctionDefinition_c
  context = lh:closeScope(context); -- Opened by TemplateParams_c
}

nonterminal TemplateInitialFunctionDefinition_c with location, ast<ast:FunctionDecl>, givenStmt;
concrete productions top::TemplateInitialFunctionDefinition_c
| ds::DeclarationSpecifiers_c  d::Declarator_c  l::DeclarationList_c
    {
      ds.givenQualifiers = ds.typeQualifiers;
      d.givenType = ast:baseTypeExpr();
      
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(ds.location, ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
      
      top.ast = 
        ast:functionDecl(ds.storageClass, ds.specialSpecifiers, bt, d.ast, d.declaredIdent, ds.attributes, ast:foldDecl(l.ast), top.givenStmt);
    }
    action {
      -- Function are annoying because we have to open a scope, then add the
      -- parameters, and close it after the brace.
      context = lh:beginFunctionScope(d.declaredIdent, d.declaredParamIdents, context);
    }
| d::Declarator_c  l::DeclarationList_c
    {
      d.givenType = ast:baseTypeExpr();
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(d.location, ast:nilQualifier(), [], [], []);

      top.ast = 
        ast:functionDecl([], [], bt, d.ast, d.declaredIdent, ast:nilAttribute(), ast:foldDecl(l.ast), top.givenStmt);
    }
    action {
      -- Unfortunate duplication. This production is necessary for K&R compatibility
      -- We can't make it a proper optional nonterminal, since that requires a reduce far too early.
      -- (i.e. LALR conflicts)
      context = lh:beginFunctionScope(d.declaredIdent, d.declaredParamIdents, context);
    }
