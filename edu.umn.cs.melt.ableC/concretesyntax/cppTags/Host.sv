grammar edu:umn:cs:melt:ableC:concretesyntax:cppTags;

imports edu:umn:cs:melt:ableC:concretesyntax;

{-

-- Declarations get top level (translation unit) and more
concrete production declaration_tag_c
s::Declaration_c ::= t::TagLine_c
{
}

-- Often used within the definition of a struct declaration:
concrete production structDeclaration_tag_c
s::StructDeclaration_c ::= t::TagLine_c
{
}

-- Includes also appear inside initialization lists. weee....
concrete production initializer_tag_c
top::Initializer_c ::= t::TagLine_c  i::Initializer_c
{
}

concrete production initializerOne_tag_c
top::InitializerList_c ::= i::Initializer_c t::TagLine_c
{
}

concrete production initializerList_tag_c
top::InitializerList_c ::= il2::InitializerList_c ',' i::Initializer_c t::TagLine_c
{
}

-}
