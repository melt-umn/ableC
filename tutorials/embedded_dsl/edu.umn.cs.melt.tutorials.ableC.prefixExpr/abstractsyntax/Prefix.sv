grammar edu:umn:cs:melt:tutorials:ableC:prefixExpr:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;

abstract production prefixExpr
top::Expr ::= pe::PrefixExpr
{
  forwards to mkErrorCheck(pe.errors, pe.toExpr);
}

synthesized attribute toExpr::Expr;

nonterminal PrefixExpr with location, pp, toExpr, typerep, errors, env, returnType;

abstract production addPrefixExpr
top::PrefixExpr ::= pe1::PrefixExpr pe2::PrefixExpr
{
  top.pp = pp"+ ${pe1.pp} ${pe2.pp}";
  top.toExpr =
    binaryOpExpr(
      pe1.toExpr,
      numOp(addOp(location=top.location), location=top.location),
      pe2.toExpr,
      location=top.location);
  top.typerep = usualAdditiveConversionsOnTypes(pe1.typerep, pe2.typerep);
  top.errors := pe1.errors ++ pe2.errors;

  top.errors <-
    case pe1.typerep, pe2.typerep, top.typerep of
    | errorType(), _, _ -> []
    | _, errorType(), _ -> []
    | t1, t2, errorType() -> [err(top.location, s"Invalid parameter types to prefix + (got ${showType(t1)}, ${showType(t2)})")]
    | _, _, _ -> []
    end;
}

abstract production subPrefixExpr
top::PrefixExpr ::= pe1::PrefixExpr pe2::PrefixExpr
{
  top.pp = pp"- ${pe1.pp} ${pe2.pp}";
  top.toExpr =
    binaryOpExpr(
      pe1.toExpr,
      numOp(subOp(location=top.location), location=top.location),
      pe2.toExpr,
      location=top.location);
  top.typerep = usualSubtractiveConversionsOnTypes(pe1.typerep, pe2.typerep);
  top.errors := pe1.errors ++ pe2.errors;

  top.errors <-
    case pe1.typerep, pe2.typerep, top.typerep of
    | errorType(), _, _ -> []
    | _, errorType(), _ -> []
    | t1, t2, errorType() -> [err(top.location, s"Invalid parameter types to prefix - (got ${showType(t1)}, ${showType(t2)})")]
    | _, _, _ -> []
    end;
}

abstract production mulPrefixExpr
top::PrefixExpr ::= pe1::PrefixExpr pe2::PrefixExpr
{
  top.pp = pp"* ${pe1.pp} ${pe2.pp}";
  top.toExpr =
    binaryOpExpr(
      pe1.toExpr,
      numOp(mulOp(location=top.location), location=top.location),
      pe2.toExpr,
      location=top.location);
  top.typerep = usualArithmeticConversionsOnTypes(pe1.typerep, pe2.typerep);
  top.errors := pe1.errors ++ pe2.errors;

  top.errors <-
    case pe1.typerep, pe2.typerep, top.typerep of
    | errorType(), _, _ -> []
    | _, errorType(), _ -> []
    | t1, t2, errorType() -> [err(top.location, s"Invalid parameter types to prefix * (got ${showType(t1)}, ${showType(t2)})")]
    | _, _, _ -> []
    end;
}

abstract production divPrefixExpr
top::PrefixExpr ::= pe1::PrefixExpr pe2::PrefixExpr
{
  top.pp = pp"/ ${pe1.pp} ${pe2.pp}";
  top.toExpr =
    binaryOpExpr(
      pe1.toExpr,
      numOp(divOp(location=top.location), location=top.location),
      pe2.toExpr,
      location=top.location);
  top.typerep = usualArithmeticConversionsOnTypes(pe1.typerep, pe2.typerep);
  top.errors := pe1.errors ++ pe2.errors;

  top.errors <-
    case pe1.typerep, pe2.typerep, top.typerep of
    | errorType(), _, _ -> []
    | _, errorType(), _ -> []
    | t1, t2, errorType() -> [err(top.location, s"Invalid parameter types to prefix / (got ${showType(t1)}, ${showType(t2)})")]
    | _, _, _ -> []
    end;
}

abstract production exprPrefixExpr
top::PrefixExpr ::= e::Expr
{
  top.pp = parens(e.pp);
  top.toExpr = e;
  top.typerep = e.typerep;
  top.errors := e.errors;
}

global builtin::Location = builtinLoc("prefix");