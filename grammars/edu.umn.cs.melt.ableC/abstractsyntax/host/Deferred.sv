grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production deferredDecl
top::Decl ::= refId::String d::Decl
{
  propagate env;
  
  top.pp = ppConcat([pp"deferredDecl", space(), parens(text(refId)), space(), braces(nestlines(2, d.pp))]);

  production refIdExists::Boolean = !null(lookupRefId(refId, top.env));
  top.host = if refIdExists then d.host else decls(nilDecl());
  top.errors := if refIdExists then d.errors else [];
  -- TODO: We are lifting to potentially outside the scope where the refId is defined.
  -- This might be problematic if the refId isn't defined in the global scope.
  top.globalDecls =
    if refIdExists || d.isEmpty
    then @d.globalDecls
    else consGlobalDecl(deferredDecl(refId, decls(@d.globalDecls)), nilGlobalDecl());
  top.functionDecls =
    if refIdExists
    then @d.functionDecls
    else consFunDecl(deferredDecl(refId, decls(@d.functionDecls)), nilFunDecl());
  top.defs := if refIdExists then d.defs else [deferredDeclDef(refId, ^d)];
  top.freeVariables := if refIdExists then d.freeVariables else [];
}

production foldDeferredDecl
top::Decl ::= refIds::[String]  d::Decl
{
  propagate env, controlStmtContext;
  forwards to
    case refIds of
    | h :: t -> deferredDecl(h, foldDeferredDecl(t, @d))
    | [] -> @d
    end;
}

function defsDeferredDecls
[Decorated Decl] ::= env::Env isTopLevel::Boolean
                      controlStmtContext::ControlStmtContext
                      defs::[Def]
{
  local deferredDecls::Decl =
    decls(
      foldDecl(
        concat(
          map(
            lookupDeferredDecls(_, env),
            map(fst, foldr(consDefs, nilDefs(), defs).refIdContribs)))));
  deferredDecls.env = env;
  deferredDecls.isTopLevel = isTopLevel;
  deferredDecls.controlStmtContext = controlStmtContext;

  return
    if !null(deferredDecls.defs)
    then
      deferredDecls ::
      defsDeferredDecls(
        addEnv(deferredDecls.defs, env), isTopLevel, controlStmtContext,
          deferredDecls.defs)
    else [];
}

aspect production defsDecl
top::Decl ::= d::[Def]
{
  -- This production goes away when the transformation to host occurs, this is a special case where
  -- host is not simply propagated, because Def is a closed 'collection' nonterminal with special
  -- semantics.
  local deferredDecls::[Decorated Decl] =
    defsDeferredDecls(addEnv(d, top.env), top.isTopLevel, top.controlStmtContext, d);
  top.host = decls(foldDecl(map(\ d::Decorated Decl -> d.host, deferredDecls)));
  top.defs <- concat(map((.defs), deferredDecls));
  top.freeVariables <- concat(map((.freeVariables), deferredDecls));
}

aspect production variableDecls
top::Decl ::= storage::StorageClasses  attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  nondecorated local host::Decl =
    if dcls.hasModifiedTypeExpr
    then decls(foldDecl(ty.hostDecls ++ dcls.hostDecls))
    else variableDecls(^storage, attrs.host, ty.host, dcls.host);
  local deferredDecls::[Decorated Decl] =
    defsDeferredDecls(addEnv(dcls.defs, dcls.env), top.isTopLevel,
      top.controlStmtContext, ty.defs ++ dcls.defs);
  top.host =
    if !null(deferredDecls)
    then decls(foldDecl(host :: map((.host), deferredDecls)))
    else host;
  top.defs <- concat(map((.defs), deferredDecls));
  top.freeVariables <- concat(map((.freeVariables), deferredDecls));
}

aspect production typeExprDecl
top::Decl ::= attrs::Attributes ty::BaseTypeExpr
{
  nondecorated local host::Decl = typeExprDecl(attrs.host, ty.host);
  local deferredDecls::[Decorated Decl] =
    defsDeferredDecls(addEnv(ty.defs, ty.env), top.isTopLevel,
      top.controlStmtContext, ty.defs);
  top.host =
    if !null(deferredDecls)
    then decls(foldDecl(host :: map((.host), deferredDecls)))
    else host;
  top.defs <- concat(map((.defs), deferredDecls));
  top.freeVariables <- concat(map((.freeVariables), deferredDecls));
}

aspect production typedefDecls
top::Decl ::= attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  nondecorated local host::Decl =
    if dcls.hasModifiedTypeExpr
    then decls(foldDecl(ty.hostDecls ++ dcls.hostDecls))
    else typedefDecls(attrs.host, ty.host, dcls.host);
  local deferredDecls::[Decorated Decl] =
    defsDeferredDecls(addEnv(dcls.defs, dcls.env), top.isTopLevel,
      top.controlStmtContext, ty.defs ++ dcls.defs);
  top.host =
    if !null(deferredDecls)
    then decls(foldDecl(host :: map((.host), deferredDecls)))
    else host;
  top.defs <- concat(map((.defs), deferredDecls));
  top.freeVariables <- concat(map((.freeVariables), deferredDecls));
}

aspect production functionDeclaration
top::Decl ::= f::FunctionDecl
{
  nondecorated local host::Decl = f.host;
  local deferredDecls::[Decorated Decl] =
    defsDeferredDecls(addEnv(f.defs, f.env), top.isTopLevel,
      top.controlStmtContext, f.defs);
  top.host =
    if !null(deferredDecls)
    then decls(foldDecl(host :: map((.host), deferredDecls)))
    else host;
  top.defs <- concat(map((.defs), deferredDecls));
  top.freeVariables <- concat(map((.freeVariables), deferredDecls));
}
