grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

imports core:monad;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode, concat as ppConcat;

imports edu:umn:cs:melt:ableC:abstractsyntax hiding directCallExpr
                                             with unaryOpExpr as unaryOpExprDefault,
                                                  arraySubscriptExpr as arraySubscriptExprDefault,
                                                  callExpr as callExprDefault,
                                                  memberExpr as memberExprDefault,
                                                  dereferenceExpr as dereferenceExprDefault,
                                                  explicitCastExpr as explicitCastExprDefault,
                                                  addExpr as addExprDefault,
                                                  subtractExpr as subtractExprDefault,
                                                  binaryOpExpr as binaryOpExprDefault;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;

imports edu:umn:cs:melt:ableC:abstractsyntax:construction;

imports edu:umn:cs:melt:ableC:abstractsyntax:injectable as inj;

{- Explaination of overloading
 - All standard unary and binary operators may be overloaded, in addition to function calls, array
 - subscripts, and field access.  
 -
 - This method of overloading works by staticly building lists of possible overloads paired with
 - module names via collection production attributes.  Here the module name is a unique string
 - based on the grammar name of the extension, which can be set on a type via GCC's `__attribute__`
 - mechanism.  To avoid undefined behavior (similar to 'orphaned instances' in Haskell), we require
 - all overloaded types to be a 'new' type not compatible with any host types, such as structs,
 - unions, or enums.  
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
 - The extension writer also writes an aspect function for the host dispatch function that they
 - wish to overload, and contribute a pair containing their extension module name and the overload
 - expression to the list of overloads.  
 -
 - Overloadable constructs include all numeric, logical, assignment and comparison operators, array
 - subscript, function call, member access, assignment to array index, and call to a member access.
 -}

synthesized attribute unaryProd::Maybe<(Expr ::= Expr Location)> occurs on UnaryOp;
synthesized attribute binaryProd::Maybe<(Expr ::= Expr Expr Location)>
  occurs on BinOp, AssignOp, BoolOp, BitOp, CompareOp, NumOp;
  
flowtype unaryProd {decorate} on UnaryOp;
flowtype binaryProd {decorate} on BinOp, AssignOp, BoolOp, BitOp, CompareOp, NumOp;

-- Expressions
function getArraySubscriptOverload
Maybe<(Expr ::= Expr Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- moduleName(env, t);
      prod :: (Expr ::= Expr Expr Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getMemberCallOverload
Maybe<(Expr ::= Expr Boolean Name Exprs Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Boolean Name Exprs Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- moduleName(env, t);
      prod :: (Expr ::= Expr Boolean Name Exprs Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getCallOverload
Maybe<(Expr ::= Expr Exprs Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Exprs Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- moduleName(env, t);
      prod :: (Expr ::= Expr Exprs Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getMemberOverload
Maybe<(Expr ::= Expr Boolean Name Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Boolean Name Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- moduleName(env, t);
      prod :: (Expr ::= Expr Boolean Name Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getSubscriptAssignOverload
Maybe<(Expr ::= Expr Expr AssignOp Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Expr AssignOp Expr Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- moduleName(env, t);
      prod :: (Expr ::= Expr Expr AssignOp Expr Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getMemberAssignOverload
Maybe<(Expr ::= Expr Boolean Name AssignOp Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Boolean Name AssignOp Expr Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- moduleName(env, t);
      prod :: (Expr ::= Expr Boolean Name AssignOp Expr Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getDereferenceOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- moduleName(env, t);
      prod :: (Expr ::= Expr Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

-- Unary operators
function getPreIncOpOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverload(t, env, overloads);
}

function getPreDecOpOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverload(t, env, overloads);
}

function getPostIncOpOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverload(t, env, overloads);
}

function getPostDecOpOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverload(t, env, overloads);
}

function getAddressOfOpOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverload(t, env, overloads);
}

function getDereferenceOpOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverload(t, env, overloads);
}

function getPositiveOpOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverload(t, env, overloads);
}

function getNegativeOpOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverload(t, env, overloads);
}

function getBitNegateOpOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverload(t, env, overloads);
}

function getNotOpOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env
{
  production attribute overloads::[Pair<String (Expr ::= Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverload(t, env, overloads);
}

function getAddOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getSubOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

-- Binary operators
function getEqOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getMulEqAssignOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getDivEqOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getModEqOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getAddEqOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getSubEqOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getLshEqOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getRshEqOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getAndEqOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getOrEqOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getXorEqOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getAndBoolOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getOrBoolOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getAndBitOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getOrBitOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getXorBitOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getLshBitOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getRshBitOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getEqualsOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getNotEqualsOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getGtOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getLtOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getGteOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getLteOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getAddOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getSubOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getMulOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getDivOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

function getModOpOverload
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  return getBinaryOverload(l, r, env, overloads, lOverloads, rOverloads);
}

-- Helper functions
function getUnaryOverload
Maybe<(Expr ::= Expr Location)> ::= t::Type env::Decorated Env overloads::[Pair<String (Expr ::= Expr Location)>]
{
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- moduleName(env, t);
      prod :: (Expr ::= Expr Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getBinaryOverload
Maybe<(Expr ::= Expr Expr Location)> ::=
  l::Type r::Type
  env::Decorated Env
  overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>]
  lOverloads::[Pair<String (Expr ::= Expr Expr Location)>]
  rOverloads::[Pair<String (Expr ::= Expr Expr Location)>]
{
  local lModuleName :: Maybe<String> = moduleName(env, l);
  local rModuleName :: Maybe<String> = moduleName(env, r);

  -- Option 1: overload for a left extension type and a right extension type
  local option1::Maybe<(Expr ::= Expr Expr Location)> =
    do (bindMaybe, returnMaybe) {
      n1 :: String <- lModuleName;
      n2 :: String <- rModuleName;
      prod :: (Expr ::= Expr Expr Location) <- lookupBy(stringPairEq, pair(n1, n2), overloads);
      return prod;
    };
  -- Option 2: overload for a left extension type and any type
  local option2::Maybe<(Expr ::= Expr Expr Location)> =
    do (bindMaybe, returnMaybe) {
      n :: String <- lModuleName;
      prod :: (Expr ::= Expr Expr Location) <- lookupBy(stringEq, n, lOverloads);
      return prod;
    };
  -- Option 2: overload for any type and a right extension type
  local option3::Maybe<(Expr ::= Expr Expr Location)> =
    do (bindMaybe, returnMaybe) {
      n :: String <- rModuleName;
      prod :: (Expr ::= Expr Expr Location) <- lookupBy(stringEq, n, rOverloads);
      return prod;
    };
  
  return orElse(option1, orElse(option2, option3));
}

function stringPairEq
Boolean ::= p1::Pair<String String> p2::Pair<String String>
{
  return p1.fst == p2.fst && p1.snd == p2.snd;
}

-- These helper functions apply maybeFn if it is a just() to the arguments, or otherwise return nothing() 
function applyMaybe
Maybe<a> ::= maybeFn::Maybe<(a ::= b)> a::b
{
  return
    case maybeFn of
      just(fn) -> just(fn(a))
    | nothing() -> nothing()
    end;
}

function applyMaybe2
Maybe<a> ::= maybeFn::Maybe<(a ::= b c)> a1::b a2::c
{
  return
    case maybeFn of
      just(fn) -> just(fn(a1, a2))
    | nothing() -> nothing()
    end;
}

function applyMaybe3
Maybe<a> ::= maybeFn::Maybe<(a ::= b c d)> a1::b a2::c a3::d
{
  return
    case maybeFn of
      just(fn) -> just(fn(a1, a2, a3))
    | nothing() -> nothing()
    end;
}

function applyMaybe4
Maybe<a> ::= maybeFn::Maybe<(a ::= b c d e)> a1::b a2::c a3::d a4::e
{
  return
    case maybeFn of
      just(fn) -> just(fn(a1, a2, a3, a4))
    | nothing() -> nothing()
    end;
}

function applyMaybe5
Maybe<a> ::= maybeFn::Maybe<(a ::= b c d e f)> a1::b a2::c a3::d a4::e a5::f
{
  return
    case maybeFn of
      just(fn) -> just(fn(a1, a2, a3, a4, a5))
    | nothing() -> nothing()
    end;
}

function applyMaybe6
Maybe<a> ::= maybeFn::Maybe<(a ::= b c d e f g)> a1::b a2::c a3::d a4::e a5::f a6::g
{
  return
    case maybeFn of
      just(fn) -> just(fn(a1, a2, a3, a4, a5, a6))
    | nothing() -> nothing()
    end;
}
