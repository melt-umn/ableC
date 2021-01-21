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

  lhs.otherType = rhs.host:typerep;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<UnaryProd> =
    if lhs.addressOfProd.isJust
    then just(mkEqRewriteExpr(\ lhs::host:Expr rhs::host:Expr loc::Location -> rhs, lhs, _, _))
    else nothing();
  
  local host::host:Expr =
    inj:eqExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lhs.lEqProd, orElse(map(\ p::BinaryProd -> p(lhs, _, _), rType.rEqProd), rewriteProd)) of
    | just(prod) ->
      host:transformedExpr(
        host, 
        prod(host:decExpr(rhs, location=rhs.location), top.location),
        location=top.location)
    | nothing() -> host
    end;
  
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

  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lMulProd.isJust || rType.rMulProd.isJust
    then just(mkEqRewriteExpr(mulExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local host::host:Expr =
    inj:mulEqExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lMulEqProd, orElse(rType.rMulEqProd, rewriteProd)) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lDivProd.isJust || rType.rDivProd.isJust
    then just(mkEqRewriteExpr(divExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local host::host:Expr =
    inj:divEqExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lDivEqProd, orElse(rType.rDivEqProd, rewriteProd)) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lModProd.isJust || rType.rModProd.isJust
    then just(mkEqRewriteExpr(modExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local host::host:Expr =
    inj:modEqExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lModEqProd, orElse(rType.rModEqProd, rewriteProd)) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lAddProd.isJust || rType.rAddProd.isJust
    then just(mkEqRewriteExpr(addExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local host::host:Expr =
    inj:addEqExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lAddEqProd, orElse(rType.rAddEqProd, rewriteProd)) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lSubProd.isJust || rType.rSubProd.isJust
    then just(mkEqRewriteExpr(subExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local host::host:Expr =
    inj:subEqExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lSubEqProd, orElse(rType.rSubEqProd, rewriteProd)) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lLshBitProd.isJust || rType.rLshBitProd.isJust
    then just(mkEqRewriteExpr(lshExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local host::host:Expr =
    inj:lshEqExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lLshEqProd, orElse(rType.rLshEqProd, rewriteProd)) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lRshBitProd.isJust || rType.rRshBitProd.isJust
    then just(mkEqRewriteExpr(rshExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local host::host:Expr =
    inj:rshEqExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lRshEqProd, orElse(rType.rRshEqProd, rewriteProd)) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lAndProd.isJust || rType.rAndProd.isJust
    then just(mkEqRewriteExpr(andExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local host::host:Expr =
    inj:andEqExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lAndEqProd, orElse(rType.rAndEqProd, rewriteProd)) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;


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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lAndProd.isJust || rType.rAndProd.isJust
    then just(mkEqRewriteExpr(xorExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local host::host:Expr =
    inj:xorEqExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lXorEqProd, orElse(rType.rXorEqProd, rewriteProd)) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local rewriteProd::Maybe<BinaryProd> =
    if lhs.addressOfProd.isJust || lType.lOrProd.isJust || rType.rOrProd.isJust
    then just(mkEqRewriteExpr(orExpr(_, _, location=_), _, _, _))
    else nothing();
  
  local host::host:Expr =
    inj:orEqExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lOrEqProd, orElse(rType.rOrEqProd, rewriteProd)) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local host::host:Expr =
    inj:andExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lAndProd, rType.rAndProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local host::host:Expr =
    inj:orExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lOrProd, rType.rOrProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local host::host:Expr =
    inj:andBitExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lAndBitProd, rType.rAndBitProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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
  
  local host::host:Expr =
    inj:orBitExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lOrBitProd, rType.rOrBitProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local host::host:Expr =
    inj:xorExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lXorProd, rType.rXorProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local host::host:Expr =
    inj:lshExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lLshBitProd, rType.rLshBitProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local host::host:Expr =
    inj:rshExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lRshBitProd, rType.rRshBitProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
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
  
  local host::host:Expr =
    inj:equalsExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lEqualsProd, orElse(rType.rEqualsProd, rewriteProd)) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
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
  
  local host::host:Expr =
    inj:notEqualsExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lNotEqualsProd, orElse(rType.rNotEqualsProd, rewriteProd)) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
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
  
  local host::host:Expr =
    inj:ltExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case foldr1(orElse, [lType.lLtProd, rType.rLtProd, rewriteProd1, rewriteProd2, rewriteProd3]) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
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
  
  local host::host:Expr =
    inj:gtExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case foldr1(orElse, [lType.lGtProd, rType.rGtProd, rewriteProd1, rewriteProd2, rewriteProd3]) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
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
  
  local host::host:Expr =
    inj:lteExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case foldr1(orElse, [lType.lLteProd, rType.rLteProd, rewriteProd1, rewriteProd2, rewriteProd3]) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
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
  
  local host::host:Expr =
    inj:gteExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case foldr1(orElse, [lType.lGteProd, rType.rGteProd, rewriteProd1, rewriteProd2, rewriteProd3]) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local host::host:Expr =
    inj:addExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lAddProd, rType.rAddProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local host::host:Expr =
    inj:subExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lSubProd, rType.rSubProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local host::host:Expr =
    inj:mulExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lMulProd, rType.rMulProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local host::host:Expr =
    inj:divExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lDivProd, rType.rDivProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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

  rhs.env = addEnv(lhs.defs, lhs.env);
  
  local lType::host:Type = lhs.host:typerep;
  lType.otherType = rType;
  local rType::host:Type = rhs.host:typerep;
  rType.otherType = lType;
  
  local host::host:Expr =
    inj:modExpr(
      host:decExpr(lhs, location=lhs.location),
      host:decExpr(rhs, location=rhs.location),
      location=top.location);
  local fwrd::host:Expr =
    case orElse(lType.lModProd, rType.rModProd) of
    | just(prod) ->
      host:transformedExpr(
        host,
        prod(
          host:decExpr(lhs, location=lhs.location),
          host:decExpr(rhs, location=rhs.location),
          top.location),
        location=top.location)
    | nothing() -> host
    end;

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
      host:declStmt(host:autoDecl(tmpName, addressOfExpr(lhs, location=loc))),
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
        host:declStmt(host:autoDecl(tmpName1, lhs)),
        host:declStmt(host:autoDecl(tmpName2, rhs))),
      baseOpProd(
        host:declRefExpr(tmpName1, location=loc),
        host:declRefExpr(tmpName2, location=loc),
        loc),
      location=loc);
}
