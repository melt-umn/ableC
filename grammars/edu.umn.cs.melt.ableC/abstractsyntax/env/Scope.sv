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
