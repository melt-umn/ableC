grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

imports core:monad;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode;

imports edu:umn:cs:melt:ableC:abstractsyntax hiding directCallExpr
                                             with unaryOpExpr as unaryOpExprDefault,
                                                  arraySubscriptExpr as arraySubscriptExprDefault,
                                                  callExpr as callExprDefault,
                                                  memberExpr as memberExprDefault,
                                                  binaryOpExpr as binaryOpExprDefault;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;

{- Explaination of overloading
 - All standard unary and binary operators may be overloaded, in addition to function calls, array
 - subscripts, and field access.  
 - ...
 -}

synthesized attribute resolved::Maybe<Expr> occurs on UnaryOp, BinOp, AssignOp, BoolOp, BitOp, CompareOp, NumOp;

function getUnaryOverload
Maybe<Expr> ::= e::Decorated Expr overloads::[Pair<String (Expr ::= Expr)>]
{
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- moduleName(e.env, e.typerep);
      prod :: (Expr ::= Expr) <- lookupBy(stringEq, n, overloads);
      return prod(new(e));
    };
}

function getBinaryOverload
Maybe<Expr> ::=
  l::Decorated Expr r::Decorated Expr
  overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>]
  lOverloads::[Pair<String (Expr ::= Expr Expr)>]
  rOverloads::[Pair<String (Expr ::= Expr Expr)>]
{
  local lModuleName :: Maybe<String> = moduleName(l.env, l.typerep);
  local rModuleName :: Maybe<String> = moduleName(r.env, r.typerep);

  local option1::Maybe<Expr> =
    do (bindMaybe, returnMaybe) {
      n1 :: String <- lModuleName;
      n2 :: String <- rModuleName;
      prod :: (Expr ::= Expr Expr) <- lookupBy(stringPairEq, pair(n1, n2), overloads);
      return prod(new(l), new(r));
    };
  local option2::Maybe<Expr> =
    do (bindMaybe, returnMaybe) {
      n :: String <- lModuleName;
      prod :: (Expr ::= Expr Expr) <- lookupBy(stringEq, n, lOverloads);
      return prod(new(l), new(r));
    };
  local option3::Maybe<Expr> =
    do (bindMaybe, returnMaybe) {
      n :: String <- rModuleName;
      prod :: (Expr ::= Expr Expr) <- lookupBy(stringEq, n, rOverloads);
      return prod(new(l), new(r));
    };
  
  return orElse(option1, orElse(option2, option3));
}

function stringPairEq
Boolean ::= p1::Pair<String String> p2::Pair<String String>
{
  return p1.fst == p2.fst && p1.snd == p2.snd;
}