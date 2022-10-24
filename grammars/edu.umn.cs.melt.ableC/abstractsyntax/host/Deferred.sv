grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production deferredDecl
top::Decl ::= refId::String d::Decl
{
  top.pp = ppConcat([pp"deferredDecl", space(), parens(text(refId)), space(), braces(nestlines(2, d.pp))]);

  production refIdExists::Boolean = !null(lookupRefId(refId, top.env));
  top.host = if refIdExists then d.host else decls(nilDecl());
  top.errors := if refIdExists then d.errors else [];
  top.globalDecls := if refIdExists then d.globalDecls else [];
  top.functionDecls := if refIdExists then d.functionDecls else [];
  top.defs := if refIdExists then d.defs else [deferredDeclDef(refId, d)];
  top.freeVariables := if refIdExists then d.freeVariables else [];
}

function defsDeferredDecls
[Decorated Decl] ::= env::Decorated Env isTopLevel::Boolean
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
  top.globalDecls <- concat(map((.globalDecls), deferredDecls));
  top.functionDecls <- concat(map((.functionDecls), deferredDecls));
}

aspect production variableDecls
top::Decl ::= storage::StorageClasses  attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  local host::Decl =
    if dcls.hasModifiedTypeExpr
    then
      decls(
        foldDecl(
          -- decorate needed here because of flowtype for decls
          decorate ty.host with {
            env = ty.env; givenRefId = ty.givenRefId;
            controlStmtContext = ty.controlStmtContext;
          }.decls ++ dcls.hostDecls))
    else variableDecls(storage, attrs.host, ty.host, dcls.host);
  local deferredDecls::[Decorated Decl] =
    defsDeferredDecls(addEnv(dcls.defs, dcls.env), top.isTopLevel,
      top.controlStmtContext, ty.defs ++ dcls.defs);
  top.host =
    if !null(deferredDecls)
    then decls(foldDecl(host :: map(\ d::Decorated Decl -> d.host, deferredDecls)))
    else host;
  top.globalDecls <- concat(map((.globalDecls), deferredDecls));
  top.functionDecls <- concat(map((.functionDecls), deferredDecls));
  top.defs <- concat(map((.defs), deferredDecls));
  top.freeVariables <- concat(map((.freeVariables), deferredDecls));
}

aspect production typeExprDecl
top::Decl ::= attrs::Attributes ty::BaseTypeExpr
{
  local host::Decl = typeExprDecl(attrs.host, ty.host);
  local deferredDecls::[Decorated Decl] =
    defsDeferredDecls(addEnv(ty.defs, ty.env), top.isTopLevel,
      top.controlStmtContext, ty.defs);
  top.host =
    if !null(deferredDecls)
    then decls(foldDecl(host :: map(\ d::Decorated Decl -> d.host, deferredDecls)))
    else host;
  top.globalDecls <- concat(map((.globalDecls), deferredDecls));
  top.functionDecls <- concat(map((.functionDecls), deferredDecls));
  top.defs <- concat(map((.defs), deferredDecls));
  top.freeVariables <- concat(map((.freeVariables), deferredDecls));
}

aspect production typedefDecls
top::Decl ::= attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  local host::Decl =
    if dcls.hasModifiedTypeExpr
    then
      decls(
        foldDecl(
          -- decorate needed here because of flowtype for decls
          decorate ty.host with {
            env = ty.env; givenRefId = ty.givenRefId;
            controlStmtContext = ty.controlStmtContext;
          }.decls ++ dcls.hostDecls))
    else typedefDecls(attrs.host, ty.host, dcls.host);
  local deferredDecls::[Decorated Decl] =
    defsDeferredDecls(addEnv(dcls.defs, dcls.env), top.isTopLevel,
      top.controlStmtContext, ty.defs ++ dcls.defs);
  top.host =
    if !null(deferredDecls)
    then decls(foldDecl(host :: map(\ d::Decorated Decl -> d.host, deferredDecls)))
    else host;
  top.globalDecls <- concat(map((.globalDecls), deferredDecls));
  top.functionDecls <- concat(map((.functionDecls), deferredDecls));
  top.defs <- concat(map((.defs), deferredDecls));
  top.freeVariables <- concat(map((.freeVariables), deferredDecls));
}

aspect production functionDeclaration
top::Decl ::= f::FunctionDecl
{
  local host::Decl = f.host;
  local deferredDecls::[Decorated Decl] =
    defsDeferredDecls(addEnv(f.defs, f.env), top.isTopLevel,
      top.controlStmtContext, f.defs);
  top.host =
    if !null(deferredDecls)
    then decls(foldDecl(host :: map(\ d::Decorated Decl -> d.host, deferredDecls)))
    else host;
  top.globalDecls <- concat(map((.globalDecls), deferredDecls));
  top.functionDecls <- concat(map((.functionDecls), deferredDecls));
  top.defs <- concat(map((.defs), deferredDecls));
  top.freeVariables <- concat(map((.freeVariables), deferredDecls));
}
