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
 - Some extensions may want to use the same global decl with the same name in
 - multiple places.  To avoid inserting the decl more than once, the new decl
 - must check that it has not already been defined before forwarding to
 - something that defines the 'missing' item.  To assist with this, an
 - extension may use the production 'maybeDecl', which takes a function to look
 - at the env and return true or false, determining whether the given decl is
 - to be kept.  
 - To allow this to work, the new decl must be present in the entire rest of
 - the env, even after a scope is closed.  This is implemented by inserting the
 - defs from the list of globalDecls being passed up the tree in the defs for
 - the production defining the enclosing scope.  
 - 
 - TODO:
 - Decorate lifted decls with global env instead of current env
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

abstract production injectGlobalDeclsExpr
top::Expr ::= decls::Decls lifted::Expr
{
  propagate host;
  top.errors := decls.errors ++ lifted.errors;
  top.pp = pp"injectGlobalDeclsExpr {${ppImplode(line(), decls.pps)}} (${lifted.pp})";
  
  -- defs include things that were lifted, so things in the same scope don't need to be lifted twice
  top.defs := decls.defs ++ lifted.defs;

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls := decls.globalDecls ++ unfoldDecoratedDecl(decls) ++ lifted.globalDecls;
  top.lifted = lifted.lifted;
  
  -- Define other attributes to be the same as on lifted
  top.typerep = lifted.typerep;
  top.freeVariables = lifted.freeVariables;
  
  --decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = nothing();
  
  -- TODO(?): We are adding the new env elements to the current scope, when they should really be global
  -- Shouldn't be a problem unless there are name conflicts, doing this the 'right' way would be much
  -- less efficent. 
  lifted.env = addEnv(decls.defs, top.env);
}

-- Same as injectGlobalDeclsExpr, but on Stmt
abstract production injectGlobalDeclsStmt
top::Stmt ::= decls::Decls lifted::Stmt
{
  propagate host;
  top.errors := decls.errors ++ lifted.errors;
  top.pp = pp"injectGlobalDeclsStmt {${ppImplode(line(), decls.pps)}} (${lifted.pp})";
  
  -- defs include things that were lifted, so things in the same scope don't need to be lifted twice
  top.defs := decls.defs ++ lifted.defs;

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls := decls.globalDecls ++ unfoldDecoratedDecl(decls) ++ lifted.globalDecls;
  top.lifted = lifted.lifted;
  
  -- Define other attributes to be the same as on lifted
  top.functiondefs := lifted.functiondefs;
  top.freeVariables = lifted.freeVariables;
  
  --decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = nothing();
  
  -- TODO(?): We are adding the new env elements to the current scope, when they should really be global
  -- Shouldn't be a problem unless there are name conflicts, doing this the 'right' way would be much
  -- less efficent. 
  lifted.env = addEnv(decls.defs, top.env);
}

-- Same as injectGlobalDeclsExpr, but on BaseTypeExpr
abstract production injectGlobalDeclsTypeExpr
top::BaseTypeExpr ::= decls::Decls lifted::BaseTypeExpr
{
  propagate host;
  top.pp = pp"injectGlobalDeclsTypeExpr {${ppImplode(line(), decls.pps)}} (${lifted.pp})";
  top.errors := decls.errors ++ lifted.errors;
  top.typerep = injectGlobalDeclsType(decls, lifted.typerep);
  
  -- defs include things that were lifted, so things in the same scope don't need to be lifted twice
  top.defs := decls.defs ++ lifted.defs;

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls := decls.globalDecls ++ unfoldDecoratedDecl(decls) ++ lifted.globalDecls;
  top.lifted = lifted.lifted;
  
  -- Define other attributes to be the same as on lifted
  top.typeModifiers = lifted.typeModifiers;
  top.freeVariables = lifted.freeVariables;
  
  --decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = nothing();
  
  -- TODO(?): We are adding the new env elements to the current scope, when they should really be global
  -- Shouldn't be a problem unless there are name conflicts, doing this the 'right' way would be much
  -- less efficent. 
  lifted.env = addEnv(decls.defs, top.env);
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

-- Aspects to add globalDecls defs to enclosing scope defs
aspect production functionDecl
top::FunctionDecl ::= storage::[StorageClass]  fnquals::[SpecialSpecifier]  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::[Attribute]  decls::Decls  body::Stmt
{
  top.defs <- foldr(append, [], map((.defs), mty.globalDecls));
  top.defs <- foldr(append, [], map((.defs), decls.globalDecls));
  top.defs <- foldr(append, [], map((.defs), body.globalDecls));
}
{-
aspect production nestedFunctionDecl
top::FunctionDecl ::= storage::[StorageClass]  fnquals::[SpecialSpecifier]  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::[Attribute]  decls::Decls  body::Stmt
{
  top.defs <- foldr(append, [], map((.defs), mty.globalDecls));
  top.defs <- foldr(append, [], map((.defs), decls.globalDecls));
  top.defs <- foldr(append, [], map((.defs), body.globalDecls));
}-}

aspect production compoundStmt
top::Stmt ::= s::Stmt
{
  top.defs <- foldr(append, [], map((.defs), s.globalDecls));
}

aspect production ifStmt
top::Stmt ::= c::Expr  t::Stmt  e::Stmt
{
  top.defs <- foldr(append, [], map((.defs), c.globalDecls));
  top.defs <- foldr(append, [], map((.defs), t.globalDecls));
  top.defs <- foldr(append, [], map((.defs), e.globalDecls));
}

aspect production whileStmt
top::Stmt ::= e::Expr  b::Stmt
{
  top.defs <- foldr(append, [], map((.defs), e.globalDecls));
  top.defs <- foldr(append, [], map((.defs), b.globalDecls));
}

aspect production doStmt
top::Stmt ::= b::Stmt  e::Expr
{
  top.defs <- foldr(append, [], map((.defs), b.globalDecls));
  top.defs <- foldr(append, [], map((.defs), e.globalDecls));
}

aspect production forStmt
top::Stmt ::= i::MaybeExpr  c::MaybeExpr  s::MaybeExpr  b::Stmt
{
  top.defs <- foldr(append, [], map((.defs), i.globalDecls));
  top.defs <- foldr(append, [], map((.defs), c.globalDecls));
  top.defs <- foldr(append, [], map((.defs), s.globalDecls));
  top.defs <- foldr(append, [], map((.defs), b.globalDecls));
}

aspect production forDeclStmt
top::Stmt ::= i::Decl  c::MaybeExpr  s::MaybeExpr  b::Stmt
{
  top.defs <- foldr(append, [], map((.defs), i.globalDecls));
  top.defs <- foldr(append, [], map((.defs), c.globalDecls));
  top.defs <- foldr(append, [], map((.defs), s.globalDecls));
  top.defs <- foldr(append, [], map((.defs), b.globalDecls));
}

aspect production switchStmt
top::Stmt ::= e::Expr  b::Stmt
{
  top.defs <- foldr(append, [], map((.defs), e.globalDecls));
  top.defs <- foldr(append, [], map((.defs), b.globalDecls));
}

aspect production stmtExpr
top::Expr ::= body::Stmt result::Expr
{
  top.defs <- foldr(append, [], map((.defs), body.globalDecls));
  top.defs <- foldr(append, [], map((.defs), result.globalDecls));
}

function unfoldDecoratedDecl
[Decorated Decl] ::= decl::Decorated Decls
{
  return case decl of
           nilDecl() -> []
         | consDecl(d,ds) -> d :: unfoldDecoratedDecl(ds)
         | _ -> error ("Incorrect application of unfoldDecl.")
         end;
}