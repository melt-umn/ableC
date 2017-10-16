grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

aspect default production
top::BinOp ::=
{
  top.opName =
    case top.pp of
      text(opName) -> opName
    | _ -> error("Op pp isn't simple text, opName must be overridden manually")
    end;
}

--------------------------------------------------------------------------------
abstract production assignOp
top::BinOp ::= op::AssignOp
{
  propagate host, lifted;

  top.errors :=
    if typeAssignableTo(top.lop.typerep, top.rop.typerep)
    then
      if containsQualifier(constQualifier(location=bogusLoc()), top.lop.typerep)
      then [err(top.location, "Assignment of read-only variable")]
      else []
    else [err(top.location, "Incompatible type in rhs of assignment, expected " ++ showType(top.lop.typerep) ++ " but found " ++ showType(top.rop.typerep))];
  top.pp = op.pp;
  top.typerep = top.lop.typerep.defaultLvalueConversion;
  top.collectedTypeQualifiers := op.collectedTypeQualifiers;
  top.lhsRhsRuntimeMods := [];

  top.errors <- if top.lop.isLValue then []
    else [err(top.lop.location, "lvalue required as left operand of assignment")];
}

abstract production eqOp
top::AssignOp ::=
{
  propagate host, lifted;
  top.pp = text("=");
  top.collectedTypeQualifiers := [];
}
abstract production mulEqOp
top::AssignOp ::=
{
  propagate host, lifted;
  top.pp = text("*=");
  top.collectedTypeQualifiers := [];
}
abstract production divEqOp
top::AssignOp ::=
{
  propagate host, lifted;
  top.pp = text("/=");
  top.collectedTypeQualifiers := [];
}
abstract production modEqOp
top::AssignOp ::=
{
  propagate host, lifted;
  top.pp = text("%=");
  top.collectedTypeQualifiers := [];
}
abstract production addEqOp
top::AssignOp ::=
{
  propagate host, lifted;
  top.pp = text("+=");
  top.collectedTypeQualifiers := [];
}
abstract production subEqOp
top::AssignOp ::=
{
  propagate host, lifted;
  top.pp = text("-=");
  top.collectedTypeQualifiers := [];
}
abstract production lshEqOp
top::AssignOp ::=
{
  propagate host, lifted;
  top.pp = text("<<=");
  top.collectedTypeQualifiers := [];
}
abstract production rshEqOp
top::AssignOp ::=
{
  propagate host, lifted;
  top.pp = text(">>=");
  top.collectedTypeQualifiers := [];
}
abstract production andEqOp
top::AssignOp ::=
{
  propagate host, lifted;
  top.pp = text("&=");
  top.collectedTypeQualifiers := [];
}
abstract production orEqOp
top::AssignOp ::=
{
  propagate host, lifted;
  top.pp = text("|=");
  top.collectedTypeQualifiers := [];
}
abstract production xorEqOp
top::AssignOp ::=
{
  propagate host, lifted;
  top.pp = text("^=");
  top.collectedTypeQualifiers := [];
}


--------------------------------------------------------------------------------
abstract production boolOp
top::BinOp ::= op::BoolOp
{
  propagate host, lifted;
  top.pp = op.pp;
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.collectedTypeQualifiers := op.collectedTypeQualifiers;
  top.errors := op.errors;
  top.lhsRhsRuntimeMods := [];
}

abstract production andBoolOp
top::BoolOp ::=
{
  propagate host, lifted;
  top.pp = text("&&");
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production orBoolOp
top::BoolOp ::=
{
  propagate host, lifted;
  top.pp = text("||");
  top.collectedTypeQualifiers := [];
  top.errors := [];
}


--------------------------------------------------------------------------------
abstract production bitOp
top::BinOp ::= op::BitOp
{
  propagate host, lifted;
  top.pp = op.pp;
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
  top.collectedTypeQualifiers := op.collectedTypeQualifiers;
  top.errors := op.errors;
  top.lhsRhsRuntimeMods := [];
}

abstract production andBitOp
top::BitOp ::=
{
  propagate host, lifted;
  top.pp = text("&");
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production orBitOp
top::BitOp ::=
{
  propagate host, lifted;
  top.pp = text("|");
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production xorBitOp
top::BitOp ::=
{
  propagate host, lifted;
  top.pp = text("^");
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production lshBitOp
top::BitOp ::=
{
  propagate host, lifted;
  top.pp = text("<<");
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production rshBitOp
top::BitOp ::=
{
  propagate host, lifted;
  top.pp = text(">>");
  top.collectedTypeQualifiers := [];
  top.errors := [];
}


--------------------------------------------------------------------------------
abstract production compareOp
top::BinOp ::= op::CompareOp
{
  propagate host, lifted;
  top.pp = op.pp;
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.collectedTypeQualifiers := op.collectedTypeQualifiers;
  top.errors := op.errors;
  top.lhsRhsRuntimeMods := [];
}

abstract production equalsOp
top::CompareOp ::=
{
  propagate host, lifted;
  top.pp = text("==");
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production notEqualsOp
top::CompareOp ::=
{
  propagate host, lifted;
  top.pp = text("!=");
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production gtOp
top::CompareOp ::=
{
  propagate host, lifted;
  top.pp = text(">");
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production ltOp
top::CompareOp ::=
{
  propagate host, lifted;
  top.pp = text("<");
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production gteOp
top::CompareOp ::=
{
  propagate host, lifted;
  top.pp = text(">=");
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production lteOp
top::CompareOp ::=
{
  propagate host, lifted;
  top.pp = text("<=");
  top.collectedTypeQualifiers := [];
  top.errors := [];
}


--------------------------------------------------------------------------------
abstract production numOp
top::BinOp ::= op::NumOp
{
  propagate host, lifted;
  top.pp = op.pp;
  top.typerep = op.typerep;
  top.collectedTypeQualifiers := op.collectedTypeQualifiers;
  top.errors := op.errors;
  top.lhsRhsRuntimeMods := [];
}

abstract production addOp
top::NumOp ::=
{
  propagate host, lifted;
  top.pp = text("+");
  top.typerep = usualAdditiveConversionsOnTypes(top.lop.typerep, top.rop.typerep);
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production subOp
top::NumOp ::=
{
  propagate host, lifted;
  top.pp = text("-");
  top.typerep = usualSubtractiveConversionsOnTypes(top.lop.typerep, top.rop.typerep);
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production mulOp
top::NumOp ::=
{
  propagate host, lifted;
  top.pp = text("*");
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production divOp
top::NumOp ::=
{
  propagate host, lifted;
  top.pp = text("/");
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
  top.collectedTypeQualifiers := [];
  top.errors := [];
}
abstract production modOp
top::NumOp ::=
{
  propagate host, lifted;
  top.pp = text("%");
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
  top.collectedTypeQualifiers := [];
  top.errors := [];
}

--------------------------------------------------------------------------------
abstract production commaOp
top::BinOp ::=
{
  propagate host, lifted;
  top.pp = comma();
  top.typerep = top.rop.typerep;
  top.collectedTypeQualifiers := [];
  top.errors := [];
  top.lhsRhsRuntimeMods := [];
}


