grammar edu:umn:cs:melt:ableC:concretesyntax:construction;

imports silver:langutil;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:concretesyntax:lexerHack as lh;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax;

-- Needed for the lexer hack to work, allows specification of type names to add to lexer scope
marking terminal LexerHackTypedefProto_t 'proto_typedef' lexer classes {Ckeyword};

concrete production lexerHackTypedefProto
top::Declaration_c ::= 'proto_typedef' ids::IdentifierList_c ';'
{
  top.ast = decls(nilDecl());
}
action {
  context = lh:addTypenamesToScope(ids.declaredIdents, context);
}

nonterminal IdentifierList_c with declaredIdents;

concrete productions top::IdentifierList_c
| id::Identifier_t
    { top.declaredIdents = [fromId(id)]; }
| h::IdentifierList_c ',' t::Identifier_t
    { top.declaredIdents = fromId(t) :: h.declaredIdents; }