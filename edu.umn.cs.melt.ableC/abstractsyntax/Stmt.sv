grammar edu:umn:cs:melt:ableC:abstractsyntax;

nonterminal Stmt with pp, host<Stmt>, lifted<Stmt>, errors, globalDecls, defs, env, functiondefs, returnType, freeVariables;
flowtype Stmt = decorate {env, returnType}, functiondefs {env, returnType};

autocopy attribute returnType :: Maybe<Type>;

