grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

import silver:util:raw:treemap as tm;

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
function emptyScope
Scopes<a> ::= 
{
  return [tm:empty(compareString)];
}
{-- Adds contributions to the innermost scope -}
function addScope
Scopes<a> ::= d::Contribs<a>  s::Scopes<a>
{
  return tm:add(d, head(s)) :: tail(s);
}
{-- Adds contributions to the outermost scope -}
function addGlobalScope
Scopes<a> ::= d::Contribs<a>  s::Scopes<a>
{
  return case d, s of
    | [], _ -> s
    | _, [_] -> addScope(d, s)
    | _, h :: t -> h :: addGlobalScope(d, t)
    end;
}
{-- Adds contributions to the second outermost scope -}
function addFunctionScope
Scopes<a> ::= d::Contribs<a> s::Scopes<a>
{
  return case d, s of
    | [], _ -> s
    | _, [_] -> addScope(d, s)
    | _, h :: m :: [] -> h :: addScope(d, m :: [])
    | _, h :: t -> h :: addFunctionScope(d, t)
  end;
}
{-- Create a new innermost scope -}
function openScope
Scopes<a> ::= s::Scopes<a>
{
  return tm:empty(compareString) :: s;
}
{-- Get the outermost scope -}
function globalScope
Scopes<a> ::= s::Scopes<a>
{
  return [last(s)];
}
{-- Get all but the outermost scope -}
function nonGlobalScope
Scopes<a> ::= s::Scopes<a>
{
  return init(s);
}
{-- Looks up an identifier in the closest scope that has a match -}
function lookupScope
[a] ::= n::String  s::Scopes<a>
{
  -- Laziness is awesome.
  return case dropWhile(null, map(tm:lookup(n, _), s)) of
  | h :: _ -> h
  | [] -> []
  end;
}
{-- Looks up an identifier in the innermost scope -}
function lookupInLocalScope
[a] ::= n::String  s::Scopes<a>
{
  return tm:lookup(n, head(s));
}
