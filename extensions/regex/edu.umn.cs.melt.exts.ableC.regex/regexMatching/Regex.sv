grammar edu:umn:cs:melt:exts:ableC:regex:regexMatching;

imports edu:umn:cs:melt:ableC:concretesyntax as cnc;
imports silver:langutil only ast;

import edu:umn:cs:melt:exts:ableC:regex;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:regex:mda_test;

marking terminal RegexMatch_t '=~';

concrete productions top::cnc:AddMulNoneOp_c
| '=~'
    { top.ast = regexMatch(top.cnc:leftExpr, top.cnc:rightExpr,
        location=top.cnc:exprLocation); }

