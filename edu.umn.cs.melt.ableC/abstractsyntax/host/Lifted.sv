grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

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
  top.pp = cat(pp"maybeValue (${text(name)}) ", braces(decl.pp));
  
  forwards to maybeDecl(\ env::Decorated Env -> null(lookupValue(name, top.env)), decl);
}
abstract production maybeTagDecl
top::Decl ::= name::String decl::Decl
{
  top.pp = cat(pp"maybeTag (${text(name)}) ", braces(decl.pp));
  
  forwards to maybeDecl(\ env::Decorated Env -> null(lookupTag(name, top.env)), decl);
}
abstract production maybeRefIdDecl
top::Decl ::= name::String decl::Decl
{
  top.pp = cat(pp"maybeRefId (${text(name)}) ", braces(decl.pp));
  
  forwards to maybeDecl(\ env::Decorated Env -> null(lookupRefId(name, top.env)), decl);
}

-- Injection production for Expr
abstract production injectGlobalDeclsExpr
top::Expr ::= decls::Decls lifted::Expr
{
  propagate host;
  top.errors := decls.errors ++ lifted.errors;
  top.pp = pp"injectGlobalDeclsExpr ${braces(nestlines(2, ppImplode(line(), decls.pps)))} (${lifted.pp})";
  
  -- Insert defs from decls at the global scope
  top.defs := globalDefsDef(decls.defs) :: lifted.defs;

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls := decls.unfoldedGlobalDecls ++ lifted.globalDecls;
  top.lifted = lifted.lifted;
  
  -- Define other attributes to be the same as on lifted
  top.typerep = lifted.typerep;
  top.freeVariables = lifted.freeVariables;

  decls.env = globalEnv(top.env);
  decls.isTopLevel = true;
  decls.returnType = nothing();

  lifted.env = addEnv([globalDefsDef(decls.defs)], top.env);

  top.isLValue = false;
}

-- Same as injectGlobalDeclsExpr, but on Stmt
abstract production injectGlobalDeclsStmt
top::Stmt ::= decls::Decls lifted::Stmt
{
  propagate host;
  top.errors := decls.errors ++ lifted.errors;
  top.pp = pp"injectGlobalDeclsStmt ${braces(nestlines(2, ppImplode(line(), decls.pps)))} (${lifted.pp})";
  
  -- Insert defs from decls at the global scope
  top.defs := globalDefsDef(decls.defs) :: lifted.defs;

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls := decls.unfoldedGlobalDecls ++ lifted.globalDecls;
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
  top.pp = pp"injectGlobalDeclsTypeExpr ${braces(nestlines(2, ppImplode(line(), decls.pps)))} (${lifted.pp})";
  top.errors := decls.errors ++ lifted.errors;
  top.typerep = lifted.typerep;
  
  -- Insert defs from decls at the global scope
  top.defs := globalDefsDef(decls.defs) :: lifted.defs;

  -- Note that the invariant over `globalDecls` and `lifted` is maintained.
  top.globalDecls := decls.unfoldedGlobalDecls ++ lifted.globalDecls;
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
 - Inserts globalDecls before h
 -}
aspect production consGlobalDecl
top::GlobalDecls ::= h::Decl  t::GlobalDecls
{
  propagate host;
  
  local newDecls::Decls = foldDecl(map(\ d::Decorated Decl -> d.lifted, h.globalDecls));
  top.lifted = consGlobalDecl(decls(newDecls), consGlobalDecl(h.lifted, t.lifted));
}

-- Utility functions
function globalDeclsDefs
[Def] ::= d::[Decorated Decl]
{
  return [globalDefsDef(foldr(append, [], map((.defs), d)))];
}
