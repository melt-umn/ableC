grammar edu:umn:cs:melt:tutorials:ableC:interval:concretesyntax:constructor;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

import edu:umn:cs:melt:tutorials:ableC:interval;

marking terminal Intr_t 'intr' lexer classes {Ckeyword};

concrete productions top::PrimaryExpr_c
| 'intr' '[' min::AssignExpr_c ',' max::AssignExpr_c ']'
  { top.ast = newInterval(min.ast, max.ast, location=top.location); }
