grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production deferredDecl
top::Decl ::= refId::String d::Decl
{
  propagate lifted;
  top.pp = ppConcat([pp"deferredDecl", space(), parens(text(refId)), space(), braces(nestlines(2, d.pp))]);
  -- This production goes away when the transformation to host occurs.
  top.host = decls(nilDecl());
  top.errors := [];
  top.globalDecls := [];
  top.defs := [deferredDeclDef(refId, d)];
  top.freeVariables := [];
}

function defsDeferredDecls
[Decorated Decl] ::= env::Decorated Env returnType::Maybe<Type> isTopLevel::Boolean defs::[Def]
{
  local deferredDecls::Decl =
    decls(
      foldDecl(
        concat(
          map(
            lookupDeferredDecls(_, env),
            map(fst, foldr(consDefs, nilDefs(), defs).refIdContribs)))));
  deferredDecls.env = env;
  deferredDecls.returnType = returnType;
  deferredDecls.isTopLevel = isTopLevel;
  
  return
    if !null(deferredDecls.defs)
    then deferredDecls :: defsDeferredDecls(env, returnType, isTopLevel, deferredDecls.defs)
    else [];
}

-- Because extensions can use defsDecl to introduce refIds, we handle rewriting of deferredDecl
-- productions using host rather than lifted.

aspect production defsDecl
top::Decl ::= d::[Def]
{
  -- This production goes away when the transformation to host occurs, this is a special case where
  -- host is not simply propagated, because Def is a closed 'collection' nonterminal with special
  -- semantics.
  local deferredDecls::[Decorated Decl] = defsDeferredDecls(top.env, top.returnType, top.isTopLevel, d);
  top.host = decls(foldDecl(map(\ d::Decorated Decl -> d.host, deferredDecls)));
  top.defs <- concat(map((.defs), deferredDecls));
}

aspect production variableDecls
top::Decl ::= storage::StorageClasses  attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  local host::Decl = variableDecls(storage, attrs.host, ty.host, dcls.host);
  local deferredDecls::[Decorated Decl] = defsDeferredDecls(top.env, top.returnType, top.isTopLevel, ty.defs);
  top.host =
    if !null(deferredDecls)
    then decls(foldDecl(host :: map(\ d::Decorated Decl -> d.host, deferredDecls)))
    else host;
  top.defs <- concat(map((.defs), deferredDecls));
  top.freeVariables <- concat(map((.freeVariables), deferredDecls));
}

aspect production typeExprDecl
top::Decl ::= attrs::Attributes ty::BaseTypeExpr
{
  local host::Decl = typeExprDecl(attrs.host, ty.host);
  local deferredDecls::[Decorated Decl] = defsDeferredDecls(top.env, top.returnType, top.isTopLevel, ty.defs);
  top.host =
    if !null(deferredDecls)
    then decls(foldDecl(host :: map(\ d::Decorated Decl -> d.host, deferredDecls)))
    else host;
  top.defs <- concat(map((.defs), deferredDecls));
  top.freeVariables <- concat(map((.freeVariables), deferredDecls));
}

aspect production typedefDecls
top::Decl ::= attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  local host::Decl = typedefDecls(attrs.host, ty.host, dcls.host);
  local deferredDecls::[Decorated Decl] = defsDeferredDecls(top.env, top.returnType, top.isTopLevel, ty.defs);
  top.host =
    if !null(deferredDecls)
    then decls(foldDecl(host :: map(\ d::Decorated Decl -> d.host, deferredDecls)))
    else host;
  top.defs <- concat(map((.defs), deferredDecls));
  top.freeVariables <- concat(map((.freeVariables), deferredDecls));
}

aspect production functionDeclaration
top::Decl ::= f::FunctionDecl
{
  local host::Decl = functionDeclaration(f.host);
  local deferredDecls::[Decorated Decl] = defsDeferredDecls(top.env, top.returnType, top.isTopLevel, f.defs);
  top.host =
    if !null(deferredDecls)
    then decls(foldDecl(host :: map(\ d::Decorated Decl -> d.host, deferredDecls)))
    else host;
  top.defs <- concat(map((.defs), deferredDecls));
  top.freeVariables <- concat(map((.freeVariables), deferredDecls));
}
