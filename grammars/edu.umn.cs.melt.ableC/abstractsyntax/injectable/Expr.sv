grammar edu:umn:cs:melt:ableC:abstractsyntax:injectable;

imports edu:umn:cs:melt:ableC:abstractsyntax:host as host;

abstract production arraySubscriptExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([ lhs.pp, brackets( rhs.pp )]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods :: [LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:arraySubscriptExpr(modLhsRhs.fst, modLhsRhs.snd)));
}

abstract production memberExpr
top::host:Expr ::= lhs::host:Expr  deref::Boolean  rhs::host:Name
{
  top.pp = parens(ppConcat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  -- to ensure modified lhs is an lvalue in case this memberExpr is enclosed in
  --  an eqExpr, replace x.m with (&x)->m
  local preModLhs :: host:Expr =
    if null(runtimeMods) then lhs
    else mkAddressOf(lhs);
  preModLhs.env = lhs.env;
  preModLhs.host:returnType = lhs.host:returnType;

  local preModDeref :: Boolean = deref || !null(runtimeMods);

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:memberExpr(applyMods(runtimeMods, preModLhs), preModDeref, rhs)));
}

abstract production explicitCastExpr
top::host:Expr ::= ty::host:TypeName  e::host:Expr
{
  top.pp = parens( ppConcat([parens(ty.pp), e.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods :: [RuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:explicitCastExpr(ty, applyMods(runtimeMods, e))));
}

abstract production callExpr
top::host:Expr ::= f::host:Expr  a::host:Exprs
{
  top.pp = parens( ppConcat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );

  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute preInsertions :: [(host:Stmt ::= Decorated host:Exprs)] with ++;
  preInsertions := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  -- TODO: wrap result in Maybe in case return void
  production attribute postInsertions :: [(host:Stmt ::= Decorated host:Exprs  Decorated host:Expr)] with ++;
  postInsertions := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local tmpNamePrefix :: String = "_tmp" ++ toString(genInt());

  local tmpArgs :: host:Exprs = foldExpr(mkTmpExprsRefs(a, tmpNamePrefix, 0));
  tmpArgs.env = top.env;
  tmpArgs.host:returnType = top.host:returnType;

  local callFunc :: host:Expr = host:callExpr(f, tmpArgs);
  callFunc.env = top.env;
  callFunc.host:returnType = top.host:returnType;

  local tmpResultDecl :: host:Stmt =
    mkDecl(
      tmpNamePrefix ++ "_result",
      callFunc.host:typerep,
      callFunc);

  local tmpResultRef :: host:Expr =
    host:declRefExpr(
      host:name(tmpNamePrefix ++ "_result")
    );
  tmpResultRef.env = top.env;
  tmpResultRef.host:returnType = top.host:returnType;

  local injExpr :: host:Expr =
    host:stmtExpr(
      foldStmt(
        mkTmpExprsDecls(a, tmpNamePrefix, 0) ++
        map(\ins::(host:Stmt ::= Decorated host:Exprs) ->
          ins(tmpArgs), preInsertions) ++
        [tmpResultDecl] ++
        map(\ins::(host:Stmt ::= Decorated host:Exprs  Decorated host:Expr) ->
          ins(tmpArgs, tmpResultRef), postInsertions)
      ),
      tmpResultRef
    );

  forwards to
    host:wrapWarnExpr(lerrors,
      if null(preInsertions) && null(postInsertions)
      then host:callExpr(f, a)
      else injExpr);
}

function mkTmpExprsDecls
[host:Stmt] ::= es::Decorated host:Exprs  tmpNamePrefix::String  i::Integer
{
  return
    case es of
      host:consExpr(h, t) ->
        cons(
          mkDecl(tmpNamePrefix ++ "_" ++ toString(i), h.host:typerep, h),
          mkTmpExprsDecls(t, tmpNamePrefix, i+1)
        )
    | host:nilExpr() -> []
    end;
}

function mkTmpExprsRefs
[host:Expr] ::= es::Decorated host:Exprs  tmpNamePrefix::String  i::Integer
{
  return
    case es of
      host:consExpr(h, t) ->
        cons(
          host:declRefExpr(
            host:name(tmpNamePrefix ++ "_" ++ toString(i))
          ),
          mkTmpExprsRefs(t, tmpNamePrefix, i+1)
        )
    | host:nilExpr() -> []
    end;
}

