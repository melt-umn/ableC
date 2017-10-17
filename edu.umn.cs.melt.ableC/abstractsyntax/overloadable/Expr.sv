grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

abstract production unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  top.pp = if op.preExpr
           then parens( cat( op.pp, e.pp ) )
           else parens( cat( e.pp, op.pp ) );
  
  top.typerep = addQualifiers(op.injectedQualifiers, forward.typerep);
  op.op = e;
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly
  
  forwards to
    wrapWarnExpr(lerrors,
      case op.unaryProd of
        just(prod) -> prod(e, top.location)
      | nothing()  -> inj:unaryOpExpr(op, e, location=top.location)
      end,
      top.location);
}
abstract production dereferenceExpr
top::Expr ::= e::Expr
{
  top.pp = parens(cat(text("*"), e.pp));
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  forwards to
    wrapWarnExpr(lerrors,
      case getDereferenceOverload(e.typerep, top.env) of
        just(prod) -> prod(e, top.location)
      | nothing()  -> inj:dereferenceExpr(e, location=top.location)
      end,
      top.location);
}
abstract production explicitCastExpr
top::Expr ::= ty::TypeName  e::Expr
{
  top.pp = parens( ppConcat([parens(ty.pp), e.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  forwards to
    wrapWarnExpr(lerrors,
      inj:explicitCastExpr(ty, e, location=top.location),
      top.location);
}
abstract production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  top.pp = parens( ppConcat([ lhs.pp, brackets( rhs.pp )]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  forwards to
    wrapWarnExpr(lerrors,
      case getArraySubscriptOverload(lhs.typerep, top.env) of
        just(prod) -> prod(lhs, rhs, top.location)
      | nothing()  -> inj:arraySubscriptExpr(lhs, rhs, location=top.location)
      end,
      top.location);
}
abstract production callExpr
top::Expr ::= f::Expr  a::Exprs
{
  top.pp = parens( ppConcat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );

  a.env = addEnv(f.defs, f.env);
  -- Option 1: Apply a member to arguments (e.g. a.foo(b))
  local option1::Maybe<Expr> = 
    case f of
      memberExpr(l, d, r) ->
        applyMaybe5(getMemberCallOverload(l.typerep, top.env), l, d, r, a, top.location)
    | _ -> nothing()
    end;
  -- Option 2: Normal overloaded application
  local option2::Maybe<Expr> = applyMaybe3(getCallOverload(f.typerep, top.env), f, a, top.location);
  
  forwards to
    if      option1.isJust then option1.fromJust
    else if option2.isJust then option2.fromJust
    else callExprDefault(f, a, location=top.location);
}
abstract production memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  top.pp = parens(ppConcat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  -- get overload function from under pointer if dereferencing
  local ty :: Type =
    if deref
    then case lhs.typerep.withoutAttributes of
           pointerType(_, sub) -> sub
         | _                   -> lhs.typerep
         end
    else lhs.typerep;

  forwards to
    wrapWarnExpr(lerrors,
      case getMemberOverload(ty, top.env) of
        just(prod) -> prod(lhs, deref, rhs, top.location)
      | nothing()  -> inj:memberExpr(lhs, deref, rhs, location=top.location)
      end,
      top.location);
}

