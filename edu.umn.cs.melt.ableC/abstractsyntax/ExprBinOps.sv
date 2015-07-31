
autocopy attribute lop :: Decorated Expr;
autocopy attribute rop :: Decorated Expr;

nonterminal BinOp with location, lop, rop, pp, typerep, errors;

aspect default production
top::BinOp ::= { top.errors := []; } -- TODO REMOVE

--------------------------------------------------------------------------------
abstract production assignOp
top::BinOp ::= op::AssignOp
{
  top.errors :=
    (if typeAssignableTo(top.lop.typerep, top.rop.typerep) then []
     else [err(top.location, "Incompatible type in rhs of assignment, expected " ++ showType(top.lop.typerep) ++ " but found " ++ showType(top.rop.typerep))]);
  top.pp = op.pp;
  top.typerep = top.lop.typerep.defaultLvalueConversion;
}

nonterminal AssignOp with location, lop, rop, pp;

abstract production eqOp
top::AssignOp ::=
{
  top.pp = text("=");
}
abstract production mulEqOp
top::AssignOp ::=
{
  top.pp = text("*=");
}
abstract production divEqOp
top::AssignOp ::=
{
  top.pp = text("/=");
}
abstract production modEqOp
top::AssignOp ::=
{
  top.pp = text("%=");
}
abstract production addEqOp
top::AssignOp ::=
{
  top.pp = text("+=");
}
abstract production subEqOp
top::AssignOp ::=
{
  top.pp = text("-=");
}
abstract production lshEqOp
top::AssignOp ::=
{
  top.pp = text("<<=");
}
abstract production rshEqOp
top::AssignOp ::=
{
  top.pp = text(">>=");
}
abstract production andEqOp
top::AssignOp ::=
{
  top.pp = text("&=");
}
abstract production orEqOp
top::AssignOp ::=
{
  top.pp = text("|=");
}
abstract production xorEqOp
top::AssignOp ::=
{
  top.pp = text("^=");
}


--------------------------------------------------------------------------------
abstract production boolOp
top::BinOp ::= op::BoolOp
{
  top.pp = op.pp;
  top.typerep = builtinType([], signedType(intType()));
}

nonterminal BoolOp with location, lop, rop, pp;

abstract production andBoolOp
top::BoolOp ::=
{
  top.pp = text("&&");
}
abstract production orBoolOp
top::BoolOp ::=
{
  top.pp = text("||");
}


--------------------------------------------------------------------------------
abstract production bitOp
top::BinOp ::= op::BitOp
{
  top.pp = op.pp;
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
}

nonterminal BitOp with location, lop, rop, pp;

abstract production andBitOp
top::BitOp ::=
{
  top.pp = text("&");
}
abstract production orBitOp
top::BitOp ::=
{
  top.pp = text("|");
}
abstract production xorBitOp
top::BitOp ::=
{
  top.pp = text("^");
}
abstract production lshBitOp
top::BitOp ::=
{
  top.pp = text("<<");
}
abstract production rshBitOp
top::BitOp ::=
{
  top.pp = text(">>");
}



--------------------------------------------------------------------------------
abstract production compareOp
top::BinOp ::= op::CompareOp
{
  top.pp = op.pp;
  top.typerep = builtinType([], signedType(intType()));
}

nonterminal CompareOp with location, lop, rop, pp;

abstract production equalsOp
top::CompareOp ::=
{
  top.pp = text("==");
}
abstract production notEqualsOp
top::CompareOp ::=
{
  top.pp = text("!=");
}
abstract production gtOp
top::CompareOp ::=
{
  top.pp = text(">");
}
abstract production ltOp
top::CompareOp ::=
{
  top.pp = text("<");
}
abstract production gteOp
top::CompareOp ::=
{
  top.pp = text(">=");
}
abstract production lteOp
top::CompareOp ::=
{
  top.pp = text("<=");
}


--------------------------------------------------------------------------------
abstract production numOp
top::BinOp ::= op::NumOp
{
  top.pp = op.pp;
  top.typerep = op.typerep;
}

nonterminal NumOp with location, lop, rop, pp, typerep;

abstract production addOp
top::NumOp ::=
{
  top.pp = text("+");
  top.typerep = usualAdditiveConversionsOnTypes(top.lop.typerep, top.rop.typerep);
}
abstract production subOp
top::NumOp ::=
{
  top.pp = text("-");
  top.typerep = usualSubtractiveConversionsOnTypes(top.lop.typerep, top.rop.typerep);
}
abstract production mulOp
top::NumOp ::=
{
  top.pp = text("*");
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
}
abstract production divOp
top::NumOp ::=
{
  top.pp = text("/");
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
}
abstract production modOp
top::NumOp ::=
{
  top.pp = text("%");
  top.typerep = usualArithmeticConversionsOnTypes(top.lop.typerep, top.rop.typerep);
}

--------------------------------------------------------------------------------
abstract production commaOp
top::BinOp ::=
{
  top.pp = comma();
  top.typerep = top.rop.typerep;
}


