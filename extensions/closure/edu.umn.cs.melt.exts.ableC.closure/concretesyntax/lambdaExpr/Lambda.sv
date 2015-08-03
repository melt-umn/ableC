grammar edu:umn:cs:melt:exts:ableC:closure:concretesyntax:lambdaExpr;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

import edu:umn:cs:melt:exts:ableC:closure;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:closure:mda_test;

marking terminal Lambda_t 'lambda' lexer classes {Ckeyword};

concrete productions top::PostfixExpr_c
| 'lambda' body::Lambda_c
    { top.ast = body.ast; }

nonterminal Lambda_c with ast<Expr>, location;

concrete productions top::Lambda_c
| '{' captured::EnvNameList_c '}' '(' sqs::SpecifierQualifierList_c param::DirectDeclarator_c ')'
  '.' '(' res::Expr_c ')'
    { sqs.givenQualifiers = sqs.typeQualifiers;
      local bt::BaseTypeExpr =
        figureOutTypeFromSpecifiers(sqs.location, sqs.typeQualifiers, sqs.preTypeSpecifiers, sqs.realTypeSpecifiers, sqs.mutateTypeSpecifiers);
      param.givenType = baseTypeExpr();
      local pType::TypeName = 
        typeName(
          if null(sqs.attributes) then bt else warnTypeExpr([wrn(top.location, "Ignoring attributes in type name1")], bt),
          param.ast);
      top.ast = lambdaExpr(captured.ast, pType, param.declaredIdent, res.ast,
                  location=top.location); }

| '(' sqs::SpecifierQualifierList_c param::DirectDeclarator_c ')' '.' '(' res::Expr_c ')'
    { sqs.givenQualifiers = sqs.typeQualifiers;
      local bt::BaseTypeExpr =
        figureOutTypeFromSpecifiers(sqs.location, sqs.typeQualifiers, sqs.preTypeSpecifiers, sqs.realTypeSpecifiers, sqs.mutateTypeSpecifiers);
      param.givenType = baseTypeExpr();
      local pType::TypeName = 
        typeName(
          if null(sqs.attributes) then bt else warnTypeExpr([wrn(top.location, "Ignoring attributes in type name1")], bt),
          param.ast);
      top.ast = lambdaExpr(envContents(), pType, param.declaredIdent, res.ast,
                  location=top.location); 
    }

nonterminal EnvNameList_c with ast<EnvNameList>;

concrete productions top::EnvNameList_c
| id::Identifier_t ',' rest::EnvNameList_c
    { top.ast = consEnvNameList(fromId(id), rest.ast); }
| id::Identifier_t
    { top.ast = consEnvNameList(fromId(id), nilEnvNameList()); }
|
    { top.ast = nilEnvNameList(); }
