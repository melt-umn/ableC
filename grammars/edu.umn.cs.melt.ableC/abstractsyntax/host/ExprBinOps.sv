grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

import core:monad;

abstract production eqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs, top.location);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production mulEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("*="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs, top.location);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production divEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("/="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs, top.location);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production modEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("%="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs, top.location);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production addEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("+="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs, top.location);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production subEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("-="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs, top.location);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production lshEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs, top.location);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production rshEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs, top.location);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production andEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("&="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs, top.location);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production xorEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("^="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs, top.location);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production orEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("|="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs, top.location);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

function assignErrors
[Message] ::= lhs::Decorated Expr  rhs::Decorated Expr  loc::Location
{
	return
    (if typeAssignableTo(lhs.typerep, rhs.typerep)
     then
       (if containsQualifier(constQualifier(location=bogusLoc()), lhs.typerep)
        then [err(loc, "Assignment of read-only variable")]
        else []) ++
       case lhs.typerep of
         extType(_, refIdExtType(_, _, refId)) ->
           case lookupRefId(refId, lhs.env) of
             item :: _ ->
               if item.hasConstField
               then [err(loc, s"Assignment of read-only variable (${show(80, lhs.pp)} has const fields)")]
               else []
           | [] -> []
           end 
       | _ -> []
       end
     else [err(loc, "Incompatible type in rhs of assignment, expected " ++ showType(lhs.typerep) ++ " but found " ++ showType(rhs.typerep))]) ++
    if lhs.isLValue then []
      else [err(lhs.location, "lvalue required as left operand of assignment")];
}

abstract production andExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("&&"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return if i1 != 0 && i2 != 0 then 1 else 0;
    };
}

abstract production orExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("||"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return if i1 != 0 || i2 != 0 then 1 else 0;
    };
}

abstract production andBitExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("&"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return fromBits(zipWithPad(\ a::Boolean b::Boolean -> a && b, false, toBits(i1), toBits(i2)));
    };
}

abstract production orBitExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("|"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return fromBits(zipWithPad(\ a::Boolean b::Boolean -> a || b, false, toBits(i1), toBits(i2)));
    };
}

abstract production xorExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("^"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return fromBits(zipWithPad(\ a::Boolean b::Boolean -> (a && !b) || (!a && b), false, toBits(i1), toBits(i2)));
    };
}

abstract production lshExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return foldr(\ Unit i::Integer -> i * 2, i1, repeat(unit(), i2));
    };
}

abstract production rshExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return foldr(\ Unit i::Integer -> i / 2, i1, repeat(unit(), i2));
    };
}

abstract production equalsExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("=="), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return if i1 == i2 then 1 else 0;
    };
}

abstract production notEqualsExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("!="), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return if i1 != i2 then 1 else 0;
    };
}

abstract production gtExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text(">"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return if i1 > i2 then 1 else 0;
    };
}

abstract production ltExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("<"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return if i1 < i2 then 1 else 0;
    };
}

abstract production gteExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text(">="), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return if i1 >= i2 then 1 else 0;
    };
}

abstract production lteExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("<="), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return if i1 <= i2 then 1 else 0;
    };
}

abstract production addExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("+"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualAdditiveConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return i1 + i2;
    };
}

abstract production subExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("-"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualSubtractiveConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return i1 - i2;
    };
}

abstract production mulExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("*"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return i1 * i2;
    };
}

abstract production divExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("/"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return i1 / i2;
    };
}

abstract production modExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), text("%"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    do (bindMaybe, returnMaybe) {
      i1::Integer <- lhs.integerConstantValue;
      i2::Integer <- rhs.integerConstantValue;
      return i1 % i2;
    };
}

abstract production commaExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs;
  top.pp = parens( ppConcat([lhs.pp, space(), comma(), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = rhs.typerep;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

-- These are little-endian
function toBits
[Boolean] ::= i::Integer
{
  return if i == 0 then [] else (i % 2 == 1) :: toBits(i / 2);
}

function fromBits
Integer ::= bs::[Boolean]
{
  return
    case bs of
    | [] -> 0
    | true :: t -> 1 + 2 * fromBits(t)
    | false :: t -> 2 * fromBits(t)
    end;
}

function zipWithPad
[a] ::= fn::(a ::= a a) pad::a l1::[a] l2::[a]
{
  return
    case l1, l2 of
    | [], [] -> []
    | h1::t1, [] -> fn(h1, pad) :: zipWithPad(fn, pad, t1, [])
    | [], h2::t2 -> fn(h2, pad) :: zipWithPad(fn, pad, [], t2)
    | h1::t1, h2::t2 -> fn(h1, h2) :: zipWithPad(fn, pad, t1, t2)
    end;
}

