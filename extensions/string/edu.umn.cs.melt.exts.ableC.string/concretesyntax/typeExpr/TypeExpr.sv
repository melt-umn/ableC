grammar edu:umn:cs:melt:exts:ableC:string:concretesyntax:typeExpr;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

import edu:umn:cs:melt:exts:ableC:string;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:string:mda_test;

marking terminal String_t 'string' lexer classes {Ckeyword};

concrete productions top::TypeSpecifier_c
| 'string'
    { top.realTypeSpecifiers = [stringTypeExpr(top.givenQualifiers)];
      top.preTypeSpecifiers = []; }
