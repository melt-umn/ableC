grammar edu:umn:cs:melt:ableC:abstractsyntax;

import silver:util:raw:treemap as tm;

{- ------------------------------------------------------------
   The helper functions below simplify the creation of ASTs.  They are
   currently used only by the algebraic-data-types extension.  They
   should only be used as a temporary means for generating ASTs.
   ------------------------------------------------------------
 -}

-- Helper functions --
----------------------
abstract production txtExpr
e::Expr ::= txt::String
{
  propagate host;
  e.pp = text(txt);
  e.errors := [];
  e.globalDecls := [];
  e.defs = [];
  e.freeVariables = [];
  e.typerep = errorType(); -- error("Need a type on txtExpr"); 
}
abstract production txtStmt
s::Stmt ::= txt::String
{
  propagate host;
  s.pp = text(txt);
  s.errors := [];
  s.globalDecls := [];
  s.defs = [];
  s.freeVariables = [];
  s.functiondefs = [];
}

abstract production txtDecl
d::Decl ::= txt::String
{
  propagate host;
  d.pp = text(txt);
  d.errors := [ ];
  d.globalDecls := [];
  d.defs = [ ];
  d.freeVariables = [];
}






{- ------------------------------------------------------------
   Functions and aspects to print out some components of the
   environment.  This maybe useful for some debugging purposes.

   The production printEnv uses the dependency of inherited attribute
   env for synthesized attribute pp.

   ------------------------------------------------------------
 -}

abstract production printEnv
e::Expr ::=
{
  e.errors := [];
  e.globalDecls := [];
  e.defs = [];
  e.pp = comment("printEnv pp should be demanded through host pp", location=e.location).pp;
  forwards to comment( show(80,showEnv(e.env)), location=e.location );
}



function showEnv
Document ::= e::Decorated Env
{
  return concat( [
    text(" Environment:"),
    nestlines(5, 
      concat([
       --text("Labels:"),line(),
       text("Values:"),line(),
         nestlines(5, valuesD),
       text("Tags:"),line(),
         nestlines(5, tagsD),
       text("RefIDs:"),
         nestlines(5, refIDsD)
       ]) )
   ] );

  local valuesD :: Document
    = ppImplode(line(), map( showScope(_,showValueItemBinding), map( tm:toList, e.values )));
  local tagsD :: Document
    = ppImplode(line(), map( showScope(_,showTagItemBinding), map( tm:toList, e.tags )));
  local refIDsD :: Document
    = ppImplode(line(), map( showScope(_,showRefIdItemBinding), map( tm:toList, e.refIds )));
}

function showScope
Document ::= scope::[Pair<String a>] showFunc::(Document ::= Pair<String a>)
{
  return ppImplode(line(), map(showFunc, scope)) ;
}


function showValueItemBinding
Document ::= bnd::Pair<String ValueItem>
{
 return concat( [ text(bnd.fst), text(" -> ") ] ); --, nestlines(10,bnd.snd.pp) ]);
}
function showTagItemBinding
Document ::= bnd::Pair<String TagItem>
{
 return concat( [ text(bnd.fst), text(" -> ") ] ); -- , nestlines(10,bnd.snd.pp) ]);
}
function showRefIdItemBinding
Document ::= bnd::Pair<String RefIdItem>
{
 return concat( [ text(bnd.fst), text(" -> ") ] ); -- , nestlines(10,bnd.snd.pp) ]);
}



{-

-- Aspects over different "Item" types in Env --
------------------------------------------------

attribute pp occurs on ValueItem ;

aspect production declaratorValueItem
top::ValueItem ::= s::Decorated Declarator
{ top.pp = ppImplode(text(" "),s.pps); }

aspect production functionValueItem
top::ValueItem ::= s::Decorated FunctionDecl
{ top.pp = text("FunctionDecl"); } --s.pp; }

aspect production builtinFunctionValueItem
top::ValueItem ::= t::Type  handler::(Expr ::= Name Exprs Location)
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

aspect production errorValueItem
top::ValueItem ::=
{ top.pp = text("errorValueItem"); }


attribute pp occurs on TagItem ;

aspect production enumTagItem
top::TagItem ::= s::Decorated EnumDecl
{ top.pp = text("Decorated Enum"); }

aspect production refIdTagItem
top::TagItem ::= tag::StructOrEnumOrUnion  refId::String
{ top.pp = text("Struct|Enum, refId = " ++ refId); }

aspect production errorTagItem
top::TagItem ::=
{ top.pp = text("ErrorTagItem"); }

aspect production adtRefIdTagItem
t::TagItem ::= adtRefId::String structRefId::String
{ t.pp = text("ADT Tag: adtRefId=" ++ adtRefId ++ ", structRefId=" ++ structRefId); }



attribute pp occurs on RefIdItem;

aspect production adtRefIdItem
t::RefIdItem ::= adt::Decorated ADTDecl s::Decorated StructDecl 
{ t.pp = text("ADTDecl, adt.name=" ++ adt.name ++ " -> struct ref id=" );}-- ++ s.refId); }

aspect production structRefIdItem
top::RefIdItem ::= s::Decorated StructDecl
{ top.pp = text("StructDecl: s.refId=" ++ s.refId); }

aspect production unionRefIdItem
top::RefIdItem ::= s::Decorated UnionDecl
{ top.pp = text("UnionDecl"); }


-}
