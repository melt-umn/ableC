grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

abstract production preIncExpr
top::host:Expr ::= e::host:Expr
{
  propagate env, host:controlStmtContext;

  top.pp = parens( cat( text("++"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  nondecorated local host::host:Expr = inj:preIncExpr(host:decExpr(^e));
  nondecorated local fwrd::host:Expr =
    case e.host:typerep.preIncProd of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(host:decExpr(^e)))
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd);
}
abstract production preDecExpr
top::host:Expr ::= e::host:Expr
{
  propagate env, host:controlStmtContext; 
  top.pp = parens( cat( text("--"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  nondecorated local host::host:Expr = inj:preDecExpr(host:decExpr(^e));
  nondecorated local fwrd::host:Expr =
    case e.host:typerep.preDecProd of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(host:decExpr(^e)))
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd);
}
abstract production postIncExpr
top::host:Expr ::= e::host:Expr
{
  propagate env, host:controlStmtContext;

  top.pp = parens( cat( e.pp, text("++") ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  nondecorated local host::host:Expr = inj:postIncExpr(host:decExpr(^e));
  nondecorated local fwrd::host:Expr =
    case e.host:typerep.postIncProd of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(host:decExpr(^e)))
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd);
}
abstract production postDecExpr
top::host:Expr ::= e::host:Expr
{
  propagate env, host:controlStmtContext;

  top.pp = parens( cat( e.pp, text("--") ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  nondecorated local host::host:Expr = inj:postDecExpr(host:decExpr(^e));
  nondecorated local fwrd::host:Expr =
    case e.host:typerep.postDecProd of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(host:decExpr(^e)))
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd);
}
abstract production addressOfExpr
top::host:Expr ::= e::host:Expr
{
  propagate env, host:controlStmtContext;

  top.pp = parens( cat( text("&"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  nondecorated local host::host:Expr = inj:addressOfExpr(host:decExpr(^e));
  nondecorated local fwrd::host:Expr =
    case e.addressOfProd of
    | just(prod) -> host:transformedExpr(host, prod())
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd);
}
abstract production dereferenceExpr
top::host:Expr ::= e::host:Expr
{
  propagate env, host:controlStmtContext;

  top.pp = parens(cat(text("*"), e.pp));
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  nondecorated local host::host:Expr = inj:dereferenceExpr(host:decExpr(^e));
  nondecorated local fwrd::host:Expr =
    case e.host:typerep.dereferenceProd of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(host:decExpr(^e)))
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd);
}
abstract production positiveExpr
top::host:Expr ::= e::host:Expr
{
  propagate env, host:controlStmtContext;
  
  top.pp = parens( cat( text("+"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  nondecorated local host::host:Expr = inj:positiveExpr(host:decExpr(^e));
  nondecorated local fwrd::host:Expr =
    case e.host:typerep.positiveProd of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(host:decExpr(^e)))
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd);
}
abstract production negativeExpr
top::host:Expr ::= e::host:Expr
{
  propagate env, host:controlStmtContext;

  top.pp = parens( cat( text("-"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  nondecorated local host::host:Expr = inj:negativeExpr(host:decExpr(^e));
  nondecorated local fwrd::host:Expr =
    case e.host:typerep.negativeProd of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(host:decExpr(^e)))
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd);
}
abstract production bitNegateExpr
top::host:Expr ::= e::host:Expr
{
  propagate env, host:controlStmtContext;

  top.pp = parens( cat( text("~"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  nondecorated local host::host:Expr = inj:bitNegateExpr(host:decExpr(^e));
  nondecorated local fwrd::host:Expr =
    case e.host:typerep.bitNegateProd of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(host:decExpr(^e)))
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd);
}
abstract production notExpr
top::host:Expr ::= e::host:Expr
{
  propagate env, host:controlStmtContext;
  
  top.pp = parens( cat( text("!"), e.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  nondecorated local host::host:Expr = inj:notExpr(host:decExpr(^e));
  nondecorated local fwrd::host:Expr =
    case e.host:typerep.notProd of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(host:decExpr(^e)))
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd);
}
