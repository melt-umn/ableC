grammar edu:umn:cs:melt:tutorials:ableC:tuple:concretesyntax;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:concretesyntax:lexerHack as lh;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;

imports silver:langutil only ast; 

imports edu:umn:cs:melt:tutorials:ableC:tuple:abstractsyntax;

marking terminal Tuple_t 'tuple' lexer classes {Ckeyword};

concrete production tupleDecl_c
top::Declaration_c ::= 'tuple' id::Identifier_t '{' tns::TypeNames_c '}'
{
  top.ast = tupleDecl(fromId(id), tns.ast);
}
action {
  context = lh:addTypenamesToScope([fromId(id)], context);
}
