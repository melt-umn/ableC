grammar edu:umn:cs:melt:ableC:abstractsyntax:injectable;

import edu:umn:cs:melt:ableC:abstractsyntax:host
                                             with eqExpr as eqExprDefault,
                                                  mulEqExpr as mulEqExprDefault,
                                                  divEqExpr as divEqExprDefault,
                                                  modEqExpr as modEqExprDefault,
                                                  addEqExpr as addEqExprDefault,
                                                  subEqExpr as subEqExprDefault,
                                                  lshEqExpr as lshEqExprDefault,
                                                  rshEqExpr as rshEqExprDefault,
                                                  andEqExpr as andEqExprDefault,
                                                  xorEqExpr as xorEqExprDefault,
                                                  orEqExpr as orEqExprDefault,
                                                  andExpr as andExprDefault,
                                                  orExpr as orExprDefault,
                                                  andBitExpr as andBitExprDefault,
                                                  orBitExpr as orBitExprDefault,
                                                  xorExpr as xorExprDefault,
                                                  lshExpr as lshExprDefault,
                                                  rshExpr as rshExprDefault,
                                                  equalsExpr as equalsExprDefault,
                                                  notEqualsExpr as notEqualsExprDefault,
                                                  gtExpr as gtExprDefault,
                                                  ltExpr as ltExprDefault,
                                                  gteExpr as gteExprDefault,
                                                  lteExpr as lteExprDefault,
                                                  addExpr as addExprDefault,
                                                  subExpr as subExprDefault,
                                                  mulExpr as mulExprDefault,
                                                  divExpr as divExprDefault,
                                                  modExpr as modExprDefault;

abstract production eqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("="), space(), rhs.pp]) );
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
        eqExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production mulEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("*="), space(), rhs.pp]) );
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
        mulEqExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production divEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("/="), space(), rhs.pp]) );
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
        divEqExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production modEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("%="), space(), rhs.pp]) );
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
        modEqExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production addEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("+="), space(), rhs.pp]) );
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
        addEqExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production subEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("-="), space(), rhs.pp]) );
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
        subEqExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production lshEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<="), space(), rhs.pp]) );
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
        lshEqExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production rshEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>="), space(), rhs.pp]) );
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
        rshEqExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production andEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("&="), space(), rhs.pp]) );
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
        andEqExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production xorEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("^="), space(), rhs.pp]) );
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
        xorEqExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production orEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("|="), space(), rhs.pp]) );
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
        orEqExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production andExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("&&"), space(), rhs.pp]) );
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
        andExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production orExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("||"), space(), rhs.pp]) );
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
        orExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production andBitExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("&"), space(), rhs.pp]) );
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
        andBitExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production orBitExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("|"), space(), rhs.pp]) );
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
        orBitExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production xorExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("^"), space(), rhs.pp]) );
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
        xorExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production lshExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<"), space(), rhs.pp]) );
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
        lshExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production rshExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>"), space(), rhs.pp]) );
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
        rshExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production equalsExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("=="), space(), rhs.pp]) );
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
        equalsExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production notEqualsExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("!="), space(), rhs.pp]) );
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
        notEqualsExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production gtExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">"), space(), rhs.pp]) );
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
        gtExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production ltExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<"), space(), rhs.pp]) );
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
        ltExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production gteExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">="), space(), rhs.pp]) );
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
        gteExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production lteExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<="), space(), rhs.pp]) );
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
        lteExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production addExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("+"), space(), rhs.pp]) );
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
        addExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production subExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("-"), space(), rhs.pp]) );
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
        subExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production mulExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("*"), space(), rhs.pp]) );
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
        mulExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production divExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("/"), space(), rhs.pp]) );
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
        divExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production modExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("%"), space(), rhs.pp]) );
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
        modExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

