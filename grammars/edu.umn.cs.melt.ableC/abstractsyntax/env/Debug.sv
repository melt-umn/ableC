grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

import silver:langutil;
import silver:langutil:pp;

-- Aspects over different "Item" types in Env --
------------------------------------------------

attribute pp occurs on ValueItem;
flowtype pp {} on ValueItem;

aspect production declaratorValueItem
top::ValueItem ::= s::Decorated Declarator
{ top.pp = ppImplode(text(" "),s.pps); }

aspect production functionValueItem
top::ValueItem ::= s::Decorated FunctionDecl
{ top.pp = text("FunctionDecl"); } --s.pp; }

aspect production builtinValueItem
top::ValueItem ::= t::Type
{ top.pp = text("BuiltinValueItem"); }

aspect production builtinFunctionValueItem
top::ValueItem ::= t::Type  handler::(Expr ::= Name Exprs)
{ top.pp = text("BuiltinFunctionValueItem"); }

aspect production fieldValueItem
top::ValueItem ::= s::Decorated StructDeclarator
{ top.pp = text("StructDeclarator");} --ppImplode(text(" "),s.pps); }

aspect production enumValueItem
top::ValueItem ::= s::Decorated EnumItem
{ top.pp = text("EnumItem");} -- s.pp; }

aspect production parameterValueItem
top::ValueItem ::= s::Decorated ParameterDecl
{ top.pp = text("ParameterDecl");} -- s.pp; }

aspect production autoValueItem
top::ValueItem ::= e::Decorated Expr
{ top.pp = text("autoValueItem"); }

aspect production preDeclValueItem
top::ValueItem ::= ty::Type
{ top.pp = pp"preDeclValueItem"; }

aspect production errorValueItem
top::ValueItem ::=
{ top.pp = text("errorValueItem"); }


attribute pp occurs on TagItem;
flowtype pp {} on TagItem;

aspect production enumTagItem
top::TagItem ::= s::Decorated EnumDecl
{ top.pp = text("Decorated Enum"); }

aspect production refIdTagItem
top::TagItem ::= tag::StructOrEnumOrUnion  refId::String
{ top.pp = text("Struct|Union, refId = " ++ refId); }

aspect production errorTagItem
top::TagItem ::=
{ top.pp = text("ErrorTagItem"); }
{-
aspect production adtRefIdTagItem
t::TagItem ::= adtRefId::String structRefId::String
{ t.pp = text("ADT Tag: adtRefId=" ++ adtRefId ++ ", structRefId=" ++ structRefId); }
-}


attribute pp occurs on RefIdItem;
flowtype pp {} on RefIdItem;

{-
aspect production adtRefIdItem
t::RefIdItem ::= adt::Decorated ADTDecl s::Decorated StructDecl 
{ t.pp = text("ADTDecl, adt.name=" ++ adt.name ++ " -> struct ref id=" );}-- ++ s.refId); }
-}
aspect production structRefIdItem
top::RefIdItem ::= s::Decorated StructDecl
{ top.pp = text("StructDecl: s.refId=" ++ s.refId); }

aspect production unionRefIdItem
top::RefIdItem ::= s::Decorated UnionDecl
{ top.pp = text("UnionDecl"); }
