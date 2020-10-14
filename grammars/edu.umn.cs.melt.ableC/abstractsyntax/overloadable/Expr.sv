grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

abstract production explicitCastExpr
top::host:Expr ::= ty::host:TypeName  e::host:Expr
{
  top.pp = parens( ppConcat([parens(ty.pp), e.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  e.env = addEnv(ty.defs, ty.env);

  local fwrd::host:Expr =
    inj:explicitCastExpr(
      host:decTypeName(ty),
      host:decExpr(e, location=e.location),
      location=top.location);

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production arraySubscriptExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([ lhs.pp, brackets( rhs.pp )]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local rewriteProd::Maybe<BinaryProd> =
    case lhs.host:typerep.addressOfArraySubscriptProd of
    | just(prod) ->
      just(
        \ lhs::host:Expr rhs::host:Expr loc::Location ->
          dereferenceExpr(prod(lhs, rhs, loc), location=loc))
    | nothing() -> nothing()
    end;
  
  local host::host:Expr =
    inj:arraySubscriptExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lhs.host:typerep.arraySubscriptProd, rewriteProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production callExpr
top::host:Expr ::= f::host:Expr  a::host:Exprs
{
  top.pp = parens( ppConcat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );
  
  local rewriteProd::Maybe<(host:Expr ::= host:Exprs Location)> =
    case f.host:typerep.addressOfCallProd of
    | just(prod) ->
      just(\ a::host:Exprs loc::Location ->
        dereferenceExpr(
          prod(host:decExpr(f, location=f.location), a, loc),
          location=loc))
    | nothing() -> nothing()
    end;
  
  a.env = addEnv(f.defs, f.env);
  
  local host::host:Expr =
    inj:callExpr(
      host:decExpr(f, location=f.location),
      host:decExprs(a),
      location=top.location);
  forwards to
    case orElse(f.callProd, rewriteProd) of
    | just(prod) ->
       host:transformedExpr(
         host,
         prod(host:decExprs(a), top.location),
         location=top.location)
    | nothing() -> host
    end;
}
abstract production memberExpr
top::host:Expr ::= lhs::host:Expr  deref::Boolean  rhs::host:Name
{
  top.pp = parens(ppConcat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local t::host:Type = lhs.host:typerep;
  t.isDeref = deref;
  local host::host:Expr =
    inj:memberExpr(
      host:decExpr(lhs, location=lhs.location),
      deref, rhs,
      location=top.location);
  local fwrd::host:Expr =
    case t.memberProd of
    | just(prod) ->
       host:transformedExpr(
         host,
         prod(lhs, rhs, top.location),
         location=top.location)
    | nothing() -> host
    end;
  
  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production compoundLiteralExpr
top::host:Expr ::= ty::host:TypeName  init::host:InitList
{
  top.pp = parens( ppConcat([parens(ty.pp), text("{"), ppImplode(text(", "), init.pps), text("}")]) );
  
  local t::host:Type = ty.host:typerep;
  local host::host:Expr =
    host:compoundLiteralExpr(
      host:decTypeName(ty),
      init,
      location=top.location);
  forwards to
    case t.compoundLiteralProd of
    | just(prod) ->
       host:transformedExpr(
         host,
         prod(ty, init, top.location),
         location=top.location)
    | nothing() -> host
    end;
}
