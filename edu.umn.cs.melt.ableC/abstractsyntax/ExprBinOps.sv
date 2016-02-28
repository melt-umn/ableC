
autocopy attribute lop :: Decorated Expr;
autocopy attribute rop :: Decorated Expr;

nonterminal BinOp with location, lop, rop, opName, pp, host<BinOp>, typerep, errors;

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
  propagate host;
  top.errors :=
    (if typeAssignableTo(top.lop.typerep, top.rop.typerep) then []
     else [err(top.location, "Incompatible type in rhs of assignment, expected " ++ showType(top.lop.typerep) ++ " but found " ++ showType(top.rop.typerep))]);
  top.pp = op.pp;
  top.typerep = top.lop.typerep.defaultLvalueConversion;
}

nonterminal AssignOp with location, lop, rop, pp, host<AssignOp>;

abstract production eqOp
top::AssignOp ::=
{
  propagate host;
  top.pp = text("=");
}
abstract production mulEqOp
top::AssignOp ::=
{
  propagate host;
  top.pp = text("*=");
}
abstract production divEqOp
top::AssignOp ::=
{
  propagate host;
  top.pp = text("/=");
}
abstract production modEqOp
top::AssignOp ::=
{
  propagate host;
  top.pp = text("%=");
}
abstract production addEqOp
top::AssignOp ::=
{
  propagate host;
  top.pp = text("+=");
}
abstract production subEqOp
top::AssignOp ::=
{
  propagate host;
  top.pp = text("-=");
}
abstract production lshEqOp
top::AssignOp ::=
{
  propagate host;
  top.pp = text("<<=");
}
abstract production rshEqOp
top::AssignOp ::=
{
  propagate host;
  top.pp = text(">>=");
}
abstract production andEqOp
top::AssignOp ::=
{
  propagate host;
  top.pp = text("&=");
}
abstract production orEqOp
top::AssignOp ::=
{
  propagate host;
  top.pp = text("|=");
}
abstract production xorEqOp
top::AssignOp ::=
{
  propagate host;
  top.pp = text("^=");
}


--------------------------------------------------------------------------------
abstract production boolOp
top::BinOp ::= op::BoolOp
{
  propagate host;
  top.pp = op.pp;
  top.typerep = builtinType([], signedType(intType()));
}

nonterminal BoolOp with location, lop, rop, pp, host<BoolOp>;

abstract production andBoolOp
top::BoolOp ::=
{
  propagate host;
  top.pp = text("&&");
}
abstract production orBoolOp
top::BoolOp ::=
{
  propagate host;
  top.pp = text("||");
}


--------------------------------------------------------------------------------
abstract production bitOp
top::BinOp ::= op::BitOp
{
  propagate host;
  top.pp = op.pp;
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
}

nonterminal BitOp with location, lop, rop, pp, host<BitOp>;

abstract production andBitOp
top::BitOp ::=
{
  propagate host;
  top.pp = text("&");
}
abstract production orBitOp
top::BitOp ::=
{
  propagate host;
  top.pp = text("|");
}
abstract production xorBitOp
top::BitOp ::=
{
  propagate host;
  top.pp = text("^");
}
abstract production lshBitOp
top::BitOp ::=
{
  propagate host;
  top.pp = text("<<");
}
abstract production rshBitOp
top::BitOp ::=
{
  propagate host;
  top.pp = text(">>");
}



--------------------------------------------------------------------------------
abstract production compareOp
top::BinOp ::= op::CompareOp
{
  propagate host;
  top.pp = op.pp;
  top.typerep = builtinType([], signedType(intType()));
}

nonterminal CompareOp with location, lop, rop, pp, host<CompareOp>;

abstract production equalsOp
top::CompareOp ::=
{
  propagate host;
  top.pp = text("==");
}
abstract production notEqualsOp
top::CompareOp ::=
{
  propagate host;
  top.pp = text("!=");
}
abstract production gtOp
top::CompareOp ::=
{
  propagate host;
  top.pp = text(">");
}
abstract production ltOp
top::CompareOp ::=
{
  propagate host;
  top.pp = text("<");
}
abstract production gteOp
top::CompareOp ::=
{
  propagate host;
  top.pp = text(">=");
}
abstract production lteOp
top::CompareOp ::=
{
  propagate host;
  top.pp = text("<=");
}


--------------------------------------------------------------------------------
abstract production numOp
top::BinOp ::= op::NumOp
{
  propagate host;
  top.pp = op.pp;
  top.typerep = op.typerep;
}

nonterminal NumOp with location, lop, rop, pp, host<NumOp>, typerep;

abstract production addOp
top::NumOp ::=
{
  propagate host;
  top.pp = text("+");
  top.typerep = usualAdditiveConversionsOnTypes(top.lop.typerep, top.rop.typerep);
}
abstract production subOp
top::NumOp ::=
{
  propagate host;
  top.pp = text("-");
  top.typerep = usualSubtractiveConversionsOnTypes(top.lop.typerep, top.rop.typerep);
}
abstract production mulOp
top::NumOp ::=
{
  propagate host;
  top.pp = text("*");
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
}
abstract production divOp
top::NumOp ::=
{
  propagate host;
  top.pp = text("/");
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
}
abstract production modOp
top::NumOp ::=
{
  propagate host;
  top.pp = text("%");
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
}

--------------------------------------------------------------------------------
abstract production commaOp
top::BinOp ::=
{
  propagate host;
  top.pp = comma();
  top.typerep = top.rop.typerep;
}


