grammar edu:umn:cs:melt:ableC:abstractsyntax;

{--
 - Extensions that want to specify declartions to lift to a global scope
 - do so by forwarding to the host production `injectGlobalDecls` (or one
 - of the corresponding ones for Type or BaseTypeExpr.)  
 - 
 - After extracting the `host` tree, there are no extension constructs, but
 - the AST contains constructs that cannot be directly translated into C, for
 - example declarations need to be lifted to the proper place. 
 - 
 - A pair of synthesized attributes can be used for this.
 - * `globalDecls`: the list of declarations to lift up
 - * `lifted`: the lifted tree.
 - An invariant here is that all Decl nodes in the `host` tree appear in
 - either `globalDecls` or in `lifted`.  Also, the 'injection' productions
 - defined here should not occur in the lifted tree.  
 - 
 - Another invariant is that declarations in globalDecls with the same name
 - refer to an identical declaration, so that any duplicates can be safely
 - removed.  This is left up to the extension writer for now, but there may
 - a better solution.  
 - 
 - TODO:
 - Right now we assume the name in any globalDecls pairs corresponds to a
 - ValueItem that is being defined.  We should find a way to generalize this,
 - possibly leveraging some of the current env stuff, to allow things like
 - non-typedef'ed structs to be lifted.  
 - 
 - It would be nice to move all of this to its own grammar, but aspecting
 - everything for lifted and globalDecls would be kind of a pain
 -}
synthesized attribute lifted<a>::a;

-- String is name of decl, could be used to remove duplicates
synthesized attribute globalDecls::[Pair<String Decl>] with ++;

-- List of names of global decls that have already been inserted, to avoid lifting and inserting
-- the same decl at different locations
inherited attribute globalDeclEnv::[String];

abstract production injectGlobalDeclsExpr
top::Expr ::= globalDecls::[Pair<String Decl>] lifted::Expr
{
  top.pp = pp"injectGlobalDeclsExpr {${ppImplode(pp"\n", foldDecl(map(snd, globalDecls)).pps)}} (${lifted.pp})";
  top.host = injectGlobalDeclsExpr(zipWith(pair, names, unfoldDecl(decls.host)), lifted.host, location=top.location);
  
  -- Remove the globalDecls that are already in the env (i.e. this is already part of a lifted ast)
  local newGlobalDecls::[Pair<String Decl>] = removeEnvGlobalDeclPairs(globalDecls, top.env);
 
  local decls::Decls = foldDecl(map(snd, newGlobalDecls));
  local names::[String] = map(fst, newGlobalDecls);

  decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = top.returnType;

  top.errors <- decls.errors;

 -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls :=
    decls.globalDecls ++
    zipWith(pair, names, unfoldDecl(decls.lifted)) ++ 
    lifted.globalDecls;
  -- It should hold that names and unfoldDecl(decls.lifted) are the same length and
  -- correctly correspond to one another.
  top.lifted = lifted.lifted;
  
  -- TODO: We are adding the new env elements to the current scope, when they should really be global
  -- Shouldn't be a problem unless there are name conflicts, doing this the right way would be less
  -- efficent. 
  lifted.env = addEnv(decls.defs, top.env);
  
  -- defs include things that were lifted, so things in the same scope don't need to be lifted twice
  top.defs = decls.defs ++ lifted.defs;
  
  -- Define other attributes to be the same as on lifted
  top.errors := lifted.errors;
  top.freeVariables = lifted.freeVariables;
  top.typerep = lifted.typerep;
}

-- Same as injectGlobalDeclsExpr, but on Stmt
abstract production injectGlobalDeclsStmt
top::Stmt ::= globalDecls::[Pair<String Decl>] lifted::Stmt
{
  top.pp = pp"injectGlobalDeclsStmt {${ppImplode(pp"\n", foldDecl(map(snd, globalDecls)).pps)}} (${lifted.pp})";
  top.host = injectGlobalDeclsStmt(zipWith(pair, names, unfoldDecl(decls.host)), lifted.host);
  
  -- Remove the globalDecls that are already in the env (i.e. this is already part of a lifted ast)
  local newGlobalDecls::[Pair<String Decl>] = removeEnvGlobalDeclPairs(globalDecls, top.env);
 
  local decls::Decls = foldDecl(map(snd, newGlobalDecls));
  local names::[String] = map(fst, newGlobalDecls);

  decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = top.returnType;

  top.errors <- decls.errors;

 -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls :=
    decls.globalDecls ++
    zipWith(pair, names, unfoldDecl(decls.lifted)) ++ 
    lifted.globalDecls;
  -- It should hold that names and unfoldDecl(decls.lifted) are the same length and
  -- correctly correspond to one another.
  top.lifted = lifted.lifted;
  
  -- TODO: We are adding the new env elements to the current scope, when they should really be global
  -- Shouldn't be a problem unless there are name conflicts, doing this the right way would be less
  -- efficent. 
  lifted.env = addEnv(decls.defs, top.env);
  
  -- defs include things that were lifted, so things in the same scope don't need to be lifted twice
  top.defs = decls.defs ++ lifted.defs;
  
  -- Define other attributes to be the same as on lifted
  top.errors := lifted.errors;
  top.functiondefs = lifted.functiondefs;
  top.freeVariables = lifted.freeVariables;
}

-- Same as injectGlobalDeclsExpr, but on BaseTypeExpr
abstract production injectGlobalDeclsTypeExpr
top::BaseTypeExpr ::= globalDecls::[Pair<String Decl>] lifted::BaseTypeExpr
{
  top.pp = pp"injectGlobalDeclsTypeExpr {${ppImplode(pp"\n", foldDecl(map(snd, globalDecls)).pps)}} (${lifted.pp})";
  top.host = injectGlobalDeclsTypeExpr(zipWith(pair, names, unfoldDecl(decls.host)), lifted.host);
  top.typerep = noncanonicalType(injectGlobalDeclsType(globalDecls, lifted.typerep));
  
  -- Remove the globalDecls that are already in the env (i.e. this is already part of a lifted ast)
  local newGlobalDecls::[Pair<String Decl>] = removeEnvGlobalDeclPairs(globalDecls, top.env);
 
  local decls::Decls = foldDecl(map(snd, newGlobalDecls));
  local names::[String] = map(fst, newGlobalDecls);

  decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = top.returnType;

  top.errors <- decls.errors;

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls :=
    decls.globalDecls ++
    zipWith(pair, names, unfoldDecl(decls.lifted)) ++ 
    lifted.globalDecls;
  -- It should hold that names and unfoldDecl(decls.lifted) are the same length and
  -- correctly correspond to one another.
  top.lifted = lifted.lifted;
 
  -- TODO: We are adding the new env elements to the innermost scope, when they should really be global
  -- Shouldn't be a problem unless there are name conflicts with variables at in-between scopes,
  -- doing this the right way would be less efficent.  
  lifted.env = addEnv(decls.defs, top.env);
  
  -- defs include things that were lifted, so things in the same scope don't need to be lifted twice
  top.defs = decls.defs ++ lifted.defs;
  
  -- Define other attributes to be the same as on lifted
  top.errors := lifted.errors;
  top.typeModifiers = lifted.typeModifiers;
  top.freeVariables = lifted.freeVariables;
}

{--
 - Lifting mechanism for types
 - Since we don't have access to the environment, and Type doesn't occur in the host tree, this just gets
 - turned into injectGlobalDeclsTypeExpr in the host tree
 -}
abstract production injectGlobalDeclsType
top::NoncanonicalType ::= globalDecls::[Pair<String Decl>] lifted::Type
{
  propagate host;
  top.canonicalType = lifted;
  top.lpp = pp"injectGlobalDeclsType {${ppImplode(pp"\n", foldDecl(map(snd, globalDecls)).pps)}} (${lifted.lpp}${lifted.rpp})";
  top.rpp = lifted.rpp;
  top.baseTypeExpr = injectGlobalDeclsTypeExpr(globalDecls, lifted.baseTypeExpr);
  top.typeModifierExpr = lifted.typeModifierExpr;
}

{--
 - Inserts globalDecls before h
 -}
aspect production consGlobalDecl
top::GlobalDecls ::= h::Decl  t::GlobalDecls
{
  propagate host;
 
  local newGlobalDeclPairs::[Pair<String Decl>] =
    removeDuplicateGlobalDeclPairs(h.globalDecls, top.globalDeclEnv);
  local newDecls::Decls = foldDecl(map(snd, newGlobalDeclPairs));

  top.lifted =
    consGlobalDecl( 
      decls(newDecls),
      consGlobalDecl(
        h.lifted,
        t.lifted));
  
  t.globalDeclEnv = top.globalDeclEnv ++ map(fst, newGlobalDeclPairs);
  t.env = addEnv(h.defs, top.env);
}

-- Removes duplicate global decls before inserting them
-- sofar is the list of names that have already been inserted, passed in to globalDecls via globalDeclEnv
function removeDuplicateGlobalDeclPairs
[Pair<String Decl>] ::= ds::[Pair<String Decl>]  sofar::[String]
{
  return
    case ds of
      [] -> []
    | pair(n, d) :: t ->
        if containsBy(stringEq, n, sofar)
        then removeDuplicateGlobalDeclPairs(t, sofar)
        else pair(n, d) :: removeDuplicateGlobalDeclPairs(t, n::sofar)
    end;
}

-- Removes global decls that already are in the env before inserting them
function removeEnvGlobalDeclPairs
[Pair<String Decl>] ::= ds::[Pair<String Decl>]  env::Decorated Env
{
  return
    case ds of
      [] -> []
    | pair(n, d) :: t ->
        if !null(lookupValue(n, env)) || !null(lookupTag(n, env))
        then removeEnvGlobalDeclPairs(t, env)
        else pair(n, d) :: removeEnvGlobalDeclPairs(t, env)
    end;
}