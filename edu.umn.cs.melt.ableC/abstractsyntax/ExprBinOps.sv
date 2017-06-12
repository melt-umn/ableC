
autocopy attribute lop :: Decorated Expr;
autocopy attribute rop :: Decorated Expr;

nonterminal BinOp with location, lop, rop, opName, pp, host<BinOp>, lifted<BinOp>, typerep, errors, collectedTypeQualifiers;
flowtype collectedTypeQualifiers {lop, rop} on BinOp;
flowtype errors {lop, rop} on BinOp;

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
  top.errors := op.errors;
}

nonterminal BoolOp with location, lop, rop, pp, host<BoolOp>, lifted<BoolOp>, collectedTypeQualifiers, errors;
flowtype collectedTypeQualifiers {lop, rop} on BoolOp;
flowtype errors {lop, rop} on BoolOp;

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
}

nonterminal BitOp with location, lop, rop, pp, host<BitOp>, lifted<BitOp>, collectedTypeQualifiers, errors;
flowtype collectedTypeQualifiers {lop, rop} on BitOp;
flowtype errors {lop, rop} on BitOp;

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
}

nonterminal CompareOp with location, lop, rop, pp, host<CompareOp>, lifted<CompareOp>, collectedTypeQualifiers, errors;
flowtype collectedTypeQualifiers {lop, rop} on CompareOp;
flowtype errors {lop, rop} on CompareOp;

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
}

nonterminal NumOp with location, lop, rop, pp, host<NumOp>, lifted<NumOp>, typerep, collectedTypeQualifiers, errors;
flowtype collectedTypeQualifiers {lop, rop} on NumOp;
flowtype errors {lop, rop} on NumOp;

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
}


