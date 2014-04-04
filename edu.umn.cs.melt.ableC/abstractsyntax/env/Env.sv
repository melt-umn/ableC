grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports silver:util:raw:treemap as tm;

{--
 - The environment values that get passed around and used to look up names.
 -}
nonterminal Env with labels, tags, values, refIds;

{--
 - A list of definitions, only used in contributing new names to the environment.
 -}
nonterminal Defs with labelContribs, tagContribs, valueContribs, refIdContribs;

{--
 - An individual definition of a name.
 -}
closed nonterminal Def with labelContribs, tagContribs, valueContribs, refIdContribs;


{--
 - An attribute on abstract syntax trees that represents the definitions
 - that escape the scope of the corresponding subtree.
 -}
synthesized attribute defs :: [Def];
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
  return if null(d) then e else decorate addEnv_i(foldr(consDefs, nilDefs(), d), e) with {};
}
function openScope
Decorated Env ::= e::Decorated Env
{
  return decorate openScope_i(e) with {};
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

