grammar edu:umn:cs:melt:exts:ableC:tables;

imports edu:umn:cs:melt:ableC:abstractsyntax as abs;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as abs;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;

imports silver:langutil;
imports silver:langutil:pp;

abstract production table
top::abs:Expr ::= trows::TableRows
{
 -- t.pp = concat( [text("table ("), line(), trows.pp, text(" )")] );

  forwards to 
    if !null(trows.errors) then
      abs:errorExpr(trows.errors, location=trows.location)
    else
      abs:stmtExpr(
        abs:foldStmt(trows.preDecls),
        disjunction(mapConjunction(transpose(trows.ftExprss))),
        location=top.location);
}

-- Table Rows --
----------------
nonterminal TableRows with pp, errors, ftExprss, rlen, location, env, preDecls;

synthesized attribute preDecls :: [abs:Stmt];
synthesized attribute ftExprss :: [[abs:Expr]];
synthesized attribute rlen :: Integer;

abstract production tableRowSnoc
top::TableRows ::= trowstail::TableRows  trow::TableRow
{
  top.pp = concat([trowstail.pp, line(), trow.pp]);

  top.errors := trowstail.errors ++ trow.errors;
  top.errors <-
    if trow.rlen == trowstail.rlen then [] else
      [err(trowstail.location,
        "The number of T,F,* entries in table row must be the same " ++
        "as the preceding rows")];

  top.rlen = trow.rlen;
  top.ftExprss = trowstail.ftExprss ++ [trow.ftExprs];
  top.preDecls = trowstail.preDecls ++ trow.preDecls;
}

abstract production tableRowOne
top::TableRows ::= trow::TableRow
{
  top.pp = trow.pp;
  top.errors := trow.errors;
  top.rlen = trow.rlen;
  top.ftExprss = [trow.ftExprs];
  top.preDecls = trow.preDecls;
}

-- Table Row --
---------------
nonterminal TableRow with pp, errors, ftExprs, rlen, location, env, preDecls;

synthesized attribute ftExprs :: [abs:Expr];

abstract production tableRow
top::TableRow ::= e::abs:Expr tvl::TruthFlagList
{
  top.pp = concat([e.pp, text(" : "), tvl.pp]);
  top.errors := e.errors;
  top.rlen = tvl.rlen;
  top.ftExprs = tvl.ftExprs;
  
  top.errors <-
    if abs:typeAssignableTo(abs:builtinType([], abs:boolType()), e.abs:typerep) then []
    else [err(e.location, "Condition expression expected type boolean (got " ++ abs:showType(e.abs:typerep) ++ ")")];
  
  -- Generate a name
  local ident :: abs:Name =
    abs:name("__table_condition_" ++ toString(genInt()), location = top.location);
  
  top.preDecls =
    [abs:declStmt(
      abs:variableDecls(
        [],
        [],
        abs:directTypeExpr(
          abs:builtinType([], abs:boolType())),
        abs:foldDeclarator([
          abs:declarator(
            ident,
            abs:baseTypeExpr(),
            [],
            abs:justInitializer(
              abs:exprInitializer(e))
          )
        ])
      )
    )]; -- _Bool ident = e;
  
  tvl.rowExpr = 
    abs:declRefExpr(ident, location=top.location);
}

-- Truth Value List
-------------------
nonterminal TruthFlagList with pp, rowExpr, ftExprs, rlen;

inherited attribute rowExpr :: abs:Expr;
-- the expression in the table row.  It is passed down to the TF*
-- values to be used in the translation to the host language.

abstract production tvlistCons
top::TruthFlagList ::= tv::TruthFlag  tvltail::TruthFlagList
{
  top.pp = concat([tv.pp, text(" "), tvltail.pp]);
  top.rlen = 1 + tvltail.rlen;
  top.ftExprs = tv.ftExpr :: tvltail.ftExprs;

  tv.rowExpr = top.rowExpr;
  tvltail.rowExpr = top.rowExpr;
}

abstract production tvlistOne
top::TruthFlagList ::= tv::TruthFlag
{
  top.pp = tv.pp;
  top.rlen = 1;
  top.ftExprs = [tv.ftExpr];
 
  tv.rowExpr = top.rowExpr;
}


-- Truth Values
---------------
nonterminal TruthFlag with pp, rowExpr, ftExpr;

synthesized attribute ftExpr :: abs:Expr;

abstract production tvTrue
top::TruthFlag ::=
{
  top.pp = text("T");
  top.ftExpr = top.rowExpr;
}

abstract production tvFalse
top::TruthFlag ::=
{
  top.pp = text("F");
  top.ftExpr = logicalNegate(top.rowExpr);
}

abstract production tvStar
top::TruthFlag ::=
{ 
  top.pp = text("*");
  top.ftExpr =
    abs:realConstant(
      abs:integerConstant("1", false, abs:noIntSuffix(), location=top.rowExpr.location),
      location=top.rowExpr.location);
}


-- Our AST construction helper functions

function logicalNegate
abs:Expr ::= ne::abs:Expr
{
  return
    abs:unaryOpExpr(
      abs:notOp(location=ne.location), 
      ne,
      location=ne.location);
}
function logicalOr
abs:Expr ::= e1::abs:Expr e2::abs:Expr
{
  return abs:binaryOpExpr(e1, op, e2, location=e1.location);
  
  local op :: abs:BinOp =
    abs:boolOp(abs:orBoolOp(location=e1.location), location=e1.location);
}
function logicalAnd
abs:Expr ::= e1::abs:Expr e2::abs:Expr
{
  return abs:binaryOpExpr(e1, op, e2, location=e1.location);
  
  local op :: abs:BinOp =
    abs:boolOp(abs:andBoolOp(location=e1.location), location=e1.location);
}

-- table helper functions
-------------------------
function disjunction
abs:Expr ::= es::[abs:Expr]
{
  return if length(es) == 1 then head(es)
         else logicalOr(head(es), disjunction(tail(es)));
}
function mapConjunction
[abs:Expr] ::= ess::[[abs:Expr]]
{
  return if null(ess) then [] 
         else cons(conjunction(head(ess)),
                     mapConjunction(tail(ess)));
}
function conjunction
abs:Expr ::= es::[abs:Expr]
{
  return if length(es) == 1 then head(es)
         else logicalAnd(head(es), conjunction(tail(es)));
}
function transpose
[[a]] ::= m::[[a]]
{
  return
    case m of
    | [] :: _ -> []
    | _       -> map(head,m) :: transpose(map(tail,m))
    end;
}

