grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

{-
 - The enivronment in ableC is represented as a nonterminal which is used to build up various lists
 - of 'scopes'.  Each scope is a treemap that is used to look up a value.  If the value is not
 - found in the current scope, then the next one is tried, etc.  The last scope represents the
 - global level.  This is to allow names in the environment to be shadowed by a name in a lower
 - scope, while still preventing a name from being declared twice in the local scope.  
 - Contribs is just a list of items to add to a scope.  
 -}

type Scope<a> = [tm:Map<String a>];
type Contribs<a> = [Pair<String a>];

synthesized attribute labels :: Scope<LabelItem>;
synthesized attribute tags :: Scope<TagItem>;
synthesized attribute values :: Scope<ValueItem>;
synthesized attribute refIds :: Scope<RefIdItem>;
synthesized attribute misc :: Scope<MiscItem>;
synthesized attribute globalEnv :: Decorated Env;

synthesized attribute labelContribs :: Contribs<LabelItem>;
synthesized attribute tagContribs :: Contribs<TagItem>;
synthesized attribute valueContribs :: Contribs<ValueItem>;
synthesized attribute refIdContribs :: Contribs<RefIdItem>;
synthesized attribute miscContribs :: Contribs<MiscItem>;
synthesized attribute globalDefs :: [Def];

{-- Adds contributions to the innermost scope -}
function augmentScope_i
Scope<a> ::= d::Contribs<a>  s::Scope<a>
{
  return tm:add(d, head(s)) :: tail(s);
}
{-- Adds contributions to the outermost scope -}
function augmentGlobalScope_i
Scope<a> ::= d::Contribs<a>  s::Scope<a>
{
  return case d, s of
    | [], _ -> s
    | _, [_] -> augmentScope_i(d, s)
    | _, h :: t -> h :: augmentGlobalScope_i(d, t)
    end;
}
{-- Looks up an identifier in the closest scope that has a match -}
function readScope_i
[a] ::= name::String  scope::Scope<a>
{
  -- Laziness is awesome.
  return case dropWhile(null, map(tm:lookup(name, _), scope)) of
  | h :: _ -> h
  | [] -> []
  end;
}

{- Environment representation productions provide implementations for env functions
 - emptyEnv_i creates the basic environment with empty global scopes
 - addEnv_i adds provided defs to the current (first on list) scope, and global defs to the global (last on list) scope
 - openScope_i adds a new scope to the scope lists to which new elements will be added by default
 - globalEnv_i gets the last (global) scope from the scope lists
 -}

abstract production emptyEnv_i
top::Env ::=
{
  top.labels = [tm:empty(compareString)];
  top.tags = [tm:empty(compareString)];
  top.values = [tm:empty(compareString)];
  top.refIds = [tm:empty(compareString)];
  top.misc = [tm:empty(compareString)];
}
abstract production addEnv_i
top::Env ::= d::Defs  e::Decorated Env
{
  production gd::Defs = foldr(consDefs, nilDefs(), d.globalDefs);

  top.labels = augmentGlobalScope_i(gd.labelContribs, augmentScope_i(d.labelContribs, e.labels));
  top.tags = augmentGlobalScope_i(gd.tagContribs, augmentScope_i(d.tagContribs, e.tags));
  top.values = augmentGlobalScope_i(gd.valueContribs, augmentScope_i(d.valueContribs, e.values));
  top.refIds = augmentGlobalScope_i(gd.refIdContribs, augmentScope_i(d.refIdContribs, e.refIds));
  top.misc = augmentGlobalScope_i(gd.miscContribs, augmentScope_i(d.miscContribs, e.misc));
}
abstract production openScope_i
top::Env ::= e::Decorated Env
{
  top.labels = tm:empty(compareString) :: e.labels;
  top.tags = tm:empty(compareString) :: e.tags;
  top.values = tm:empty(compareString) :: e.values;
  top.refIds = tm:empty(compareString) :: e.refIds;
  top.misc = tm:empty(compareString) :: e.misc;
}
abstract production globalEnv_i
top::Env ::= e::Decorated Env
{
  top.labels = [last(e.labels)];
  top.tags = [last(e.tags)];
  top.values = [last(e.values)];
  top.refIds = [last(e.refIds)];
  top.misc = [last(e.misc)];
}

{- Definition list productions provide a way of folding up defs into Contribs lists
 -}

abstract production nilDefs
top::Defs ::=
{
  top.labelContribs = [];
  top.tagContribs = [];
  top.valueContribs = [];
  top.refIdContribs = [];
  top.miscContribs = [];
  top.globalDefs = [];
}

abstract production consDefs
top::Defs ::= h::Def  t::Defs
{
  top.labelContribs = h.labelContribs ++ t.labelContribs;
  top.tagContribs = h.tagContribs ++ t.tagContribs;
  top.valueContribs = h.valueContribs ++ t.valueContribs;
  top.refIdContribs = h.refIdContribs ++ t.refIdContribs;
  top.miscContribs = h.miscContribs ++ t.miscContribs;
  top.globalDefs = h.globalDefs ++ t.globalDefs;
}

-- Defaults for Def

aspect default production
top::Def ::=
{
  top.labelContribs = [];
  top.tagContribs = [];
  top.valueContribs = [];
  top.refIdContribs = [];
  top.miscContribs = [];
  top.globalDefs = [];
}

