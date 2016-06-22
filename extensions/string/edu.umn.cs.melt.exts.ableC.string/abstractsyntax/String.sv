grammar edu:umn:cs:melt:exts:ableC:string:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode ;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

--imports edu:umn:cs:melt:exts:ableC:gc;

abstract production showExpr
top::Expr ::= e::Expr
{
  top.typerep = stringType();
  forwards to
    case e.typerep.showProd of
      just(p) -> p(e, top.location)
    | nothing() -> errorExpr([err(e.location, s"show representation of ${showType(e.typerep)} not defined")], location=top.location)
    end;
}

abstract production showString
top::Expr ::= e::Expr
{
  local localErrors::[Message] =
    checkStringHeaderDef("showString", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("showString", location=builtIn()),
      consExpr(e, nilExpr()),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production showChar
top::Expr ::= e::Expr
{
  local localErrors::[Message] =
    checkStringHeaderDef("showChar", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("showChar", location=builtIn()),
      consExpr(e, nilExpr()),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production showInt
top::Expr ::= e::Expr
{
  local localErrors::[Message] =
    checkStringHeaderDef("showInt", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("showInt", location=builtIn()),
      consExpr(e, nilExpr()),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production showFloat
top::Expr ::= e::Expr
{
  local localErrors::[Message] =
    checkStringHeaderDef("showFloat", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("showFloat", location=builtIn()),
      consExpr(e, nilExpr()),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production showPointer
top::Expr ::= e::Expr
{
  local localErrors::[Message] =
    checkStringHeaderDef("_showPointer", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("_showPointer", location=builtIn()),
      consExpr(
        stringLiteral(s"\"${showType(e.typerep)}\"", location=top.location),
        consExpr(
          e,
          nilExpr())),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production strExpr
top::Expr ::= e::Expr
{
  top.typerep = stringType();
  forwards to
    case e.typerep.strProd of
      just(p) -> p(e, top.location)
    | nothing() -> errorExpr([err(e.location, s"str of ${showType(e.typerep)} not defined")], location=top.location)
    end;
}

abstract production strString
top::Expr ::= e::Expr
{
  top.typerep = stringType();
  forwards to e;
}

abstract production strChar
top::Expr ::= e::Expr
{
  local localErrors::[Message] =
    checkStringHeaderDef("strChar", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("strChar", location=builtIn()),
      consExpr(e, nilExpr()),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production assignString
top::Expr ::= lhs::Expr rhs::Expr
{
  forwards to
    binaryOpExpr(
      lhs,
      assignOp(eqOp(location=builtIn()), location=builtIn()),
      strExpr(rhs, location=builtIn()),
      location=builtIn());
}

abstract production appendString
top::Expr ::= e1::Expr e2::Expr
{
  local localErrors::[Message] =
    checkStringHeaderDef("_append_string", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("_append_string", location=builtIn()),
      consExpr(
        strExpr(e1, location=builtIn()),
        consExpr(
          strExpr(e2, location=builtIn()),
          nilExpr())),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production removeString
top::Expr ::= e1::Expr e2::Expr
{
  local localErrors::[Message] =
    checkStringHeaderDef("_remove_string", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("_remove_string", location=builtIn()),
      consExpr(
        strExpr(e1, location=builtIn()),
        consExpr(
          strExpr(e2, location=builtIn()),
          nilExpr())),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production repeatString
top::Expr ::= e1::Expr e2::Expr
{
  local localErrors::[Message] =
    checkStringHeaderDef("_repeat_string", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("_repeat_string", location=builtIn()),
      consExpr(e1, consExpr(e2, nilExpr())),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production eqString
top::Expr ::= e1::Expr e2::Expr
{
  local localErrors::[Message] =
    checkStringHeaderDef("_eq_string", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("_eq_string", location=builtIn()),
      consExpr(e1, consExpr(e2, nilExpr())),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production subscriptString
top::Expr ::= e1::Expr e2::Expr
{
  local localErrors::[Message] =
    checkStringHeaderDef("_index_string", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("_index_string", location=builtIn()),
      consExpr(e1, consExpr(e2, nilExpr())),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production subscriptAssignString
top::Expr ::= e1::Expr e2::Expr op::AssignOp e3::Expr
{
  local localErrors::[Message] =
    checkStringHeaderDef("_check_index_string", top.location, top.env);
  local fwrd::Expr =
    stmtExpr(
      exprStmt(
        directCallExpr(
          name("_check_index_string", location=builtIn()),
          consExpr(e1, consExpr(e2, nilExpr())),
          location=top.location)),
        binaryOpExpr(
          arraySubscriptExpr(
            e1, e2,
            location=builtIn()),
          assignOp(op, location=builtIn()),
          e3,
          location=builtIn()),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production substringString
top::Expr ::= e1::Expr a::Exprs
{
  -- TODO: check arg types
  local localErrors::[Message] =
    checkStringHeaderDef("_substring", top.location, top.env) ++
    if a.count != 2
    then [err(top.location, s"Invalid number of arguments to substring: expected 2, got ${toString(a.count)}")]
    else [];
  local fwrd::Expr =
    directCallExpr(
      name("_substring", location=builtIn()),
      consExpr(e1, a),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production lengthString
top::Expr ::= e1::Expr
{
  local localErrors::[Message] =
    checkStringHeaderDef("strlen", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("strlen", location=builtIn()),
      consExpr(e1, nilExpr()),
      location=top.location);
  forwards to mkErrorCheck(localErrors, fwrd);
}

-- Check the given env for the given function name
function checkStringHeaderDef
[Message] ::= n::String loc::Location env::Decorated Env
{
  return
    if !null(lookupValue(n, env))
    then []
    else [err(loc, "Missing include of string.xh")];
}

{-
 - New location for expressions which don't have real locations
 -}
abstract production builtIn
top::Location ::=
{
  forwards to loc("Built In", 0, 0, 0, 0, 0, 0);
}