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

  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust
    then just(mkEqRewriteExpr(\ lhs::host:Expr rhs::host:Expr loc::Location -> rhs, _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:eqExpr(_, _, location=_),
      orElse(lType.lEqProd, orElse(rType.rEqProd, rewriteProd)))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);
  
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

  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lMulProd.isJust || rType.rMulProd.isJust
    then just(mkEqRewriteExpr(mulExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:mulEqExpr(_, _, location=_),
      orElse(lType.lMulEqProd, orElse(rType.rMulEqProd, rewriteProd)))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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

  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lDivProd.isJust || rType.rDivProd.isJust
    then just(mkEqRewriteExpr(divExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:divEqExpr(_, _, location=_),
      orElse(lType.lDivEqProd, orElse(rType.rDivEqProd, rewriteProd)))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lModProd.isJust || rType.rModProd.isJust
    then just(mkEqRewriteExpr(modExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:modEqExpr(_, _, location=_),
      orElse(lType.lModEqProd, orElse(rType.rModEqProd, rewriteProd)))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lAddProd.isJust || rType.rAddProd.isJust
    then just(mkEqRewriteExpr(addExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:addEqExpr(_, _, location=_),
      orElse(lType.lAddEqProd, orElse(rType.rAddEqProd, rewriteProd)))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lSubProd.isJust || rType.rSubProd.isJust
    then just(mkEqRewriteExpr(subExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:subEqExpr(_, _, location=_),
      orElse(lType.lSubEqProd, orElse(rType.rSubEqProd, rewriteProd)))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lLshBitProd.isJust || rType.rLshBitProd.isJust
    then just(mkEqRewriteExpr(lshExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:lshEqExpr(_, _, location=_),
      orElse(lType.lLshEqProd, orElse(rType.rLshEqProd, rewriteProd)))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lRshBitProd.isJust || rType.rRshBitProd.isJust
    then just(mkEqRewriteExpr(rshExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:rshEqExpr(_, _, location=_),
      orElse(lType.lRshEqProd, orElse(rType.rRshEqProd, rewriteProd)))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lAndProd.isJust || rType.rAndProd.isJust
    then just(mkEqRewriteExpr(andExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:andEqExpr(_, _, location=_),
      orElse(lType.lAndEqProd, orElse(rType.rAndEqProd, rewriteProd)))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);


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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lAndProd.isJust || rType.rAndProd.isJust
    then just(mkEqRewriteExpr(xorExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:xorEqExpr(_, _, location=_),
      orElse(lType.lAndEqProd, orElse(rType.rAndEqProd, rewriteProd)))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lOrProd.isJust || rType.rOrProd.isJust
    then just(mkEqRewriteExpr(orExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:orEqExpr(_, _, location=_),
      orElse(lType.lOrEqProd, orElse(rType.rOrEqProd, rewriteProd)))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:andExpr(_, _, location=_),
      orElse(lType.lAndProd, rType.rAndProd))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:orExpr(_, _, location=_),
      orElse(lType.lOrProd, rType.rOrProd))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:andBitExpr(_, _, location=_),
      orElse(lType.lAndBitProd, rType.rAndBitProd))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:orBitExpr(_, _, location=_),
      orElse(lType.lOrBitProd, rType.rOrBitProd))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:xorExpr(_, _, location=_),
      orElse(lType.lXorProd, rType.rXorProd))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:lshExpr(_, _, location=_),
      orElse(lType.lLshBitProd, rType.rLshBitProd))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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

  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:rshExpr(_, _, location=_),
      orElse(lType.lRshBitProd, rType.rRshBitProd))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lType.lNotEqualsProd.isJust || rType.rNotEqualsProd.isJust
    then
     just(
       \ lhs::host:Expr rhs::host:Expr loc::Location ->
         notExpr(notEqualsExpr(lhs, rhs, location=loc), location=loc)) 
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:equalsExpr(_, _, location=_),
      orElse(lType.lEqualsProd, orElse(rType.rEqualsProd, rewriteProd)))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lType.lEqualsProd.isJust || rType.rEqualsProd.isJust
    then
     just(
       \ lhs::host:Expr rhs::host:Expr loc::Location ->
         notExpr(equalsExpr(lhs, rhs, location=loc), location=loc)) 
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:notEqualsExpr(_, _, location=_),
      orElse(lType.lNotEqualsProd, orElse(rType.rNotEqualsProd, rewriteProd)))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd1::Maybe<BinaryProd> =
    if lType.lGtProd.isJust || rType.rGtProd.isJust
    then
     just(
       mkTmpBinOpExpr(
         \ lhs::host:Expr rhs::host:Expr loc::Location ->
           gtExpr(rhs, lhs, location=loc),
         _, _, _))
    else nothing();
  
  local rewriteProd2::Maybe<BinaryProd> =
    if lType.lLteProd.isJust || rType.rLteProd.isJust
    then
     just(
       mkTmpBinOpExpr(
         \ lhs::host:Expr rhs::host:Expr loc::Location ->
           andExpr(
             lteExpr(lhs, rhs, location=loc),
             notEqualsExpr(lhs, rhs, location=loc),
             location=loc),
         _, _, _))
    else nothing();
  
  local rewriteProd3::Maybe<BinaryProd> =
    if lType.lGteProd.isJust || rType.rGteProd.isJust
    then
     just(
       mkTmpBinOpExpr(
         \ lhs::host:Expr rhs::host:Expr loc::Location ->
           andExpr(
             gteExpr(rhs, lhs, location=loc),
             notEqualsExpr(lhs, rhs, location=loc),
             location=loc),
         _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:ltExpr(_, _, location=_),
      foldr1(
        orElse,
        [lType.lLtProd, rType.rLtProd, rewriteProd1, rewriteProd2, rewriteProd3]))
          (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd1::Maybe<BinaryProd> =
    if lType.lLtProd.isJust || rType.rLtProd.isJust
    then
     just(
       mkTmpBinOpExpr(
         \ lhs::host:Expr rhs::host:Expr loc::Location ->
           ltExpr(rhs, lhs, location=loc),
         _, _, _))
    else nothing();
  
  local rewriteProd2::Maybe<BinaryProd> =
    if lType.lGteProd.isJust || rType.rGteProd.isJust
    then
     just(
       mkTmpBinOpExpr(
         \ lhs::host:Expr rhs::host:Expr loc::Location ->
           andExpr(
             gteExpr(lhs, rhs, location=loc),
             notEqualsExpr(lhs, rhs, location=loc),
             location=loc),
         _, _, _))
    else nothing();
  
  local rewriteProd3::Maybe<BinaryProd> =
    if lType.lLteProd.isJust || rType.rLteProd.isJust
    then
     just(
       mkTmpBinOpExpr(
         \ lhs::host:Expr rhs::host:Expr loc::Location ->
           andExpr(
             lteExpr(rhs, lhs, location=loc),
             notEqualsExpr(lhs, rhs, location=loc),
             location=loc),
         _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:gtExpr(_, _, location=_),
      foldr1(
        orElse,
        [lType.lGtProd, rType.rGtProd, rewriteProd1, rewriteProd2, rewriteProd3]))
          (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd1::Maybe<BinaryProd> =
    if lType.lGteProd.isJust || rType.rGteProd.isJust
    then
     just(
       mkTmpBinOpExpr(
         \ lhs::host:Expr rhs::host:Expr loc::Location ->
           gteExpr(rhs, lhs, location=loc),
         _, _, _))
    else nothing();
  
  local rewriteProd2::Maybe<BinaryProd> =
    if lType.lLtProd.isJust || rType.rLtProd.isJust
    then
     just(
       mkTmpBinOpExpr(
         \ lhs::host:Expr rhs::host:Expr loc::Location ->
           orExpr(
             ltExpr(lhs, rhs, location=loc),
             equalsExpr(lhs, rhs, location=loc),
             location=loc),
         _, _, _))
    else nothing();
  
  local rewriteProd3::Maybe<BinaryProd> =
    if lType.lGtProd.isJust || rType.rGtProd.isJust
    then
     just(
       mkTmpBinOpExpr(
         \ lhs::host:Expr rhs::host:Expr loc::Location ->
           orExpr(
             gtExpr(rhs, lhs, location=loc),
             equalsExpr(lhs, rhs, location=loc),
             location=loc),
         _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:lteExpr(_, _, location=_),
      foldr1(
        orElse,
        [lType.lLteProd, rType.rLteProd, rewriteProd1, rewriteProd2, rewriteProd3]))
          (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  injectedQualifiers := case top.env, top.host:returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end;local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd1::Maybe<BinaryProd> =
    if lType.lLteProd.isJust || rType.rLteProd.isJust
    then
     just(
       mkTmpBinOpExpr(
         \ lhs::host:Expr rhs::host:Expr loc::Location ->
           lteExpr(rhs, lhs, location=loc),
         _, _, _))
    else nothing();
  
  local rewriteProd2::Maybe<BinaryProd> =
    if lType.lGtProd.isJust || rType.rGtProd.isJust
    then
     just(
       mkTmpBinOpExpr(
         \ lhs::host:Expr rhs::host:Expr loc::Location ->
           orExpr(
             gtExpr(lhs, rhs, location=loc),
             equalsExpr(lhs, rhs, location=loc),
             location=loc),
         _, _, _))
    else nothing();
  
  local rewriteProd3::Maybe<BinaryProd> =
    if lType.lLtProd.isJust || rType.rLtProd.isJust
    then
     just(
       mkTmpBinOpExpr(
         \ lhs::host:Expr rhs::host:Expr loc::Location ->
           orExpr(
             ltExpr(rhs, lhs, location=loc),
             equalsExpr(lhs, rhs, location=loc),
             location=loc),
         _, _, _))
    else nothing();
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:gteExpr(_, _, location=_),
      foldr1(
        orElse,
        [lType.lGteProd, rType.rGteProd, rewriteProd1, rewriteProd2, rewriteProd3]))
          (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:addExpr(_, _, location=_),
      orElse(lType.lAddProd, rType.rAddProd))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:subExpr(_, _, location=_),
      orElse(lType.lSubProd, rType.rSubProd))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:mulExpr(_, _, location=_),
      orElse(lType.lMulProd, rType.rMulProd))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:divExpr(_, _, location=_),
      orElse(lType.lDivProd, rType.rDivProd))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

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
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local fwrd::host:Expr =
    fromMaybe(
      inj:modExpr(_, _, location=_),
      orElse(lType.lModProd, rType.rModProd))
        (modLhsRhs.fst, modLhsRhs.snd, top.location);

  forwards to
    host:wrapWarnExpr(
      lerrors,
      host:wrapQualifiedExpr(injectedQualifiers, fwrd, top.location),
      top.location);
}

-- Utilities
function mkEqRewriteExpr
host:Expr ::= baseOpProd::BinaryProd  lhs::host:Expr  rhs::host:Expr  loc::Location
{
  local tmpName::host:Name = host:name("_tmp" ++ toString(genInt()), location=loc);
  -- ({auto ${tmpName} = &${lhs}; *${tmpName} = *${tmpName} ${baseOp} ${rhs};})
  return
    host:stmtExpr(
      host:declStmt(autoDecl(tmpName, addressOfExpr(lhs, location=loc))),
      eqExpr(
        dereferenceExpr(host:declRefExpr(tmpName, location=loc), location=loc),
        baseOpProd(
          dereferenceExpr(host:declRefExpr(tmpName, location=loc), location=loc),
          rhs, loc),
        location=loc),
      location=loc);
}

function mkTmpBinOpExpr
host:Expr ::= baseOpProd::BinaryProd  lhs::host:Expr  rhs::host:Expr  loc::Location
{
  local tmpName1::host:Name = host:name("_tmp" ++ toString(genInt()), location=loc);
  local tmpName2::host:Name = host:name("_tmp" ++ toString(genInt()), location=loc);
  -- ({auto ${tmpName1} = ${lhs}; auto ${tmpName2} = rhs; ${tmpName1} ${baseOp} ${tmpName2};})
  return
    host:stmtExpr(
      host:seqStmt(
        host:declStmt(autoDecl(tmpName1, lhs)),
        host:declStmt(autoDecl(tmpName2, rhs))),
      baseOpProd(
        host:declRefExpr(tmpName1, location=loc),
        host:declRefExpr(tmpName2, location=loc),
        loc),
      location=loc);
}
