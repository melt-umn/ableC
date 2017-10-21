grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

imports core:monad;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode, concat as ppConcat;

imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;

imports edu:umn:cs:melt:ableC:abstractsyntax:host as host;
imports edu:umn:cs:melt:ableC:abstractsyntax:injectable as inj;

-- TODO: This explanation is probably out of date
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
 - host:moduleName attribute and used to look up the forward for a dispatching production.  For binary
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

synthesized attribute unaryProd::Maybe<(host:Expr ::= host:Expr Location)> occurs on host:UnaryOp;
  
flowtype unaryProd {decorate} on host:UnaryOp;

-- host:Expressions
function getArraySubscriptOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- host:moduleName(env, t);
      prod :: (host:Expr ::= host:Expr host:Expr Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getMemberCallOverloadProd
Maybe<(host:Expr ::= host:Expr Boolean host:Name host:Exprs Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Boolean host:Name host:Exprs Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- host:moduleName(env, t);
      prod :: (host:Expr ::= host:Expr Boolean host:Name host:Exprs Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getCallOverloadProd
Maybe<(host:Expr ::= host:Expr host:Exprs Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr host:Exprs Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- host:moduleName(env, t);
      prod :: (host:Expr ::= host:Expr host:Exprs Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getMemberOverloadProd
Maybe<(host:Expr ::= host:Expr Boolean host:Name Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Boolean host:Name Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- host:moduleName(env, t);
      prod :: (host:Expr ::= host:Expr Boolean host:Name Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getSubscriptAssignOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr (host:Expr ::= host:Expr host:Expr Location) host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr host:Expr (host:Expr ::= host:Expr host:Expr Location) host:Expr Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- host:moduleName(env, t);
      prod :: (host:Expr ::= host:Expr host:Expr (host:Expr ::= host:Expr host:Expr Location) host:Expr Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getMemberAssignOverloadProd
Maybe<(host:Expr ::= host:Expr Boolean host:Name (host:Expr ::= host:Expr host:Expr Location) host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Boolean host:Name (host:Expr ::= host:Expr host:Expr Location) host:Expr Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- host:moduleName(env, t);
      prod :: (host:Expr ::= host:Expr Boolean host:Name (host:Expr ::= host:Expr host:Expr Location) host:Expr Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getDereferenceOverloadProd
Maybe<(host:Expr ::= host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Location)>] with ++;
  overloads := [];
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- host:moduleName(env, t);
      prod :: (host:Expr ::= host:Expr Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

-- Unary operators
function getPreIncOpOverloadProd
Maybe<(host:Expr ::= host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverloadProd(t, env, overloads);
}

function getPreDecOpOverloadProd
Maybe<(host:Expr ::= host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverloadProd(t, env, overloads);
}

function getPostIncOpOverloadProd
Maybe<(host:Expr ::= host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverloadProd(t, env, overloads);
}

function getPostDecOpOverloadProd
Maybe<(host:Expr ::= host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverloadProd(t, env, overloads);
}

function getAddressOfOpOverloadProd
Maybe<(host:Expr ::= host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverloadProd(t, env, overloads);
}

function getDereferenceOpOverloadProd
Maybe<(host:Expr ::= host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverloadProd(t, env, overloads);
}

function getPositiveOpOverloadProd
Maybe<(host:Expr ::= host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverloadProd(t, env, overloads);
}

function getNegativeOpOverloadProd
Maybe<(host:Expr ::= host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverloadProd(t, env, overloads);
}

function getBitNegateOpOverloadProd
Maybe<(host:Expr ::= host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverloadProd(t, env, overloads);
}

function getNotOpOverloadProd
Maybe<(host:Expr ::= host:Expr Location)> ::= t::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<String (host:Expr ::= host:Expr Location)>] with ++;
  overloads := [];
  return getUnaryOverloadProd(t, env, overloads);
}

-- Binary operators
function getEqOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getMulEqOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getDivEqOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getModEqOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getAddEqOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getSubEqOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getLshEqOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getRshEqOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getAndEqOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getXorEqOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getOrEqOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getAndOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getOrOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getAndBitOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getOrBitOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getXorOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getLshOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getRshOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getEqualsOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getNotEqualsOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getLtOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getGtOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getLteOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getGteOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getAddOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getSubOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getMulOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getDivOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

function getModOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= l::host:Type r::host:Type env::Decorated Env
{
  production attribute overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];

  return getBinaryOverloadProd(l, r, env, overloads, lOverloads, rOverloads);
}

-- Helper functions
function getUnaryOverloadProd
Maybe<(host:Expr ::= host:Expr Location)> ::= t::host:Type env::Decorated Env overloads::[Pair<String (host:Expr ::= host:Expr Location)>]
{
  return
    do (bindMaybe, returnMaybe) {
      n :: String <- host:moduleName(env, t);
      prod :: (host:Expr ::= host:Expr Location) <- lookupBy(stringEq, n, overloads);
      return prod;
    };
}

function getBinaryOverloadProd
Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::=
  l::host:Type r::host:Type
  env::Decorated Env
  overloads::[Pair<Pair<String String> (host:Expr ::= host:Expr host:Expr Location)>]
  lOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>]
  rOverloads::[Pair<String (host:Expr ::= host:Expr host:Expr Location)>]
{
  local lModuleName :: Maybe<String> = host:moduleName(env, l);
  local rModuleName :: Maybe<String> = host:moduleName(env, r);

  -- Option 1: overload for a left extension type and a right extension type
  local option1::Maybe<(host:Expr ::= host:Expr host:Expr Location)> =
    do (bindMaybe, returnMaybe) {
      n1 :: String <- lModuleName;
      n2 :: String <- rModuleName;
      prod :: (host:Expr ::= host:Expr host:Expr Location) <- lookupBy(stringPairEq, pair(n1, n2), overloads);
      return prod;
    };
  -- Option 2: overload for a left extension type and any type
  local option2::Maybe<(host:Expr ::= host:Expr host:Expr Location)> =
    do (bindMaybe, returnMaybe) {
      n :: String <- lModuleName;
      prod :: (host:Expr ::= host:Expr host:Expr Location) <- lookupBy(stringEq, n, lOverloads);
      return prod;
    };
  -- Option 2: overload for any type and a right extension type
  local option3::Maybe<(host:Expr ::= host:Expr host:Expr Location)> =
    do (bindMaybe, returnMaybe) {
      n :: String <- rModuleName;
      prod :: (host:Expr ::= host:Expr host:Expr Location) <- lookupBy(stringEq, n, rOverloads);
      return prod;
    };
  
  return orElse(option1, orElse(option2, option3));
}

function getBinaryOverload
host:Expr ::=
  -- AST components
  lhs::host:Expr  rhs::host:Expr  loc::Location
  -- Inherited attributes
  env::Decorated Env  returnType::Maybe<host:Type>
  -- Production-specfic overload parameters
  overloadFn::(Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= host:Type host:Type Decorated Env) -- Function getting the overload production
  defaultProd::(host:Expr ::= host:Expr host:Expr Location) -- Default production for no overload
{
  lhs.env = env;
  lhs.host:returnType = returnType;
  rhs.env = env;
  rhs.host:returnType = returnType;
  
  -- Option 1: Normal overloaded operator
  local option1::Maybe<host:Expr> =
    applyMaybe3(overloadFn(lhs.host:typerep, rhs.host:typerep, env), lhs, rhs, loc);
  
  -- Option 2: No overload
  local option2::host:Expr = defaultProd(lhs, rhs, loc);
  
  return fromMaybe(option2, option1);
}

function getAssignOverload
host:Expr ::=
  -- AST components
  lhs::host:Expr  rhs::host:Expr  loc::Location
  -- Inherited attributes
  env::Decorated Env  returnType::Maybe<host:Type>
  -- Production-specfic overload parameters
  prod::(host:Expr ::= host:Expr host:Expr Location) -- Overloaded production
  overloadFn::(Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= host:Type host:Type Decorated Env) -- Function getting the overload production
  maybeBaseOpOverloadFn::Maybe<(Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= host:Type host:Type Decorated Env)> -- Function getting the base operator overload production, if it exists
  defaultProd::(host:Expr ::= host:Expr host:Expr Location) -- Default production for no overload
{
  lhs.env = env;
  lhs.host:returnType = returnType;
  rhs.env = env;
  rhs.host:returnType = returnType;

  -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] += b)
  local option1::Maybe<host:Expr> =
    case lhs of
      arraySubscriptExpr(l, r) ->
      applyMaybe5(getSubscriptAssignOverloadProd(l.host:typerep, env), l, r, prod, rhs, loc)
    | memberExpr(l, d, r) ->
      applyMaybe6(getMemberAssignOverloadProd(l.host:typerep, env), l, d, r, prod, rhs, loc)
    | _ -> nothing()
    end;
  
  -- Option 2: Normal overloaded assign operator
  local option2::Maybe<host:Expr> =
    applyMaybe3(overloadFn(lhs.host:typerep, rhs.host:typerep, env), lhs, rhs, loc);
  
  -- Option 3: Rewrite using overloaded = and the base operator
  local option3::Maybe<host:Expr> =
    do (bindMaybe, returnMaybe) {
      baseOpOverloadFn :: (Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= host:Type host:Type Decorated Env) <-
        maybeBaseOpOverloadFn;
      baseOpProd :: (host:Expr ::= host:Expr host:Expr Location) <- baseOpOverloadFn(lhs.host:typerep, rhs.host:typerep, env);
      tmpName::String = "_tmp" ++ toString(genInt());

      -- ({${lhs.host:typerep} *${tmpName} = &${lhs}; *${tmpName} = *${tmpName} ${baseOp} ${rhs}})
      return
        host:stmtExpr(
          mkDecl(
            tmpName,
            host:pointerType(host:nilQualifier(), lhs.host:typerep),
            host:unaryOpExpr(host:addressOfOp(location=loc), lhs, location=loc),
            loc),
          eqExpr(
            host:dereferenceExpr(
              host:declRefExpr(host:name(tmpName, location=loc), location=loc),
              location=loc),
            baseOpProd(
              host:dereferenceExpr(
                host:declRefExpr(host:name(tmpName, location=loc), location=loc),
                location=loc),
              rhs, loc),
            location=loc),
          location=loc);
    };
  
  -- Option 4: No overload
  local option4::host:Expr = defaultProd(lhs, rhs, loc);
  
  return fromMaybe(option4, orElse(option1, orElse(option2, option3)));
}

function getNegatedBinaryOverload
host:Expr ::=
  -- AST components
  lhs::host:Expr  rhs::host:Expr  loc::Location
  -- Inherited attributes
  env::Decorated Env  returnType::Maybe<host:Type>
  -- Production-specfic overload parameters
  overloadFn::(Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= host:Type host:Type Decorated Env) -- Function getting the overload production
  negatedOverloadFn::(Maybe<(host:Expr ::= host:Expr host:Expr Location)> ::= host:Type host:Type Decorated Env) -- Function getting the negated version of the overload production
  defaultProd::(host:Expr ::= host:Expr host:Expr Location) -- Default production for no overload
{
  lhs.env = env;
  lhs.host:returnType = returnType;
  rhs.env = env;
  rhs.host:returnType = returnType;
  
  -- Option 1: Normal overloaded operator
  local option1::Maybe<host:Expr> =
    applyMaybe3(overloadFn(lhs.host:typerep, rhs.host:typerep, env), lhs, rhs, loc);
  
  -- Option 2: Rewrite using ! and the overloaded negated version of the operator
  local option2::Maybe<host:Expr> =
    do (bindMaybe, returnMaybe) {
      negatedOpProd :: (host:Expr ::= host:Expr host:Expr Location) <- negatedOverloadFn(lhs.host:typerep, rhs.host:typerep, env);

      -- !(${lhs} ${negatedOp} ${rhs})
      return unaryOpExpr(host:notOp(location=loc), negatedOpProd(lhs, rhs, loc), location=loc);
    };
  
  -- Option 3: No overload
  local option3::host:Expr = defaultProd(lhs, rhs, loc);
  
  return fromMaybe(option3, orElse(option1, option2));
}

function getGtOverload
host:Expr ::=
  -- AST components
  lhs::host:Expr  rhs::host:Expr  loc::Location
  -- Inherited attributes
  env::Decorated Env  returnType::Maybe<host:Type>
{
  lhs.env = env;
  lhs.host:returnType = returnType;
  rhs.env = env;
  rhs.host:returnType = returnType;
  
  -- Option 1: Normal overloaded operator
  local option1::Maybe<host:Expr> =
    applyMaybe3(
      getGtOverloadProd(lhs.host:typerep, rhs.host:typerep, env),
      lhs, rhs, loc);
  
  -- Option 2: Rewrite using !, || and the overloaded ==, < operators
  local option2::Maybe<host:Expr> =
    do (bindMaybe, returnMaybe) {
      ltOverloadProd :: (host:Expr ::= host:Expr host:Expr Location) <-
        getLtOverloadProd(lhs.host:typerep, rhs.host:typerep, env);
      eqOverloadProd :: (host:Expr ::= host:Expr host:Expr Location) <-
        getEqOverloadProd(lhs.host:typerep, rhs.host:typerep, env);
      lhsTmpName::String = "_tmp" ++ toString(genInt());
      rhsTmpName::String = "_tmp" ++ toString(genInt());

      -- ({${lhs.host:typerep} ${lhsTmpName} = ${lhs};
      --   ${rhs.host:typerep} ${rhsTmpName} = ${rhs};
      --   !((${lhsTmpName} ${ltOverloadProd} ${rhsTmpName}) ||
      --     (${lhsTmpName} ${eqOverloadProd} ${rhsTmpName}));})
      return
        host:stmtExpr(
          host:seqStmt(
            mkDecl(lhsTmpName, lhs.host:typerep, lhs, loc),
            mkDecl(rhsTmpName, rhs.host:typerep, rhs, loc)),
          unaryOpExpr(
            host:notOp(location=loc),
            orExpr(
              ltOverloadProd(
                host:declRefExpr(
                  host:name(lhsTmpName, location=loc),
                  location=loc),
                host:declRefExpr(
                  host:name(rhsTmpName, location=loc),
                  location=loc),
                loc),
              eqOverloadProd(
                host:declRefExpr(
                  host:name(lhsTmpName, location=loc),
                  location=loc),
                host:declRefExpr(
                  host:name(rhsTmpName, location=loc),
                  location=loc),
                loc),
              location=loc),
            location=loc),
          location=loc);
    };
  
  -- Option 3: No overload
  local option3::host:Expr = inj:gtExpr(lhs, rhs, location=loc);
  
  return fromMaybe(option3, orElse(option1, option2));
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

function applyMaybe7
Maybe<a> ::= maybeFn::Maybe<(a ::= b c d e f g h)> a1::b a2::c a3::d a4::e a5::f a6::g a7::h
{
  return
    case maybeFn of
      just(fn) -> just(fn(a1, a2, a3, a4, a5, a6, a7))
    | nothing() -> nothing()
    end;
}
