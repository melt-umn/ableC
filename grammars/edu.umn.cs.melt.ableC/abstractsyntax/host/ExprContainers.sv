grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

tracked nonterminal MaybeExpr with pp, host, isJust, errors, globalDecls, functionDecls,
  defs, env, maybeTyperep, freeVariables, justTheExpr, isLValue,
  integerConstantValue, controlStmtContext;

flowtype MaybeExpr = decorate {env, controlStmtContext},
  isJust {}, justTheExpr {}, maybeTyperep {decorate}, integerConstantValue {decorate};

synthesized attribute maybeTyperep :: Maybe<Type>;
synthesized attribute justTheExpr :: Maybe<Expr>;

propagate host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext on MaybeExpr;

abstract production justExpr
top::MaybeExpr ::= e::Expr
{
  propagate env;
  top.pp = e.pp;
  top.isJust = true;
  top.justTheExpr = just(e);
  top.maybeTyperep = just(e.typerep);
  top.isLValue = e.isLValue;
  top.integerConstantValue = e.integerConstantValue;
}
abstract production nothingExpr
top::MaybeExpr ::=
{
  top.pp = notext();
  top.isJust = false;
  top.justTheExpr = nothing();
  top.maybeTyperep = nothing();
  top.isLValue = false;
  implicit top.integerConstantValue = ;
}

tracked nonterminal Exprs with pps, host, errors, globalDecls, functionDecls, defs, env,
  expectedTypes, argumentPosition, callExpr, argumentErrors, typereps, count,
  callVariadic, freeVariables, appendedExprs, appendedRes, isLValue,
  controlStmtContext;

flowtype Exprs = decorate {env, controlStmtContext},
  argumentErrors {decorate, expectedTypes, argumentPosition, callExpr, callVariadic},
  count {}, appendedRes {appendedExprs};

{-- Initially 1. -}
inherited attribute argumentPosition :: Integer;
inherited attribute callExpr :: Decorated Expr;
inherited attribute callVariadic :: Boolean;
synthesized attribute argumentErrors :: [Message];

synthesized attribute count :: Integer;

inherited attribute appendedExprs :: Exprs;
synthesized attribute appendedRes :: Exprs;

propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext on Exprs;

abstract production consExpr
top::Exprs ::= h::Expr  t::Exprs
{
  propagate callExpr, callVariadic;

  top.pps = h.pp :: t.pps;
  top.freeVariables := h.freeVariables ++ removeDefsFromNames(h.defs, t.freeVariables);
  top.typereps = h.typerep :: t.typereps;
  top.count = 1 + t.count;
  top.appendedRes = consExpr(h, t.appendedRes);
  top.isLValue = t.isLValue;

  top.argumentErrors =
   if null(top.expectedTypes) then
      if top.callVariadic then []
      else
        [errFromOrigin(top.callExpr, s"call expected ${toString(top.argumentPosition - 1)} arguments, got ${toString(top.argumentPosition + t.count)}")]
    else
     (if !typeAssignableTo(head(top.expectedTypes).defaultFunctionArrayLvalueConversion, h.typerep) then
        [errFromOrigin(h, s"argument ${toString(top.argumentPosition)} expected type ${showType(head(top.expectedTypes))} (got ${showType(h.typerep)})")] ++ t.argumentErrors
      else
        t.argumentErrors) ++
      case head(top.expectedTypes), h.typerep of
      | arrayType(_, _, staticArraySize(), constantArrayType(s1)), arrayType(_, _, _, constantArrayType(s2)) when s1 > s2 ->
        [wrnFromOrigin(h, s"array argument is too small; contains ${toString(s2)} elements, callee requires at least ${toString(s1)}")]
      | _, _ -> []
      end;
  t.expectedTypes = tail(top.expectedTypes);
  t.argumentPosition = top.argumentPosition + 1;
  t.appendedExprs = top.appendedExprs;

  t.env = addEnv(h.defs, h.env);
  h.env = top.env;
}
abstract production nilExpr
top::Exprs ::=
{
  top.pps = [];
  top.freeVariables := [];
  top.typereps = [];
  top.count = 0;
  top.appendedRes = top.appendedExprs;
  top.isLValue = false;

  top.argumentErrors =
    if null(top.expectedTypes) then []
    else
      [errFromOrigin(top.callExpr, s"call expected ${toString(top.argumentPosition + length(top.expectedTypes) - 1)} arguments, got only ${toString(top.argumentPosition - 1)}")];
}
{--
 - The purpose of this production is for an extension production to use to wrap
 - children that have already been decorated during error checking, etc. when
 - computing a forward tree, to avoid re-decoration and potential exponential
 - performance hits.  When using this production, one must be very careful to
 - ensure that the inherited attributes recieved by the wrapped tree are equivalent
 - to the ones that would have been passed down in the forward tree.
 - See https://github.com/melt-umn/silver/issues/86
 -}
abstract production decExprs
top::Exprs ::= e::Decorated Exprs
{
  propagate env;
  top.pps = e.pps;
  top.host = e.host;
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.functionDecls := e.functionDecls;
  top.defs := e.defs;
  top.freeVariables := e.freeVariables;
  top.typereps = e.typereps;
  top.count = e.count;
  top.isLValue = e.isLValue;
  forwards to new(e); -- appendedRes, argumentErrors require more than the reference set
}

function appendExprs
Exprs ::= e1::Exprs e2::Exprs
{
  propagate env;
  e1.appendedExprs = e2;
  return e1.appendedRes;
}

tracked nonterminal ExprOrTypeName with pp, host, errors, globalDecls, functionDecls,
  defs, env, typerep, freeVariables, isLValue, controlStmtContext;

flowtype ExprOrTypeName = decorate {env, controlStmtContext};

propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext on ExprOrTypeName;

abstract production exprExpr
top::ExprOrTypeName ::= e::Expr
{
  top.pp = e.pp;
  top.typerep = e.typerep;
  top.isLValue = e.isLValue;
}
abstract production typeNameExpr
top::ExprOrTypeName ::= ty::TypeName
{
  top.pp = ty.pp;
  top.typerep = ty.typerep;
  top.isLValue = false;
}


