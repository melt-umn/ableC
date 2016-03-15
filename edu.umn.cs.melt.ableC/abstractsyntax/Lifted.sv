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
  top.pps = h.pp :: t.pps;
  
  local newDecls::Decls =
    getGlobalDecls(
      consDecl(h, nilDecl()),
      top.env, top.isTopLevel, top.returnType);
  newDecls.env = top.env;
  newDecls.isTopLevel = top.isTopLevel;
  newDecls.returnType = top.returnType;
  
  top.lifted = 
    if !null(t.globalDecls)
    then error("consGlobalDecl tail has global decls!")
    else appendDecls(newDecls, t.lifted);
  top.globalDecls := [];
  
  t.env = addEnv(newDecls.defs, top.env); -- Needed for computing lifted on tail
  
  forwards to top.lifted;
}

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
    then getGlobalDecls(
      appendDecls(newDecls.host, ds.lifted),
      env, isTopLevel, returnType)
    else ds;
}