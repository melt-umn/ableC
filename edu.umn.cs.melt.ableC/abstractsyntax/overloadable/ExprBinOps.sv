grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

import edu:umn:cs:melt:ableC:abstractsyntax:construction;

import edu:umn:cs:melt:ableC:abstractsyntax:injectable only LhsOrRhsRuntimeMod, applyLhsRhsMods;
import edu:umn:cs:melt:ableC:abstractsyntax:injectable as inj;

abstract production eqExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly
  local modLhsRhs :: Pair<Expr Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [Qualifier] with ++;
  injectedQualifiers := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  -- TODO: overload subscript/member on all assign exprs
  local option1::Maybe<Expr> =
    case lhs of
      arraySubscriptExpr(l, r) -> applyMaybe4(getSubscriptAssignOverload(l.typerep, top.env), l, r, rhs, top.location)
    | memberExpr(l, d, r)      -> applyMaybe5(getMemberAssignOverload(l.typerep, top.env), l, d, r, rhs, top.location)
    | _                        -> nothing()
    end;

  forwards to
    wrapWarnExpr(lerrors,
      wrapQualifiedExpr(injectedQualifiers,
        case option1, getEqOverload(lhs.typerep, rhs.typerep, top.env) of
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
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getMulEqOverload(lhs.typerep, rhs.typerep, top.env), getMulOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.typerep, prod, top.location)
        | nothing(), nothing()  -> inj:mulEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production divEqExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getDivEqOverload(lhs.typerep, rhs.typerep, top.env), getDivOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.typerep, prod, top.location)
        | nothing(), nothing()  -> inj:divEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production modEqExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getModEqOverload(lhs.typerep, rhs.typerep, top.env), getModOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.typerep, prod, top.location)
        | nothing(), nothing()  -> inj:modEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production addEqExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("+="), space(), rhs.pp]) );
  production attribute lerrors :: [Message] with ++;
  lerrors := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly
  local modLhsRhs :: Pair<Expr Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute injectedQualifiers :: [Qualifier] with ++;
  injectedQualifiers := case top.env, top.returnType of emptyEnv_i(), nothing() -> [] | _, _ -> [] end; -- TODO: seed flow type properly

  local option1::Maybe<Expr> =
    case lhs of
      arraySubscriptExpr(l, r) -> applyMaybe4(getSubscriptAddAssignOverload(l.typerep, top.env), l, r, rhs, top.location)
    | memberExpr(l, d, r)      -> applyMaybe5(getMemberAddAssignOverload(l.typerep, top.env), l, d, r, rhs, top.location)
    | _                        -> nothing()
    end;

  forwards to
    wrapWarnExpr(lerrors,
      wrapQualifiedExpr(injectedQualifiers,
        case option1, getAddEqOverload(lhs.typerep, rhs.typerep, top.env),
                      getAddOverload(lhs.typerep, rhs.typerep, top.env) of
        -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
          just(e), _, _                    -> e
        -- Option 2: Normal overloaded binary operators
        | nothing(), just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.typerep, prod, top.location)
        | nothing(), nothing(), nothing()  -> inj:addEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production subEqExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getSubEqOverload(lhs.typerep, rhs.typerep, top.env), getSubOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.typerep, prod, top.location)
        | nothing(), nothing()  -> inj:subEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production lshEqExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getLshEqOverload(lhs.typerep, rhs.typerep, top.env), getLshOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.typerep, prod, top.location)
        | nothing(), nothing()  -> inj:lshEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production rshEqExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getRshEqOverload(lhs.typerep, rhs.typerep, top.env), getRshOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.typerep, prod, top.location)
        | nothing(), nothing()  -> inj:rshEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production andEqExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getAndEqOverload(lhs.typerep, rhs.typerep, top.env), getAndOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.typerep, prod, top.location)
        | nothing(), nothing()  -> inj:andEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production xorEqExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getXorEqOverload(lhs.typerep, rhs.typerep, top.env), getXorOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.typerep, prod, top.location)
        | nothing(), nothing()  -> inj:xorEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production orEqExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getOrEqOverload(lhs.typerep, rhs.typerep, top.env), getOrOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing(), just(prod) -> expandAssign(modLhsRhs.fst, modLhsRhs.snd, lhs.typerep, prod, top.location)
        | nothing(), nothing()  -> inj:orEqExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

-- for example, this is used to rewrite `x *= y;` as `x = x ovrldMul y;`
function expandAssign
Expr ::= lhs::Expr  rhs::Expr  ty::Type  prod::(Expr ::= Expr Expr Location)  loc::Location
{
  local tmpName::String = "_tmp" ++ toString(genInt());

  -- ({${lhs.typerep} *${tmpName} = &${lhs}; *${tmpName} = *${tmpName} ${baseOp} ${rhs}})
  return
    stmtExpr(
      mkDecl(
        tmpName,
        pointerType(nilQualifier(), ty),
        unaryOpExprDefault(addressOfOp(location=loc), lhs, location=loc),
        loc),
      eqExpr(
        dereferenceExprDefault(
          declRefExpr(name(tmpName, location=loc), location=loc),
          location=loc),
        prod(
          dereferenceExprDefault(
            declRefExpr(name(tmpName, location=loc), location=loc),
            location=loc),
          rhs, loc),
        location=loc),
      location=loc);
}

-- TODO: Automatic equations with DeMorgan's Laws?  

abstract production andExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getAndOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:andExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production orExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getOrOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:orExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production andBitExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getAndBitOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:andBitExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production orBitExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getOrBitOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:orBitExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production xorExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getXorOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:xorExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production lshExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getLshOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:lshExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production rshExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getRshOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:rshExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production equalsExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getEqualsOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:equalsExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production notEqualsExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getNotEqualsOverload(lhs.typerep, rhs.typerep, top.env), getEqualsOverload(lhs.typerep, rhs.typerep, top.env) of
        -- explicit overload for !=
          just(prod), _         -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        -- infer an overload for != from an overload for ==
        | nothing(), just(prod) -> unaryOpExpr(notOp(location=top.location), prod(modLhsRhs.fst, modLhsRhs.snd, top.location), location=top.location)
        | nothing(), nothing()  -> inj:notEqualsExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production gtExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getGtOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:gtExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production ltExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getLtOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:ltExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production gteExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getGteOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:gteExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production lteExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getLteOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:lteExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production addExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getAddOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:addExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production subExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getSubOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:subExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production mulExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getMulOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:mulExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production divExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getDivOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:divExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

abstract production modExpr
top::Expr ::= lhs::Expr  rhs::Expr
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
        case getModOverload(lhs.typerep, rhs.typerep, top.env) of
          just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
        | nothing()  -> inj:modExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
        end,
        top.location),
      top.location);
}

