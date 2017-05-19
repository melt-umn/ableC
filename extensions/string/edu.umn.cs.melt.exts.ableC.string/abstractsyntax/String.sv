grammar edu:umn:cs:melt:exts:ableC:string:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;
imports edu:umn:cs:melt:ableC:abstractsyntax:overload as ovrld;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

--imports edu:umn:cs:melt:exts:ableC:gc;

global builtin::Location = builtinLoc("string");

aspect production addOp
top::NumOp ::=
{
  lOverloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:string:string",
       \ lhs::Expr rhs::Expr ->
         appendString(lhs, strExpr(rhs, location=top.location), location=top.location))];
  rOverloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:string:string",
       \ lhs::Expr rhs::Expr ->
         appendString(strExpr(lhs, location=top.location), rhs, location=top.location))];
}

aspect production subOp
top::NumOp ::=
{
  lOverloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:string:string",
       \ lhs::Expr rhs::Expr ->
         removeString(lhs, strExpr(rhs, location=top.location), location=top.location))];
}

aspect production mulOp
top::NumOp ::=
{
  lOverloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:string:string",
       repeatString(_, _, location=top.location))];
}

aspect production equalsOp
top::CompareOp ::=
{
  lOverloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:string:string",
       \ lhs::Expr rhs::Expr ->
         eqString(lhs, strExpr(rhs, location=top.location), location=top.location))];
  rOverloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:string:string",
       \ lhs::Expr rhs::Expr ->
         eqString(strExpr(lhs, location=top.location), rhs, location=top.location))];
}

aspect production eqOp
top::AssignOp ::=
{
  lOverloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:string:string",
       assignString(_, _, location=top.location))];
}

aspect production ovrld:callExpr
top::Expr ::= f::Expr  a::Exprs
{
  memberOverloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:string:string",
       memberCallString(_, _, _, a, location=top.location))];
}

aspect production ovrld:arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  overloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:string:string",
       subscriptString(lhs, rhs, location=top.location))];
}

aspect production assignOp
top::BinOp ::= op::AssignOp
{
  subscriptOverloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:string:string",
       \ l::Expr i::Expr r::Expr ->
         errorExpr(
           [err(top.location, "Strings are immutable, cannot assign to index")],
           location=top.location))];
  memberOverloads <-
    [pair(
       "edu:umn:cs:melt:exts:ableC:string:string",
       \ l::Expr d::Boolean m::Name r::Expr ->
         errorExpr(
           [err(top.location, s"Cannot assign to field ${m.name} of string")],
           location=top.location))];
}

abstract production showExpr
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"show(${e.pp})";

  production attribute overloads::[Pair<String Expr>] with ++;
  overloads :=
    [pair("edu:umn:cs:melt:exts:ableC:string:string", showString(e, location=top.location))];
  
  local localErrors::[Message] = e.errors;
  local resolved::Maybe<Expr> =
    case moduleName(e.env, e.typerep) of
      just(n) -> lookupBy(stringEq, n, overloads)
    | nothing() -> nothing()
    end;
  local fwrd::Expr = fromMaybe(showHost(e, location=top.location), resolved);
  
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production showHost
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"show(${e.pp})";
  
  local localErrors::[Message] = e.errors;
  local fwrd::Expr =
    case e.typerep.showProd of
      just(p) -> p(e, top.location)
    | nothing() -> errorExpr([err(e.location, s"show of ${showType(e.typerep)} not defined")], location=top.location)
    end;
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production showString
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"show(${e.pp})";
  
  local localErrors::[Message] =
    checkStringHeaderDef("showString", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("showString", location=builtin),
      consExpr(e, nilExpr()),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production showCharPointer
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"show(${e.pp})";
  
  local localErrors::[Message] =
    checkStringHeaderDef("showCharPointer", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("showCharPointer", location=builtin),
      consExpr(e, nilExpr()),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production showChar
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"show(${e.pp})";
  
  local localErrors::[Message] =
    checkStringHeaderDef("showChar", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("showChar", location=builtin),
      consExpr(e, nilExpr()),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production showInt
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"show(${e.pp})";
  
  local localErrors::[Message] =
    checkStringHeaderDef("showInt", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("showInt", location=builtin),
      consExpr(e, nilExpr()),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production showFloat
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"show(${e.pp})";
  
  local localErrors::[Message] =
    checkStringHeaderDef("showFloat", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("showFloat", location=builtin),
      consExpr(e, nilExpr()),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production showPointer
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"show(${e.pp})";
  
  local localErrors::[Message] =
    checkStringHeaderDef("_showPointer", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("_showPointer", location=builtin),
      consExpr(
        stringLiteral(s"\"${showType(e.typerep)}\"", location=builtin),
        consExpr(
          e,
          nilExpr())),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production strExpr
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"str(${e.pp})";

  production attribute overloads::[Pair<String Expr>] with ++;
  overloads :=
    [pair("edu:umn:cs:melt:exts:ableC:string:string", strString(e, location=top.location))];
  
  local localErrors::[Message] = e.errors;
  local resolved::Maybe<Expr> =
    case moduleName(e.env, e.typerep) of
      just(n) -> lookupBy(stringEq, n, overloads)
    | nothing() -> nothing()
    end;
  local fwrd::Expr = fromMaybe(strHost(e, location=top.location), resolved);
  
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production strHost
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"str(${e.pp})";
  
  local localErrors::[Message] = e.errors;
  local fwrd::Expr =
    case e.typerep.strProd of
      just(p) -> p(e, top.location)
    | nothing() -> errorExpr([err(e.location, s"str of ${showType(e.typerep)} not defined")], location=top.location)
    end;
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production strString
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"str(${e.pp})";
  
  forwards to e;
}

abstract production strCharPointer
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"str(${e.pp})";
  
  local localErrors::[Message] =
    checkStringHeaderDef("strCharPointer", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("strCharPointer", location=builtin),
      consExpr(e, nilExpr()),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production strChar
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"str(${e.pp})";
  
  local localErrors::[Message] =
    checkStringHeaderDef("strChar", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("strChar", location=builtin),
      consExpr(e, nilExpr()),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production strPointer
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"str(${e.pp})";
  
  local localErrors::[Message] =
    checkStringHeaderDef("strPointer", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("strPointer", location=builtin),
      consExpr(e, nilExpr()),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production assignString
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate substituted;
  top.pp = pp"${lhs.pp} = ${rhs.pp}";
  
  forwards to
    binaryOpExpr(
      lhs,
      assignOp(eqOp(location=builtin), location=builtin),
      strExpr(rhs, location=builtin),
      location=builtin);
}

abstract production appendString
top::Expr ::= e1::Expr e2::Expr
{
  propagate substituted;
  top.pp = pp"${e1.pp} + ${e2.pp}";
  
  local localErrors::[Message] =
    checkStringHeaderDef("_append_string", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("_append_string", location=builtin),
      consExpr(
        strExpr(e1, location=builtin),
        consExpr(
          strExpr(e2, location=builtin),
          nilExpr())),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production removeString
top::Expr ::= e1::Expr e2::Expr
{
  propagate substituted;
  top.pp = pp"${e1.pp} - ${e2.pp}";
  
  local localErrors::[Message] =
    checkStringHeaderDef("_remove_string", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("_remove_string", location=builtin),
      consExpr(
        strExpr(e1, location=builtin),
        consExpr(
          strExpr(e2, location=builtin),
          nilExpr())),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production repeatString
top::Expr ::= e1::Expr e2::Expr
{
  propagate substituted;
  top.pp = pp"${e1.pp} * ${e2.pp}";
  
  local localErrors::[Message] =
    checkStringHeaderDef("_repeat_string", top.location, top.env) ++
    if e2.typerep.isIntegerType
    then []
    else [err(e2.location, s"String repeat must have integer type, but got ${showType(e2.typerep)}")];
  local fwrd::Expr =
    directCallExpr(
      name("_repeat_string", location=builtin),
      consExpr(e1, consExpr(e2, nilExpr())),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production eqString
top::Expr ::= e1::Expr e2::Expr
{
  propagate substituted;
  top.pp = pp"${e1.pp} == ${e2.pp}";
  
  local localErrors::[Message] =
    checkStringHeaderDef("_eq_string", top.location, top.env);
  local fwrd::Expr =
    directCallExpr(
      name("_eq_string", location=builtin),
      consExpr(e1, consExpr(e2, nilExpr())),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production subscriptString
top::Expr ::= e1::Expr e2::Expr
{
  propagate substituted;
  top.pp = pp"${e1.pp}[${e2.pp}]";
  
  local localErrors::[Message] =
    checkStringHeaderDef("_index_string", top.location, top.env) ++
    if e2.typerep.isIntegerType
    then []
    else [err(e2.location, s"String index must have integer type, but got ${showType(e2.typerep)}")];
  local fwrd::Expr =
    directCallExpr(
      name("_index_string", location=builtin),
      consExpr(e1, consExpr(e2, nilExpr())),
      location=builtin);
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production memberCallString
top::Expr ::= lhs::Expr deref::Boolean rhs::Name a::Exprs
{
  propagate substituted;
  
  forwards to
    case deref, rhs.name of
      _, "substring" -> substringString(lhs, a, location=top.location)
    | _, n -> errorExpr([err(rhs.location, s"String does not have field ${n}")], location=top.location)
    end;
}

abstract production substringString
top::Expr ::= e1::Expr a::Exprs
{
  propagate substituted;
  top.pp = pp"${e1.pp}.substring(${ppImplode(pp", ", a.pps)}";
  
  a.expectedTypes = -- size_t
    [builtinType([], unsignedType(longType())),
     builtinType([], unsignedType(longType()))];
  a.argumentPosition = 1;
  a.callExpr = top; -- Doesn't really matter, just needs location
  a.callVariadic = false;
  local localErrors::[Message] =
    checkStringHeaderDef("_substring", top.location, top.env) ++
    a.argumentErrors;
  local fwrd::Expr =
    directCallExpr(
      name("_substring", location=builtin),
      consExpr(e1, a),
      location=builtin);
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
