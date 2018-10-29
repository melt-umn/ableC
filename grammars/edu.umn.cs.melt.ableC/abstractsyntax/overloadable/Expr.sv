grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

abstract production explicitCastExpr
top::host:Expr ::= ty::host:TypeName  e::host:Expr
{
  top.pp = parens( ppConcat([parens(ty.pp), e.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr = inj:explicitCastExpr(ty, e, location=top.location);

  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
abstract production arraySubscriptExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([ lhs.pp, brackets( rhs.pp )]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local rewriteProd::Maybe<BinaryProd> =
    case lhs.host:typerep.addressOfArraySubscriptProd of
      just(prod) ->
        just(
          \ lhs::host:Expr rhs::host:Expr loc::Location ->
            dereferenceExpr(prod(lhs, rhs, loc), location=loc))
    | nothing() -> nothing()
    end;
  
  local host::host:Expr = inj:arraySubscriptExpr(lhs, rhs, location=top.location);
  local fwrd::host:Expr =
    case orElse(lhs.host:typerep.arraySubscriptProd, rewriteProd) of
      just(prod) -> host:transformedExpr(host, prod(lhs, rhs, top.location), location=top.location)
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
      just(prod) ->
        just(\ a::host:Exprs loc::Location -> dereferenceExpr(prod(f, a, loc), location=loc))
    | nothing() -> nothing()
    end;
  
  local host::host:Expr = inj:callExpr(f, a, location=top.location);
  forwards to
    case orElse(f.callProd, rewriteProd) of
      just(prod) -> host:transformedExpr(host, prod(a, top.location), location=top.location)
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
  local host::host:Expr = inj:memberExpr(lhs, deref, rhs, location=top.location);
  local fwrd::host:Expr =
    case t.memberProd of
      just(prod) -> host:transformedExpr(host, prod(lhs, rhs, top.location), location=top.location)
    | nothing() -> host
    end;
  
  forwards to host:wrapWarnExpr(lerrors, fwrd, top.location);
}
