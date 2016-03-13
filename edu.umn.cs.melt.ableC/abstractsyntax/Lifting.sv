grammar edu:umn:cs:melt:ableC:abstractsyntax;

{-
synthesized attribute lifted<a> :: a;
attribute lifted<Decl> occurs on Decl;
attribute lifted<Decls> occurs on Decls;
attribute lifted<Expr> occurs on Expr;
-}


-- `globalDecls` as list `[Pair<String Decl>]`
------------------------------------------------------------
{- 
Expressions that want to specify declartions to lift to a global scope
do so by forwarding to the host production `injectGlobalDecls`.  

After extracting the `host` tree, there are no extension constructs,
but declarations need to be lifted to the proper place. 

A pair of synthesized attributes can be used for this.
- `globalDecls`: the list of declarations to lift up
- `lifted`: the lifted tree.
An invariant here is that all Decl nodes in the `host` tree appear in
either `globalDecls` or in `lifted`.
- On `Decls` nonterminals at the global level,, `globalDecls` is empty
  and all the `Decl` trees to be lifted (were in `globalDecls`) are now
  put into `lifted`.
- On all other nonterminals, `globalDecls` need not be empty.

Another invariant is that declarations in globalDecls declare unique
names.  Thus no fear of name clashes.  This is unrealistic, but we can
address this later.
 -}

{-
aspect production consGlobalDecl
top::Decls ::= h::Decl  t::Decls
{
 -- define pp, env, defs, etc.
 propagate host;

 -- top.globalDecls := [];  -- already in production in Decls.sv
 top.lifted = consGlobalDecl( 
                decls( foldDecl( removeDuplicateGlobalDecls(h.globalDecls) ) ),
                consGlobalDecl(
                  h.lifted,
                  t.lifted)
              );
  -- t.globalDecls is ignored.  The invariant ensures that it is empty.
}


abstract production injectGlobalDecls
top::Expr ::= gdecls::[Pair<String Decl>]  e::Expr
{
 local decls::Decls = foldDecl( map( snd, gdecls) );
 local names::[String] = map(fst, gdecls);

 decls.env = top.env;
 decls.isTopLevel = true;
 decls.returnType = top.returnType;

 e.env = addEnv(decls.defs, top.env);
 top.errors := decls.errors ++ e.errors;

 propagate host;

 -- Note that the invariant over `globalDecls` and `lifted` is maintained.
 top.globalDecls := decls.globalDecls ++ 
                   zipWith( pair, names, unfoldDecl(decls.lifted) ) ++
                   e.globalDecls;
 -- It should hold that names and unfoldDecl(decls.lifted) are the same length and
 -- correctly correspond to one another.
 top.lifted = e.lifted;
}


abstract production sampleInjector
top::Expr ::= e::Expr
{
  top.pp = cat( text("injector"), parens(e.pp) );
  local d::Decl = makeDeclIntInit("foo", "42", e.location);
  forwards to injectGlobalDecls ( [pair("foo", d)], e, location=top.location );
}


-- not used here, call with sofar as [] initially.
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

-}





-- `globalDecls` as tree of type `Decls` --
------------------------------------------------------------
{- 
Expressions that want to specify declartions to lift to a global scope
do so by forwarding to the host production `injectGlobalDecls`.  

After extracting the `host` tree, there are no extension constructs,
but declarations need to be lifted to the proper place. 

A pair of synthesized attributes can be used for this.
- `globalDecls`: the declarations (`Decls`) to lift up
- `lifted`: the lifted tree.

An invariant here is that all Decl nodes in the `host` tree appear in
either `globalDecls` or in `lifted`.
- On `Decls` nonterminals at the global level, `globalDecls` is
  `nilDecl()` and all the `Decl` trees that were to be lifted (were in
  `globalDecls`) are now put into `lifted`.
- On all other nonterminals, `globalDecls` need not be empty.

Another invariant is that declarations in globalDecls declare unique
names.  Thus no fear of name clashes.  This is unrealistic and not
enforced now, but we can ddress this later.
 -}


{-
aspect production consGlobalDecl
top::Decls ::= h::Decl  t::Decls
{
 -- define pp, env, defs, etc.
 propagate host;

 -- top.globalDecls := [];  -- already in production in Decls.sv
 top.lifted = consGlobalDecl( 
                decls( h.globalDecls ),
                consGlobalDecl(
                  h.lifted,
                  t.lifted)
              );
  -- t.globalDecls is ignored.  The invariant ensures that it is empty.
}

abstract production injectGlobalDecls
top::Expr ::= decls::Decls  e::Expr
{
 e.env = addEnv(decls.defs, top.env);
 top.errors := decls.errors ++ e.errors;

 propagate host;

 -- Note that the invariant over `globalDecls` and `lifted` is maintained.
 top.globalDecls := 
   appendDecls( decls.globalDecls,
                appendDecls( decls.lifted,
                             e.globalDecls ) );
 top.lifted = e.lifted;
}

abstract production sampleInjector
top::Expr ::= e::Expr
{
  top.pp = cat( text("injector"), parens(e.pp) );
  local d::Decl = makeDeclIntInit("foo", "42", e.location);
  forwards to injectGlobalDecls ( consDecl(d, nilDecl()), e );
}

-}
