grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production eqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production mulEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("*="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production divEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("/="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production modEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("%="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production addEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("+="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production subEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("-="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production lshEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production rshEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production andEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("&="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production xorEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("^="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production orEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("|="), space(), rhs.pp]) );
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

fun assignErrors [Message] ::= lhs::Decorated Expr  rhs::Decorated Expr =
  (if typeAssignableTo(lhs.typerep, rhs.typerep)
   then
     (if containsQualifier(constQualifier(), lhs.typerep)
      then [errFromOrigin(lhs, "Assignment of read-only variable")]
      else []) ++
     case lhs.typerep of
       extType(_, refIdExtType(_, _, refId)) ->
         case lookupRefId(refId, lhs.env) of
           item :: _ ->
             if item.hasConstField
             then [errFromOrigin(lhs, s"Assignment of read-only variable (${show(80, lhs.pp)} has const fields)")]
             else []
         | [] -> []
         end 
     | _ -> []
     end
   else [errFromOrigin(rhs, "Incompatible type in rhs of assignment, expected " ++ show(80, lhs.typerep) ++ " but found " ++ show(80, rhs.typerep))]) ++
  if lhs.isLValue then []
    else [errFromOrigin(lhs, "lvalue required as left operand of assignment")];

abstract production andExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("&&"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue != 0 && rhs.integerConstantValue != 0 then 1 else 0;
}

abstract production orExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("||"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue != 0 || rhs.integerConstantValue != 0 then 1 else 0;
}

abstract production andBitExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("&"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue = fromBits(
      zipWithPad(\ a::Boolean b::Boolean -> a && b, false,
        toBits(lhs.integerConstantValue),
        toBits(rhs.integerConstantValue)));
}

abstract production orBitExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("|"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue = fromBits(
      zipWithPad(\ a::Boolean b::Boolean -> a || b, false,
        toBits(lhs.integerConstantValue),
        toBits(rhs.integerConstantValue)));
}

abstract production xorExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("^"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue = fromBits(
      zipWithPad(\ a::Boolean b::Boolean -> (a && !b) || (!a && b), false,
        toBits(lhs.integerConstantValue),
        toBits(rhs.integerConstantValue)));
}

abstract production lshExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    foldr(\ Unit i::Integer -> i * 2, lhs.integerConstantValue, repeat(unit(), rhs.integerConstantValue));
}

abstract production rshExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    foldr(\ Unit i::Integer -> i / 2, lhs.integerConstantValue, repeat(unit(), rhs.integerConstantValue));
}

abstract production equalsExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("=="), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue == rhs.integerConstantValue then 1 else 0;
}

abstract production notEqualsExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("!="), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue != rhs.integerConstantValue then 1 else 0;
}

abstract production gtExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text(">"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue > rhs.integerConstantValue then 1 else 0;
}

abstract production ltExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("<"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue < rhs.integerConstantValue then 1 else 0;
}

abstract production gteExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text(">="), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue >= rhs.integerConstantValue then 1 else 0;
}

abstract production lteExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("<="), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue <= rhs.integerConstantValue then 1 else 0;
}

abstract production addExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("+"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualAdditiveConversionsOnTypes(lhs.typerep, rhs.typerep);
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    lhs.integerConstantValue + rhs.integerConstantValue;
}

abstract production subExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("-"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualSubtractiveConversionsOnTypes(lhs.typerep, rhs.typerep);
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    lhs.integerConstantValue - rhs.integerConstantValue;
}

abstract production mulExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("*"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    lhs.integerConstantValue * rhs.integerConstantValue;
}

abstract production divExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("/"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    lhs.integerConstantValue / rhs.integerConstantValue;
}

abstract production modExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), text("%"), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
  top.integerConstantValue =
    lhs.integerConstantValue % rhs.integerConstantValue;
}

abstract production commaExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([lhs.pp, space(), comma(), space(), rhs.pp]) );
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = rhs.typerep;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

-- These are little-endian
fun toBits [Boolean] ::= i::Integer = if i == 0 then [] else (i % 2 == 1) :: toBits(i / 2);

fun fromBits Integer ::= bs::[Boolean] =
  case bs of
  | [] -> 0
  | true :: t -> 1 + 2 * fromBits(t)
  | false :: t -> 2 * fromBits(t)
  end;

fun zipWithPad [a] ::= fn::(a ::= a a) pad::a l1::[a] l2::[a] =
  case l1, l2 of
  | [], [] -> []
  | h1::t1, [] -> fn(h1, pad) :: zipWithPad(fn, pad, t1, [])
  | [], h2::t2 -> fn(h2, pad) :: zipWithPad(fn, pad, [], t2)
  | h1::t1, h2::t2 -> fn(h1, h2) :: zipWithPad(fn, pad, t1, t2)
  end;

