grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

import edu:umn:cs:melt:ableC:abstractsyntax:construction;

aspect default production
top::BinOp ::=
{
  top.binaryProd = nothing();
}

aspect production assignOp
top::BinOp ::= op::AssignOp
{
  local tmpName::String = "_tmp" ++ toString(genInt());

  local option1::Maybe<(Expr ::= Expr Expr Location)> = op.binaryProd;
  local option2::Maybe<(Expr ::= Expr Expr Location)> = 
    do (bindMaybe, returnMaybe) {
      baseOp :: BinOp <- op.baseOp;
      baseProd :: (Expr ::= Expr Expr Location) <-
        decorate baseOp with {lop = top.lop; rop = top.rop;}.binaryProd;
      return
        \ lhs::Expr rhs::Expr loc::Location ->
          -- ({${top.lop.typerep} *${tmpName} = &${lhs}; *${tmpName} = *${tmpName} ${baseOp} ${rhs}})
          stmtExpr(
            mkDecl(
              tmpName,
              pointerType([], top.lop.typerep),
              unaryOpExprDefault(addressOfOp(location=loc), lhs, location=loc),
              loc),
            binaryOpExpr(
              unaryOpExprDefault(
                dereferenceOp(location=loc),
                declRefExpr(name(tmpName, location=loc), location=loc),
                location=loc),
              assignOp(eqOp(location=loc), location=loc),
              baseProd(
                unaryOpExprDefault(
                  dereferenceOp(location=loc),
                  declRefExpr(name(tmpName, location=loc), location=loc),
                  location=loc),
                rhs, loc),
              location=loc),
            location=loc);
    };
  top.binaryProd = orElse(option1, option2);
}

synthesized attribute baseOp::Maybe<BinOp> occurs on AssignOp;

aspect production eqOp
top::AssignOp ::=
{
  top.baseOp = nothing();
  top.binaryProd = getEqOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production mulEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(mulOp(location=top.location), location=top.location));
  top.binaryProd = getMulEqAssignOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production divEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(divOp(location=top.location), location=top.location));
  top.binaryProd = getDivEqOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production modEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(modOp(location=top.location), location=top.location));
  top.binaryProd = getModEqOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production addEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(addOp(location=top.location), location=top.location));
  top.binaryProd = getAddEqOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production subEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(subOp(location=top.location), location=top.location));
  top.binaryProd = getSubEqOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production lshEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(lshBitOp(location=top.location), location=top.location));
  top.binaryProd = getLshEqOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production rshEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(rshBitOp(location=top.location), location=top.location));
  top.binaryProd = getRshEqOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production andEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(andBitOp(location=top.location), location=top.location));
  top.binaryProd = getAndEqOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production orEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(orBitOp(location=top.location), location=top.location));
  top.binaryProd = getOrEqOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production xorEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(xorBitOp(location=top.location), location=top.location));
  top.binaryProd = getXorEqOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
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
  top.binaryProd = getAndBoolOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production orBoolOp
top::BoolOp ::=
{
  top.binaryProd = getOrBoolOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
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
  top.binaryProd = getAndBitOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production orBitOp
top::BitOp ::=
{
  top.binaryProd = getOrBitOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production xorBitOp
top::BitOp ::=
{
  top.binaryProd = getXorBitOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production lshBitOp
top::BitOp ::=
{
  top.binaryProd = getLshBitOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production rshBitOp
top::BitOp ::=
{
  top.binaryProd = getRshBitOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
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
  top.binaryProd = getEqualsOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production notEqualsOp
top::CompareOp ::=
{
  local option1::Maybe<(Expr ::= Expr Expr Location)> =
    getNotEqualsOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
  local option2::Maybe<(Expr ::= Expr Expr Location)> =
    case getEqualsOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env) of
      just(prod) ->
        just(
          \ lhs::Expr rhs::Expr loc::Location ->
            unaryOpExpr(notOp(location=loc), prod(lhs, rhs, loc), location=loc))
    | nothing() -> nothing()
    end; 
  
  top.binaryProd = orElse(option1, option2);
}
aspect production gtOp
top::CompareOp ::=
{
  top.binaryProd = getGtOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production ltOp
top::CompareOp ::=
{
  top.binaryProd = getLtOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production gteOp
top::CompareOp ::=
{
  local option1::Maybe<(Expr ::= Expr Expr Location)> =
    getGteOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
  local option2::Maybe<(Expr ::= Expr Expr Location)> =
    case getLtOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env) of
      just(prod) ->
        just(
          \ lhs::Expr rhs::Expr loc::Location ->
            unaryOpExpr(notOp(location=loc), prod(lhs, rhs, loc), location=loc))
    | nothing() -> nothing()
    end; 
  
  top.binaryProd = orElse(option1, option2);
}
aspect production lteOp
top::CompareOp ::=
{
  local option1::Maybe<(Expr ::= Expr Expr Location)> =
    getLteOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
  local option2::Maybe<(Expr ::= Expr Expr Location)> =
    case getGtOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env) of
      just(prod) ->
        just(
          \ lhs::Expr rhs::Expr loc::Location ->
            unaryOpExpr(notOp(location=loc), prod(lhs, rhs, loc), location=loc))
    | nothing() -> nothing()
    end; 
  
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
  top.binaryProd = getAddOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production subOp
top::NumOp ::=
{
  top.binaryProd = getSubOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production mulOp
top::NumOp ::=
{
  top.binaryProd = getMulOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production divOp
top::NumOp ::=
{
  top.binaryProd = getDivOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
aspect production modOp
top::NumOp ::=
{
  top.binaryProd = getModOpOverload(top.lop.typerep, top.rop.typerep, top.lop.env);
}
