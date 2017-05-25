
autocopy attribute lop :: Decorated Expr;
autocopy attribute rop :: Decorated Expr;

nonterminal BinOp with location, lop, rop, opName, pp, host<BinOp>, lifted<BinOp>, typerep, errors, collectedTypeQualifiers;

aspect default production
top::BinOp ::=
{
  top.errors := []; -- TODO REMOVE
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
      if containsQualifier(constQualifier(), top.lop.typerep)
      then [err(top.location, "Assignment of read-only variable")]
      else []
    else [err(top.location, "Incompatible type in rhs of assignment, expected " ++ showType(top.lop.typerep) ++ " but found " ++ showType(top.rop.typerep))];
  top.pp = op.pp;
  top.typerep = top.lop.typerep.defaultLvalueConversion;
  top.collectedTypeQualifiers := op.collectedTypeQualifiers;
}

nonterminal AssignOp with location, lop, rop, pp, host<AssignOp>, lifted<AssignOp>, collectedTypeQualifiers;

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
}

nonterminal BoolOp with location, lop, rop, pp, host<BoolOp>, lifted<BoolOp>, collectedTypeQualifiers;

abstract production andBoolOp
top::BoolOp ::=
{
  propagate host, lifted;
  top.pp = text("&&");
  top.collectedTypeQualifiers := [];
}
abstract production orBoolOp
top::BoolOp ::=
{
  propagate host, lifted;
  top.pp = text("||");
  top.collectedTypeQualifiers := [];
}


--------------------------------------------------------------------------------
abstract production bitOp
top::BinOp ::= op::BitOp
{
  propagate host, lifted;
  top.pp = op.pp;
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
  top.collectedTypeQualifiers := op.collectedTypeQualifiers;
}

nonterminal BitOp with location, lop, rop, pp, host<BitOp>, lifted<BitOp>, collectedTypeQualifiers;

abstract production andBitOp
top::BitOp ::=
{
  propagate host, lifted;
  top.pp = text("&");
  top.collectedTypeQualifiers := [];
}
abstract production orBitOp
top::BitOp ::=
{
  propagate host, lifted;
  top.pp = text("|");
  top.collectedTypeQualifiers := [];
}
abstract production xorBitOp
top::BitOp ::=
{
  propagate host, lifted;
  top.pp = text("^");
  top.collectedTypeQualifiers := [];
}
abstract production lshBitOp
top::BitOp ::=
{
  propagate host, lifted;
  top.pp = text("<<");
  top.collectedTypeQualifiers := [];
}
abstract production rshBitOp
top::BitOp ::=
{
  propagate host, lifted;
  top.pp = text(">>");
  top.collectedTypeQualifiers := [];
}



--------------------------------------------------------------------------------
abstract production compareOp
top::BinOp ::= op::CompareOp
{
  propagate host, lifted;
  top.pp = op.pp;
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.collectedTypeQualifiers := op.collectedTypeQualifiers;
}

nonterminal CompareOp with location, lop, rop, pp, host<CompareOp>, lifted<CompareOp>, collectedTypeQualifiers;

abstract production equalsOp
top::CompareOp ::=
{
  propagate host, lifted;
  top.pp = text("==");
  top.collectedTypeQualifiers := [];
}
abstract production notEqualsOp
top::CompareOp ::=
{
  propagate host, lifted;
  top.pp = text("!=");
  top.collectedTypeQualifiers := [];
}
abstract production gtOp
top::CompareOp ::=
{
  propagate host, lifted;
  top.pp = text(">");
  top.collectedTypeQualifiers := [];
}
abstract production ltOp
top::CompareOp ::=
{
  propagate host, lifted;
  top.pp = text("<");
  top.collectedTypeQualifiers := [];
}
abstract production gteOp
top::CompareOp ::=
{
  propagate host, lifted;
  top.pp = text(">=");
  top.collectedTypeQualifiers := [];
}
abstract production lteOp
top::CompareOp ::=
{
  propagate host, lifted;
  top.pp = text("<=");
  top.collectedTypeQualifiers := [];
}


--------------------------------------------------------------------------------
abstract production numOp
top::BinOp ::= op::NumOp
{
  propagate host, lifted;
  top.pp = op.pp;
  top.typerep = op.typerep;
  top.collectedTypeQualifiers := op.collectedTypeQualifiers;
}

nonterminal NumOp with location, lop, rop, pp, host<NumOp>, lifted<NumOp>, typerep, collectedTypeQualifiers;

abstract production addOp
top::NumOp ::=
{
  propagate host, lifted;
  top.pp = text("+");
  top.typerep = usualAdditiveConversionsOnTypes(top.lop.typerep, top.rop.typerep);
  top.collectedTypeQualifiers := [];
}
abstract production subOp
top::NumOp ::=
{
  propagate host, lifted;
  top.pp = text("-");
  top.typerep = usualSubtractiveConversionsOnTypes(top.lop.typerep, top.rop.typerep);
  top.collectedTypeQualifiers := [];
}
abstract production mulOp
top::NumOp ::=
{
  propagate host, lifted;
  top.pp = text("*");
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
  top.collectedTypeQualifiers := [];
}
abstract production divOp
top::NumOp ::=
{
  propagate host, lifted;
  top.pp = text("/");
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
  top.collectedTypeQualifiers := [];
}
abstract production modOp
top::NumOp ::=
{
  propagate host, lifted;
  top.pp = text("%");
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
  top.collectedTypeQualifiers := [];
}

--------------------------------------------------------------------------------
abstract production commaOp
top::BinOp ::=
{
  propagate host, lifted;
  top.pp = comma();
  top.typerep = top.rop.typerep;
  top.collectedTypeQualifiers := [];
}


