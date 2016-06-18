grammar edu:umn:cs:melt:exts:ableC:string:concretesyntax:show;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

import edu:umn:cs:melt:exts:ableC:string;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:string:mda_test;

marking terminal Show_t 'show' lexer classes {Ckeyword};

-- Someday, we may overload function application instead
concrete productions top::PrimaryExpr_c
| 'show' '(' s::Expr_c ')'
  { top.ast = showExpr(s.ast, location=top.location); }
