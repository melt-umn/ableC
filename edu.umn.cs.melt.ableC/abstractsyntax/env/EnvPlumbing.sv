grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

{-
 - The enivronment in ableC is represented as a nonterminal 'Env' which is used to build up various
 - scopes, reperesenting the contents of each namespace.  
 - Contributions to an environment are represented as another nonterminal 'Defs', which is used to
 - build up contributions to each individual scope in an Env.  
 -}

synthesized attribute tags :: Scopes<TagItem>;
synthesized attribute values :: Scopes<ValueItem>;
synthesized attribute refIds :: Scopes<RefIdItem>;
synthesized attribute misc :: Scopes<MiscItem>;
synthesized attribute globalEnv :: Decorated Env;

synthesized attribute tagContribs :: Contribs<TagItem>;
synthesized attribute valueContribs :: Contribs<ValueItem>;
synthesized attribute refIdContribs :: Contribs<RefIdItem>;
synthesized attribute miscContribs :: Contribs<MiscItem>;
synthesized attribute globalDefs :: [Def];

{- Environment representation productions provide implementations for env functions
 - emptyEnv_i creates the basic environment with empty global scopes
 - addEnv_i adds provided defs to the current (first on list) scope, and global defs to the global (last on list) scope
 - openScope_i adds a new scope to the scope lists to which new elements will be added by default
 - globalEnv_i gets the last (global) scope from the scope lists
 -}

abstract production emptyEnv_i
top::Env ::=
{
  top.tags = emptyScope();
  top.values = emptyScope();
  top.refIds = emptyScope();
  top.misc = emptyScope();
}
abstract production addEnv_i
top::Env ::= d::Defs  e::Decorated Env
{
  production gd::Defs = foldr(consDefs, nilDefs(), d.globalDefs);

  top.tags = addGlobalScope(gd.tagContribs, addScope(d.tagContribs, e.tags));
  top.values = addGlobalScope(gd.valueContribs, addScope(d.valueContribs, e.values));
  top.refIds = addGlobalScope(gd.refIdContribs, addScope(d.refIdContribs, e.refIds));
  top.misc = addGlobalScope(gd.miscContribs, addScope(d.miscContribs, e.misc));
}
abstract production openEnvScope_i
top::Env ::= e::Decorated Env
{
  top.tags = openScope(e.tags);
  top.values = openScope(e.values);
  top.refIds = openScope(e.refIds);
  top.misc = openScope(e.misc);
}
abstract production globalEnv_i
top::Env ::= e::Decorated Env
{
  top.tags = globalScope(e.tags);
  top.values = globalScope(e.values);
  top.refIds = globalScope(e.refIds);
  top.misc = globalScope(e.misc);
}

{- Definition list productions provide a way of folding up defs into Contribs lists
 -}

abstract production nilDefs
top::Defs ::=
{
  top.tagContribs = [];
  top.valueContribs = [];
  top.refIdContribs = [];
  top.miscContribs = [];
  top.globalDefs = [];
}

abstract production consDefs
top::Defs ::= h::Def  t::Defs
{
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
  top.tagContribs = [];
  top.valueContribs = [];
  top.refIdContribs = [];
  top.miscContribs = [];
  top.globalDefs = [];
}

