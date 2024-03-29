grammar edu:umn:cs:melt:ableC:concretesyntax:construction;

imports silver:langutil;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:host;

-- Needed for the lexer hack to work, when dealing with code fragments,
-- allows specification of type names to add to lexer scope
concrete production lexerHackProtoTypedefDecl
top::Declaration_c ::= ProtoTypedef_c
{
  top.ast = decls(nilDecl());
}

terminal LexerHackTypedefProto_t 'proto_typedef' lexer classes {Keyword, Reserved};

tracked nonterminal ProtoTypedef_c;

concrete productions top::ProtoTypedef_c
| 'proto_typedef' ids::IdentifierList_c ';'
  {}
  action {
    context = addIdentsToScope(ids.declaredIdents, TypeName_t, context);
  }

tracked nonterminal IdentifierList_c with declaredIdents;

concrete productions top::IdentifierList_c
| id::Identifier_c
    { top.declaredIdents = [id.ast]; }
| h::IdentifierList_c ',' t::Identifier_c
    { top.declaredIdents = t.ast :: h.declaredIdents; }
