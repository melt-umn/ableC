grammar edu:umn:cs:melt:tutorials:ableC:tuple:concretesyntax;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:concretesyntax:lexerHack as lh;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;

imports silver:langutil only ast; 

imports edu:umn:cs:melt:tutorials:ableC:tuple:abstractsyntax;

marking terminal Tuple_t 'tuple' lexer classes {Ckeyword};

concrete production tupleDecl_c
top::Declaration_c ::= 'tuple' id::Identifier_t '{' tns::TupleTypeNames_c '}'
{
  top.ast = tupleDecl(fromId(id), tns.ast);
}
action {
  context = lh:addTypenamesToScope([fromId(id)], context);
}

-- Mirrors TypeNames_c
-- Can't use TypeNames_c due to constraints on adding new terminals to host follow sets
-- More on that later.
nonterminal TupleTypeNames_c with ast<TypeNames>;

concrete productions top::TupleTypeNames_c
| h::TypeName_c ',' t::TupleTypeNames_c
    { top.ast = consTypeName(h.ast, t.ast); }
| h::TypeName_c 
    { top.ast = consTypeName(h.ast, nilTypeName()); }
| 
    { top.ast = nilTypeName(); }