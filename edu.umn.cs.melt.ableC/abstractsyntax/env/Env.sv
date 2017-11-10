grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;

{--
 - The environment values that get passed around and used to look up names.
 -}
nonterminal Env with tags, values, refIds, misc;

{--
 - A list of definitions, only used in contributing new names to the environment.
 -}
nonterminal Defs 
  with tagContribs, valueContribs, refIdContribs, miscContribs, globalDefs;

{--
 - An individual definition of a name.
 -}
closed nonterminal Def 
  with tagContribs, valueContribs, refIdContribs, miscContribs, globalDefs;


{--
 - An attribute on abstract syntax trees that represents the definitions
 - that escape the scope of the corresponding subtree.
 - There may be cases where an extension writer may wish to add additional defs for a new namespace to a host production,
 - for example, putting a unique identifier for every name that is declared in the environment. For this to be possible, we
 - make defs a collection attribute so that extensions can aspect host productions and add new defs. To avoid interference,
 - we have the invariant that any new defs added must only contain Defs that affect the namespace being defined - that is,
 - we can only make use of this 'shortcut' of adding new defs to the environment when the same thing could be implemented
 - in a more complex way by mirroring defs and env with another pair of synthesized and inherited attributes.
 -}
synthesized attribute defs :: [Def] with ++;
{--
 - For local-scope only definitions (e.g. struct and union fields)
 - Used in conjunction with 'tagEnv'.
 - Distinct from 'defs' because nested structs should all have their names
 - visible at outer scope, so we still need a mechanism to propagate those.
 - e.g. struct x { struct y { .. } .. } should result in both x and y in the env.
 -
 - @see defs for normal definitions
 -}
 -- TODO: Rename to localDefs to be consistant with our naming scheme everywhere else
synthesized attribute localdefs :: [Def] with ++;
{--
 - The environment, on which all lookups are performed.
 -}
autocopy attribute env :: Decorated Env;
{--
 - The local environment for a struct or enum. Could be a different type, I suppose. TODO
 -}
synthesized attribute tagEnv :: Decorated Env;

{--
 - For label definitions, seperate from normal environment because these are whole-function-scope,
 - to avoid circular flow dependancies of forward -> functionDefs -> env -> forward.
 -}
synthesized attribute labelDefs :: Contribs<LabelItem> with ++;
autocopy attribute labelEnv :: Scopes<LabelItem>;


-- Environment manipulation functions

function emptyEnv
Decorated Env ::=
{
  return decorate emptyEnv_i() with {};
}
function openEnvScope
Decorated Env ::= e::Decorated Env
{
  return decorate openEnvScope_i(e) with {};
}
function addEnv
Decorated Env ::= d::[Def]  e::Decorated Env
{
  return if null(d) then e else addEnvDefs(foldr(consDefs, nilDefs(), d), e);
}
function addEnvDefs
Decorated Env ::= d::Defs  e::Decorated Env
{
  return decorate addEnv_i(d, e) with {};
}
function globalEnv
Decorated Env ::= e::Decorated Env
{
  return decorate globalEnv_i(e) with {};
}

-- Environment lookup functions

function lookupValue
[ValueItem] ::= n::String  e::Decorated Env
{
  return lookupScope(n, e.values);
}
function lookupTag
[TagItem] ::= n::String  e::Decorated Env
{
  return lookupScope(n, e.tags);
}
function lookupRefId 
[RefIdItem] ::= n::String  e::Decorated Env
{
  return lookupScope(n, e.refIds);
}
function lookupMisc 
[MiscItem] ::= n::String  e::Decorated Env
{
  return lookupScope(n, e.misc);
}


function lookupValueInLocalScope
[ValueItem] ::= n::String  e::Decorated Env
{
  return lookupInLocalScope(n, e.values);
}
function lookupTagInLocalScope
[TagItem] ::= n::String  e::Decorated Env
{
  return lookupInLocalScope(n, e.tags);
}
function lookupMiscInLocalScope
[MiscItem] ::= n::String  e::Decorated Env
{
  return lookupInLocalScope(n, e.misc);
}

