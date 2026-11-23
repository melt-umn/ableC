grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;

-- True if using scope graphs
global sgOn::Boolean = false;

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

fun lookupValue [ValueItem] ::= n::String  e::Env = 
  if sgOn then lookupValueSG(n, e) else lookupValueList(n, e);
fun lookupTag [TagItem] ::= n::String  e::Env =  
  if sgOn then lookupTagSG(n, e) else lookupTagList(n, e);
fun lookupRefId [RefIdItem] ::= n::String  e::Env =
  if sgOn then lookupRefIdSG(n, e) else lookupRefIdList(n, e);
fun lookupDeferredDecls [Decl] ::= n::String  e::Env =
  if sgOn then lookupDeferredDeclsSG(n, e) else lookupDeferredDeclsList(n, e);
fun lookupMisc [MiscItem] ::= n::String  e::Env =
  if sgOn then lookupMiscSG(n, e) else lookupMiscList(n, e);

fun lookupValueInLocalScope [ValueItem] ::= n::String  e::Env =
  if sgOn then lookupValueInLocalScopeSG(n, e) else lookupValueInLocalScopeList(n, e);
fun lookupTagInLocalScope [TagItem] ::= n::String  e::Env =
  if sgOn then lookupTagInLocalScopeSG(n, e) else lookupTagInLocalScopeList(n, e);
fun lookupMiscInLocalScope [MiscItem] ::= n::String  e::Env =
  if sgOn then lookupMiscInLocalScopeSG(n, e) else lookupMiscInLocalScopeList(n, e);

fun lookupValueList [ValueItem] ::= n::String  e::Env = lookupScope(n, e.values);
fun lookupTagList [TagItem] ::= n::String  e::Env = lookupScope(n, e.tags);
fun lookupRefIdList [RefIdItem] ::= n::String  e::Env = lookupScope(n, e.refIds);
fun lookupDeferredDeclsList [Decl] ::= n::String  e::Env = lookupScope(n, e.deferredDecls);
fun lookupMiscList [MiscItem] ::= n::String  e::Env = lookupScope(n, e.misc);

fun lookupValueInLocalScopeList [ValueItem] ::= n::String  e::Env = lookupInLocalScope(n, e.values);
fun lookupTagInLocalScopeList [TagItem] ::= n::String  e::Env = lookupInLocalScope(n, e.tags);
fun lookupMiscInLocalScopeList [MiscItem] ::= n::String  e::Env = lookupInLocalScope(n, e.misc);

fun lookupValueSG [ValueItem] ::= n::String  e::Env = 
  map(\sd::Decorated SGNode -> case sd.datum of datumValue(_, v) -> v | _ -> error("") end, lookupScopeSG(n, e.scope, labelVal()));
fun lookupTagSG [TagItem] ::= n::String  e::Env = 
  map(\sd::Decorated SGNode -> case sd.datum of datumTag(_, v) -> v | _ -> error("") end, lookupScopeSG(n, e.scope, labelTag()));
fun lookupRefIdSG [RefIdItem] ::= n::String  e::Env =
  map(\sd::Decorated SGNode -> case sd.datum of datumRefId(_, v) -> v | _ -> error("") end, lookupScopeSG(n, e.scope, labelRefId()));
fun lookupDeferredDeclsSG [Decl] ::= n::String  e::Env =
  map(\sd::Decorated SGNode -> case sd.datum of datumDeferredDecl(_, v) -> ^v | _ -> error("") end, lookupScopeSG(n, e.scope, labelDefer()));
fun lookupMiscSG [MiscItem] ::= n::String  e::Env =
  map(\sd::Decorated SGNode -> case sd.datum of datumMisc(_, v) -> v | _ -> error("") end, lookupScopeSG(n, e.scope, labelMisc()));

fun lookupValueInLocalScopeSG [ValueItem] ::= n::String  e::Env =
  map(\sd::Decorated SGNode -> case sd.datum of datumValue(_, v) -> v | _ -> error("") end, lookupInLocalScopeSG(n, e.scope, labelVal()));
fun lookupTagInLocalScopeSG [TagItem] ::= n::String  e::Env =
  map(\sd::Decorated SGNode -> case sd.datum of datumTag(_, v) -> v | _ -> error("") end, lookupInLocalScopeSG(n, e.scope, labelTag()));
fun lookupMiscInLocalScopeSG [MiscItem] ::= n::String  e::Env =
  map(\sd::Decorated SGNode -> case sd.datum of datumMisc(_, v) -> v | _ -> error("") end, lookupInLocalScopeSG(n, e.scope, labelMisc()));
