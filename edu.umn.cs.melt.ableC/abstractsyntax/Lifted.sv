grammar edu:umn:cs:melt:ableC:abstractsyntax;

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
- On `Decls` nonterminals at the global level, `globalDecls` is empty
  and all the `Decl` trees to be lifted (were in `globalDecls`) are now
  put into `lifted`.
- On all other nonterminals, `globalDecls` need not be empty.

Another invariant is that declarations in globalDecls declare unique
names.  Thus no fear of name clashes.  This is unrealistic, but we can
address this later.
-}

synthesized attribute lifted<a>::a;

-- String is name of decl, could be used to remove duplicates
synthesized attribute globalDecls::[Pair<String Decl>] with ++;

abstract production injectGlobalDecls
top::Expr ::= globalDecls::[Pair<String Decl>] lifted::Expr
{
 top.pp = pp"injectGlobalDecls {${text(implode(", ", names))}} (${lifted.pp})";
 top.host = injectGlobalDecls(zipWith(pair, names, unfoldDecl(decls.host)), lifted.host, location=top.location);
 
 local decls::Decls = foldDecl(map(snd, globalDecls));
 local names::[String] = map(fst, globalDecls);

 decls.env = globalEnv(top.env);
 decls.isTopLevel = true;
 decls.returnType = top.returnType;

 top.errors := decls.errors;

 -- Note that the invariant over `globalDecls` and `lifted` is maintained.
 top.globalDecls :=
   decls.globalDecls ++ 
   zipWith(pair, names, unfoldDecl(decls.lifted)) ++
   lifted.globalDecls;
 -- It should hold that names and unfoldDecl(decls.lifted) are the same length and
 -- correctly correspond to one another.
 top.lifted = lifted.lifted;
 
 lifted.env = addEnv(decls.defs, top.env);
 
 -- TODO: We are adding the new env elements to the current scope, when they should really be global
 -- Shouldn't be a problem unless there are name conflicts, doing this the right way would be less
 -- efficent.  
 forwards to lifted
 with {env = lifted.env;};
}

-- Inserted globalDecls before h. Should only ever get used by top-level 
-- foldGlobalDecl in concrete syntax.
abstract production consGlobalDecl
top::Decls ::= h::Decl  t::Decls
{
 propagate host;
 
 local newDecls::Decls =
   foldDecl(map(snd, removeDuplicateGlobalDeclPairs(h.globalDecls, [])));

 top.globalDecls := [];
 top.lifted =
   if !null(t.globalDecls)
   then error("consGlobalDecl tail has global decls!")
   else consDecl( 
          decls(newDecls),
          consDecl(
            h.lifted,
            t.lifted));
  
  t.env = addEnv(h.defs, top.env);
  
  -- define pp, env, defs, etc.
  forwards to consDecl(h, t);
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