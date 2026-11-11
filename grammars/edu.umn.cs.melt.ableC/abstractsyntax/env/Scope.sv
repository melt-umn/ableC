grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

import silver:util:treemap as tm;

-- TODO: Move this to langutil:env?

{-
 - Environment namespaces in ableC are represented by various lists of 'scopes'.  Each scope is a
 - treemap that is used to look up a value.  If the value is not found in the current scope, then
 - the next one is tried, etc.  The last scope represents the  global level.  
 - This is to allow names in the environment to be shadowed by a name in a lower scope, while still
 - preventing a name from being declared twice in the local scope.  
 - Contribs is just a list of items to add to a scope.  
 -}

type Scopes<a> = [tm:Map<String a>];
type Contribs<a> = [Pair<String a>];

{-- Create an empty scope -}
fun emptyScope Scopes<a> ::= = [tm:empty()];
{-- Adds contributions to the innermost scope -}
fun addScope Scopes<a> ::= d::Contribs<a>  s::Scopes<a> = tm:add(d, head(s)) :: tail(s);
{-- Adds contributions to the outermost scope -}
fun addGlobalScope Scopes<a> ::= d::Contribs<a>  s::Scopes<a> =
  case d, s of
  | [], _ -> s
  | _, [] -> error("No scopes in env!")
  | _, [_] -> addScope(d, s)
  | _, h :: t -> h :: addGlobalScope(d, t)
  end;
{-- Adds contributions to the second outermost scope -}
{- TODO: This implementation is slightly broken because gcc supports nested
   functions. We should inject into the outermost scope for the current 
   function, which is not necessarily the second outermost scope -}
fun addFunctionScope Scopes<a> ::= d::Contribs<a> s::Scopes<a> =
  case d, s of
  | [], _ -> s
  | _, [] -> error("No scopes in env!")
  | _, [_] -> addScope(d, s)
  | _, h :: m :: [] -> addScope(d, h :: m :: [])
  | _, h :: t -> h :: addFunctionScope(d, t)
  end;
{-- Create a new innermost scope -}
fun openScope Scopes<a> ::= s::Scopes<a> = tm:empty() :: s;
{-- Get the outermost scope -}
fun globalScope Scopes<a> ::= s::Scopes<a> = [last(s)];
{-- Get all but the outermost scope -}
fun nonGlobalScope Scopes<a> ::= s::Scopes<a> = init(s);
{-- Get the outermost 2 scopes -}
fun functionScope Scopes<a> ::= s::Scopes<a> = drop(length(s) - 2, s);
{-- Looks up an identifier in the closest scope that has a match -}
fun lookupScope [a] ::= n::String  s::Scopes<a> =
  case dropWhile(null, map(tm:lookup(n, _), s)) of
  | h :: _ -> h
  | [] -> []
  end;
{-- Looks up an identifier in the innermost scope -}
fun lookupInLocalScope [a] ::= n::String  s::Scopes<a> = tm:lookup(n, head(s));


{- Scope Graphs -}

synthesized attribute datum::Datum;

nonterminal SGNode with datum;

production mkScope
top::SGNode ::= d::Datum
{ top.datum = d; }

production mkLexScope
top::SGNode ::= 
{ forwards to mkScope(datumNone()); }

production mkValueScope
top::SGNode ::= n::String d::ValueItem
{ forwards to mkScope(datumValue(n, d)); }

production mkTagScope
top::SGNode ::= n::String d::TagItem
{ forwards to mkScope(datumTag(n, d)); }

production mkRefIdScope
top::SGNode ::= n::String d::RefIdItem
{ forwards to mkScope(datumRefId(n, d)); }

production mkDeferredDeclScope
top::SGNode ::= n::String d::Decl
{ forwards to mkScope(datumDeferredDecl(n, ^d)); }

production mkMiscScope
top::SGNode ::= n::String d::MiscItem
{ forwards to mkScope(datumMisc(n, d)); }

--

data nonterminal Datum;

production datumNone
top::Datum ::=
{}

production datumValue
top::Datum ::= n::String d::ValueItem
{}

production datumTag
top::Datum ::= n::String d::TagItem
{}

production datumRefId
top::Datum ::= n::String d::RefIdItem
{}

production datumDeferredDecl
top::Datum ::= n::String d::Decl
{}

production datumMisc
top::Datum ::= n::String d::MiscItem
{}

--

fun toValueScope Decorated SGNode ::= c::Pair<String ValueItem> =
  decorate mkValueScope(c.1, c.2) with { edges = tm:empty(); };

fun toTagScope Decorated SGNode ::= c::Pair<String TagItem> =
  decorate mkTagScope(c.1, c.2) with { edges = tm:empty(); };

fun toRefIdScope Decorated SGNode ::= c::Pair<String RefIdItem> =
  decorate mkRefIdScope(c.1, c.2) with { edges = tm:empty(); };

fun toDeferreddeclScope Decorated SGNode ::= c::Pair<String Decl> =
  decorate mkDeferredDeclScope(c.1, c.2) with { edges = tm:empty(); };

fun toMiscScope Decorated SGNode ::= c::Pair<String MiscItem> =
  decorate mkMiscScope(c.1, c.2) with { edges = tm:empty(); };

--

inherited attribute edges::tm:Map<String Decorated SGNode> occurs on SGNode;

--

{-
fun emptyScope Scopes<a> ::= = [tm:empty()];
-}

fun emptyScopeSG Decorated SGNode ::= =
  decorate mkLexScope() with {
    edges = tm:empty();
  };

{-
fun addScope Scopes<a> ::= d::Contribs<a>  s::Scopes<a> = tm:add(d, head(s)) :: tail(s);
-}

fun addScopeSG Decorated SGNode ::= d::Defs s::Decorated SGNode =
  decorate mkLexScope() with {
    edges =
      updateDclEdges("val", mkValueScope, d.valueContribs,
      updateDclEdges("tag", mkTagScope, d.tagContribs,
      updateDclEdges("refid", mkRefIdScope, d.refIdContribs,
      updateDclEdges("defer", mkDeferredDeclScope, d.deferredDeclContribs,
      updateDclEdges("misc", mkMiscScope, d.miscContribs, s.edges)))));
  }
;

{-
fun addGlobalScope Scopes<a> ::= d::Contribs<a>  s::Scopes<a> =
  case d, s of
  | [], _ -> s
  | _, [] -> error("No scopes in env!")
  | _, [_] -> addScope(d, s)
  | _, h :: t -> h :: addGlobalScope(d, t)
  end;
-}

fun addGlobalScopeSG Decorated SGNode ::= d::Defs s::Decorated SGNode =
  error("addGlobalScopeSG todo");

{-
fun addFunctionScope Scopes<a> ::= d::Contribs<a> s::Scopes<a> =
  case d, s of
  | [], _ -> s
  | _, [] -> error("No scopes in env!")
  | _, [_] -> addScope(d, s)
  | _, h :: m :: [] -> addScope(d, h :: m :: [])
  | _, h :: t -> h :: addFunctionScope(d, t)
  end;
-}

fun addFunctionScopeSG Decorated SGNode ::= d::Defs s::Decorated SGNode =
  error("addFunctionScopeSG todo");

{-
fun openScope Scopes<a> ::= s::Scopes<a> = tm:empty() :: s;
-}

fun openScopeSG Decorated SGNode ::= s::Decorated SGNode =
  error("openScopeSG todo");

{-
fun globalScope Scopes<a> ::= s::Scopes<a> = [last(s)];
-}

fun globalScopeSG Decorated SGNode ::= s::Decorated SGNode =
  error("globalScopeSG todo");

{-
fun nonGlobalScope Scopes<a> ::= s::Scopes<a> = init(s);
-}

fun nonGlobalScopeSG Decorated SGNode ::= s::Decorated SGNode =
  error("nonGlobalScopeSG todo");

{-
fun functionScope Scopes<a> ::= s::Scopes<a> = drop(length(s) - 2, s);
-}

fun functionScopeSG Decorated SGNode ::= s::Decorated SGNode =
  error("functionScopeSG todo");

{-
fun lookupScope [a] ::= n::String  s::Scopes<a> =
  case dropWhile(null, map(tm:lookup(n, _), s)) of
  | h :: _ -> h
  | [] -> []
  end;
-}

fun lookupScopeSG [Decorated SGNode] ::= n::String s::Decorated SGNode =
  error("lookupScopeSG todo");

{-
fun lookupInLocalScope [a] ::= n::String  s::Scopes<a> = tm:lookup(n, head(s));
-}

fun lookupInLocalScopeSG [Decorated SGNode] ::= n::String s::Decorated SGNode =
  error("lookupInLocalScopeSG todo");

--

fun updateDclEdges
  tm:Map<String Decorated SGNode> ::=
    lab::String
    mk::(SGNode ::= String a)
    cs::Contribs<a>
    og::tm:Map<String Decorated SGNode>
=
  let nodes::[Decorated SGNode] =
    foldr(
      \p::(String, a) ns::[Decorated SGNode] ->
        decorate mk(p.1, p.2) with { edges = tm:empty(); } :: ns,
      tm:lookup("val", og), cs)
  in
    tm:update(lab, nodes, og)
  end
;
