grammar edu:umn:cs:melt:exts:ableC:gc:gcMalloc;

imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:concretesyntax as cnc;
imports edu:umn:cs:melt:ableC:abstractsyntax as abs;

import edu:umn:cs:melt:exts:ableC:gc;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:gc:mda_test;

marking terminal GcMalloc_t  'gcmalloc' lexer classes {Ckeyword};

concrete productions top::cnc:PostfixExpr_c
| 'gcmalloc' m::Malloc_c
    { top.ast = m.ast; }

nonterminal Malloc_c with ast<abs:Expr>, location;

concrete productions top::Malloc_c
| '(' size::cnc:Expr_c ')'
    { top.ast = gcMallocExpr(size.ast,
        location=top.location); }
