grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

imports silver:util:treemap as tm;

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
  propagate host, errors, globalDecls, functionDecls, defs, freeVariables;
  e.pp = text(txt);
  e.typerep = errorType(); -- error("Need a type on txtExpr");
  e.isLValue = false;
}
abstract production txtStmt
s::Stmt ::= txt::String
{
  propagate host, errors, globalDecls, functionDecls, defs, functionDefs,
    freeVariables, labelDefs;
  s.pp = text(txt);
}

abstract production txtDecl
d::Decl ::= txt::String
{
  propagate host, errors, globalDecls, functionDecls, defs, freeVariables;
  d.pp = text(txt);
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
  propagate errors, globalDecls, functionDecls, defs;
  e.pp =
    decorate comment("printEnv pp should be demanded through host pp")
    with {env = e.env; controlStmtContext=e.controlStmtContext;}.pp;
  forwards to comment( show(80,showEnv(e.env)) );
}



function showEnv
Document ::= e::Decorated Env
{
  return ppConcat( [
    text(" Environment:"),
    nestlines(5,
      ppConcat([
--       text("Labels:"),line(),
--         nestlines(5, labelsD),
       text("Values:"),line(),
         nestlines(5, valuesD),
       text("Tags:"),line(),
         nestlines(5, tagsD),
       text("RefIDs:"),
         nestlines(5, refIDsD),
       text("Misc:"),
         nestlines(5, miscD)
       ]) )
   ] );

--  local labelsD :: Document
--    = ppImplode(line(), map( showScope(_,showLabelItemBinding), map( tm:toList, e.labels )));
  nondecorated local valuesD::Document =
    ppImplode(line(), map( showScope(_,showValueItemBinding), map( tm:toList, e.values )));
  nondecorated local tagsD::Document =
    ppImplode(line(), map( showScope(_,showTagItemBinding), map( tm:toList, e.tags )));
  nondecorated local refIDsD::Document =
    ppImplode(line(), map( showScope(_,showRefIdItemBinding), map( tm:toList, e.refIds )));
  nondecorated local miscD::Document =
    ppImplode(line(), map( showScope(_,showMiscItemBinding), map( tm:toList, e.misc )));
}

fun showScope Document ::= scope::[Pair<String a>] showFunc::(Document ::= Pair<String a>) =
  ppImplode(line(), map(showFunc, scope));


fun showLabelItemBinding Document ::= bnd::Pair<String LabelItem> =
  ppConcat( [ text(bnd.fst), text(" -> ") ]);
fun showValueItemBinding Document ::= bnd::Pair<String ValueItem> =
  ppConcat( [ text(bnd.fst), text(" -> "), nestlines(10,bnd.snd.pp) ]);
fun showTagItemBinding Document ::= bnd::Pair<String TagItem> =
  ppConcat( [ text(bnd.fst), text(" -> "), nestlines(10,bnd.snd.pp) ]);
fun showRefIdItemBinding Document ::= bnd::Pair<String RefIdItem> =
  ppConcat( [ text(bnd.fst), text(" -> "), nestlines(10,bnd.snd.pp) ]);
fun showMiscItemBinding Document ::= bnd::Pair<String MiscItem> =
  ppConcat( [ text(bnd.fst), text(" -> ") ]);
