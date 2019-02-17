grammar edu:umn:cs:melt:tutorials:ableC:prefixExpr:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;

-- Bridge production from host abstract syntax to extension abstract syntax
abstract production prefixExpr
top::Expr ::= pe::PrefixExpr
{
  top.pp = pp"prefix (${pe.pp})";
  propagate substituted;

  -- Check for errors on the EDSL AST
  -- Either forward to an error production or the computed translation
  forwards to mkErrorCheck(pe.errors, pe.toExpr);
}

-- New attribute to compute the translation of a PrefixExpr to an Expr
synthesized attribute toExpr::Expr;

nonterminal PrefixExpr with location, pp, toExpr, typerep, errors, env, returnType;

abstract production addPrefixExpr
top::PrefixExpr ::= pe1::PrefixExpr pe2::PrefixExpr
{
  top.pp = pp"+ ${pe1.pp} ${pe2.pp}";
  top.toExpr = addExpr(pe1.toExpr, pe2.toExpr, location=top.location);
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
  top.toExpr = subExpr(pe1.toExpr, pe2.toExpr, location=top.location);
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
  top.toExpr = mulExpr(pe1.toExpr, pe2.toExpr, location=top.location);
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
  top.toExpr = divExpr(pe1.toExpr, pe2.toExpr, location=top.location);
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