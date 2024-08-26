grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;

{--
 - The environment values that get passed around and used to look up names.
 -}
data nonterminal Env with tags, values, refIds, deferredDecls, misc;

{--
 - A list of definitions, only used in contributing new names to the environment.
 -}
data nonterminal Defs 
  with tagContribs, valueContribs, refIdContribs, deferredDeclContribs, miscContribs, globalDefs, functionScopeDefs;

{--
 - An individual definition of a name.
 -}
closed data nonterminal Def 
  with tagContribs, valueContribs, refIdContribs, deferredDeclContribs, miscContribs, globalDefs, functionScopeDefs;


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
monoid attribute defs :: [Def];
{--
 - For Function-Scope definitions
 - Note that since the env may determine the forward, and functionDefs on a production determine the env provided to that
 - production, functionDefs must be computed without using the forward. 
 -}
monoid attribute functionDefs :: [Def];
{--
 - For local-scope only definitions (e.g. struct and union fields)
 - Used in conjunction with 'tagEnv'.
 - Distinct from 'defs' because nested structs should all have their names
 - visible at outer scope, so we still need a mechanism to propagate those.
 - e.g. struct x { struct y { .. } .. } should result in both x and y in the env.
 -
 - @see defs for normal definitions
 -}
monoid attribute localDefs :: [Def];
{--
 - The environment, on which all lookups are performed.
 -}
inherited attribute env :: Env;

{--
 - The local field environment for a struct or union. Could be a different type, I suppose. TODO
 -}
inherited attribute localEnv :: Env;

{--
 - The local environment found when looking up a struct or union.
 -}
synthesized attribute tagEnv :: Env;

-- Environment manipulation functions

fun addEnv Env ::= d::[Def]  e::Env =
  if null(d) then e else addDefsEnv(foldr(consDefs, nilDefs(), d), e);

-- Environment lookup functions

fun lookupValue [ValueItem] ::= n::String  e::Env = lookupScope(n, e.values);
fun lookupTag [TagItem] ::= n::String  e::Env = lookupScope(n, e.tags);
fun lookupRefId [RefIdItem] ::= n::String  e::Env = lookupScope(n, e.refIds);
fun lookupDeferredDecls [Decl] ::= n::String  e::Env = lookupScope(n, e.deferredDecls);
fun lookupMisc [MiscItem] ::= n::String  e::Env = lookupScope(n, e.misc);


fun lookupValueInLocalScope [ValueItem] ::= n::String  e::Env = lookupInLocalScope(n, e.values);
fun lookupTagInLocalScope [TagItem] ::= n::String  e::Env = lookupInLocalScope(n, e.tags);
fun lookupMiscInLocalScope [MiscItem] ::= n::String  e::Env = lookupInLocalScope(n, e.misc);

