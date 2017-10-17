grammar edu:umn:cs:melt:ableC:abstractsyntax:injectable;

import edu:umn:cs:melt:ableC:abstractsyntax:host
                                             with unaryOpExpr as unaryOpExprDefault,
                                                  arraySubscriptExpr as arraySubscriptExprDefault,
                                                  memberExpr as memberExprDefault,
                                                  dereferenceExpr as dereferenceExprDefault,
                                                  explicitCastExpr as explicitCastExprDefault;

abstract production dereferenceExpr
top::Expr ::= e::Expr
{
  top.pp = parens( cat(text("*"), e.pp) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  production attribute injectedQualifiers :: [Qualifier] with ++;
  injectedQualifiers := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  forwards to
    wrapWarnExpr(lerrors,
      wrapQualifiedExpr(injectedQualifiers,
        dereferenceExprDefault(applyMods(runtimeMods, e), location=top.location),
        top.location),
      top.location);
}

abstract production unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  top.pp = if op.preExpr
           then parens( cat( op.pp, e.pp ) )
           else parens( cat( e.pp, op.pp ) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly
  op.op = e;

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  production attribute injectedQualifiers :: [Qualifier] with ++;
  injectedQualifiers := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  forwards to
    wrapWarnExpr(lerrors,
      wrapQualifiedExpr(injectedQualifiers,
        unaryOpExprDefault(op, applyMods(runtimeMods, e), location=top.location),
        top.location),
      top.location);
}

abstract production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  top.pp = parens( ppConcat([ lhs.pp, brackets( rhs.pp )]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly
  local modLhsRhs :: Pair<Expr Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [Qualifier] with ++;
  injectedQualifiers := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  forwards to
    wrapWarnExpr(lerrors,
      wrapQualifiedExpr(injectedQualifiers,
        arraySubscriptExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  top.pp = parens(ppConcat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  production attribute injectedQualifiers :: [Qualifier] with ++;
  injectedQualifiers := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  forwards to
    wrapWarnExpr(lerrors,
      wrapQualifiedExpr(injectedQualifiers,
        memberExprDefault(applyMods(runtimeMods, lhs), deref, rhs, location=top.location),
        top.location),
      top.location);
}

abstract production explicitCastExpr
top::Expr ::= ty::TypeName  e::Expr
{
  top.pp = parens( ppConcat([parens(ty.pp), e.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  production attribute injectedQualifiers :: [Qualifier] with ++;
  injectedQualifiers := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  forwards to
    wrapWarnExpr(lerrors,
      wrapQualifiedExpr(injectedQualifiers,
        explicitCastExprDefault(ty, applyMods(runtimeMods, e), location=top.location),
        top.location),
      top.location);
}
