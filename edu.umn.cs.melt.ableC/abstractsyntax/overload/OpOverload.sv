grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

imports core:monad;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode, concat as ppConcat;

imports edu:umn:cs:melt:ableC:abstractsyntax hiding directCallExpr
                                             with unaryOpExpr as unaryOpExprDefault,
                                                  arraySubscriptExpr as arraySubscriptExprDefault,
                                                  callExpr as callExprDefault,
                                                  memberExpr as memberExprDefault,
                                                  binaryOpExpr as binaryOpExprDefault;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;

{- Explaination of overloading
 - All standard unary and binary operators may be overloaded, in addition to function calls, array
 - subscripts, and field access.  
 -
 - This method of overloading works by staticly building lists of possible overloads paired with
 - module names via collection production attributes on the dispatching productions.  Here the
 - module name is a unique string based on the grammar name of the extension, which can be set on a
 - type via GCC's `__attribute__` mechanism.  To avoid prevent unexpected behavior, we require all
 - overloaded types to be a 'new' type not compatible with any host types, such as structs, unions,
 - or enums.  
 -
 - The module name of an operator argument, if set, can be accessed from its typerep via the
 - moduleName attribute and used to look up the forward for a dispatching production.  For binary
 - operators, we must look at the module names of both the left and right children, and check if
 - there is an overload between those two extension types, an extension type on the left and a host
 - type on the right, or an host type on the left and an extension type on the right.  
 -
 - In order to define an overload, the extension writer must declare a new type with the
 - `module(<name>)` attribute.  For example
 -   struct __attribute__((module("org:ext:foo"))) foo { ... }
 - or
 -   typedef __attribute__((module("org:ext:bar"))) union bar_u bar;
 - The extension writer also writes an aspect production for the host production that they wish to
 - overload, and contribute a pair containing their extension module name and the overload
 - expression to the list of overloads.  
 -
 - Overloadable constructs include all numeric, logical, assignment and comparison operators, array
 - subscript, function call, member access, assignment to array index, and call to a member access.
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