

nonterminal MaybeExpr with pp, isJust, errors, globalDecls, defs, env, maybeTyperep, returnType, justTheExpr;

synthesized attribute maybeTyperep :: Maybe<Type>;
synthesized attribute justTheExpr :: Maybe<Expr>;

abstract production justExpr
top::MaybeExpr ::= e::Expr
{
  top.pp = e.pp;
  top.isJust = true;
  top.justTheExpr = just(e);
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.defs = e.defs;
  top.maybeTyperep = just(e.typerep);
}
abstract production nothingExpr
top::MaybeExpr ::=
{
  top.pp = notext();
  top.isJust = false;
  top.justTheExpr = nothing();
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.maybeTyperep = nothing();
}


synthesized attribute pps :: [Document];

nonterminal Exprs with pps, errors, globalDecls, defs, env, expectedTypes, argumentPosition, callExpr, argumentErrors, count, callVariadic, returnType;

inherited attribute expectedTypes :: [Type];
{-- Initially 1. -}
inherited attribute argumentPosition :: Integer;
autocopy attribute callExpr :: Decorated Expr;
autocopy attribute callVariadic :: Boolean;
synthesized attribute argumentErrors :: [Message];

synthesized attribute count :: Integer;

abstract production consExpr
top::Exprs ::= h::Expr  t::Exprs
{
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.defs = h.defs ++ t.defs;
  top.count = 1 + t.count;
  
  top.argumentErrors =
    if null(top.expectedTypes) then
      if top.callVariadic then []
      else
        [err(top.callExpr.location, "call expected " ++ toString(top.argumentPosition) ++ " arguments, got " ++ toString(top.argumentPosition + t.count - 1))]
    else
      if !typeAssignableTo(head(top.expectedTypes).withoutTypeQualifiers, h.typerep) then
        [err(h.location, "argument " ++ toString(top.argumentPosition) ++ " expected type " ++ showType(head(top.expectedTypes)) ++ " (got " ++ showType(h.typerep) ++ ")")] ++ t.argumentErrors
      else
        t.argumentErrors;
  t.expectedTypes = tail(top.expectedTypes);
  t.argumentPosition = top.argumentPosition + 1;
  
  t.env = addEnv(h.defs, h.env);
}
abstract production nilExpr
top::Exprs ::=
{
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.count = 0;
  
  top.argumentErrors =
    if null(top.expectedTypes) then []
    else
      [err(top.callExpr.location, "call expected " ++ toString(top.argumentPosition + length(top.expectedTypes)) ++ " arguments, got only " ++ toString(top.argumentPosition))];
}

nonterminal ExprOrTypeName with pp, errors, globalDecls, defs, env, typerep, returnType;

abstract production exprExpr
top::ExprOrTypeName ::= e::Expr
{
  top.pp = e.pp;
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.defs = e.defs;
  top.typerep = e.typerep;
}
abstract production typeNameExpr
top::ExprOrTypeName ::= ty::TypeName
{
  top.pp = ty.pp;
  top.errors := ty.errors;
  top.globalDecls := ty.globalDecls;
  top.defs = ty.defs;
  top.typerep = ty.typerep;
}


