grammar edu:umn:cs:melt:exts:ableC:vector:concretesyntax:typeExpr;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

import edu:umn:cs:melt:exts:ableC:vector;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:vector:mda_test;

marking terminal Vector_t 'vector' lexer classes {Ckeyword};

concrete productions top::TypeSpecifier_c
| 'vector' '(' sub::TypeName_c ')'
    { top.realTypeSpecifiers = [vectorTypeExpr(sub.ast)];
      top.preTypeSpecifiers = []; }
