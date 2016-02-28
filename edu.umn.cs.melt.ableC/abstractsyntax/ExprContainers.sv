

nonterminal MaybeExpr with pp, host<MaybeExpr>, isJust, errors, globalDecls, defs, env, maybeTyperep, returnType, freeVariables, justTheExpr;

synthesized attribute maybeTyperep :: Maybe<Type>;
synthesized attribute justTheExpr :: Maybe<Expr>;

abstract production justExpr
top::MaybeExpr ::= e::Expr
{
  propagate host;
  top.pp = e.pp;
  top.isJust = true;
  top.justTheExpr = just(e);
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.defs = e.defs;
  top.freeVariables = e.freeVariables;
  top.maybeTyperep = just(e.typerep);
}
abstract production nothingExpr
top::MaybeExpr ::=
{
  propagate host;
  top.pp = notext();
  top.isJust = false;
  top.justTheExpr = nothing();
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
  top.maybeTyperep = nothing();
}


synthesized attribute pps :: [Document];

nonterminal Exprs with pps, host<Exprs>, errors, globalDecls, defs, env, expectedTypes, argumentPosition, callExpr, argumentErrors, typereps, count, callVariadic, returnType, freeVariables, appendedExprs, appendedRes;

inherited attribute expectedTypes :: [Type];
{-- Initially 1. -}
inherited attribute argumentPosition :: Integer;
autocopy attribute callExpr :: Decorated Expr;
autocopy attribute callVariadic :: Boolean;
synthesized attribute argumentErrors :: [Message];

synthesized attribute count :: Integer;

inherited attribute appendedExprs :: Exprs;
synthesized attribute appendedRes :: Exprs;

abstract production consExpr
top::Exprs ::= h::Expr  t::Exprs
{
  propagate host;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.defs = h.defs ++ t.defs;
  top.freeVariables = h.freeVariables ++ removeDefsFromNames(h.defs, t.freeVariables);
  top.typereps = h.typerep :: t.typereps;
  top.count = 1 + t.count;
  top.appendedRes = consExpr(h, t.appendedRes);
  
  top.argumentErrors =
    if null(top.expectedTypes) then
      if top.callVariadic then []
      else
        [err(top.callExpr.location, s"call expected ${toString(top.argumentPosition)} arguments, got ${toString(top.argumentPosition + t.count - 1)}")]
    else
      if !typeAssignableTo(head(top.expectedTypes).withoutTypeQualifiers, h.typerep) then
        [err(h.location, s"argument ${toString(top.argumentPosition)} expected type ${showType(head(top.expectedTypes))} (got ${showType(h.typerep)})")] ++ t.argumentErrors
      else
        t.argumentErrors;
  t.expectedTypes = tail(top.expectedTypes);
  t.argumentPosition = top.argumentPosition + 1;
  t.appendedExprs = top.appendedExprs;
  
  t.env = addEnv(h.defs, h.env);
}
abstract production nilExpr
top::Exprs ::=
{
  propagate host;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
  top.typereps = [];
  top.count = 0;
  top.appendedRes = top.appendedExprs;
  
  top.argumentErrors =
    if null(top.expectedTypes) then []
    else
      [err(top.callExpr.location, s"call expected ${toString(top.argumentPosition + length(top.expectedTypes))} arguments, got only ${toString(top.argumentPosition)}")];
}

function appendExprs
Exprs ::= e1::Exprs e2::Exprs
{
  e1.appendedExprs = e2;
  return e1.appendedRes;
}

nonterminal ExprOrTypeName with pp, host<ExprOrTypeName>, errors, globalDecls, defs, env, typerep, returnType, freeVariables;

abstract production exprExpr
top::ExprOrTypeName ::= e::Expr
{
  propagate host;
  top.pp = e.pp;
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.defs = e.defs;
  top.freeVariables = e.freeVariables;
  top.typerep = e.typerep;
}
abstract production typeNameExpr
top::ExprOrTypeName ::= ty::TypeName
{
  propagate host;
  top.pp = ty.pp;
  top.errors := ty.errors;
  top.globalDecls := ty.globalDecls;
  top.defs = ty.defs;
  top.freeVariables = ty.freeVariables;
  top.typerep = ty.typerep;
}


