grammar edu:umn:cs:melt:exts:ableC:gc:gcMalloc;

imports edu:umn:cs:melt:ableC:concretesyntax as cnc;
imports silver:langutil only ast;

import edu:umn:cs:melt:exts:ableC:gc;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:gc:mda_test;

marking terminal GcMalloc_t  'gcmalloc' lexer classes {Ckeyword};
marking terminal GcRealloc_t 'gcrealloc' lexer classes {Ckeyword};

terminal To_t 'to' lexer classes {Ckeyword};

concrete productions top::cnc:PostfixExpr_c
| 'gcmalloc' '(' size::cnc:Expr_c ')'
    { top.ast = gcMallocExpr(size.ast,
        location=top.location); }
| 'gcrealloc' ptr::cnc:Expr_c 'to' '(' size::cnc:Expr_c ')'
    { top.ast = gcReallocExpr(ptr.ast, size.ast,
        location=top.location); }