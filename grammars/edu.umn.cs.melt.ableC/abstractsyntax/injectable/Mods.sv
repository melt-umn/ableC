grammar edu:umn:cs:melt:ableC:abstractsyntax:injectable;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode, concat as ppConcat;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
import edu:umn:cs:melt:ableC:abstractsyntax:host;

tracked nonterminal LhsOrRhsRuntimeMods with modLhs, modRhs, lhsToModify, rhsToModify;
synthesized attribute modLhs :: Expr;
synthesized attribute modRhs :: Expr;

inherited attribute lhsToModify :: Expr;
inherited attribute rhsToModify :: Expr;

abstract production consLhsOrRhsRuntimeMod
top::LhsOrRhsRuntimeMods ::= h::LhsOrRhsRuntimeMod  t::LhsOrRhsRuntimeMods
{
  t.lhsToModify = top.lhsToModify;
  t.rhsToModify = top.rhsToModify;

  h.lhsToModify = t.modLhs;
  h.rhsToModify = t.modRhs;

  top.modLhs = h.modLhs;
  top.modRhs = h.modRhs;
}

abstract production nilLhsOrRhsRuntimeMod
top::LhsOrRhsRuntimeMods ::=
{
  top.modLhs = top.lhsToModify;
  top.modRhs = top.rhsToModify;
}

function applyLhsRhsMods
Pair<Expr Expr> ::= l::[LhsOrRhsRuntimeMod]  lhs::Decorated Expr  rhs::Decorated Expr
{
  local tmpLhsName :: String = "_tmpLhs" ++ toString(genInt());
  local tmpLhs :: Expr = declRefExpr(name(tmpLhsName));
  local tmpRhsName :: String = "_tmpRhs" ++ toString(genInt());
  local tmpRhs :: Expr = declRefExpr(name(tmpRhsName));

  local mods :: LhsOrRhsRuntimeMods = foldr(consLhsOrRhsRuntimeMod, nilLhsOrRhsRuntimeMod(), l);
  mods.lhsToModify = tmpLhs;
  mods.rhsToModify = tmpRhs;

  -- copy lhs/rhs to tmps to prevent being evaluated more than once
  local modLhs :: Expr =
    if null(filter((.isLhs), l))
    then new(lhs)
    else
      stmtExpr(
        mkDecl(tmpLhsName, lhs.typerep, new(lhs)),
        mods.modLhs
      );

  local modRhs :: Expr =
    if null(filter(\m::LhsOrRhsRuntimeMod -> !m.isLhs, l))
    then new(rhs)
    else
      stmtExpr(
        mkDecl(tmpRhsName, rhs.typerep, new(rhs)),
        mods.modRhs
      );

  return (modLhs, modRhs);
}

tracked nonterminal LhsOrRhsRuntimeMod with modLhs, modRhs, isLhs, lhsToModify, rhsToModify;
synthesized attribute isLhs :: Boolean;

abstract production lhsRuntimeMod
top::LhsOrRhsRuntimeMod ::= rm::RuntimeMod
{
  top.modLhs = rm.modExpr;
  top.modRhs = top.rhsToModify;
  top.isLhs = true;

  rm.exprToModify = top.lhsToModify;
}

abstract production rhsRuntimeMod
top::LhsOrRhsRuntimeMod ::= rm::RuntimeMod
{
  top.modLhs = top.lhsToModify;
  top.modRhs = rm.modExpr;
  top.isLhs = false;

  rm.exprToModify = top.rhsToModify;
}

tracked nonterminal RuntimeMods with modExpr, exprToModify;
synthesized attribute modExpr :: Expr;
inherited attribute exprToModify :: Expr;

abstract production consRuntimeMod
top::RuntimeMods ::= h::RuntimeMod  t::RuntimeMods
{
  t.exprToModify = top.exprToModify;
  h.exprToModify = t.modExpr;
  top.modExpr = h.modExpr;
}

abstract production nilRuntimeMod
top::RuntimeMods ::=
{
  top.modExpr = top.exprToModify;
}

function applyMods
Expr ::= l::[RuntimeMod] e::Decorated Expr
{
  local tmpName :: String = "_tmp" ++ toString(genInt());
  local tmpDecl :: Stmt = mkDecl(tmpName, e.typerep, new(e));

  local mods :: RuntimeMods = foldr(consRuntimeMod, nilRuntimeMod(), l);
  mods.exprToModify = declRefExpr(name(tmpName));

  local modExpr :: Expr =
    if null(l) then new(e)
    else stmtExpr(tmpDecl, mods.modExpr);

  return modExpr;
}

tracked nonterminal RuntimeMod with modExpr, exprToModify;

-- insert arbitrary boolean expressions and error message to print on exit if failed
abstract production runtimeCheck
top::RuntimeMod ::= check::(Expr ::= Expr)  failMessage::String
{
  top.modExpr =
    stmtExpr(
      ifStmtNoElse(
        check(top.exprToModify),
        seqStmt(
          exprStmt(
            directCallExpr(
              name("fprintf"),
              foldExpr(
                [declRefExpr(name("stderr")),
                 mkStringConst(s"${getParsedOriginLocationOrFallback(ambientOrigin()).unparse}:${failMessage}")]))),
          exprStmt(
            directCallExpr(
              name("exit"),
              foldExpr([mkIntConst(255)]))))
      ),
      top.exprToModify
    );
}

-- wrap expr using provided function
abstract production runtimeConversion
top::RuntimeMod ::= conv::(Expr ::= Expr)
{
  top.modExpr = conv(top.exprToModify);
}

-- insert arbitrary code in stmtExpr that returns expr unchanged
abstract production runtimeInsertion
top::RuntimeMod ::= ins::(Stmt ::= Expr)
{
  top.modExpr = stmtExpr(ins(top.exprToModify), top.exprToModify);
}

