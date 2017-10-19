grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

import edu:umn:cs:melt:ableC:abstractsyntax:construction;

import edu:umn:cs:melt:ableC:abstractsyntax:host as host;
import edu:umn:cs:melt:ableC:abstractsyntax:injectable as inj;

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

  -- TODO: overload subscript/member on all assign exprs
  local option1::Maybe<host:Expr> =
    case lhs of
      arraySubscriptExpr(l, r) -> applyMaybe5(getSubscriptAssignOverload(l.host:typerep, top.env), l, r,
                                                host:eqExpr(_, _, location=_), rhs, top.location)
    | memberExpr(l, d, r)      -> applyMaybe6(getMemberAssignOverload(l.host:typerep, top.env), l, d, r,
                                                host:eqExpr(_, _, location=_), rhs, top.location)
    | _                        -> nothing()
    end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case option1, getEqOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
        -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
          just(e), _            -> e
        -- Option 2: Normal overloaded binary operators
        | nothing(), just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), nothing()  -> inj:eqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  local option1::Maybe<host:Expr> =
    case lhs of
      arraySubscriptExpr(l, r) -> applyMaybe5(getSubscriptAssignOverload(l.host:typerep, top.env), l, r,
                                                host:mulEqExpr(_, _, location=_), rhs, top.location)
    | memberExpr(l, d, r)      -> applyMaybe6(getMemberAssignOverload(l.host:typerep, top.env), l, d, r,
                                                host:mulEqExpr(_, _, location=_), rhs, top.location)
    | _                        -> nothing()
    end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case option1, getMulEqOverload(lhs.host:typerep, rhs.host:typerep, top.env),
                      getMulOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
        -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
          just(e), _, _                    -> e
        -- Option 2: Normal overloaded binary operators
        | nothing(), just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.host:typerep, prod, top.location)
        | nothing(), nothing(), nothing()  -> inj:mulEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  local option1::Maybe<host:Expr> =
    case lhs of
      arraySubscriptExpr(l, r) -> applyMaybe5(getSubscriptAssignOverload(l.host:typerep, top.env), l, r,
                                                host:divEqExpr(_, _, location=_), rhs, top.location)
    | memberExpr(l, d, r)      -> applyMaybe6(getMemberAssignOverload(l.host:typerep, top.env), l, d, r,
                                                host:divEqExpr(_, _, location=_), rhs, top.location)
    | _                        -> nothing()
    end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case option1, getDivEqOverload(lhs.host:typerep, rhs.host:typerep, top.env),
                      getDivOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
        -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
          just(e), _, _                    -> e
        -- Option 2: Normal overloaded binary operators
        | nothing(), just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.host:typerep, prod, top.location)
        | nothing(), nothing(), nothing()  -> inj:divEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  local option1::Maybe<host:Expr> =
    case lhs of
      arraySubscriptExpr(l, r) -> applyMaybe5(getSubscriptAssignOverload(l.host:typerep, top.env), l, r,
                                                host:modEqExpr(_, _, location=_), rhs, top.location)
    | memberExpr(l, d, r)      -> applyMaybe6(getMemberAssignOverload(l.host:typerep, top.env), l, d, r,
                                                host:modEqExpr(_, _, location=_), rhs, top.location)
    | _                        -> nothing()
    end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case option1, getModEqOverload(lhs.host:typerep, rhs.host:typerep, top.env),
                      getModOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
        -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
          just(e), _, _                    -> e
        -- Option 2: Normal overloaded binary operators
        | nothing(), just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.host:typerep, prod, top.location)
        | nothing(), nothing(), nothing()  -> inj:modEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  local option1::Maybe<host:Expr> =
    case lhs of
      arraySubscriptExpr(l, r) -> applyMaybe5(getSubscriptAssignOverload(l.host:typerep, top.env), l, r,
                                                host:addEqExpr(_, _, location=_), rhs, top.location)
    | memberExpr(l, d, r)      -> applyMaybe6(getMemberAssignOverload(l.host:typerep, top.env), l, d, r,
                                                host:addEqExpr(_, _, location=_), rhs, top.location)
    | _                        -> nothing()
    end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case option1, getAddEqOverload(lhs.host:typerep, rhs.host:typerep, top.env),
                      getAddOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
        -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
          just(e), _, _                    -> e
        -- Option 2: Normal overloaded binary operators
        | nothing(), just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.host:typerep, prod, top.location)
        | nothing(), nothing(), nothing()  -> inj:addEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  local option1::Maybe<host:Expr> =
    case lhs of
      arraySubscriptExpr(l, r) -> applyMaybe5(getSubscriptAssignOverload(l.host:typerep, top.env), l, r,
                                                host:subEqExpr(_, _, location=_), rhs, top.location)
    | memberExpr(l, d, r)      -> applyMaybe6(getMemberAssignOverload(l.host:typerep, top.env), l, d, r,
                                                host:subEqExpr(_, _, location=_), rhs, top.location)
    | _                        -> nothing()
    end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case option1, getSubEqOverload(lhs.host:typerep, rhs.host:typerep, top.env),
                      getSubOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
        -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
          just(e), _, _                    -> e
        -- Option 2: Normal overloaded binary operators
        | nothing(), just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.host:typerep, prod, top.location)
        | nothing(), nothing(), nothing()  -> inj:subEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  local option1::Maybe<host:Expr> =
    case lhs of
      arraySubscriptExpr(l, r) -> applyMaybe5(getSubscriptAssignOverload(l.host:typerep, top.env), l, r,
                                                host:lshEqExpr(_, _, location=_), rhs, top.location)
    | memberExpr(l, d, r)      -> applyMaybe6(getMemberAssignOverload(l.host:typerep, top.env), l, d, r,
                                                host:lshEqExpr(_, _, location=_), rhs, top.location)
    | _                        -> nothing()
    end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case option1, getLshEqOverload(lhs.host:typerep, rhs.host:typerep, top.env),
                      getLshOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
        -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
          just(e), _, _                    -> e
        -- Option 2: Normal overloaded binary operators
        | nothing(), just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.host:typerep, prod, top.location)
        | nothing(), nothing(), nothing()  -> inj:lshEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  local option1::Maybe<host:Expr> =
    case lhs of
      arraySubscriptExpr(l, r) -> applyMaybe5(getSubscriptAssignOverload(l.host:typerep, top.env), l, r,
                                                host:rshEqExpr(_, _, location=_), rhs, top.location)
    | memberExpr(l, d, r)      -> applyMaybe6(getMemberAssignOverload(l.host:typerep, top.env), l, d, r,
                                                host:rshEqExpr(_, _, location=_), rhs, top.location)
    | _                        -> nothing()
    end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case option1, getRshEqOverload(lhs.host:typerep, rhs.host:typerep, top.env),
                      getRshOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
        -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
          just(e), _, _                    -> e
        -- Option 2: Normal overloaded binary operators
        | nothing(), just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.host:typerep, prod, top.location)
        | nothing(), nothing(), nothing()  -> inj:rshEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  local option1::Maybe<host:Expr> =
    case lhs of
      arraySubscriptExpr(l, r) -> applyMaybe5(getSubscriptAssignOverload(l.host:typerep, top.env), l, r,
                                                host:andEqExpr(_, _, location=_), rhs, top.location)
    | memberExpr(l, d, r)      -> applyMaybe6(getMemberAssignOverload(l.host:typerep, top.env), l, d, r,
                                                host:andEqExpr(_, _, location=_), rhs, top.location)
    | _                        -> nothing()
    end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case option1, getAndEqOverload(lhs.host:typerep, rhs.host:typerep, top.env),
                      getAndOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
        -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
          just(e), _, _                    -> e
        -- Option 2: Normal overloaded binary operators
        | nothing(), just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.host:typerep, prod, top.location)
        | nothing(), nothing(), nothing()  -> inj:andEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  local option1::Maybe<host:Expr> =
    case lhs of
      arraySubscriptExpr(l, r) -> applyMaybe5(getSubscriptAssignOverload(l.host:typerep, top.env), l, r,
                                                host:xorEqExpr(_, _, location=_), rhs, top.location)
    | memberExpr(l, d, r)      -> applyMaybe6(getMemberAssignOverload(l.host:typerep, top.env), l, d, r,
                                                host:xorEqExpr(_, _, location=_), rhs, top.location)
    | _                        -> nothing()
    end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case option1, getXorEqOverload(lhs.host:typerep, rhs.host:typerep, top.env),
                      getXorOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
        -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
          just(e), _, _                    -> e
        -- Option 2: Normal overloaded binary operators
        | nothing(), just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.host:typerep, prod, top.location)
        | nothing(), nothing(), nothing()  -> inj:xorEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  local option1::Maybe<host:Expr> =
    case lhs of
      arraySubscriptExpr(l, r) -> applyMaybe5(getSubscriptAssignOverload(l.host:typerep, top.env), l, r,
                                                host:orEqExpr(_, _, location=_), rhs, top.location)
    | memberExpr(l, d, r)      -> applyMaybe6(getMemberAssignOverload(l.host:typerep, top.env), l, d, r,
                                                host:orEqExpr(_, _, location=_), rhs, top.location)
    | _                        -> nothing()
    end;

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case option1, getOrEqOverload(lhs.host:typerep, rhs.host:typerep, top.env),
                      getOrOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
        -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
          just(e), _, _                    -> e
        -- Option 2: Normal overloaded binary operators
        | nothing(), just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.host:typerep, prod, top.location)
        | nothing(), nothing(), nothing()  -> inj:orEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

-- for example, this is used to rewrite `x *= y;` as `x = x ovrldMul y;`
function expandAssign
host:Expr ::= lhs::host:Expr  rhs::host:Expr  ty::host:Type
              prod::(host:Expr ::= host:Expr host:Expr Location)  loc::Location
{
  local tmpName::String = "_tmp" ++ toString(genInt());

  -- ({${lhs.host:typerep} *${tmpName} = &${lhs}; *${tmpName} = *${tmpName} ${baseOp} ${rhs}})
  return
    host:stmtExpr(
      mkDecl(
        tmpName,
        host:pointerType(host:nilQualifier(), ty),
        host:unaryOpExpr(host:addressOfOp(location=loc), lhs, location=loc),
        loc),
      eqExpr(
        host:dereferenceExpr(
          host:declRefExpr(host:name(tmpName, location=loc), location=loc),
          location=loc),
        prod(
          host:dereferenceExpr(
            host:declRefExpr(host:name(tmpName, location=loc), location=loc),
            location=loc),
          rhs, loc),
        location=loc),
      location=loc);
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getAndOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:andExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getOrOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:orExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getAndBitOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:andBitExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getOrBitOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:orBitExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getXorOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:xorExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getLshOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:lshExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getRshOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:rshExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getEqualsOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:equalsExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getNotEqualsOverload(lhs.host:typerep, rhs.host:typerep, top.env), getEqualsOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
        -- explicit overload for !=
          just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        -- infer an overload for != from an overload for ==
        | nothing(), just(prod) -> unaryOpExpr(host:notOp(location=top.location), prod(modLhsRhs.fst, modLhsRhs.snd, top.location), location=top.location)
        | nothing(), nothing()  -> inj:notEqualsExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getGtOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:gtExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getLtOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:ltExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getGteOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:gteExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getLteOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:lteExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getAddOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:addExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getSubOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:subExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getMulOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:mulExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getDivOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:divExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
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

  forwards to
    host:wrapWarnExpr(lerrors,
      host:wrapQualifiedExpr(injectedQualifiers,
        case getModOverload(lhs.host:typerep, rhs.host:typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:modExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

