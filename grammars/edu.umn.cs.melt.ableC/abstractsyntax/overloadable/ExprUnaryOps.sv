grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

abstract production preIncExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("++"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local host::host:Expr = inj:preIncExpr(e, location=top.location);
  local fwrd::host:Expr =
    case e.host:typerep.preIncProd of
      just(prod) -> host:transformedExpr(host, prod(e, top.location), location=top.location)
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production preDecExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("--"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local host::host:Expr = inj:preDecExpr(e, location=top.location);
  local fwrd::host:Expr =
    case e.host:typerep.preDecProd of
      just(prod) -> host:transformedExpr(host, prod(e, top.location), location=top.location)
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production postIncExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( e.pp, text("++") ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local host::host:Expr = inj:postIncExpr(e, location=top.location);
  local fwrd::host:Expr =
    case e.host:typerep.postIncProd of
      just(prod) -> host:transformedExpr(host, prod(e, top.location), location=top.location)
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production postDecExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( e.pp, text("--") ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local host::host:Expr = inj:postDecExpr(e, location=top.location);
  local fwrd::host:Expr =
    case e.host:typerep.postDecProd of
      just(prod) -> host:transformedExpr(host, prod(e, top.location), location=top.location)
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production addressOfExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("&"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local host::host:Expr = inj:addressOfExpr(e, location=top.location);
  local fwrd::host:Expr =
    case e.addressOfProd of
      just(prod) -> host:transformedExpr(host, prod(top.location), location=top.location)
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production dereferenceExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens(cat(text("*"), e.pp));
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local host::host:Expr = inj:dereferenceExpr(e, location=top.location);
  local fwrd::host:Expr =
    case e.host:typerep.dereferenceProd of
      just(prod) -> host:transformedExpr(host, prod(e, top.location), location=top.location)
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production positiveExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("+"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local host::host:Expr = inj:positiveExpr(e, location=top.location);
  local fwrd::host:Expr =
    case e.host:typerep.positiveProd of
      just(prod) -> host:transformedExpr(host, prod(e, top.location), location=top.location)
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production negativeExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("-"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local host::host:Expr = inj:negativeExpr(e, location=top.location);
  local fwrd::host:Expr =
    case e.host:typerep.negativeProd of
      just(prod) -> host:transformedExpr(host, prod(e, top.location), location=top.location)
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production bitNegateExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("~"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local host::host:Expr = inj:bitNegateExpr(e, location=top.location);
  local fwrd::host:Expr =
    case e.host:typerep.bitNegateProd of
      just(prod) -> host:transformedExpr(host, prod(e, top.location), location=top.location)
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production notExpr
top::host:Expr ::= e::host:Expr
{
  top.pp = parens( cat( text("!"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local host::host:Expr = inj:notExpr(e, location=top.location);
  local fwrd::host:Expr =
    case e.host:typerep.notProd of
      just(prod) -> host:transformedExpr(host, prod(e, top.location), location=top.location)
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
