grammar edu:umn:cs:melt:exts:ableC:closure:concretesyntax:typeExpr;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

import edu:umn:cs:melt:exts:ableC:closure;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:closure:mda_test;

marking terminal Closure_t 'closure' lexer classes {Ckeyword};

concrete productions top::TypeSpecifier_c
| 'closure' '<' param::TypeName_c ',' res::TypeName_c '>'
    { top.realTypeSpecifiers = [closureTypeExpr(param.ast, res.ast)];
      top.preTypeSpecifiers = []; }