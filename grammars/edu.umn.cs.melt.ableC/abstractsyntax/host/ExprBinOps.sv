grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production eqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("="), space(), rhs.pp]) );

  lhs.env = top.env;
  lhs.controlStmtContext = top.controlStmtContext;

  forwards to
    case lhs.typerep.eqProd of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultEqExpr(lhs, rhs)
    end;
}
abstract production defaultEqExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = eqExpr(lhs.host, rhs.host);
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  top.isLValue = false;

  rhs.env = addEnv(lhs.defs, lhs.env);
  rhs.controlStmtContext = top.controlStmtContext;
}

abstract production mulEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("*="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;

  local overload::Maybe<AssignOp> =
    case lType.mulEqProd of
    | just(prod) -> just(prod)
    | _ ->
      if lType.eqProd.isJust || lType.lMulProd.isJust
      then just(updateAssignOp(mulExpr))
      else nothing()
    end;

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultMulEqExpr(lhs, rhs)
    end;
}
abstract production defaultMulEqExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = mulEqExpr(lhs.host, rhs.host);
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  top.isLValue = false;
}

abstract production divEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("/="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;

  local overload::Maybe<AssignOp> =
    case lType.divEqProd of
    | just(prod) -> just(prod)
    | _ ->
      if lType.eqProd.isJust || lType.lDivProd.isJust
      then just(updateAssignOp(divExpr))
      else nothing()
    end;

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultDivEqExpr(lhs, rhs)
    end;
}
abstract production defaultDivEqExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = divEqExpr(lhs.host, rhs.host);
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  top.isLValue = false;
}

abstract production modEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("%="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;

  local overload::Maybe<AssignOp> =
    case lType.modEqProd of
    | just(prod) -> just(prod)
    | _ ->
      if lType.eqProd.isJust || lType.lModProd.isJust
      then just(updateAssignOp(modExpr))
      else nothing()
    end;

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultModEqExpr(lhs, rhs)
    end;
}
abstract production defaultModEqExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = modEqExpr(lhs.host, rhs.host);
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  top.isLValue = false;
}

abstract production addEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("+="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;

  local overload::Maybe<AssignOp> =
    case lType.addEqProd of
    | just(prod) -> just(prod)
    | _ ->
      if lType.eqProd.isJust || lType.lAddProd.isJust
      then just(updateAssignOp(addExpr))
      else nothing()
    end;

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultAddEqExpr(lhs, rhs)
    end;
}
abstract production defaultAddEqExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = addEqExpr(lhs.host, rhs.host);
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  top.isLValue = false;
}

abstract production subEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("-="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;

  local overload::Maybe<AssignOp> =
    case lType.subEqProd of
    | just(prod) -> just(prod)
    | _ ->
      if lType.eqProd.isJust || lType.lSubProd.isJust
      then just(updateAssignOp(subExpr))
      else nothing()
    end;

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultSubEqExpr(lhs, rhs)
    end;
}
abstract production defaultSubEqExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = subEqExpr(lhs.host, rhs.host);
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  top.isLValue = false;
}

abstract production lshEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;

  local overload::Maybe<AssignOp> =
    case lType.lshEqProd of
    | just(prod) -> just(prod)
    | _ ->
      if lType.eqProd.isJust || lType.lLshProd.isJust
      then just(updateAssignOp(lshExpr))
      else nothing()
    end;

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultLshEqExpr(lhs, rhs)
    end;
}
abstract production defaultLshEqExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = lshEqExpr(lhs.host, rhs.host);
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  top.isLValue = false;
}

abstract production rshEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;

  local overload::Maybe<AssignOp> =
    case lType.rshEqProd of
    | just(prod) -> just(prod)
    | _ ->
      if lType.eqProd.isJust || lType.lRshProd.isJust
      then just(updateAssignOp(rshExpr))
      else nothing()
    end;

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultRshEqExpr(lhs, rhs)
    end;
}
abstract production defaultRshEqExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = rshEqExpr(lhs.host, rhs.host);
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  top.isLValue = false;
}

abstract production andEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("&="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;

  local overload::Maybe<AssignOp> =
    case lType.andEqProd of
    | just(prod) -> just(prod)
    | _ ->
      if lType.eqProd.isJust || lType.lAndProd.isJust
      then just(updateAssignOp(andExpr))
      else nothing()
    end;

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultAndEqExpr(lhs, rhs)
    end;
}
abstract production defaultAndEqExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = andEqExpr(lhs.host, rhs.host);
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  top.isLValue = false;
}

abstract production xorEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("^="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;

  local overload::Maybe<AssignOp> =
    case lType.xorEqProd of
    | just(prod) -> just(prod)
    | _ ->
      if lType.eqProd.isJust || lType.lXorProd.isJust
      then just(updateAssignOp(xorExpr))
      else nothing()
    end;

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultXorEqExpr(lhs, rhs)
    end;
}
abstract production defaultXorEqExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = xorEqExpr(lhs.host, rhs.host);
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  top.isLValue = false;
}

abstract production orEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("|="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;

  local overload::Maybe<AssignOp> =
    case lType.orEqProd of
    | just(prod) -> just(prod)
    | _ ->
      if lType.eqProd.isJust || lType.lOrProd.isJust
      then just(updateAssignOp(orExpr))
      else nothing()
    end;

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultOrEqExpr(lhs, rhs)
    end;
}
abstract production defaultOrEqExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = orEqExpr(lhs.host, rhs.host);
  top.errors <- assignErrors(lhs, rhs);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
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
  top.pp = parens( ppConcat([lhs.pp, space(), text("&&"), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lAndProd, rType.rAndProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultAndExpr(lhs, rhs)
    end;
}
abstract production defaultAndExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = andExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue != 0 && rhs.integerConstantValue != 0 then 1 else 0;
}

abstract production orExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("||"), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lOrProd, rType.rOrProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultOrExpr(lhs, rhs)
    end;
}
abstract production defaultOrExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = orExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue != 0 || rhs.integerConstantValue != 0 then 1 else 0;
}

abstract production andBitExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("&"), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lAndBitProd, rType.rAndBitProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultAndBitExpr(lhs, rhs)
    end;
}
abstract production defaultAndBitExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = andBitExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  top.isLValue = false;
  top.integerConstantValue = fromBits(
      zipWithPad(\ a::Boolean b::Boolean -> a && b, false,
        toBits(lhs.integerConstantValue),
        toBits(rhs.integerConstantValue)));
}

abstract production orBitExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("|"), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lOrBitProd, rType.rOrBitProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultOrBitExpr(lhs, rhs)
    end;
}
abstract production defaultOrBitExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = orBitExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  top.isLValue = false;
  top.integerConstantValue = fromBits(
      zipWithPad(\ a::Boolean b::Boolean -> a || b, false,
        toBits(lhs.integerConstantValue),
        toBits(rhs.integerConstantValue)));
}

abstract production xorExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("^"), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lXorProd, rType.rXorProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultXorExpr(lhs, rhs)
    end;
}
abstract production defaultXorExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = xorExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  top.isLValue = false;
  top.integerConstantValue = fromBits(
      zipWithPad(\ a::Boolean b::Boolean -> (a && !b) || (!a && b), false,
        toBits(lhs.integerConstantValue),
        toBits(rhs.integerConstantValue)));
}

abstract production lshExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<"), space(), rhs.pp]) );
  
  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lLshProd, rType.rLshProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultLshExpr(lhs, rhs)
    end;
}
abstract production defaultLshExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = lshExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  top.isLValue = false;
  top.integerConstantValue =
    foldr(\ Unit i::Integer -> i * 2, lhs.integerConstantValue, repeat(unit(), rhs.integerConstantValue));
}

abstract production rshExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>"), space(), rhs.pp]) );
  
  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lRshProd, rType.rRshProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultRshExpr(lhs, rhs)
    end;
}
abstract production defaultRshExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = rshExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  top.isLValue = false;
  top.integerConstantValue =
    foldr(\ Unit i::Integer -> i / 2, lhs.integerConstantValue, repeat(unit(), rhs.integerConstantValue));
}

abstract production equalsExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("=="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lEqualsProd, rType.rEqualsProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultEqualsExpr(lhs, rhs)
    end;
}
abstract production defaultEqualsExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = equalsExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue == rhs.integerConstantValue then 1 else 0;
}

abstract production notEqualsExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("!="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(
    orElse(lType.lNotEqualsProd, rType.rNotEqualsProd),
    if lType.lEqualsProd.isJust || rType.rEqualsProd.isJust
    then just(bindBinaryOp(\ l r -> notExpr(equalsExpr(l, r))))
    else nothing());

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultNotEqualsExpr(lhs, rhs)
    end;
}
abstract production defaultNotEqualsExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = notEqualsExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue != rhs.integerConstantValue then 1 else 0;
}

abstract production gtExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">"), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lGtProd, rType.rGtProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultGtExpr(lhs, rhs)
    end;
}
abstract production defaultGtExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = gtExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue > rhs.integerConstantValue then 1 else 0;
}

abstract production ltExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<"), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lLtProd, rType.rLtProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultLtExpr(lhs, rhs)
    end;
}
abstract production defaultLtExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = ltExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue < rhs.integerConstantValue then 1 else 0;
}

-- TODO: Defaults for >=, <=?
abstract production gteExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text(">="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lGteProd, rType.rGteProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultGteExpr(lhs, rhs)
    end;
}
abstract production defaultGteExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = gteExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue >= rhs.integerConstantValue then 1 else 0;
}

abstract production lteExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("<="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lLteProd, rType.rLteProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultLteExpr(lhs, rhs)
    end;
}
abstract production defaultLteExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = lteExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
  top.integerConstantValue =
    if lhs.integerConstantValue <= rhs.integerConstantValue then 1 else 0;
}

abstract production addExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("+"), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lAddProd, rType.rAddProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultAddExpr(lhs, rhs)
    end;
}
abstract production defaultAddExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = addExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualAdditiveConversionsOnTypes(lhs.typerep, rhs.typerep);
  top.isLValue = false;
  top.integerConstantValue =
    lhs.integerConstantValue + rhs.integerConstantValue;
}

abstract production subExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("-"), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lSubProd, rType.rSubProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultSubExpr(lhs, rhs)
    end;
}
abstract production defaultSubExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = subExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualSubtractiveConversionsOnTypes(lhs.typerep, rhs.typerep);
  top.isLValue = false;
  top.integerConstantValue =
    lhs.integerConstantValue - rhs.integerConstantValue;
}

abstract production mulExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("*"), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lMulProd, rType.rMulProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultMulExpr(lhs, rhs)
    end;
}
abstract production defaultMulExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = mulExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  top.isLValue = false;
  top.integerConstantValue =
    lhs.integerConstantValue * rhs.integerConstantValue;
}

abstract production divExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("/"), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lDivProd, rType.rDivProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultDivExpr(lhs, rhs)
    end;
}
abstract production defaultDivExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = divExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  top.isLValue = false;
  top.integerConstantValue =
    lhs.integerConstantValue / rhs.integerConstantValue;
}

abstract production modExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("%"), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;
  local rType::Type = rhs.typerep;
  rType.otherType = lhs.typerep;
  local overload::Maybe<BinaryOp> = orElse(lType.lModProd, rType.rModProd);

  forwards to
    case overload of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultModExpr(lhs, rhs)
    end;
}
abstract production defaultModExpr
top::Expr ::= @lhs::Expr @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = modExpr(lhs.host, rhs.host);
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
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

