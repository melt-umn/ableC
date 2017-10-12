grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

abstract production unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  top.pp = if op.preExpr
           then parens( cat( op.pp, e.pp ) )
           else parens( cat( e.pp, op.pp ) );
  
  top.typerep = addQualifiers(op.collectedTypeQualifiers, forward.typerep);
  op.op = e;
  top.errors := [];
  
  forwards to
    if null(top.errors)
    then case op.unaryProd of
           just(prod) -> prod(e, top.location)
         | nothing()  -> unaryOpExprDefault(op, e, location=top.location)
         end
    else errorExpr(top.errors, location=top.location);
}
abstract production dereferenceExpr
top::Expr ::= e::Expr
{
  top.pp = parens(cat(text("*"), e.pp));
  top.errors := [];

  forwards to
    if null(top.errors)
    then case getDereferenceOverload(e.typerep, top.env) of
           just(prod) -> prod(e, top.location)
         | nothing()  -> dereferenceExprDefault(e, location=top.location)
         end
    else errorExpr(top.errors, location=top.location);
}
abstract production explicitCastExpr
top::Expr ::= ty::TypeName  e::Expr
{
  top.pp = parens( ppConcat([parens(ty.pp), e.pp]) );
  top.errors := [];

  forwards to
    if null(top.errors)
    then explicitCastExprDefault(ty, e, location=top.location)
    else errorExpr(top.errors, location=top.location);
}
abstract production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  top.pp = parens( ppConcat([ lhs.pp, brackets( rhs.pp )]) );
  top.errors := [];

  forwards to
    if null(top.errors)
    then case getArraySubscriptOverload(lhs.typerep, top.env) of
           just(prod) -> prod(lhs, rhs, top.location)
         | nothing()  -> arraySubscriptExprDefault(lhs, rhs, location=top.location)
         end
    else errorExpr(top.errors, location=top.location);
}
abstract production callExpr
top::Expr ::= f::Expr  a::Exprs
{
  top.pp = parens( ppConcat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );

  a.env = addEnv(f.defs, f.env);
  -- Option 1: Apply a member to arguments (e.g. a.foo(b))
  local option1::Maybe<Expr> = 
    case f of
      memberExpr(l, d, r) ->
        applyMaybe5(getMemberCallOverload(l.typerep, top.env), l, d, r, a, top.location)
    | _ -> nothing()
    end;
  -- Option 2: Normal overloaded application
  local option2::Maybe<Expr> = applyMaybe3(getCallOverload(f.typerep, top.env), f, a, top.location);
  
  forwards to
    if      option1.isJust then option1.fromJust
    else if option2.isJust then option2.fromJust
    else callExprDefault(f, a, location=top.location);
}
abstract production memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  top.pp = parens(ppConcat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  top.errors := [];

  -- get overload function from under pointer if dereferencing
  local ty :: Type =
    if deref
    then case lhs.typerep.withoutAttributes of
           pointerType(_, sub) -> sub
         | _                   -> lhs.typerep
         end
    else lhs.typerep;

  forwards to
    if null(top.errors)
    then case getMemberOverload(ty, top.env) of
           just(prod) -> prod(lhs, deref, rhs, top.location)
         | nothing()  -> memberExprDefault(lhs, deref, rhs, location=top.location)
         end
    else errorExpr(top.errors, location=top.location);
}
abstract production addExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("+"), space(), rhs.pp]) );
  top.errors := [];

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := [];
  local modLhsRhs :: Pair<Expr Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute collectedTypeQualifiers :: [Qualifier] with ++;
  collectedTypeQualifiers := [];

  forwards to
    if null(top.errors)
    then qualifiedExpr(foldQualifier(collectedTypeQualifiers),
           case getAddOverload(lhs.typerep, rhs.typerep, top.env) of
             just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
           | nothing()  -> addExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
           end,
           location=top.location)
    else errorExpr(top.errors, location=top.location);
}
abstract production subtractExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  top.pp = parens( ppConcat([lhs.pp, space(), text("-"), space(), rhs.pp]) );
  top.errors := [];

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := [];
  local modLhsRhs :: Pair<Expr Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute collectedTypeQualifiers :: [Qualifier] with ++;

  forwards to
    if null(top.errors)
    then qualifiedExpr(foldQualifier(collectedTypeQualifiers),
           case getSubOverload(lhs.typerep, rhs.typerep, top.env) of
             just(prod) -> prod(modLhsRhs.fst, modLhsRhs.snd, top.location)
           | nothing()  -> subtractExprDefault(modLhsRhs.fst, modLhsRhs.snd, location=top.location)
           end,
           location=top.location)
    else errorExpr(top.errors, location=top.location);
}
abstract production binaryOpExpr
top::Expr ::= lhs::Expr  op::BinOp  rhs::Expr
{
  -- case op here is a potential problem, since that emits a dep on op->forward, which eventually should probably include env
  -- Find a way to do this that doesn't cause problems if an op forwards.
  top.pp = parens( ppConcat([ 
    {-case op, lhs.pp of
    | assignOp(eqOp()), cat(cat(text("("), lhsNoParens), text(")")) -> lhsNoParens
    | _, _ -> lhs.pp
    end-} lhs.pp, space(), op.pp, space(), rhs.pp ]) );

  top.errors := [];

  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := op.lhsRhsRuntimeMods;
  local modLhsRhs :: Pair<Expr Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute collectedTypeQualifiers :: [Qualifier] with ++;

  rhs.env = addEnv(lhs.defs, lhs.env);
  op.lop = lhs;
  op.rop = rhs;

  -- Option 1: Assign to a member or subscript (e.g. a.foo = b, a[i] = b)
  local option1::Maybe<Expr> =
    case lhs, op of
      arraySubscriptExpr(l, r), assignOp(aOp) ->
        applyMaybe5(getSubscriptAssignOverload(l.typerep, top.env), l, r, aOp, rhs, top.location)
    | memberExpr(l, d, r), assignOp(aOp) ->
        applyMaybe6(getMemberAssignOverload(l.typerep, top.env), l, d, r, aOp, rhs, top.location)
    | _, _ -> nothing()
    end;
  -- Option 2: Normal overloaded binary operators
  local option2::Maybe<Expr> = applyMaybe3(op.binaryProd, lhs, rhs, top.location);
  
  forwards to
    if null(top.errors)
    then qualifiedExpr(foldQualifier(collectedTypeQualifiers),
           if      option1.isJust then option1.fromJust
           else if option2.isJust then option2.fromJust
           else binaryOpExprDefault(modLhsRhs.fst, op, modLhsRhs.snd, location=top.location),
           location=top.location)
    else errorExpr(top.errors, location=top.location);
}

