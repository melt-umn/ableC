
nonterminal MaybeInitializer with pp, host<MaybeInitializer>, lifted<MaybeInitializer>, errors, globalDecls, defs, env, freeVariables, returnType;
flowtype MaybeInitializer = decorate {env, returnType};

nonterminal Initializer with pp, host<Initializer>, lifted<Initializer>, errors, globalDecls, defs, env, freeVariables, returnType;
flowtype Initializer = decorate {env, returnType};

nonterminal InitList with pps, host<InitList>, lifted<InitList>, errors, globalDecls, defs, env, freeVariables, returnType;
flowtype InitList = decorate {env, returnType};

nonterminal Init with pp, host<Init>, lifted<Init>, errors, globalDecls, defs, env, freeVariables, returnType;
flowtype Init = decorate {env, returnType};

{--
 - Tree access pattern for designators.
 - e.g.  "[1].d[0] = e" gives "array(0, field(d, array(1, initial)))"
 -}
nonterminal Designator with pp, host<Designator>, lifted<Designator>, errors, globalDecls, defs, env, freeVariables, returnType;
flowtype Designator = decorate {env, returnType};

