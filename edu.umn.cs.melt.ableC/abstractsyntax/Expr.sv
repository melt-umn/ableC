grammar edu:umn:cs:melt:ableC:abstractsyntax;

nonterminal Expr with location, pp, host<Expr>, lifted<Expr>, globalDecls, errors, defs, env, returnType, freeVariables, typerep, isLValue;

flowtype Expr = decorate {env, returnType};

synthesized attribute integerConstantValue :: Maybe<Integer>;
synthesized attribute isLValue::Boolean;

nonterminal GenericAssocs with pps, host<GenericAssocs>, lifted<GenericAssocs>, errors, globalDecls, defs, env, selectionType, compatibleSelections, returnType, freeVariables;
flowtype GenericAssocs = decorate {env, returnType}, compatibleSelections {decorate, selectionType};

autocopy attribute selectionType :: Type;
synthesized attribute compatibleSelections :: [Decorated Expr];

nonterminal GenericAssoc with location, pp, host<GenericAssoc>, lifted<GenericAssoc>, globalDecls, errors, defs, env, selectionType, compatibleSelections, returnType, freeVariables;
flowtype GenericAssoc = decorate {env, returnType}, compatibleSelections {decorate, selectionType};

