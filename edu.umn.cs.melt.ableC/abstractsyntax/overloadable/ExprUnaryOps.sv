grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

abstract production preIncExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("++"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getUnaryOverload(
       e, top.location,
       top.env, top.host:returnType,
       getPreIncOverloadProd,
       inj:preIncExpr(_, location=_));

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production preDecExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("--"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getUnaryOverload(
       e, top.location,
       top.env, top.host:returnType,
       getPreDecOverloadProd,
       inj:preDecExpr(_, location=_));

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production postIncExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( e.pp, text("++") ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getUnaryOverload(
       e, top.location,
       top.env, top.host:returnType,
       getPostIncOverloadProd,
       inj:postIncExpr(_, location=_));

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production postDecExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( e.pp, text("--") ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getUnaryOverload(
       e, top.location,
       top.env, top.host:returnType,
       getPostDecOverloadProd,
       inj:postDecExpr(_, location=_));

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production addressOfExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("&"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getUnaryOverload(
       e, top.location,
       top.env, top.host:returnType,
       getAddressOfOverloadProd,
       inj:addressOfExpr(_, location=_));

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production dereferenceExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens(cat(text("*"), e.pp));
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getUnaryOverload(
       e, top.location,
       top.env, top.host:returnType,
       getDereferenceOverloadProd,
       inj:dereferenceExpr(_, location=_));

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production positiveExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("+"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getUnaryOverload(
       e, top.location,
       top.env, top.host:returnType,
       getPositiveOverloadProd,
       inj:positiveExpr(_, location=_));

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production negativeExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("-"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getUnaryOverload(
       e, top.location,
       top.env, top.host:returnType,
       getNegativeOverloadProd,
       inj:negativeExpr(_, location=_));

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production bitNegateExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("~"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getUnaryOverload(
       e, top.location,
       top.env, top.host:returnType,
       getBitNegateOverloadProd,
       inj:bitNegateExpr(_, location=_));

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production notExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("!"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getUnaryOverload(
       e, top.location,
       top.env, top.host:returnType,
       getNotOverloadProd,
       inj:notExpr(_, location=_));

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
