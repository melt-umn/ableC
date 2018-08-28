grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

abstract production preIncExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("++"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    fromMaybe(
      inj:preIncExpr(_, location=_),
      e.host:typerep.preIncProd)(e, top.location);

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production preDecExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("--"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    fromMaybe(
      inj:preDecExpr(_, location=_),
      e.host:typerep.preDecProd)(e, top.location);

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production postIncExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( e.pp, text("++") ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    fromMaybe(
      inj:postIncExpr(_, location=_),
      e.host:typerep.postIncProd)(e, top.location);

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production postDecExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( e.pp, text("--") ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    fromMaybe(
      inj:postDecExpr(_, location=_),
      e.host:typerep.postDecProd)(e, top.location);

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production addressOfExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("&"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    fromMaybe(
      inj:addressOfExpr(e, location=_),
      e.addressOfProd)(top.location);

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production dereferenceExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens(cat(text("*"), e.pp));
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    fromMaybe(
      inj:dereferenceExpr(_, location=_),
      e.host:typerep.dereferenceProd)(e, top.location);

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production positiveExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("+"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    fromMaybe(
      inj:positiveExpr(_, location=_),
      e.host:typerep.positiveProd)(e, top.location);

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production negativeExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("-"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    fromMaybe(
      inj:negativeExpr(_, location=_),
      e.host:typerep.negativeProd)(e, top.location);

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production bitNegateExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("~"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    fromMaybe(
      inj:bitNegateExpr(_, location=_),
      e.host:typerep.bitNegateProd)(e, top.location);

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production notExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("!"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    fromMaybe(
      inj:notExpr(_, location=_),
      e.host:typerep.notProd)(e, top.location);

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
