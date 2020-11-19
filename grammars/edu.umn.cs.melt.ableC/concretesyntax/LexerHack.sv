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
lexer class Scoped
  submits to Reserved,
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
    local shiftableGlobals::[TerminalId] = intersectBy(terminalIdEq, shiftable, Global);
    
    {- In order of preference:
     - * Looked-up terminal from context
     -   * If the name has previously been defined as a TypeName_t and we have already seen a
           specifier in the current specifier list, then return Identifier_t instead (needed to
           handle C11 typedef re-declarations)
     - * Any valid, unambigous terminal from the Global lexer class (if not in a system header file)
     -   * If there are more than one, check the globalPrerences parser attribute
     -   * Otherwise, fail (this is a conflict between two extensions that must be resolved with
           explict preferences/prefixes)
     - * Identifier_t, if valid
     - * TypeName_t, if valid
     - * Any (arbitrary) thing that is valid: if the parse succeeds there will
     -   be a semantic error that is better than a syntax error.
     -}
    pluck
      case lookupResult of
      | just(id) ->
        if id == TypeName_t && seenTypeSpecifier && containsBy(terminalIdEq, Identifier_t, shiftable)
        then Identifier_t
        else id
      | nothing() when !inSystemHeader && !null(shiftableGlobals) ->
        case shiftableGlobals of
        | [id] -> id
        | ids when lookupBy(terminalSetEq, ids, globalPreferences) matches just(id) -> id
        | _ -> disambiguationFailure
        end
      | _ when containsBy(terminalIdEq, Identifier_t, shiftable) -> Identifier_t
      | _ when containsBy(terminalIdEq, TypeName_t, shiftable) -> TypeName_t
      | _ -> head(shiftable) -- Always has length >= 2
      end;
  };

-- "Globally scoped" terminals are extension marking terminals that should be treated as
-- identifiers that live in the outermost scope, and thus can be lexically shadowed.
-- Extensions should use this class rather than Reserved, as marking terminals should not
-- use lexical precedence.
lexer class Global extends Scoped;

-- Lexical ambiguities between Global terminals cannot usually be decided by the Scoped
-- disambuguation class, and must ordinarily be resolved at composition time with
-- transparent prefixes or explicit disambiguation groups.
-- Extensions may occasionally introduce such ambiguities internally.  Instead of a
-- disambiguation group, they can specify a preference using the globalPreferences parser attribute.
parser attribute globalPreferences::[Pair<[TerminalId] TerminalId>]
  action { globalPreferences = []; };

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
