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
    local lookupResult::Maybe<TerminalId> =
      -- Look up the lexeme in the current context
      case lookupBy(stringEq, lexeme, head(context)) of
      | just(id) ->
        if containsBy(terminalIdEq, id, shiftable)
        -- Only disambiguate to an extension terminal if that terminal is valid at this point.
        then just(id)
        else nothing()
      | nothing() -> nothing()
      end;
  
    pluck
      fromMaybe(
        -- By default, disambiguate to Identifier_t if it is valid at this point, or else TypeName_t.
        if containsBy(terminalIdEq, Identifier_t, shiftable)
        then Identifier_t
        -- If TypeName_t isn't valid here, then oh well... syntax error.
        else TypeName_t,
        lookupResult);
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
[[Pair<String TerminalId>]] ::= funName::ast:Name  id::TerminalId  paramNames::Maybe<[ast:Name]>  paramId::TerminalId  context::[[Pair<String TerminalId>]]
{
  return
    addIdentsToScope(
      fromMaybe([], paramNames),
      paramId,
      openScope(
        addIdentsToScope(
          [funName],
          id,
          context)));
}
