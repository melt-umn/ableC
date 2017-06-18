grammar edu:umn:cs:melt:tutorials:ableC:globalint:concretesyntax;

imports edu:umn:cs:melt:ableC:concretesyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports silver:langutil only ast; 

imports edu:umn:cs:melt:tutorials:ableC:globalint:abstractsyntax;

marking terminal GlobalInt_t 'globalint' lexer classes {Ckeyword};

concrete production globalIntRefExpr_c
top::PrimaryExpr_c ::= 'globalint' id::Identifier_t
{
  top.ast = globalIntRefExpr(fromId(id), location=top.location);
}