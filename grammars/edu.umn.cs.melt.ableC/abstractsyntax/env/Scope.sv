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

data nonterminal Datum with name;

production datumNone
top::Datum ::=
{ top.name = ""; }

production datumValue
top::Datum ::= n::String d::ValueItem
{ top.name = n; }

production datumTag
top::Datum ::= n::String d::TagItem
{ top.name = n; }

production datumRefId
top::Datum ::= n::String d::RefIdItem
{ top.name = n; }

production datumDeferredDecl
top::Datum ::= n::String d::Decl
{ top.name = n; }

production datumMisc
top::Datum ::= n::String d::MiscItem
{ top.name = n; }

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
  };

{-
fun addGlobalScope Scopes<a> ::= d::Contribs<a>  s::Scopes<a> =
  case d, s of
  | [], _ -> s
  | _, [] -> error("No scopes in env!")
  | _, [_] -> addScope(d, s)
  | _, h :: t -> h :: addGlobalScope(d, t)
  end;
-}

-- proof of concept
-- implementing the 'hacky' updating of the decls list for a global scope
-- replaced in future by synthesizing edges up ableC tree instead, a la SLE 2025 paper
fun addGlobalScopeSG Decorated SGNode ::= d::Defs s::Decorated SGNode =
  let lexTgts::[Decorated SGNode] = tm:lookup("lex", s.edges) in
    case lexTgts of
    | []  -> addScopeSG(d, s)
    | [x] -> decorate mkLexScope()
             with { edges = tm:update("lex", [addGlobalScopeSG(d, x)], s.edges); }
    | _   -> error("found scope with multiple lex targets!")
    end
  end;

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

-- proof of concept
-- implementing the 'hacky' updating of the decls list for a global scope
-- replaced in future by synthesizing edges up ableC tree instead, a la SLE 2025 paper
fun addFunctionScopeSG Decorated SGNode ::= d::Defs s::Decorated SGNode =
  let lexTgts::[Decorated SGNode] = tm:lookup("lex", s.edges) in
    case lexTgts of
    | []  -> addScopeSG(d, s)
    | [m] -> case tm:lookup("lex", m.edges) of
             | [] -> decorate mkLexScope() with { edges = tm:update("lex", [addScopeSG(d, m)], s.edges); }
             | _  -> decorate mkLexScope() with { edges = tm:update("lex", [addFunctionScopeSG(d, m)], s.edges); }
             end
    | _   -> error("found scope with multiple lex targets!")
    end
  end;

{-
fun openScope Scopes<a> ::= s::Scopes<a> = tm:empty() :: s;
-}

fun openScopeSG Decorated SGNode ::= s::Decorated SGNode =
  decorate mkLexScope() with { edges = tm:update("lex", [s], tm:empty()); };

{-
fun globalScope Scopes<a> ::= s::Scopes<a> = [last(s)];
-}

fun globalScopeSG Decorated SGNode ::= s::Decorated SGNode =
  let lexTgts::[Decorated SGNode] = tm:lookup("lex", s.edges) in
    case lexTgts of
    | []  -> s
    | [x] -> globalScopeSG(x)
    | _   -> error("found scope with multiple lex targets!")
    end
  end;

{-
fun nonGlobalScope Scopes<a> ::= s::Scopes<a> = init(s);
-}

-- just a proof of concept...
fun nonGlobalScopeSG Decorated SGNode ::= s::Decorated SGNode =
  let lexTgts::[Decorated SGNode] = tm:lookup("lex", s.edges) in
    case lexTgts of
    | [m] -> case tm:lookup("lex", m.edges) of
             | []  -> decorate mkLexScope() with { edges = tm:update("lex", [], s.edges); }
             | [y] -> decorate mkLexScope() with { edges = tm:update("lex", [nonGlobalScopeSG(m)], s.edges); }
             | _   -> error("found scope with multiple lex targets!")
             end
    | _   -> error("found scope with multiple lex targets, or innermost scope had none!")
    end
  end;

{-
fun functionScope Scopes<a> ::= s::Scopes<a> = drop(length(s) - 2, s);
-}

-- just a proof of concept...
fun functionScopeSG Decorated SGNode ::= s::Decorated SGNode =
  let lexTgts::[Decorated SGNode] = tm:lookup("lex", s.edges) in
    case lexTgts of
    | [m] -> case tm:lookup("lex", m.edges) of
             | []  -> s
             | [_] -> functionScopeSG(m)
             | _   -> error("found scope with multiple lex targets!")
             end
    | _   -> error("found scope with multiple lex targets, or innermost scope had none!")
    end
  end;

{-
fun lookupScope [a] ::= n::String  s::Scopes<a> =
  case dropWhile(null, map(tm:lookup(n, _), s)) of
  | h :: _ -> h
  | [] -> []
  end;
-}

fun lookupScopeSG [Decorated SGNode] ::= n::String s::Decorated SGNode l::Label =
  resolve(\d::Datum -> d.name == n, regexCat(regexStar(regexLex()), regexLabel(l)), s);

{-
fun lookupInLocalScope [a] ::= n::String  s::Scopes<a> = tm:lookup(n, head(s));
-}

fun lookupInLocalScopeSG [Decorated SGNode] ::= n::String s::Decorated SGNode l::Label =
  resolve(\d::Datum -> d.name == n, regexLabel(l), s);

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
      tm:lookup(lab, og), cs)
  in
    tm:update(lab, nodes, og)
  end
;

--

type Predicate = (Boolean ::= Datum);

fun resolve
[Decorated SGNode] ::= p::Predicate r::Regex s::Decorated SGNode
=
  let cont::[Decorated SGNode] =
    let validLabels::[Label] = r.first in
      foldl(
        \acc::(Maybe<Label>, [Decorated SGNode]) nextLab::Label ->
          let prevLab::Maybe<Label> = acc.1 in
            let prevRes::[Decorated SGNode] = acc.2 in
              let nextRes::[Decorated SGNode] = concat(map(resolve(p, r.deriv(nextLab), _),
                                                          nextLab.demand(s))) in
                (just(nextLab), prevRes ++ nextRes)
              end
            end
          end,
        (nothing(), []),
        validLabels
      ).2
    end
  in
    case r.simplify of
    | regexEmpty() -> []
    | _ -> if p(s.datum) && r.nullable then s::cont else cont
    end
  end;
