grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production preIncExpr
top::Expr ::= e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( cat( text("++"), e.pp ) );
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;

  top.errors <- 
    if !e.isLValue
    then [err(e.location, "lvalue required as unary operand for ++")]
    else [];
}
abstract production preDecExpr
top::Expr ::= e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( cat( text("--"), e.pp ) );
  top.typerep = e.typerep.integerPromotions;

  top.errors <- 
    if !e.isLValue
    then [err(e.location, "lvalue required as unary operand for --")]
    else [];
}
abstract production postIncExpr
top::Expr ::= e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( cat( e.pp, text("++") ) );
  top.typerep = e.typerep.integerPromotions;

  top.errors <- 
    if !e.isLValue
    then [err(e.location, "lvalue required as unary operand for ++")]
    else [];
}
abstract production postDecExpr
top::Expr ::= e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( cat( e.pp, text("--") ) );
  top.typerep = e.typerep.integerPromotions;

  top.errors <- 
    if !e.isLValue
    then [err(e.location, "lvalue required as unary operand for --")]
    else [];
}
abstract production addressOfExpr
top::Expr ::= e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( cat( text("&"), e.pp ) );
  top.typerep = pointerType(nilQualifier(), e.typerep);

  top.errors <- 
    if !e.isLValue
    then [err(e.location, "lvalue required as unary operand for &")]
    else [];
}
abstract production dereferenceExpr
top::Expr ::= e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( cat(text("*"), e.pp) );
  top.typerep =
    case e.typerep.defaultFunctionArrayLvalueConversion of
    | pointerType(_, innerty) -> innerty
    | _ -> errorType()
    end;
  top.isLValue = true;
  
  top.errors <-
     -- TODO: This error check may need to change for ext host types
    case e.typerep.defaultFunctionArrayLvalueConversion of
    | pointerType(_, _) -> []
    | errorType() -> []
    | _ -> [err(top.location, "invalid type argument of unary ‘*’ (have ‘" ++
                               showType(e.typerep) ++ "’)")]
    end;
}
abstract production positiveExpr
top::Expr ::= e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( cat( text("+"), e.pp ) );
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;
  top.integerConstantValue = e.integerConstantValue;
}
abstract production negativeExpr
top::Expr ::= e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( cat( text("-"), e.pp ) );
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;
  top.integerConstantValue = -e.integerConstantValue;
}
abstract production bitNegateExpr
top::Expr ::= e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( cat( text("~"), e.pp ) );
  top.typerep = e.typerep.defaultLvalueConversion.integerPromotions;
  top.integerConstantValue = nothing(); -- TODO
}
abstract production notExpr
top::Expr ::= e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( cat( text("!"), e.pp ) );
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

