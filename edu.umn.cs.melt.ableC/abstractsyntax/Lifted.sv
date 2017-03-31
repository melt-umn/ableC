grammar edu:umn:cs:melt:ableC:abstractsyntax;

{--
 - Extensions that want to specify declartions to lift to a global scope
 - do so by forwarding to the host production `injectGlobalDecls` (or one
 - of the corresponding ones for Stmt, Type or BaseTypeExpr.)  
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
 - lifted tree, then there is a bug in the host where something that 
 - 
 - TODO:
 - injectGlobalDeclsType currently forwards to get the correct type-checking
 - behavior, when it really shouldn't since it is a part of the host.  It
 - shouldn't be a NoncanonicalType, since we aren't OK with it getting
 - transformed away.  This could potentially be fixed by adding a
 - transformation for a type to a base type that is used for structural
 - equivalence, stripping injection productions and noncanonical types.  Or
 - maybe there is a better solution.  
 - 
 - It would be nice to move all of this to its own grammar, but aspecting
 - everything for lifted and globalDecls would be kind of a pain
 -}

synthesized attribute lifted<a>::a;
synthesized attribute globalDecls::[Decorated Decl] with ++;

{--
 - Wrapper production for a decl that first performs some sort of check for whether something is in
 - the environment before including that decl in the Decls passed to an injection production 
 -}
abstract production maybeDecl
top::Decl ::= include::(Boolean ::= Decorated Env) decl::Decl
{
  top.pp = cat(pp"maybe ", braces(decl.pp));
  
  forwards to
    if include(top.env)
    then decl
    else decls(nilDecl());
}

-- Helpers to construct maybeDecl that checks various namespaces
abstract production maybeValueDecl
top::Decl ::= name::String decl::Decl
{
  top.pp = cat(pp"maybeValue (${text(name)}", braces(decl.pp));
  
  forwards to maybeDecl(\ env::Decorated Env -> null(lookupValue(name, top.env)), decl);
}
abstract production maybeTagDecl
top::Decl ::= name::String decl::Decl
{
  top.pp = cat(pp"maybeTag (${text(name)}", braces(decl.pp));
  
  forwards to maybeDecl(\ env::Decorated Env -> null(lookupTag(name, top.env)), decl);
}
abstract production maybeRefIdDecl
top::Decl ::= name::String decl::Decl
{
  top.pp = cat(pp"maybeRefId (${text(name)}", braces(decl.pp));
  
  forwards to maybeDecl(\ env::Decorated Env -> null(lookupRefId(name, top.env)), decl);
}

-- Injection production for Expr
abstract production injectGlobalDeclsExpr
top::Expr ::= decls::Decls lifted::Expr
{
  propagate host;
  top.errors := decls.errors ++ lifted.errors;
  top.pp = pp"injectGlobalDeclsExpr {${ppImplode(line(), decls.pps)}} (${lifted.pp})";
  
  -- Insert defs from decls at the global scope
  top.defs := globalDefsDef(decls.defs) :: lifted.defs;

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls := decls.globalDecls ++ unfoldDecoratedDecl(decls) ++ lifted.globalDecls;
  top.lifted = lifted.lifted;
  
  -- Define other attributes to be the same as on lifted
  top.typerep = lifted.typerep;
  top.freeVariables = lifted.freeVariables;
  
  decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = nothing();

  lifted.env = addEnv([globalDefsDef(decls.defs)], top.env);
}

-- Same as injectGlobalDeclsExpr, but on Stmt
abstract production injectGlobalDeclsStmt
top::Stmt ::= decls::Decls lifted::Stmt
{
  propagate host;
  top.errors := decls.errors ++ lifted.errors;
  top.pp = pp"injectGlobalDeclsStmt {${ppImplode(line(), decls.pps)}} (${lifted.pp})";
  
  -- Insert defs from decls at the global scope
  top.defs := globalDefsDef(decls.defs) :: lifted.defs;

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls := decls.globalDecls ++ unfoldDecoratedDecl(decls) ++ lifted.globalDecls;
  top.lifted = lifted.lifted;
  
  -- Define other attributes to be the same as on lifted
  top.functiondefs := lifted.functiondefs;
  top.freeVariables = lifted.freeVariables;
  
  decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = nothing();
  
  lifted.env = addEnv([globalDefsDef(decls.defs)], top.env);
}

-- Same as injectGlobalDeclsExpr, but on BaseTypeExpr
abstract production injectGlobalDeclsTypeExpr
top::BaseTypeExpr ::= decls::Decls lifted::BaseTypeExpr
{
  propagate host;
  top.pp = pp"injectGlobalDeclsTypeExpr {${ppImplode(line(), decls.pps)}} (${lifted.pp})";
  top.errors := decls.errors ++ lifted.errors;
  top.typerep = injectGlobalDeclsType(decls, lifted.typerep);
  
  -- Insert defs from decls at the global scope
  top.defs := globalDefsDef(decls.defs) :: lifted.defs;

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls := decls.globalDecls ++ unfoldDecoratedDecl(decls) ++ lifted.globalDecls;
  top.lifted = lifted.lifted;
  
  -- Define other attributes to be the same as on lifted
  top.typeModifiers = lifted.typeModifiers;
  top.freeVariables = lifted.freeVariables;
  
  decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = nothing();

  lifted.env = addEnv([globalDefsDef(decls.defs)], top.env);
}

{--
 - Lifting mechanism for types
 - Since we don't have access to the environment, and Type doesn't occur in the host tree, this just gets
 - turned into injectGlobalDeclsTypeExpr in the host tree
 -}
abstract production injectGlobalDeclsType
top::Type ::= decls::Decls lifted::Type
{
  top.host = injectGlobalDeclsType(decls, lifted.host); -- Can't actually compute host on decls here, TODO...
  top.lpp = pp"injectGlobalDeclsType {${ppImplode(pp"\n", decls.pps)}} (${lifted.lpp}${lifted.rpp})";
  top.rpp = lifted.rpp;
  top.baseTypeExpr = injectGlobalDeclsTypeExpr(decls, lifted.baseTypeExpr);
  top.typeModifierExpr = lifted.typeModifierExpr;
  
  top.integerPromotions = injectGlobalDeclsType(decls, lifted.integerPromotions);
  top.defaultArgumentPromotions = injectGlobalDeclsType(decls, lifted.defaultArgumentPromotions);
  top.defaultLvalueConversion = injectGlobalDeclsType(decls, lifted.defaultLvalueConversion);
  top.defaultFunctionArrayLvalueConversion = injectGlobalDeclsType(decls, lifted.defaultFunctionArrayLvalueConversion);
  top.withoutTypeQualifiers = injectGlobalDeclsType(decls, lifted.withoutTypeQualifiers);
  top.withTypeQualifiers = injectGlobalDeclsType(decls, lifted.withTypeQualifiers);
  lifted.addedTypeQualifiers = top.addedTypeQualifiers;
  
  -- TODO: This really shouldn't be forwarding, hack for now so that pattern matching is the same
  forwards to lifted;
}

{--
 - Inserts globalDecls before h
 -}
aspect production consGlobalDecl
top::GlobalDecls ::= h::Decl  t::GlobalDecls
{
  propagate host;
 
  local newDecls::Decls = foldDecl(map(\ d::Decorated Decl -> d.lifted, h.globalDecls));
  local newDefs::[Def] = foldr(append, [], map((.defs), h.globalDecls));

  top.lifted = consGlobalDecl(decls(newDecls), consGlobalDecl(h.lifted, t.lifted));
  
  t.env = addEnv(newDefs ++ h.defs, top.env);
}

-- Utility functions
function unfoldDecoratedDecl
[Decorated Decl] ::= decl::Decorated Decls
{
  return
    case decl of
      nilDecl() -> []
    | consDecl(d,ds) -> d :: unfoldDecoratedDecl(ds)
    | _ -> error ("Incorrect application of unfoldDecl.")
    end;
}

function globalDeclsDefs
[Def] ::= d::[Decorated Decl]
{
  return [globalDefsDef(foldr(append, [], map((.defs), d)))];
}