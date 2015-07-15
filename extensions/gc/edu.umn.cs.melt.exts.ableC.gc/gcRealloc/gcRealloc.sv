grammar edu:umn:cs:melt:exts:ableC:gc:gcRealloc;

imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:concretesyntax as cnc;
imports edu:umn:cs:melt:ableC:abstractsyntax as abs;

import edu:umn:cs:melt:exts:ableC:gc;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:gc:mda_test;

marking terminal GcRealloc_t 'gcrealloc' lexer classes {Ckeyword};

terminal To_t 'to' lexer classes {Ckeyword};

concrete productions top::cnc:PostfixExpr_c
| 'gcrealloc' re::Realloc_c
    { top.ast = re.ast; }

nonterminal Realloc_c with ast<abs:Expr>, location;

concrete productions top::Realloc_c
| '(' ptr::cnc:Expr_c ')' 'to' '(' size::cnc:Expr_c ')'
--| ptr::cnc:Expr_c ':' size::cnc:ConditionalExpr_c
    { top.ast = gcReallocExpr(ptr.ast, size.ast,
        location=top.location); }
