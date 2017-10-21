grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

abstract production explicitCastExpr
top::host:Expr ::= ty::host:TypeName  e::host:Expr
{
  top.pp = parens( ppConcat([parens(ty.pp), e.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      inj:explicitCastExpr(ty, e, location=top.location),
      top.location);
}
abstract production arraySubscriptExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([ lhs.pp, brackets( rhs.pp )]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      case getArraySubscriptOverloadProd(lhs.host:typerep, top.env) of
        just(prod) -> prod(lhs, rhs, top.location)
      | nothing()  -> inj:arraySubscriptExpr(lhs, rhs, location=top.location)
      end,
      top.location);
}
abstract production callExpr
top::host:Expr ::= f::host:Expr  a::host:Exprs
{
  top.pp = parens( ppConcat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.host:pps ))]) );

  a.env = addEnv(f.defs, f.env);
  -- Option 1: Apply a member to arguments (e.g. a.foo(b))
  local option1::Maybe<host:Expr> = 
    case f of
      memberExpr(l, d, r) ->
        applyMaybe5(getMemberCallOverloadProd(l.host:typerep, top.env), l, d, r, a, top.location)
    | _ -> nothing()
    end;
  -- Option 2: Normal overloaded application
  local option2::Maybe<host:Expr> = applyMaybe3(getCallOverloadProd(f.host:typerep, top.env), f, a, top.location);
  
  forwards to
    if      option1.isJust then option1.fromJust
    else if option2.isJust then option2.fromJust
    else host:callExpr(f, a, location=top.location);
}
abstract production memberExpr
top::host:Expr ::= lhs::host:Expr  deref::Boolean  rhs::host:Name
{
  top.pp = parens(ppConcat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  -- get overload function from under pointer if dereferencing
  local ty :: host:Type =
    if deref
    then case lhs.host:typerep.host:withoutAttributes of
           host:pointerType(_, sub) -> sub
         | _                        -> lhs.host:typerep
         end
    else lhs.host:typerep;

  forwards to
    host:wrapWarnExpr(lerrors,
      case getMemberOverloadProd(ty, top.env) of
        just(prod) -> prod(lhs, deref, rhs, top.location)
      | nothing()  -> inj:memberExpr(lhs, deref, rhs, location=top.location)
      end,
      top.location);
}

