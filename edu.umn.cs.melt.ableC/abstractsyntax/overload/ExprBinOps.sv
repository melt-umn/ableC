
aspect default production
top::BinOp ::=
{
  top.resolved = nothing();
}

aspect production assignOp
top::BinOp ::= op::AssignOp
{
  production attribute subscriptOverloads::[Pair<String (Expr ::= Expr Expr Expr Location)>] with ++;
  production attribute memberOverloads::[Pair<String (Expr ::= Expr Boolean Name Expr Location)>] with ++;
  subscriptOverloads := [];
  memberOverloads := [];

  local option1::Maybe<Expr> = 
    case top.lop of
      arraySubscriptExpr(l, r) ->
        case lookupBy(stringEq, moduleName(l.env, l.typerep), subscriptOverloads) of
          just(prod) -> just(prod(new(l), new(r), new(top.rop), top.location)) 
        | nothing() -> nothing()
        end
    | _ -> nothing()
    end;
  local option2::Maybe<Expr> = 
    case top.lop of
      memberExpr(l, d, r) ->
        case lookupBy(stringEq, moduleName(l.env, l.typerep), memberOverloads) of
          just(prod) -> just(prod(new(l), d, new(r), new(top.rop), top.location)) 
        | nothing() -> nothing()
        end
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
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production mulEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(mulOp(location=top.location), location=top.location));
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production divEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(divOp(location=top.location), location=top.location));
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production modEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(modOp(location=top.location), location=top.location));
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production addEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(addOp(location=top.location), location=top.location));
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production subEqOp
top::AssignOp ::=
{
  top.baseOp = just(numOp(subOp(location=top.location), location=top.location));
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production lshEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(lshBitOp(location=top.location), location=top.location));
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production rshEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(rshBitOp(location=top.location), location=top.location));
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production andEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(andBitOp(location=top.location), location=top.location));
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production orEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(orBitOp(location=top.location), location=top.location));
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production xorEqOp
top::AssignOp ::=
{
  top.baseOp = just(bitOp(xorBitOp(location=top.location), location=top.location));
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
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
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production orBoolOp
top::BoolOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
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
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production orBitOp
top::BitOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production xorBitOp
top::BitOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production lshBitOp
top::BitOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production rshBitOp
top::BitOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
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
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production notEqualsOp
top::CompareOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option4::Maybe<Expr> =
    just(
      unaryOpExpr(
        notOp(location=top.location),
        binaryOpExpr(
          new(top.lop),
          compareOp(equalsOp(location=top.location), location=top.location),
          new(top.rop),
          location=top.location),
        location=top.location)); 
  
  top.resolved = orElse(option1, orElse(option2, orElse(option3, option4)));
}
aspect production gtOp
top::CompareOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production ltOp
top::CompareOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production gteOp
top::CompareOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option4::Maybe<Expr> =
    just(
      unaryOpExpr(
        notOp(location=top.location),
        binaryOpExpr(
          new(top.lop),
          compareOp(ltOp(location=top.location), location=top.location),
          new(top.rop),
          location=top.location),
        location=top.location)); 
  
  top.resolved = orElse(option1, orElse(option2, orElse(option3, option4)));
}
aspect production lteOp
top::CompareOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option4::Maybe<Expr> =
    just(
      unaryOpExpr(
        notOp(location=top.location),
        binaryOpExpr(
          new(top.lop),
          compareOp(gtOp(location=top.location), location=top.location),
          new(top.rop),
          location=top.location),
        location=top.location)); 
  
  top.resolved = orElse(option1, orElse(option2, orElse(option3, option4)));
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
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production subOp
top::NumOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production mulOp
top::NumOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production divOp
top::NumOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}
aspect production modOp
top::NumOp ::=
{
  production attribute overloads::[Pair<Pair<String String> (Expr ::= Expr Expr Location)>] with ++;
  production attribute lOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  production attribute rOverloads::[Pair<String (Expr ::= Expr Expr Location)>] with ++;
  overloads := [];
  lOverloads := [];
  rOverloads := [];
  local option1::Maybe<Expr> =
    case lookupBy(stringPairEq, pair(moduleName(top.lop.env, top.lop.typerep), moduleName(top.rop.env, top.rop.typerep)), overloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option2::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.lop.env, top.lop.typerep), lOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  local option3::Maybe<Expr> =
    case lookupBy(stringEq, moduleName(top.rop.env, top.rop.typerep), rOverloads) of
      just(prod) -> just(prod(new(top.lop), new(top.rop), top.location))
    | nothing() -> nothing()
    end;
  top.resolved = orElse(option1, orElse(option2, option3));
}


--------------------------------------------------------------------------------
function stringPairEq
Boolean ::= p1::Pair<String String> p2::Pair<String String>
{
  return p1.fst == p2.fst && p1.snd == p2.snd;
}
