grammar edu:umn:cs:melt:ableC:concretesyntax:lexerHack;

imports edu:umn:cs:melt:ableC:abstractsyntax as ast;

-- Nonterminal representing an enumeration of possible identifier types
-- This is closed to allow extensions to further utilize this mechanism
closed nonterminal IdentType;
abstract production identType_c     top::IdentType ::= {}
abstract production typenameType_c  top::IdentType ::= {}

-- convenient, one single object for each. totally unnecessary of course...
global identType :: IdentType = identType_c();
global typenameType :: IdentType = typenameType_c();


-- The logic that mutates the 'context' value is distributed amoung the rules
-- elsewhere in the grammar. grep for 'action' to find them all.

-- The following functions are not difficult, but we provide them to give
-- a name to the actions.
function openScope
[[Pair<String IdentType>]] ::= l::[[Pair<String IdentType>]]
{
  return head(l) :: l;
}

function closeScope
[[Pair<String IdentType>]] ::= l::[[Pair<String IdentType>]]
{
  return tail(l);
}

function addIdentsToScope
[[Pair<String IdentType>]] ::= l::[ast:Name]  context::[[Pair<String IdentType>]]
{
  return (map(pair(_, identType), map((.ast:name), l)) ++ head(context)) :: tail(context);
}

function addTypenamesToScope
[[Pair<String IdentType>]] ::= l::[ast:Name]  context::[[Pair<String IdentType>]]
{
  return (map(pair(_, typenameType), map((.ast:name), l)) ++ head(context)) :: tail(context);
}

function beginFunctionScope
[[Pair<String IdentType>]] ::= funName::ast:Name  paramNames::Maybe<[ast:Name]>  context::[[Pair<String IdentType>]]
{
  return
    addIdentsToScope(fromMaybe([], paramNames),
      openScope(
        addIdentsToScope([funName],
          context)));
}
