grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

abstract production explicitCastExpr
top::host:Expr ::= ty::host:TypeName  e::host:Expr
{
  propagate host:controlStmtContext;
  
  top.pp = parens( ppConcat([parens(ty.pp), e.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  ty.env = top.env;
  e.env = addEnv(ty.defs, ty.env);

  nondecorated local fwrd::host:Expr =
    inj:explicitCastExpr(
      host:decTypeName(^ty),
      host:decExpr(^e));

  forwards to host:wrapWarnExpr(lerrors, fwrd);
}
abstract production arraySubscriptExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  propagate host:controlStmtContext;

  top.pp = parens( ppConcat([ lhs.pp, brackets( rhs.pp )]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  rhs.env = addEnv(lhs.defs, lhs.env);
  lhs.env = top.env;
  
  local rewriteProd::Maybe<BinaryProd> =
    case lhs.host:typerep.addressOfArraySubscriptProd of
    | just(prod) ->
      just(
        \ lhs::host:Expr rhs::host:Expr ->
          dereferenceExpr(prod(lhs, rhs)))
    | nothing() -> nothing()
    end;
  
  nondecorated local host::host:Expr =
    inj:arraySubscriptExpr(
      host:decExpr(^lhs),
      host:decExpr(^rhs));
  nondecorated local fwrd::host:Expr =
    case orElse(lhs.host:typerep.arraySubscriptProd, rewriteProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(^lhs),
          host:decExpr(^rhs)))
    | nothing() -> host
    end;

  forwards to host:wrapWarnExpr(lerrors, fwrd);
}
abstract production callExpr
top::host:Expr ::= f::host:Expr  a::host:Exprs
{
  top.pp = parens( ppConcat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );
  
  local rewriteProd::Maybe<(host:Expr ::= host:Exprs)> =
    case f.host:typerep.addressOfCallProd of
    | just(prod) ->
      just(\ a::host:Exprs ->
        dereferenceExpr(
          prod(host:decExpr(^f), a)))
    | nothing() -> nothing()
    end;
  
  forward host = inj:callExpr(@f, @a);
  forwards to
    case orElse(f.callProd, rewriteProd) of
    | just(prod) -> host:transformedExpr(host:decExpr(^host), prod(host:decExprs(^a)))
    | nothing() -> @host
    end;
}
abstract production memberExpr
top::host:Expr ::= lhs::host:Expr  deref::Boolean  rhs::host:Name
{
  propagate env, host:controlStmtContext;

  top.pp = parens(ppConcat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local t::host:Type = lhs.host:typerep;
  t.isDeref = deref;
  nondecorated local host::host:Expr =
    inj:memberExpr(
      host:decExpr(^lhs),
      deref, ^rhs);
  nondecorated local fwrd::host:Expr =
    case t.memberProd of
    | just(prod) ->
       host:transformedExpr(
         host,
         prod(host:decExpr(^lhs), ^rhs))
    | nothing() -> host
    end;
  
  forwards to host:wrapWarnExpr(lerrors, fwrd);
}
abstract production compoundLiteralExpr
top::host:Expr ::= ty::host:TypeName  init::host:InitList
{
  propagate env, host:controlStmtContext;

  top.pp = parens( ppConcat([parens(ty.pp), text("{"), ppImplode(text(", "), init.pps), text("}")]) );
  
  local t::host:Type = ty.host:typerep;
  nondecorated local host::host:Expr = host:compoundLiteralExpr(host:decTypeName(^ty), ^init);
  nondecorated local tmpName::host:Name = host:name("_res_" ++ toString(genInt()));
  forwards to
    case t.objectInitProd of
    | just(prod) ->
       host:transformedExpr(
         host,
         host:stmtExpr(
           host:declStmt(
             host:variableDecls(
               host:nilStorageClass(), host:nilAttribute(),
               ty.host:bty,
               host:consDeclarator(
                 host:declarator(
                   tmpName,
                   ty.host:mty,
                   host:nilAttribute(),
                   host:justInitializer(prod(^init))),
                 host:nilDeclarator()))),
           host:declRefExpr(tmpName)))
    | nothing() -> host
    end;
}
