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
| '{' captured::CaptureList_c '}' '(' params::ParameterList_c ')'
  '.' '(' res::Expr_c ')'
    { top.ast = lambdaExpr(captured.ast, foldParameterDecl(params.ast), res.ast,
                  location=top.location); }

| '(' params::ParameterList_c ')' '.' '(' res::Expr_c ')'
    { top.ast = lambdaExpr(exprFreeVariables(), foldParameterDecl(params.ast), res.ast,
                  location=top.location); 
    }
| '{' captured::CaptureList_c '}' '(' ')'
  '.' '(' res::Expr_c ')'
    { top.ast = lambdaExpr(captured.ast, nilParameters(), res.ast,
                  location=top.location); }

| '(' ')' '.' '(' res::Expr_c ')'
    { top.ast = lambdaExpr(exprFreeVariables(), nilParameters(), res.ast,
                  location=top.location); 
    }

nonterminal CaptureList_c with ast<CaptureList>;

concrete productions top::CaptureList_c
| id::Identifier_t ',' rest::CaptureList_c
    { top.ast = consCaptureList(fromId(id), rest.ast); }
| id::Identifier_t
    { top.ast = consCaptureList(fromId(id), nilCaptureList()); }
|
    { top.ast = nilCaptureList(); }
