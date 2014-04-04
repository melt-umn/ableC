grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

{--
 - Enums must resolve to an already fully-declared tag.
 - Struct and Union however, *always* begin resolving to an incomplete type,
 - until that type is completed at the closing '}'.
 - refIds are our solution for as-yet-incomplete types.
 -}
nonterminal TagItem;

{-- Name resolves to an enum declaration -}
abstract production enumTagItem
top::TagItem ::= s::Decorated EnumDecl
{
}

{-- Name resolves to a forward declaration of some kind of tag (struct/union only) -}
abstract production refIdTagItem
top::TagItem ::= tag::StructOrEnumOrUnion  refId::String
{
}

abstract production errorTagItem
top::TagItem ::=
{
}

