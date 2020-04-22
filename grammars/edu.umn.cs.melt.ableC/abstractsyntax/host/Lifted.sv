grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

{--
 - Extensions that want to specify declartions to lift to a global scope
 - do so by forwarding to the host production `injectGlobalDecls` (or one
 - of the corresponding ones for Stmt or BaseTypeExpr.)  
 - 
 - ASTs may contain constructs that cannot be directly translated into C, for
 - example declarations need to be lifted to the proper place. 
 - 
 - A pair of synthesized attributes can be used for this.
 - * `globalDecls`: the list of declarations to lift up
 - * `host`: the tranformed tree containing only proper host productions.
 - An invariant here is that all Decl nodes in the original tree appear in
 - either `globalDecls` or in `host`.  Also, the 'injection' productions
 - defined here should not occur in the host tree.  
 -
 - One issue with this is how to generate the correct environment for the
 - 'lifted' tree passed to an injection production.  The behaviour we *want* is
 - to lift the decls to the global level, then add them to the env for the rest
 - of the tree, including the decl which emitted the globalDecls in the first
 - place.  This unfortunately doesn't work, because of a cyclical dependancy in
 - that the env is needed in the first place to figure out the names of the
 - items being injected, which are then used to generate the env.  
 -
 - Instead, we decorate the new decls at the level of the injection production
 - with an environment only containing the outermost scope in the current env,
 - and pass these new decls up the tree in the decorated form.  The defs from
 - these decls then get passed back up the tree wrapped in 'globalDefsDef',
 - which inserts them in the outermost scope of the environment.  To ensure
 - that these defs are in scope for the rest of the tree, we must re-add the
 - defs from the globalDecls being passed upward wherever a new scope is opened.
 - 
 - Some extensions may want to use the same global decl with the same name in
 - multiple places.  To avoid inserting the decl more than once, the new decl
 - must check that it has not already been defined before forwarding to
 - something that defines the 'missing' item.  To assist with this, an
 - extension may use the production 'maybeDecl', which takes a function to look
 - at the env and return true or false, determining whether the given decl is
 - to be kept.
 -
 - If there are ever errors reported about something being redefined in the
 - host tree, then there is a bug in the host where the env was not provided
 - properly somewhere to contain all injected declarations defined so far.
 -
 - It is also possible for extensions to specify declarations to lift to the
 - current function's outermost scope. This can be done by forwarding to the
 - host production `injectFunctionDeclsDecl`. The same properties discussed
 - above with global scope lifting apply the same to the function scope 
 - lifting, just using the `functionDecls` attribute to track these 
 - declarations.
 -
 - TODO:
 - It would be nice to move all of this to its own grammar, but aspecting
 - everything would be kind of a pain
 -}

monoid attribute globalDecls::[Decorated Decl] with [], ++;
monoid attribute functionDecls::[Decorated Decl] with [], ++;
synthesized attribute unfoldedGlobalDecls::[Decorated Decl];
synthesized attribute unfoldedFunctionDecls::[Decorated Decl];

flowtype globalDecls {decorate} on
  Decls, Decl, Declarators, Declarator, FunctionDecl, Parameters, ParameterDecl, StructDecl, UnionDecl, EnumDecl, StructItemList, EnumItemList, StructItem, StructDeclarators, StructDeclarator, EnumItem,
  MemberDesignator,
  SpecialSpecifiers,
  Expr, GenericAssocs, GenericAssoc,
  TypeName, BaseTypeExpr, TypeModifierExpr, TypeNames,
  MaybeExpr, Exprs, ExprOrTypeName,
  Stmt,
  MaybeInitializer, Initializer, InitList, Init, Designator;
flowtype functionDecls {decorate} on
  Decls, Decl, Declarators, Declarator, Parameters, ParameterDecl, StructDecl, UnionDecl, EnumDecl, StructItemList, EnumItemList, StructItem, StructDeclarators, StructDeclarator, EnumItem,
  MemberDesignator,
  SpecialSpecifiers,
  Expr, GenericAssocs, GenericAssoc,
  TypeName, BaseTypeExpr, TypeModifierExpr, TypeNames,
  MaybeExpr, Exprs, ExprOrTypeName,
  Stmt,
  MaybeInitializer, Initializer, InitList, Init, Designator;
flowtype unfoldedGlobalDecls {decorate} on
  Decls, Decl;
flowtype unfoldedFunctionDecls {decorate} on
  Decls, Decl;

{--
 - Wrapper production for a decl that first performs some sort of check for whether something is in
 - the environment before including that decl in the Decls passed to an injection production 
 -}
abstract production maybeDecl
top::Decl ::= include::(Boolean ::= Decorated Env) decl::Decl
{
  top.pp = cat(pp"maybe ", braces(nestlines(2, decl.pp)));
  
  forwards to
    if include(top.env)
    then decl
    else decls(nilDecl());
}

-- Helpers to construct maybeDecl that checks various namespaces
abstract production maybeValueDecl
top::Decl ::= name::String decl::Decl
{
  top.pp = cat(pp"maybeValue (${text(name)}) ", braces(nestlines(2, decl.pp)));
  
  forwards to maybeDecl(\ env::Decorated Env -> null(lookupValue(name, top.env)), decl);
}
abstract production maybeTagDecl
top::Decl ::= name::String decl::Decl
{
  top.pp = cat(pp"maybeTag (${text(name)}) ", braces(nestlines(2, decl.pp)));
  
  forwards to maybeDecl(\ env::Decorated Env -> null(lookupTag(name, top.env)), decl);
}
abstract production maybeRefIdDecl
top::Decl ::= name::String decl::Decl
{
  top.pp = cat(pp"maybeRefId (${text(name)}) ", braces(nestlines(2, decl.pp)));
  
  forwards to maybeDecl(\ env::Decorated Env -> null(lookupRefId(name, top.env)), decl);
}

-- Injection production for Expr
abstract production injectGlobalDeclsExpr
top::Expr ::= decls::Decls lifted::Expr
{
  propagate errors, functionDecls;
  top.pp = pp"injectGlobalDeclsExpr ${braces(nestlines(2, ppImplode(line(), decls.pps)))} (${lifted.pp})";
  
  -- Insert defs from decls at the global scope
  top.defs := globalDefsDef(decls.defs) :: lifted.defs;

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls := decls.unfoldedGlobalDecls ++ lifted.globalDecls;
  top.host = lifted.host;
  
  -- Variables corresponing to lifted values are *not* considered free, since they are either bound
  -- here (host tree) or available globally and shouldn't recieve special treatment (lifted tree).
  top.freeVariables := removeDefsFromNames(decls.defs, lifted.freeVariables);
  
  -- Define other attributes to be the same as on lifted
  top.typerep = lifted.typerep;

  decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = nothing();

  lifted.env = addEnv([globalDefsDef(decls.defs)], top.env);

  top.isLValue = lifted.isLValue;
}

-- Same as injectGlobalDeclsExpr, but on Stmt
abstract production injectGlobalDeclsStmt
top::Stmt ::= decls::Decls lifted::Stmt
{
  propagate errors, functionDecls;
  top.pp = pp"injectGlobalDeclsStmt ${braces(nestlines(2, ppImplode(line(), decls.pps)))} ${braces(nestlines(2, lifted.pp))}";
  
  -- Insert defs from decls at the global scope
  top.defs := globalDefsDef(decls.defs) :: lifted.defs;

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls := decls.unfoldedGlobalDecls ++ lifted.globalDecls;
  top.host = lifted.host;
  
  -- Variables corresponing to lifted values are *not* considered free, since they are either bound
  -- here (host tree) or available globally and shouldn't recieve special treatment (lifted tree).
  top.freeVariables := removeDefsFromNames(decls.defs, lifted.freeVariables);
  
  -- Define other attributes to be the same as on lifted
  top.functionDefs := lifted.functionDefs;
  
  decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = nothing();
  
  lifted.env = addEnv([globalDefsDef(decls.defs)], top.env);
}

-- Same as injectGlobalDeclsExpr, but on BaseTypeExpr
abstract production injectGlobalDeclsTypeExpr
top::BaseTypeExpr ::= decls::Decls lifted::BaseTypeExpr
{
  propagate errors, functionDecls;
  top.pp = pp"injectGlobalDeclsTypeExpr ${braces(nestlines(2, ppImplode(line(), decls.pps)))} (${lifted.pp})";
  
  -- Insert defs from decls at the global scope
  top.defs := globalDefsDef(decls.defs) :: lifted.defs;

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls := decls.unfoldedGlobalDecls ++ lifted.globalDecls;
  top.host = lifted.host;
  
  -- Variables corresponing to lifted values are *not* considered free, since they are either bound
  -- here (host tree) or available globally and shouldn't recieve special treatment (lifted tree).
  top.freeVariables := removeDefsFromNames(decls.defs, lifted.freeVariables);
  
  -- Preserve injected decls when transforming to and back from typerep
  top.decls := [injectGlobalDeclsDecl(decls)];
  
  -- Define other attributes to be the same as on lifted
  top.typerep = lifted.typerep;
  top.typeModifier = lifted.typeModifier;
  
  decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = nothing();

  lifted.env = addEnv([globalDefsDef(decls.defs)], top.env);
}

-- Just lift a list of Decls
abstract production injectGlobalDeclsDecl
top::Decl ::= decls::Decls
{
  propagate errors, functionDecls;
  top.pp = pp"injectGlobalDeclsDecl ${braces(nestlines(2, ppImplode(line(), decls.pps)))}";
  
  -- Insert defs from decls at the global scope
  top.defs := [globalDefsDef(decls.defs)];

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls := decls.unfoldedGlobalDecls;
  top.host = edu:umn:cs:melt:ableC:abstractsyntax:host:decls(nilDecl());
  
  -- Define other attributes to be the same as on "lifted" (i.e. nilDecl())
  top.freeVariables := [];
  
  decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = nothing();
}

abstract production injectFunctionDeclsDecl
top::Decl ::= decls::Decls
{
  propagate errors, globalDecls;
  top.pp = pp"injectFunctionDeclsStmt ${braces(nestlines(2, ppImplode(line(), decls.pps)))}";

  top.defs := [functionDefsDef(decls.defs)];

  top.functionDecls := decls.unfoldedFunctionDecls;
  top.host = edu:umn:cs:melt:ableC:abstractsyntax:host:decls(nilDecl());

  top.freeVariables := [];

  decls.env = functionEnv(top.env);
  decls.isTopLevel = false;
  decls.returnType = nothing();
}

{--
 - Inserts globalDecls before h
 -}
aspect production consGlobalDecl
top::GlobalDecls ::= h::Decl  t::GlobalDecls
{
  top.host =
    foldr(
      consGlobalDecl,
      t.host,
      map(\ d::Decorated Decl -> d.host, h.unfoldedGlobalDecls));
}

-- Utility functions
function globalDeclsDefs
[Def] ::= d::[Decorated Decl]
{
  return [globalDefsDef(foldr(append, [], map((.defs), d)))];
}

function functionDeclsDefs
[Def] ::= d::[Decorated Decl]
{
  return [functionDefsDef(foldr(append, [], map((.defs), d)))];
}
