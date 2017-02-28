grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports silver:util:raw:treemap as tm;

{--
 - The environment values that get passed around and used to look up names.
 -}
nonterminal Env with labels, tags, values, refIds, misc;

{--
 - A list of definitions, only used in contributing new names to the environment.
 -}
nonterminal Defs 
  with labelContribs, tagContribs, valueContribs, refIdContribs, miscContribs;

{--
 - An individual definition of a name.
 -}
closed nonterminal Def 
  with labelContribs, tagContribs, valueContribs, refIdContribs, miscContribs;


{--
 - An attribute on abstract syntax trees that represents the definitions
 - that escape the scope of the corresponding subtree.
 -}
synthesized attribute defs :: [Def] with ++;
{--
 - For Function-Scope definitions (e.g. Labels in functions)
 - @see defs for normal definitions
 -}
synthesized attribute functiondefs :: [Def];
{--
 - For local-scope only definitions (e.g. struct and union fields)
 - Used in conjunction with 'tagEnv'.
 - Distinct from 'defs' because nested structs should all have their names
 - visible at outer scope, so we still need a mechanism to propagate those.
 - e.g. struct x { struct y { .. } .. } should result in both x and y in the env.
 -
 - @see defs for normal definitions
 -}
synthesized attribute localdefs :: [Def];
{--
 - The environment, on which all lookups are performed.
 -}
autocopy attribute env :: Decorated Env;
{--
 - The local environment for a struct or enum. Could be a different type, I suppose. TODO
 -}
synthesized attribute tagEnv :: Decorated Env;


-- Environment manipulation functions

function emptyEnv
Decorated Env ::=
{
  return decorate emptyEnv_i() with {};
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
function openScope
Decorated Env ::= e::Decorated Env
{
  return decorate openScope_i(e) with {};
}
function globalEnv
Decorated Env ::= e::Decorated Env
{
  -- Two different methods of getting the global env
  --return decorate globalEnv_i(e) with {};
  return globalEnvHelp(e, []);
}

function globalEnvHelp
Decorated Env ::= e::Decorated Env ds::[Defs]
{
  return case e of
    emptyEnv_i() -> foldr(addEnvDefs, emptyEnv(), ds)
  | addEnv_i(d, e) -> globalEnvHelp(e, d :: ds)
  | openScope_i(e) -> globalEnvHelp(e, [])
  end;
}

-- Environment lookup functions

function lookupValue
[ValueItem] ::= n::String  e::Decorated Env
{
  return readScope_i(n, e.values);
}
function lookupTag
[TagItem] ::= n::String  e::Decorated Env
{
  return readScope_i(n, e.tags);
}
function lookupLabel
[LabelItem] ::= n::String  e::Decorated Env
{
  return readScope_i(n, e.labels);
}
function lookupRefId 
[RefIdItem] ::= n::String  e::Decorated Env
{
  return readScope_i(n, e.refIds);
}

function lookupMisc 
[MiscItem] ::= n::String  e::Decorated Env
{
  return readScope_i(n, e.misc);
}


function lookupValueInLocalScope
[ValueItem] ::= n::String  e::Decorated Env
{
  return tm:lookup(n, head(e.values));
}
function lookupTagInLocalScope
[TagItem] ::= n::String  e::Decorated Env
{
  return tm:lookup(n, head(e.tags));
}
function lookupLabelInLocalScope
[LabelItem] ::= n::String  e::Decorated Env
{
  return tm:lookup(n, head(e.labels));
}

function lookupMiscInLocalScope
[MiscItem] ::= n::String  e::Decorated Env
{
  return tm:lookup(n, head(e.misc));
}

