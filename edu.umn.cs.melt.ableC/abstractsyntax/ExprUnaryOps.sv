
nonterminal UnaryOp with location, op, opName, pp, preExpr, noLvalueConversion, typerep, errors;

autocopy attribute op :: Decorated Expr;
synthesized attribute opName :: String;
synthesized attribute preExpr :: Boolean;
synthesized attribute noLvalueConversion :: Boolean;

aspect default production
top::UnaryOp ::=
{
  top.errors := []; -- TODO REMOVE
  top.opName =
    case top.pp of
      text(opName) -> opName
    | _ -> error("Op pp isn't simple text, opName must be overridden manually")
    end;
}

abstract production preIncOp
top::UnaryOp ::=
{
  top.opName = "pre++";
  top.pp = text("++");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
}
abstract production preDecOp
top::UnaryOp ::= 
{
  top.opName = "pre--";
  top.pp = text("--");
  top.preExpr = true;
  top.noLvalueConversion = true;
  top.typerep = top.op.typerep.integerPromotions;
}
abstract production postIncOp
top::UnaryOp ::= 
{
  top.opName = "post++";
  top.pp = text("++");
  top.preExpr = false;
  top.noLvalueConversion = true;
  top.typerep = top.op.typerep.integerPromotions;
}
abstract production postDecOp
top::UnaryOp ::= 
{
  top.opName = "post--";
  top.pp = text("--");
  top.preExpr = false;
  top.noLvalueConversion = true;
  top.typerep = top.op.typerep.integerPromotions;
}
abstract production addressOfOp
top::UnaryOp ::=
{
  top.pp = text("&");
  top.preExpr = true;
  top.noLvalueConversion = true;
  top.typerep = pointerType([], top.op.typerep);
}
abstract production dereferenceOp
top::UnaryOp ::=
{
  top.pp = text("*");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = 
    case top.op.typerep of
    | pointerType(_, innerty) -> innerty
    | _ -> errorType()
    end;
}
abstract production positiveOp
top::UnaryOp ::=
{
  top.pp = text("+");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
}
abstract production negativeOp
top::UnaryOp ::=
{
  top.pp = text("-");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
}
abstract production bitNegateOp
top::UnaryOp ::=
{
  top.pp = text("~");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
}
abstract production notOp
top::UnaryOp ::=
{
  top.pp = text("!");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
}

abstract production warnNoOp
top::UnaryOp ::= msg::[Message]
{
  top.pp = text("");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
}

-- GCC extension
abstract production realOp
top::UnaryOp ::=
{
  top.pp = text("__real__");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
}
-- GCC extension
abstract production imagOp
top::UnaryOp ::=
{
  top.pp = text("__imag__");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
}

autocopy attribute typeop :: Type;

nonterminal UnaryTypeOp with location, typeop, pp, errors;

aspect default production
top::UnaryTypeOp ::=
{
  top.errors := []; -- TODO REMOVE
}

abstract production sizeofOp
top::UnaryTypeOp ::=
{
  top.pp = text("sizeof");
}

-- C11
abstract production alignofOp
top::UnaryTypeOp ::=
{
  top.pp = text("_Alignof");
}

