grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production preIncExpr
top::Expr ::= e::Expr
{
  top.pp = parens( cat( text("++"), e.pp ) );
  propagate env, controlStmtContext;

  forwards to
    case e.typerep.preIncProd of
    | just(prod) -> prod(e)
    | nothing() -> defaultPreIncExpr(e)
    end;
}
abstract production defaultPreIncExpr
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

  forwards to
    case e.typerep.preDecProd of
    | just(prod) -> prod(e)
    | nothing() -> defaultPreDecExpr(e)
    end;
}
abstract production defaultPreDecExpr
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

  forwards to
    case e.typerep.postIncProd of
    | just(prod) -> prod(e)
    | nothing() -> defaultPostIncExpr(e)
    end;
}
abstract production defaultPostIncExpr
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

  forwards to
    case e.typerep.postDecProd of
    | just(prod) -> prod(e)
    | nothing() -> defaultPostDecExpr(e)
    end;
}
abstract production defaultPostDecExpr
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

  forwards to
    case e.typerep.addressOfProd of
    | just(prod) -> prod(e)
    | nothing() -> defaultAddressOfExpr(e)
    end;
}
abstract production defaultAddressOfExpr
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

  forwards to
    case e.typerep.dereferenceProd of
    | just(prod) -> prod(e)
    | nothing() -> defaultDereferenceExpr(e)
    end;
}
abstract production defaultDereferenceExpr
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

  forwards to
    case e.typerep.positiveProd of
    | just(prod) -> prod(e)
    | nothing() -> defaultPositiveExpr(e)
    end;
}
abstract production defaultPositiveExpr
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

  forwards to
    case e.typerep.negativeProd of
    | just(prod) -> prod(e)
    | nothing() -> defaultNegativeExpr(e)
    end;
}
abstract production defaultNegativeExpr
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

  forwards to
    case e.typerep.bitNegateProd of
    | just(prod) -> prod(e)
    | nothing() -> defaultBitNegateExpr(e)
    end;
}
abstract production defaultBitNegateExpr
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

  forwards to
    case e.typerep.notProd of
    | just(prod) -> prod(e)
    | nothing() -> defaultNotExpr(e)
    end;
}
abstract production defaultNotExpr
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

