grammar edu:umn:cs:melt:exts:ableC:closure:concretesyntax:applyExpr;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

import edu:umn:cs:melt:exts:ableC:closure;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:closure:mda_test;

marking terminal Apply_t 'appclosure' lexer classes {Ckeyword};

terminal To_t 'to' lexer classes {Ckeyword};

-- Someday, we may overload function application instead
concrete productions top::AssignExpr_c
| 'appclosure' '(' fn::Expr_c ')' 'to' '(' param::Expr_c ')'
  { top.ast = applyExpr(fn.ast, param.ast, location=top.location); }
