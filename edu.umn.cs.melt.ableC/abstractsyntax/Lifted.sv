grammar edu:umn:cs:melt:ableC:abstractsyntax;

synthesized attribute lifted<a>::a;

-- String is name of decl, could be used to remove duplicates
synthesized attribute globalDecls::[Pair<String Decl>] with ++;

-- TODO: The globalDecls are passed in without the host transformation, host can't be computed on
-- them without decorating first, which isn't possible here.  We then to run the transformation
-- later on in consGlobalDecl.  Figure out a better solution for this?  
abstract production injectGlobalDecls
top::Expr ::= globalDecls::[Pair<String Decl>] lifted::Expr
{
  propagate host;
  --top.pp = pp"injectGlobalDecls {<decls>} (${lifted.pp})";
  
  top.globalDecls <- globalDecls;
  
  -- top.lifted = lifted.lifted
  -- Also global decls appended via collection attribute
  forwards to lifted;
}

-- Inserted globalDecls before h. Should only ever get used by top-level 
-- foldGlobalDecl in concrete syntax.
abstract production consGlobalDecl
top::Decls ::= h::Decl  t::Decls
{
  propagate host;
  
  -- pp is of the original program
  top.pps = h.pp :: t.pps;
  
  -- Using nilDecls() here and appending t to avoid redecorating the entire tree 
  local newDecls::Decls =
    getGlobalDecls(
      consDecl(h, nilDecl()),
      top.env, top.isTopLevel, top.returnType);
  newDecls.env = top.env;
  newDecls.isTopLevel = top.isTopLevel;
  newDecls.returnType = top.returnType;
  
  -- Compute the lifted transformation by appending any new decls to the tail decls
  -- TODO: This could be made more efficent by pattern matching first to see if there actually are
  -- any decls, and do something more efficent than appendDecls
  top.lifted = 
    if !null(t.globalDecls)
    then error("consGlobalDecl tail has global decls!")
    else appendDecls(newDecls, t.lifted);
  top.globalDecls := [];
  
  t.env = addEnv(newDecls.defs, top.env); -- Needed for computing lifted on tail
  
  -- OK to forward, as lifted is semanticly the same as consDecl with inserted global decls
  -- Gets errors, etc off the tree with the env added automaticly
  forwards to top.lifted;
}

-- Compute the global decls as Decls for an input Decls by performing a 'fixed-point' transformation
-- Actually we only make the recursive call on the actual new decls for efficeny reasons
function getGlobalDecls
Decls ::= ds::Decls env::Decorated Env isTopLevel::Boolean returnType::Maybe<Type>
{
  ds.env = env;
  ds.isTopLevel = isTopLevel; -- Should always be true? Is this param needed?  
  ds.returnType = returnType;
  
  local newDecls::Decls = foldDecl(map(snd, ds.globalDecls));
  newDecls.env = env;
  newDecls.isTopLevel = isTopLevel;
  newDecls.returnType = returnType;
  
  return 
    if !null(ds.globalDecls)
    then
      appendDecls(
        -- TODO: We are getting host off newDecls first, even if this is the original ast.  Low
        -- prority, but need a better solution to this
        getGlobalDecls(newDecls.host, env, isTopLevel, returnType),
        ds.lifted)
    else ds;
}