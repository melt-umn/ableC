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
synthesized attribute deferredDecls :: Scopes<Decl>;
synthesized attribute misc :: Scopes<MiscItem>;
synthesized attribute globalEnv :: Env;

synthesized attribute tagContribs :: Contribs<TagItem>;
synthesized attribute valueContribs :: Contribs<ValueItem>;
synthesized attribute refIdContribs :: Contribs<RefIdItem>;
synthesized attribute deferredDeclContribs :: Contribs<Decl>;
synthesized attribute miscContribs :: Contribs<MiscItem>;
synthesized attribute globalDefs :: [Def];
synthesized attribute functionScopeDefs :: [Def];

{- Environment representation productions provide implementations for env functions
 - emptyEnv_i creates the basic environment with empty global scopes
 - addEnv_i adds provided defs to the current (first on list) scope, and global defs to the global (last on list) scope
 - openScope_i adds a new scope to the scope lists to which new elements will be added by default
 - globalEnv_i gets the last (global) scope from the scope lists
 -}

abstract production emptyEnv
top::Env ::=
{
  top.tags = emptyScope();
  top.values = emptyScope();
  top.refIds = emptyScope();
  top.deferredDecls = emptyScope();
  top.misc = emptyScope();
}
abstract production addEnvDefs
top::Env ::= d::Defs  e::Env
{
  production gd::Defs = foldr(consDefs, nilDefs(), d.globalDefs);
  production fd::Defs = foldr(consDefs, nilDefs(), d.functionScopeDefs);

  top.tags = addFunctionScope(fd.tagContribs, addGlobalScope(gd.tagContribs, addScope(d.tagContribs, e.tags)));
  top.values = addFunctionScope(fd.valueContribs, addGlobalScope(gd.valueContribs, addScope(d.valueContribs, e.values)));
  top.refIds = addFunctionScope(fd.refIdContribs, addGlobalScope(gd.refIdContribs, addScope(d.refIdContribs, e.refIds)));
  top.deferredDecls = addFunctionScope(fd.deferredDeclContribs, addGlobalScope(gd.deferredDeclContribs, addScope(d.deferredDeclContribs, e.deferredDecls)));
  top.misc = addFunctionScope(fd.miscContribs, addGlobalScope(gd.miscContribs, addScope(d.miscContribs, e.misc)));
}
abstract production openScopeEnv
top::Env ::= e::Env
{
  top.tags = openScope(e.tags);
  top.values = openScope(e.values);
  top.refIds = openScope(e.refIds);
  top.deferredDecls = openScope(e.deferredDecls);
  top.misc = openScope(e.misc);
}
abstract production globalEnv
top::Env ::= e::Env
{
  top.tags = globalScope(e.tags);
  top.values = globalScope(e.values);
  top.refIds = globalScope(e.refIds);
  top.deferredDecls = globalScope(e.deferredDecls);
  top.misc = globalScope(e.misc);
}
abstract production nonGlobalEnv
top::Env ::= e::Env
{
  top.tags = nonGlobalScope(e.tags);
  top.values = nonGlobalScope(e.values);
  top.refIds = nonGlobalScope(e.refIds);
  top.deferredDecls = nonGlobalScope(e.deferredDecls);
  top.misc = nonGlobalScope(e.misc);
}
abstract production functionEnv
top::Env ::= e::Env
{
  top.tags = functionScope(e.tags);
  top.values = functionScope(e.values);
  top.refIds = functionScope(e.refIds);
  top.deferredDecls = functionScope(e.deferredDecls);
  top.misc = functionScope(e.misc);
}

{- Definition list productions provide a way of folding up defs into Contribs lists
 -}

abstract production nilDefs
top::Defs ::=
{
  top.tagContribs = [];
  top.valueContribs = [];
  top.refIdContribs = [];
  top.deferredDeclContribs = [];
  top.miscContribs = [];
  top.globalDefs = [];
  top.functionScopeDefs = [];
}

abstract production consDefs
top::Defs ::= h::Def  t::Defs
{
  top.tagContribs = h.tagContribs ++ t.tagContribs;
  top.valueContribs = h.valueContribs ++ t.valueContribs;
  top.refIdContribs = h.refIdContribs ++ t.refIdContribs;
  top.deferredDeclContribs = h.deferredDeclContribs ++ t.deferredDeclContribs;
  top.miscContribs = h.miscContribs ++ t.miscContribs;
  top.globalDefs = h.globalDefs ++ t.globalDefs;
  top.functionScopeDefs = h.functionScopeDefs ++ t.functionScopeDefs;
}

-- Defaults for Def

aspect default production
top::Def ::=
{
  top.tagContribs = [];
  top.valueContribs = [];
  top.refIdContribs = [];
  top.deferredDeclContribs = [];
  top.miscContribs = [];
  top.globalDefs = [];
  top.functionScopeDefs = [];
}

