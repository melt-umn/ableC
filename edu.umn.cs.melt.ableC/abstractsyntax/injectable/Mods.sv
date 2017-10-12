grammar edu:umn:cs:melt:ableC:abstractsyntax:injectable;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode, concat as ppConcat;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
import edu:umn:cs:melt:ableC:abstractsyntax;

nonterminal LhsOrRhsRuntimeMods with modLhs, modRhs, lhsToModify, rhsToModify;
synthesized attribute modLhs :: Expr;
synthesized attribute modRhs :: Expr;
autocopy attribute lhsToModify :: Expr;
autocopy attribute rhsToModify :: Expr;

abstract production consLhsOrRhsRuntimeMod
top::LhsOrRhsRuntimeMods ::= h::LhsOrRhsRuntimeMod  t::LhsOrRhsRuntimeMods
{
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
  -- TODO: copy lhs/rhs to temps to prevent being evaluated more than once
  local mods :: LhsOrRhsRuntimeMods = foldr(consLhsOrRhsRuntimeMod, nilLhsOrRhsRuntimeMod(), l);
  mods.lhsToModify = new(lhs);
  mods.rhsToModify = new(rhs);

  return pair(mods.modLhs, mods.modRhs);
}

nonterminal LhsOrRhsRuntimeMod with modLhs, modRhs, lhsToModify, rhsToModify;

abstract production lhsRuntimeMod
top::LhsOrRhsRuntimeMod ::= rm::RuntimeMod
{
  top.modLhs = rm.modExpr;
  top.modRhs = top.rhsToModify;

  rm.exprToModify = top.lhsToModify;
}

abstract production rhsRuntimeMod
top::LhsOrRhsRuntimeMod ::= rm::RuntimeMod
{
  top.modLhs = top.lhsToModify;
  top.modRhs = rm.modExpr;

  rm.exprToModify = top.rhsToModify;
}

nonterminal RuntimeMods with modExpr, exprToModify;
synthesized attribute modExpr :: Expr;
autocopy attribute exprToModify :: Expr;

abstract production consRuntimeMod
top::RuntimeMods ::= h::RuntimeMod  t::RuntimeMods
{
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
  local mods :: RuntimeMods = foldr(consRuntimeMod, nilRuntimeMod(), l);
  mods.exprToModify = new(e);

  return mods.modExpr;
}

nonterminal RuntimeMod with modExpr, exprToModify;

-- insert arbitrary boolean expressions and error message to print on exit if failed
abstract production runtimeCheck
top::RuntimeMod ::= check::(Expr ::= Expr)  failMessage::String  l::Location
{
  top.modExpr =
    stmtExpr(
      ifStmtNoElse(
        check(top.exprToModify),
        txtStmt(s"fprintf(stderr, \"${l.unparse}:${failMessage}\"); exit(255);")
      ),
      top.exprToModify,
      location=bogusLoc()
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
  top.modExpr = stmtExpr(ins(top.exprToModify), top.exprToModify, location=bogusLoc());
}

