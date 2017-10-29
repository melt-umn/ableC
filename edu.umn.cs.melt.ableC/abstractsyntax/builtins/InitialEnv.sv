grammar edu:umn:cs:melt:ableC:abstractsyntax:builtins;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;

-- The environment used at the top-level.
global initialEnv :: Decorated Env =
  openEnvScope(
    addEnv(getInitialEnvDefs(),
      emptyEnv()));


-- Contributed to from other files in this grammar.
-- Extensions should *probably* not use... need to come up with a set of good rules first.
function getInitialEnvDefs
[Def] ::=
{
  production attribute d :: [Def] with ++;
  d := [];
  
  return d;
}

