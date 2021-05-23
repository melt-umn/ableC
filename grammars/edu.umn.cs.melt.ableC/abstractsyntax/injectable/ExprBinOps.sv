grammar edu:umn:cs:melt:ableC:abstractsyntax:injectable;

abstract production eqExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and host:returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:eqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production mulEqExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("*="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:mulEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production divEqExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("/="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:divEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production modEqExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("%="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:modEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production addEqExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("+="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:addEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production subEqExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("-="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:subEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production lshEqExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:lshEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production rshEqExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:rshEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production andEqExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("&="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:andEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production xorEqExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("^="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:xorEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production orEqExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("|="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:orEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production andExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("&&"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:andExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production orExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("||"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:orExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production andBitExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("&"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:andBitExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production orBitExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("|"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:orBitExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production xorExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("^"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:xorExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production lshExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:lshExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production rshExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:rshExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production equalsExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("=="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:equalsExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production notEqualsExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("!="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:notEqualsExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production gtExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:gtExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production ltExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:ltExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production gteExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:gteExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production lteExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:lteExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production addExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("+"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:addExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production subExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("-"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:subExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production mulExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("*"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:mulExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production divExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("/"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:divExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

abstract production modExpr
top::host:Expr ::= lhs::host:Expr rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("%"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:controlStmtContext.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        host:modExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location),
        top.location),
      top.location);
}

