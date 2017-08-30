grammar edu:umn:cs:melt:tutorials:ableC:intconst:concretesyntax:decl;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports silver:langutil only ast;

imports edu:umn:cs:melt:tutorials:ableC:intconst:abstractsyntax;

exports edu:umn:cs:melt:tutorials:ableC:intconst:concretesyntax:keyword;

concrete production intConstDecl_c
top::ExternalDeclaration_c ::= 'intconst' id::Identifier_t '=' dc::DecConstant_t ';'
{ 
  top.ast = intConstDecl(fromId(id), toInt(dc.lexeme));
}
