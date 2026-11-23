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
