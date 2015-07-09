grammar edu:umn:cs:melt:exts:ableC:gc:gcNew;

imports edu:umn:cs:melt:ableC:concretesyntax as cnc;
imports edu:umn:cs:melt:ableC:abstractsyntax as abs;
imports silver:langutil only ast;

import edu:umn:cs:melt:exts:ableC:gc;

-- Spurious import, to trigger the tests on build.
--import edu:umn:cs:melt:exts:ableC:gc:mda_test;

marking terminal GcNew_t 'gcnew' lexer classes {Ckeyword};

concrete productions top::cnc:PostfixExpr_c
| 'gcnew' typeId::cnc:Identifier_t
    { top.ast = gcNewExpr(fromId(typeId),
        location=top.location); }
        
function fromId
abs:Name ::= n::cnc:Identifier_t
{
  return abs:name(n.lexeme, location=n.location);
}