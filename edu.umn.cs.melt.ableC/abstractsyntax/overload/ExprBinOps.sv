

aspect default production
top::BinOp ::=
{
  top.resolved = nothing();
}

aspect production assignOp
top::BinOp ::= op::AssignOp
{
  production attribute subscriptOverloads::[Pair<String (Expr ::= Expr Expr Expr)>] with ++;
  production attribute memberOverloads::[Pair<String (Expr ::= Expr Boolean Name Expr)>] with ++;
  subscriptOverloads := [];
  memberOverloads := [];

  local option1::Maybe<Expr> =
    case top.lop of
      arraySubscriptExpr(l, r) ->
        do (bindMaybe, returnMaybe) {
          n :: String <- moduleName(l.env, l.typerep);
          prod :: (Expr ::= Expr Expr Expr) <- lookupBy(stringEq, n, subscriptOverloads);
          return prod(l, r, new(top.rop));
        }
    | _ -> nothing()
    end;
  local option2::Maybe<Expr> = 
    case top.lop of
      memberExpr(l, d, r) ->
        do (bindMaybe, returnMaybe) {
          n :: String <- moduleName(l.env, l.typerep);
          prod :: (Expr ::= Expr Boolean Name Expr) <- lookupBy(stringEq, n, memberOverloads);
          return prod(l, d, r, new(top.rop));
        }
    | _ -> nothing()
    end;
  local option3::Maybe<Expr> = op.resolved;
  local option4::Maybe<Expr> = 
    case op.baseOp of
      just(baseOp) ->
        just(
          binaryOpExpr(
            new(top.lop),
            assignOp(eqOp(location=top.location), location=top.location),
            binaryOpExpr(new(top.lop), baseOp, new(top.rop), location=top.location),
          location=top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, orElse(option3, option4)));
}

synthesized attribute baseOp::Maybe<BinOp> occurs on AssignOp;

aspect production eqOp
top::AssignOp ::=
{
  top.baseOp = nothing();
  
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production mulEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(mulOp(location=top.location), location=top.location));
  
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production divEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(divOp(location=top.location), location=top.location));
  
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production modEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(modOp(location=top.location), location=top.location));
  
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production addEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(addOp(location=top.location), location=top.location));
  
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production subEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(subOp(location=top.location), location=top.location));
  
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production lshEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(lshBitOp(location=top.location), location=top.location));
  
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production rshEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(rshBitOp(location=top.location), location=top.location));
  
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production andEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(andBitOp(location=top.location), location=top.location));
  
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production orEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(orBitOp(location=top.location), location=top.location));
  
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production xorEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(xorBitOp(location=top.location), location=top.location));
  
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}

--------------------------------------------------------------------------------

-- TODO: Automatic equations with DeMorgan's Laws?  
aspect production boolOp
top::BinOp ::= op::BoolOp
{
  top.resolved = op.resolved;
}

aspect production andBoolOp
top::BoolOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production orBoolOp
top::BoolOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}

--------------------------------------------------------------------------------
aspect production bitOp
top::BinOp ::= op::BitOp
{
  top.resolved = op.resolved;
}

aspect production andBitOp
top::BitOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production orBitOp
top::BitOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production xorBitOp
top::BitOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production lshBitOp
top::BitOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production rshBitOp
top::BitOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}

--------------------------------------------------------------------------------
aspect production compareOp
top::BinOp ::= op::CompareOp
{
  top.resolved = op.resolved;
}

aspect production equalsOp
top::CompareOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production notEqualsOp
top::CompareOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  local option1::Maybe<Expr> = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
  local option2::Maybe<Expr> =
    just(
      unaryOpExpr(
        notOp(location=top.location),
        binaryOpExpr(
          new(top.lop),
          compareOp(equalsOp(location=top.location), location=top.location),
          new(top.rop),
          location=top.location),
        location=top.location)); 
  
  top.resolved = orElse(option1, option2);
}
aspect production gtOp
top::CompareOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production ltOp
top::CompareOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production gteOp
top::CompareOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  local option1::Maybe<Expr> = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
  local option2::Maybe<Expr> =
    just(
      unaryOpExpr(
        notOp(location=top.location),
        binaryOpExpr(
          new(top.lop),
          compareOp(ltOp(location=top.location), location=top.location),
          new(top.rop),
          location=top.location),
        location=top.location)); 
  
  top.resolved = orElse(option1, option2);
}
aspect production lteOp
top::CompareOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  local option1::Maybe<Expr> = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
  local option2::Maybe<Expr> =
    just(
      unaryOpExpr(
        notOp(location=top.location),
        binaryOpExpr(
          new(top.lop),
          compareOp(gtOp(location=top.location), location=top.location),
          new(top.rop),
          location=top.location),
        location=top.location)); 
  
  top.resolved = orElse(option1, option2);
}


--------------------------------------------------------------------------------
aspect production numOp
top::BinOp ::= op::NumOp
{
  top.resolved = op.resolved;
}

aspect production addOp
top::NumOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production subOp
top::NumOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production mulOp
top::NumOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production divOp
top::NumOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
aspect production modOp
top::NumOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  top.resolved = getBinaryOverload(top.lop, top.rop, overloads, lOverloads, rOverloads);
}
