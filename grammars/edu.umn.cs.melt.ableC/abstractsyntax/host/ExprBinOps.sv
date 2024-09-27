grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production eqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("="), space(), rhs.pp]) );

  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);

  local lType::Type = lhs.typerep;
  lType.otherType = rhs.typerep;

  forwards to fromMaybe(defaultEqExpr, lType.eqProd)(lhs, rhs);
}
-- Non-overloaded version, for use in defining overloads to avoid a circularity
production hostEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate controlStmtContext;
  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  forwards to defaultEqExpr(lhs, rhs);
}
abstract production defaultEqExpr implements AssignOp
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

  local prod::AssignOp =
    case lType.mulEqProd of
    | just(prod) -> prod
    | _ ->
      if lType.eqProd.isJust || lType.lMulProd.isJust
      then updateAssignOp(mulExpr)
      else defaultMulEqExpr
    end;

  forwards to prod(lhs, rhs);
}
abstract production defaultMulEqExpr implements AssignOp
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

  local prod::AssignOp =
    case lType.divEqProd of
    | just(prod) -> prod
    | _ ->
      if lType.eqProd.isJust || lType.lDivProd.isJust
      then updateAssignOp(divExpr)
      else defaultDivEqExpr
    end;

  forwards to prod(lhs, rhs);
}
abstract production defaultDivEqExpr implements AssignOp
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

  local prod::AssignOp =
    case lType.modEqProd of
    | just(prod) -> prod
    | _ ->
      if lType.eqProd.isJust || lType.lModProd.isJust
      then updateAssignOp(modExpr)
      else defaultModEqExpr
    end;

  forwards to prod(lhs, rhs);
}
abstract production defaultModEqExpr implements AssignOp
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

  local prod::AssignOp =
    case lType.addEqProd of
    | just(prod) -> prod
    | _ ->
      if lType.eqProd.isJust || lType.lAddProd.isJust
      then updateAssignOp(addExpr)
      else defaultAddEqExpr
    end;

  forwards to prod(lhs, rhs);
}
abstract production defaultAddEqExpr implements AssignOp
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

  local prod::AssignOp =
    case lType.subEqProd of
    | just(prod) -> prod
    | _ ->
      if lType.eqProd.isJust || lType.lSubProd.isJust
      then updateAssignOp(subExpr)
      else defaultSubEqExpr
    end;

  forwards to prod(lhs, rhs);
}
abstract production defaultSubEqExpr implements AssignOp
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

  local prod::AssignOp =
    case lType.lshEqProd of
    | just(prod) -> prod
    | _ ->
      if lType.eqProd.isJust || lType.lLshProd.isJust
      then updateAssignOp(lshExpr)
      else defaultLshEqExpr
    end;

  forwards to prod(lhs, rhs);
}
abstract production defaultLshEqExpr implements AssignOp
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

  local prod::AssignOp =
    case lType.rshEqProd of
    | just(prod) -> prod
    | _ ->
      if lType.eqProd.isJust || lType.lRshProd.isJust
      then updateAssignOp(rshExpr)
      else defaultRshEqExpr
    end;

  forwards to prod(lhs, rhs);
}
abstract production defaultRshEqExpr implements AssignOp
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

  local prod::AssignOp =
    case lType.andEqProd of
    | just(prod) -> prod
    | _ ->
      if lType.eqProd.isJust || lType.lAndProd.isJust
      then updateAssignOp(andExpr)
      else defaultAndEqExpr
    end;

  forwards to prod(lhs, rhs);
}
abstract production defaultAndEqExpr implements AssignOp
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

  local prod::AssignOp =
    case lType.xorEqProd of
    | just(prod) -> prod
    | _ ->
      if lType.eqProd.isJust || lType.lXorProd.isJust
      then updateAssignOp(xorExpr)
      else defaultXorEqExpr
    end;

  forwards to prod(lhs, rhs);
}
abstract production defaultXorEqExpr implements AssignOp
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

  local prod::AssignOp =
    case lType.orEqProd of
    | just(prod) -> prod
    | _ ->
      if lType.eqProd.isJust || lType.lOrProd.isJust
      then updateAssignOp(orExpr)
      else defaultOrEqExpr
    end;

  forwards to prod(lhs, rhs);
}
abstract production defaultOrEqExpr implements AssignOp
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
  local prod::BinaryOp = fromMaybe(defaultAddExpr, orElse(lType.lAndProd, rType.rAndProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultAndExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultOrExpr, orElse(lType.lOrProd, rType.rOrProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultOrExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultAndBitExpr, orElse(lType.lAndBitProd, rType.rAndBitProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultAndBitExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultOrBitExpr, orElse(lType.lOrBitProd, rType.rOrBitProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultOrBitExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultXorExpr, orElse(lType.lXorProd, rType.rXorProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultXorExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultLshExpr, orElse(lType.lLshProd, rType.rLshProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultLshExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultRshExpr, orElse(lType.lRshProd, rType.rRshProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultRshExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultEqualsExpr, orElse(lType.lEqualsProd, rType.rEqualsProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultEqualsExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(
    defaultNotEqualsExpr,
    orElse(
      orElse(lType.lNotEqualsProd, rType.rNotEqualsProd),
      if lType.lEqualsProd.isJust || rType.rEqualsProd.isJust
      then just(bindBinaryOp(\ l r -> notExpr(equalsExpr(l, r))))
      else nothing()));

  forwards to prod(lhs, rhs);
}
abstract production defaultNotEqualsExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultGtExpr, orElse(lType.lGtProd, rType.rGtProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultGtExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultLtExpr, orElse(lType.lLtProd, rType.rLtProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultLtExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultGteExpr, orElse(lType.lGteProd, rType.rGteProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultGteExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultLteExpr, orElse(lType.lLteProd, rType.rLteProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultLteExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultAddExpr, orElse(lType.lAddProd, rType.rAddProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultAddExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultSubExpr, orElse(lType.lSubProd, rType.rSubProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultSubExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultMulExpr, orElse(lType.lMulProd, rType.rMulProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultMulExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultDivExpr, orElse(lType.lDivProd, rType.rDivProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultDivExpr implements BinaryOp
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
  local prod::BinaryOp = fromMaybe(defaultModExpr, orElse(lType.lModProd, rType.rModProd));

  forwards to prod(lhs, rhs);
}
abstract production defaultModExpr implements BinaryOp
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

