grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

abstract production eqExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  {- TODO: Seed flow types properly on lerrors, runtimeMods, and injectedQualifiers. 
    These equations exist only to seed dependencies on env and returnType so
    extensions can freely compute these synthesized attributes based on them
    while still passing the modular well-definedness analysis. -}
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getAssignOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      eqExpr(_, _, location=_),
      getEqOverloadProd,
      nothing(),
      inj:eqExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production mulEqExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("*="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getAssignOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      mulEqExpr(_, _, location=_),
      getMulEqOverloadProd,
      just(getMulOverloadProd),
      inj:mulEqExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production divEqExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("/="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getAssignOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      divEqExpr(_, _, location=_),
      getDivEqOverloadProd,
      just(getDivOverloadProd),
      inj:divEqExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production modEqExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("%="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getAssignOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      modEqExpr(_, _, location=_),
      getModEqOverloadProd,
      just(getModOverloadProd),
      inj:modEqExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production addEqExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("+="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getAssignOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      addEqExpr(_, _, location=_),
      getAddEqOverloadProd,
      just(getAddOverloadProd),
      inj:addEqExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production subEqExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("-="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getAssignOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      subEqExpr(_, _, location=_),
      getSubEqOverloadProd,
      just(getSubOverloadProd),
      inj:subEqExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production lshEqExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getAssignOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      lshEqExpr(_, _, location=_),
      getLshEqOverloadProd,
      just(getLshOverloadProd),
      inj:lshEqExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production rshEqExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getAssignOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      rshEqExpr(_, _, location=_),
      getRshEqOverloadProd,
      just(getRshOverloadProd),
      inj:rshEqExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production andEqExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("&="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getAssignOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      andEqExpr(_, _, location=_),
      getAndEqOverloadProd,
      just(getAndOverloadProd),
      inj:andEqExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production xorEqExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("^="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getAssignOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      xorEqExpr(_, _, location=_),
      getXorEqOverloadProd,
      just(getXorOverloadProd),
      inj:xorEqExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production orEqExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("|="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr =
    getAssignOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      orEqExpr(_, _, location=_),
      getOrEqOverloadProd,
      just(getOrOverloadProd),
      inj:orEqExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

-- TODO: Automatic equations with DeMorgan's Laws?  

abstract production andExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("&&"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getAndOverloadProd,
      inj:andExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production orExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("||"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getOrOverloadProd,
      inj:orExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production andBitExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("&"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getAndBitOverloadProd,
      inj:andBitExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production orBitExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("|"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getOrBitOverloadProd,
      inj:orBitExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production xorExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("^"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getXorOverloadProd,
      inj:xorExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production lshExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getLshOverloadProd,
      inj:lshExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production rshExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getRshOverloadProd,
      inj:rshExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production equalsExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("=="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getEqualsOverloadProd,
      inj:equalsExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production notEqualsExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("!="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getNegatedBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getNotEqualsOverloadProd,
      getEqualsOverloadProd,
      inj:notEqualsExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production ltExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getLtOverloadProd,
      inj:ltExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production gtExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getGtOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType);

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production lteExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getNegatedBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getLteOverloadProd,
      getGtOverloadProd,
      inj:lteExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production gteExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getNegatedBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getGteOverloadProd,
      getLtOverloadProd,
      inj:gteExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production addExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("+"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getAddOverloadProd,
      inj:addExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production subExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("-"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getSubOverloadProd,
      inj:subExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production mulExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("*"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getMulOverloadProd,
      inj:mulExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production divExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("/"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getDivOverloadProd,
      inj:divExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

abstract production modExpr
top::host:Expr ::= lhs::host:Expr  rhs::host:Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("%"), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;

  production attribute runtimeMods::[inj:LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  local modLhsRhs :: Pair<host:Expr host:Expr> = inj:applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [host:Qualifier] with ++;
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;
  
  local fwrd::host:Expr = 
    getBinaryOverload(
      modLhsRhs.fst, modLhsRhs.snd, top.location,
      top.env, top.labelEnv, top.host:returnType,
      getModOverloadProd,
      inj:modExpr(_, _, location=_));

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

