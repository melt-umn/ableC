grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production preIncExpr
top::Expr ::= e::Expr
{
  top.pp = parens( cat( text("++"), e.pp ) );
  propagate env, controlStmtContext;

  local prod::UnaryUpdateOp = fromMaybe(defaultPreIncExpr, e.typerep.preIncProd);
  forwards to prod(e);
}
abstract production defaultPreIncExpr implements UnaryUpdateOp
top::Expr ::= @e::Expr
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = forwardParent.pp;
  top.host = preIncExpr(e.host);
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;

  top.errors <- 
    if !e.isLValue
    then [errFromOrigin(e, "lvalue required as unary operand for ++")]
    else [];
}

abstract production preDecExpr
top::Expr ::= e::Expr
{
  top.pp = parens( cat( text("--"), e.pp ) );
  propagate env, controlStmtContext;

  local prod::UnaryUpdateOp = fromMaybe(defaultPreDecExpr, e.typerep.preDecProd);
  forwards to prod(e);
}
abstract production defaultPreDecExpr implements UnaryUpdateOp
top::Expr ::= @e::Expr
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = forwardParent.pp;
  top.host = preDecExpr(e.host);
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;

  top.errors <- 
    if !e.isLValue
    then [errFromOrigin(e, "lvalue required as unary operand for --")]
    else [];
}

abstract production postIncExpr
top::Expr ::= e::Expr
{
  top.pp = parens( cat( e.pp, text("++") ) );
  propagate env, controlStmtContext;

  local prod::UnaryUpdateOp = fromMaybe(defaultPostIncExpr, e.typerep.postIncProd);
  forwards to prod(e);
}
abstract production defaultPostIncExpr implements UnaryUpdateOp
top::Expr ::= @e::Expr
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = forwardParent.pp;
  top.host = postIncExpr(e.host);
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;

  top.errors <- 
    if !e.isLValue
    then [errFromOrigin(e, "lvalue required as unary operand for ++")]
    else [];
}

abstract production postDecExpr
top::Expr ::= e::Expr
{
  top.pp = parens( cat( e.pp, text("--") ) );
  propagate env, controlStmtContext;

  local prod::UnaryUpdateOp = fromMaybe(defaultPostDecExpr, e.typerep.postDecProd);
  forwards to prod(e);
}
abstract production defaultPostDecExpr implements UnaryUpdateOp
top::Expr ::= @e::Expr
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = forwardParent.pp;
  top.host = postDecExpr(e.host);
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;

  top.errors <- 
    if !e.isLValue
    then [errFromOrigin(e, "lvalue required as unary operand for --")]
    else [];
}

abstract production addressOfExpr
top::Expr ::= e::Expr
{
  top.pp = parens( cat( text("&"), e.pp ) );
  propagate env, controlStmtContext;

  local prod::UnaryOp = fromMaybe(defaultAddressOfExpr, e.typerep.addressOfProd);
  forwards to prod(e);
}
-- Non-overloaded version, used in overloading resolution for assignment operators
production hostAddressOfExpr
top::Expr ::= e::Expr
{
  propagate env, controlStmtContext;
  forwards to defaultAddressOfExpr(e);
}
abstract production defaultAddressOfExpr implements UnaryOp
top::Expr ::= @e::Expr
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = forwardParent.pp;
  top.host = addressOfExpr(e.host);
  top.typerep = pointerType(nilQualifier(), e.typerep);
  top.isLValue = false;
  top.isSimple = e.isSimple;

  top.errors <- 
    if !e.isLValue
    then [errFromOrigin(e, "lvalue required as unary operand for &")]
    else [];
}

abstract production dereferenceExpr
top::Expr ::= e::Expr
{
  top.pp = parens( cat( text("*"), e.pp ) );
  propagate env, controlStmtContext;

  local prod::UnaryOp = fromMaybe(defaultDereferenceExpr, e.typerep.dereferenceProd);
  forwards to prod(e);
}
abstract production defaultDereferenceExpr implements UnaryOp
top::Expr ::= @e::Expr
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = forwardParent.pp;
  top.host = dereferenceExpr(e.host);
  top.typerep =
    case e.typerep.defaultFunctionArrayLvalueConversion of
    | pointerType(_, innerty) -> ^innerty
    | _ -> errorType()
    end;
  top.isLValue = true;
  top.isSimple = e.isSimple;
  
  top.errors <-
     -- TODO: This error check may need to change for ext host types
    case e.typerep.defaultFunctionArrayLvalueConversion of
    | pointerType(_, _) -> []
    | errorType() -> []
    | _ -> [errFromOrigin(top, "invalid type argument of unary ‘*’ (have ‘" ++
                               show(80, e.typerep) ++ "’)")]
    end;
}

abstract production positiveExpr
top::Expr ::= e::Expr
{
  top.pp = parens( cat( text("+"), e.pp ) );
  propagate env, controlStmtContext;

  local prod::UnaryOp = fromMaybe(defaultPositiveExpr, e.typerep.positiveProd);
  forwards to prod(e);
}
abstract production defaultPositiveExpr implements UnaryOp
top::Expr ::= @e::Expr
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = forwardParent.pp;
  top.host = positiveExpr(e.host);
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;
  top.integerConstantValue = e.integerConstantValue;
}

abstract production negativeExpr
top::Expr ::= e::Expr
{
  top.pp = parens( cat( text("-"), e.pp ) );
  propagate env, controlStmtContext;

  local prod::UnaryOp = fromMaybe(defaultNegativeExpr, e.typerep.negativeProd);
  forwards to prod(e);
}
abstract production defaultNegativeExpr implements UnaryOp
top::Expr ::= @e::Expr
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = forwardParent.pp;
  top.host = negativeExpr(e.host);
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;
  top.integerConstantValue = -e.integerConstantValue;
}

abstract production bitNegateExpr
top::Expr ::= e::Expr
{
  top.pp = parens( cat( text("~"), e.pp ) );
  propagate env, controlStmtContext;

  local prod::UnaryOp = fromMaybe(defaultBitNegateExpr, e.typerep.bitNegateProd);
  forwards to prod(e);
}
abstract production defaultBitNegateExpr implements UnaryOp
top::Expr ::= @e::Expr
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = forwardParent.pp;
  top.host = bitNegateExpr(e.host);
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;
  top.integerConstantValue = nothing(); -- TODO
}

abstract production notExpr
top::Expr ::= e::Expr
{
  top.pp = parens( cat( text("!"), e.pp ) );
  propagate env, controlStmtContext;

  local prod::UnaryOp = fromMaybe(defaultNotExpr, e.typerep.notProd);
  forwards to prod(e);
}
abstract production defaultNotExpr implements UnaryOp
top::Expr ::= @e::Expr
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = forwardParent.pp;
  top.host = notExpr(e.host);
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;
  top.integerConstantValue = if e.integerConstantValue != 0 then 1 else 0;
}

-- GCC extension
abstract production realExpr
top::Expr ::= e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( cat( text("__real__"), e.pp ) );
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;
}
-- GCC extension
abstract production imagExpr
top::Expr ::= e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( cat( text("__imag__"), e.pp ) );
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;
}

abstract production sizeofExpr
top::Expr ::= e::ExprOrTypeName
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( ppConcat([text("sizeof"), parens(e.pp)]) );
  top.typerep = builtinType(nilQualifier(), signedType(intType())); -- TODO result type
}
-- C11
abstract production alignofExpr
top::Expr ::= e::ExprOrTypeName
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( ppConcat([text("_Alignof"), parens(e.pp)]) );
  top.typerep = builtinType(nilQualifier(), signedType(intType())); -- TODO result type
}

