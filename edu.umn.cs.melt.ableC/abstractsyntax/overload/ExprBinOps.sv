synthesized attribute binaryProd::Maybe<(Expr ::= Expr Expr Location)> occurs on BinOp, AssignOp, BoolOp, BitOp, CompareOp, NumOp;

aspect default production
top::BinOp ::=
{
  top.binaryProd = nothing();
}

--------------------------------------------------------------------------------

aspect production assignOp
top::BinOp ::= op::AssignOp
{
  local l::Expr = 
    case top.lop of
      arraySubscriptExpr(l, r) -> l
    end;
  l.env = top.lop.env;
  l.returnType = top.lop.returnType;
  local r::Expr = 
    case top.lop of
      arraySubscriptExpr(l, r) -> r
    end;
  r.env = top.lop.env;
  r.returnType = top.lop.returnType;
  local lType::Type = l.typerep;
  lType.otherType = r.typerep;
  lType.otherType2 = top.rop.typerep;

  local option1::Maybe<(Expr ::= Expr Expr Location)> = 
    case top.lop, lType.subscriptAssignProd of
      arraySubscriptExpr(_, _), just(prod) -> just(constructSubscriptAssignOp(_, _, _, op, prod))
    | _, _ -> nothing()
    end;
  local option2::Maybe<(Expr ::= Expr Expr Location)> = op.binaryProd;
  local option3::Maybe<(Expr ::= Expr Expr Location)> = 
    case op.baseOp of
      just(baseOp) -> just(constructAssignOp(_, _, _, baseOp))
    | nothing() -> nothing()
    end;
  top.binaryProd = orElse(option1, orElse(option2, option3));
}

synthesized attribute baseOp::Maybe<BinOp> occurs on AssignOp;

aspect production eqOp
top::AssignOp ::=
{
  top.baseOp = nothing();
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lAssignProd), (.rAssignProd));
}
aspect production mulEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(mulOp(location=top.location), location=top.location));
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lAssignStarProd), (.rAssignStarProd));
}
aspect production divEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(divOp(location=top.location), location=top.location));
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lAssignSlashProd), (.rAssignSlashProd));
}
aspect production modEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(modOp(location=top.location), location=top.location));
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lAssignPercentProd), (.rAssignPercentProd));
}
aspect production addEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(addOp(location=top.location), location=top.location));
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lAssignPlusProd), (.rAssignPlusProd));
}
aspect production subEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(subOp(location=top.location), location=top.location));
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lAssignMinusProd), (.rAssignMinusProd));
}
aspect production lshEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(lshBitOp(location=top.location), location=top.location));
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lAssignDoubleLtProd), (.rAssignDoubleLtProd));
}
aspect production rshEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(rshBitOp(location=top.location), location=top.location));
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lAssignDoubleGtProd), (.rAssignDoubleGtProd));
}
aspect production andEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(andBitOp(location=top.location), location=top.location));
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lAssignSingleAndProd), (.rAssignSingleAndProd));
}
aspect production orEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(orBitOp(location=top.location), location=top.location));
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lAssignSingleOrProd), (.rAssignSingleOrProd));
}
aspect production xorEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(xorBitOp(location=top.location), location=top.location));
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lAssignCaratProd), (.rAssignCaratProd));
}

--------------------------------------------------------------------------------

-- TODO: Automatic equations with DeMorgan's Laws?  
aspect production boolOp
top::BinOp ::= op::BoolOp
{
  top.binaryProd = op.binaryProd;
}

aspect production andBoolOp
top::BoolOp ::=
{
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryDoubleOrProd), (.rBinaryDoubleOrProd));
}
aspect production orBoolOp
top::BoolOp ::=
{
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryDoubleAndProd), (.rBinaryDoubleAndProd));
}

--------------------------------------------------------------------------------
aspect production bitOp
top::BinOp ::= op::BitOp
{
  top.binaryProd = op.binaryProd;
}

aspect production andBitOp
top::BitOp ::=
{
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinarySingleAndProd), (.rBinarySingleAndProd));
}
aspect production orBitOp
top::BitOp ::=
{
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinarySingleOrProd), (.rBinarySingleOrProd));
}
aspect production xorBitOp
top::BitOp ::=
{
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryCaratProd), (.rBinaryCaratProd));
}
aspect production lshBitOp
top::BitOp ::=
{
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryDoubleLtProd), (.rBinaryDoubleLtProd));
}
aspect production rshBitOp
top::BitOp ::=
{
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryDoubleGtProd), (.rBinaryDoubleGtProd));
}

--------------------------------------------------------------------------------
aspect production compareOp
top::BinOp ::= op::CompareOp
{
  top.binaryProd = op.binaryProd;
}

aspect production equalsOp
top::CompareOp ::=
{
  local option1::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryEqProd), (.rBinaryEqProd));
    
  local complementProd::Maybe<(Expr ::= Expr Expr Location)> = 
    getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryNeqProd), (.rBinaryNeqProd));
  local option2::Maybe<(Expr ::= Expr Expr Location)> =
    if complementProd.isJust
    then just(constructNot(_, _, _, complementProd.fromJust))
    else nothing();
  top.binaryProd = orElse(option1, option2);
}
aspect production notEqualsOp
top::CompareOp ::=
{
  local option1::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryNeqProd), (.rBinaryNeqProd));
    
  local complementProd::Maybe<(Expr ::= Expr Expr Location)> = 
    getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryEqProd), (.rBinaryEqProd));
  local option2::Maybe<(Expr ::= Expr Expr Location)> =
    if complementProd.isJust
    then just(constructNot(_, _, _, complementProd.fromJust))
    else nothing();
  top.binaryProd = orElse(option1, option2);
}
aspect production gtOp
top::CompareOp ::=
{
  local option1::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryGtProd), (.rBinaryGtProd));
    
  local complementProd::Maybe<(Expr ::= Expr Expr Location)> = 
    getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryLteProd), (.rBinaryLteProd));
  local option2::Maybe<(Expr ::= Expr Expr Location)> =
    if complementProd.isJust
    then just(constructNot(_, _, _, complementProd.fromJust))
    else nothing();
  top.binaryProd = orElse(option1, option2);
}
aspect production ltOp
top::CompareOp ::=
{
  local option1::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryLtProd), (.rBinaryLtProd));
    
  local complementProd::Maybe<(Expr ::= Expr Expr Location)> = 
    getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryGteProd), (.rBinaryGteProd));
  local option2::Maybe<(Expr ::= Expr Expr Location)> =
    if complementProd.isJust
    then just(constructNot(_, _, _, complementProd.fromJust))
    else nothing();
  top.binaryProd = orElse(option1, option2);
}
aspect production gteOp
top::CompareOp ::=
{
  local option1::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryGteProd), (.rBinaryGteProd));
    
  local complementProd::Maybe<(Expr ::= Expr Expr Location)> = 
    getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryLtProd), (.rBinaryLtProd));
  local option2::Maybe<(Expr ::= Expr Expr Location)> =
    if complementProd.isJust
    then just(constructNot(_, _, _, complementProd.fromJust))
    else nothing();
  top.binaryProd = orElse(option1, option2);
}
aspect production lteOp
top::CompareOp ::=
{
  local option1::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryLtProd), (.rBinaryLtProd));
    
  local complementProd::Maybe<(Expr ::= Expr Expr Location)> = 
    getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryGteProd), (.rBinaryGteProd));
  local option2::Maybe<(Expr ::= Expr Expr Location)> =
    if complementProd.isJust
    then just(constructNot(_, _, _, complementProd.fromJust))
    else nothing();
  top.binaryProd = orElse(option1, option2);
}


--------------------------------------------------------------------------------
aspect production numOp
top::BinOp ::= op::NumOp
{
  top.binaryProd = op.binaryProd;
}

aspect production addOp
top::NumOp ::=
{
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryPlusProd), (.rBinaryPlusProd));
}
aspect production subOp
top::NumOp ::=
{
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryMinusProd), (.rBinaryMinusProd));
}
aspect production mulOp
top::NumOp ::=
{
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryStarProd), (.rBinaryStarProd));
}
aspect production divOp
top::NumOp ::=
{
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinarySlashProd), (.rBinarySlashProd));
}
aspect production modOp
top::NumOp ::=
{
  top.binaryProd = getBinaryProd(top.lop.typerep, top.rop.typerep, (.lBinaryPercentProd), (.rBinaryPercentProd));
}

--------------------------------------------------------------------------------

function getBinaryProd
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type r::Type lAccess::(Maybe<(Expr ::= Expr Expr Location)> ::= Decorated Type) rAccess::(Maybe<(Expr ::= Expr Expr Location)> ::= Decorated Type)
{
  l.otherType = r;
  r.otherType = l;
  -- Warnings here shouldn't be an issue
  return 
    if lAccess(l).isJust
    then lAccess(l)
    else rAccess(r);
}

function constructAssignOp
Expr ::= e1::Expr e2::Expr loc::Location op::BinOp
{
  return
    binaryOpExprDefault(
      e1,
      assignOp(eqOp(location=loc), location=loc),
      binaryOpExpr(e1, op, e2, location=loc),
      location=loc);
}

function constructSubscriptAssignOp
Expr ::= e1::Expr e2::Expr loc::Location op::AssignOp prod::(Expr ::= Expr Expr AssignOp Expr Location)
{
  return
    case e1 of
      arraySubscriptExpr(l, r) -> prod(l, r, op, e2, loc)
    end;
}

function constructNot
Expr ::= e1::Expr e2::Expr loc::Location prod::(Expr ::= Expr Expr Location)
{
  return unaryOpExpr(notOp(location=loc), prod(e1, e2, loc), location=loc);
}
