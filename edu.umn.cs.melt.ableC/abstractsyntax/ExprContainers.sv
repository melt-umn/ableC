

nonterminal MaybeExpr with pp, host<MaybeExpr>, lifted<MaybeExpr>, isJust, errors, globalDecls, defs, env, maybeTyperep, returnType, freeVariables, justTheExpr, isLValue;

flowtype MaybeExpr = decorate {env, returnType}, isJust {}, justTheExpr {}, maybeTyperep {decorate};

synthesized attribute maybeTyperep :: Maybe<Type>;
synthesized attribute justTheExpr :: Maybe<Expr>;


synthesized attribute pps :: [Document];


nonterminal Exprs with pps, host<Exprs>, lifted<Exprs>, errors, globalDecls, defs, env, expectedTypes, argumentPosition, callExpr, argumentErrors, typereps, count, callVariadic, returnType, freeVariables, appendedExprs, appendedRes, isLValue;

flowtype Exprs = decorate {env, returnType}, argumentErrors {decorate, expectedTypes, argumentPosition, callExpr, callVariadic}, count {}, appendedRes {appendedExprs};

inherited attribute expectedTypes :: [Type];
{-- Initially 1. -}
inherited attribute argumentPosition :: Integer;
autocopy attribute callExpr :: Decorated Expr;
autocopy attribute callVariadic :: Boolean;
synthesized attribute argumentErrors :: [Message];

synthesized attribute count :: Integer;

inherited attribute appendedExprs :: Exprs;
synthesized attribute appendedRes :: Exprs;

nonterminal ExprOrTypeName with pp, host<ExprOrTypeName>, lifted<ExprOrTypeName>, errors, globalDecls, defs, env, typerep, returnType, freeVariables, isLValue;

flowtype ExprOrTypeName = decorate {env, returnType};

