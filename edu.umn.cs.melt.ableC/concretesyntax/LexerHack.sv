grammar edu:umn:cs:melt:ableC:concretesyntax;

{--
 - The outer list is scopes, the inner list is a mapping from an
 - identifier to a sort. 
 - 
 - N.B. The inner list is *ordered*. The first match applies, the later are
 - shadowed.
 -
 - The C lexer hack behavior requires mapping an identifier to the specified
 - sort (ident, or typename) if it has been declared (in scope) as that type.
 - Otherwise, default to a normal ident.
 -
 - The initial value is an empty, outer scope. [[]] not [], which is no scopes at all.
 -}
parser attribute context :: [[Pair<String IdentType>]]
  action { context = [[]]; };

{--
 - C11 introduces a new wrinkle in handling typedef declarations:
 - Once a type-specifier is seen in a declaration specifiers list,
 - identifiers should no longer be treated as potentially typenames.
 -
 - This is to give correct behavior to 'typedef int foo; typedef int foo'
 - and such, where redeclaration is permitted.
 - As such, we flag true when we have seen an identifier, and reset to false
 - after we have reduced the declaration.
 -}

nonterminal IdentType;
abstract production identType_c     top::IdentType ::= {}
abstract production typenameType_c  top::IdentType ::= {}

-- convenient, one single object for each. totally unnecessary of course...
global identType :: IdentType = identType_c();
global typenameType :: IdentType = typenameType_c();

-- Here is the actual decision logic
disambiguate Identifier_t, TypeName_t
{
  pluck

    case lookupBy(stringEq, lexeme, head(context)) of
    | just(typenameType_c()) -> TypeName_t
    | _ -> Identifier_t
    end;
}

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

