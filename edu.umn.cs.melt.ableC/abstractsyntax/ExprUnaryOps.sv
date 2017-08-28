
nonterminal UnaryOp with location, op, opName, pp, host<UnaryOp>, lifted<UnaryOp>, preExpr, noLvalueConversion, typerep, errors, collectedTypeQualifiers;
flowtype UnaryOp = decorate {op}, opName {}, preExpr {}, noLvalueConversion {};

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
  propagate host, lifted;
  top.pp = text("++");
  top.preExpr = true;
  top.noLvalueConversion = true;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
  top.collectedTypeQualifiers := [];
}
abstract production preDecOp
top::UnaryOp ::= 
{
  top.opName = "pre--";
  propagate host, lifted;
  top.pp = text("--");
  top.preExpr = true;
  top.noLvalueConversion = true;
  top.typerep = top.op.typerep.integerPromotions;
  top.collectedTypeQualifiers := [];
}
abstract production postIncOp
top::UnaryOp ::= 
{
  top.opName = "post++";
  propagate host, lifted;
  top.pp = text("++");
  top.preExpr = false;
  top.noLvalueConversion = true;
  top.typerep = top.op.typerep.integerPromotions;
  top.collectedTypeQualifiers := [];
}
abstract production postDecOp
top::UnaryOp ::= 
{
  top.opName = "post--";
  propagate host, lifted;
  top.pp = text("--");
  top.preExpr = false;
  top.noLvalueConversion = true;
  top.typerep = top.op.typerep.integerPromotions;
  top.collectedTypeQualifiers := [];
}
abstract production addressOfOp
top::UnaryOp ::=
{
  propagate host, lifted;
  top.pp = text("&");
  top.preExpr = true;
  top.noLvalueConversion = true;
  top.typerep = pointerType(foldQualifier(top.collectedTypeQualifiers), top.op.typerep);
  top.collectedTypeQualifiers := [];
}
abstract production dereferenceOp
top::UnaryOp ::=
{
  propagate host, lifted;
  top.pp = text("*");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = 
    case top.op.typerep of
    | pointerType(_, innerty) -> innerty
    | _ -> errorType()
    end;
  top.errors :=
    case top.op.typerep.defaultFunctionArrayLvalueConversion of
    | pointerType(_, _) -> []
    | _ -> [err(top.location, "invalid type argument of unary ‘*’ (have ‘" ++
                               showType(top.op.typerep) ++ "’")]
    end;
  top.collectedTypeQualifiers := [];
}
abstract production positiveOp
top::UnaryOp ::=
{
  propagate host, lifted;
  top.pp = text("+");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
  top.collectedTypeQualifiers := [];
}
abstract production negativeOp
top::UnaryOp ::=
{
  propagate host, lifted;
  top.pp = text("-");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
  top.collectedTypeQualifiers := [];
}
abstract production bitNegateOp
top::UnaryOp ::=
{
  propagate host, lifted;
  top.pp = text("~");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
  top.collectedTypeQualifiers := [];
}
abstract production notOp
top::UnaryOp ::=
{
  propagate host, lifted;
  top.pp = text("!");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
  top.collectedTypeQualifiers := [];
}

abstract production warnNoOp
top::UnaryOp ::= msg::[Message]
{
  propagate host, lifted;
  top.pp = text("");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
  top.collectedTypeQualifiers := [];
}

-- GCC extension
abstract production realOp
top::UnaryOp ::=
{
  propagate host, lifted;
  top.pp = text("__real__");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
  top.collectedTypeQualifiers := [];
}
-- GCC extension
abstract production imagOp
top::UnaryOp ::=
{
  propagate host, lifted;
  top.pp = text("__imag__");
  top.preExpr = true;
  top.noLvalueConversion = false;
  top.typerep = top.op.typerep.defaultLvalueConversion.integerPromotions;
  top.collectedTypeQualifiers := [];
}

autocopy attribute typeop :: Type;

nonterminal UnaryTypeOp with location, typeop, pp, host<UnaryTypeOp>, lifted<UnaryTypeOp>, errors;
flowtype UnaryTypeOp = decorate {typeop};

aspect default production
top::UnaryTypeOp ::=
{
  top.errors := []; -- TODO REMOVE
}

abstract production sizeofOp
top::UnaryTypeOp ::=
{
  propagate host, lifted;
  top.pp = text("sizeof");
}

-- C11
abstract production alignofOp
top::UnaryTypeOp ::=
{
  propagate host, lifted;
  top.pp = text("_Alignof");
}

