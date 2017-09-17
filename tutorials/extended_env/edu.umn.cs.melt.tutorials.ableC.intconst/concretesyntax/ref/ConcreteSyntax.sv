grammar edu:umn:cs:melt:tutorials:ableC:intconst:concretesyntax:ref;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports silver:langutil only ast;

imports edu:umn:cs:melt:tutorials:ableC:intconst:abstractsyntax;

exports edu:umn:cs:melt:tutorials:ableC:intconst:concretesyntax:keyword;

concrete production intConstRef_c
top::PrimaryExpr_c ::= 'intconst' id::Identifier_t
{ 
  top.ast = intConstRef(fromId(id), location=top.location);
}
