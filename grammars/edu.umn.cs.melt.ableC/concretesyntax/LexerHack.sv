grammar edu:umn:cs:melt:ableC:concretesyntax;

{--
 - The outer list is scopes, the inner list is a mapping from an
 - identifier to a sort (ident, or typename). 
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
parser attribute context :: [[Pair<String TerminalId>]]
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


-- Here is the actual decision logic
lexer class Cidentifier
  submits to Ckeyword
  disambiguate {
    pluck
      case lookupBy(stringEq, lexeme, head(context)) of
      | just(id) -> id
      | nothing() -> Identifier_t
      end;
  };

-- The logic that mutates the 'context' value is distributed amoung the rules
-- elsewhere in the grammar. grep for 'action' to find them all.

-- The following functions are not difficult, but we provide them to give
-- a name to the actions.
function openScope
[[Pair<String TerminalId>]] ::= l::[[Pair<String TerminalId>]]
{
  return head(l) :: l;
}

function closeScope
[[Pair<String TerminalId>]] ::= l::[[Pair<String TerminalId>]]
{
  return tail(l);
}

function addIdentsToScope
[[Pair<String TerminalId>]] ::= l::[ast:Name]  id::TerminalId  context::[[Pair<String TerminalId>]]
{
  return (map(pair(_, id), map((.ast:name), l)) ++ head(context)) :: tail(context);
}

function beginFunctionScope
[[Pair<String TerminalId>]] ::= funName::ast:Name  id::TerminalId  paramNames::Maybe<[ast:Name]>  context::[[Pair<String TerminalId>]]
{
  return
    addIdentsToScope(
      fromMaybe([], paramNames),
      id,
      openScope(
        addIdentsToScope(
          [funName],
          id,
          context)));
}
