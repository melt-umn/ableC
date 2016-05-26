grammar edu:umn:cs:melt:ableC:abstractsyntax:overload;

imports edu:umn:cs:melt:ableC:abstractsyntax hiding directCallExpr
                                             with unaryOpExpr as unaryOpExprDefault,
                                                  arraySubscriptExpr as arraySubscriptExprDefault,
                                                  callExpr as callExprDefault,
                                                  memberExpr as memberExprDefault,
                                                  binaryOpExpr as binaryOpExprDefault;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;

{- Explaination of overloading
 - All standard unary and binary operators may be overloaded, in addition to function calls, array
 - subscripts, and field access.  
 - For unary operators, the overload may be provided simply by
 - providing an equation for one of the operators, which must have type Maybe<(Expr ::= Expr
 - Exprs Location)>.  
 - For binary operators, the equation must have type Maybe<(Expr ::= Expr Expr Location)>.  There
 - is a left and right attribute for each operator.  The left attibute on the left child is first
 - tried, and if that fails, then the right attribute on the right child is used.  In addition,
 - there is an inherited attribute, 'otherType', which provides the type of the other child.  
 - Assignment operators, such as +=, can be automaticly overloaded if the base operator, such as
 - +, is overloaded.  Comparison operators are also overloaded if their negation (!= for ==, >= for
 - <, etc.) as well as ! are both overloaded.  
 - Function call overloading is similar, where the equation is provided by the lhs, and the
 - parameter types are provided through the otherTypes attribute.  The equation must have type
 - Maybe<(Expr ::= Expr Exprs Location)>.  
 - Array subscript overloading is also similar, with the type used as the index passed via
 - otherType.  It must have type subscriptProd::Maybe<(Expr ::= Expr Expr Location)>.  Assignment
 - to an array index is treated specially, handled before plain array indexing or assignment
 - operators.  A special attibute on the base type of the index expression may be defined, with
 - otherType being the type in the brackets, and otherType2 being the type on the rhs of the
 - assignment.  The attribute has type Maybe<(Expr ::= Expr Expr AssignOp Expr Location)>, with 
 - the first Expr being the lhs of the index, the second Expr being the expression in the brackets,
 - the AssignOp being the assignment operator used, and the third Expr being the Expr on the rhs of
 - the assignment.  
 - Member access operators (. and ->) may also be overloaded via the memberProd and memberDerefProd
 - attributes, respectively.  They have type Maybe<(Expr ::= Expr Location)>.  The name used on the
 - rhs of the operator is passed down via the otherName attribute.  To overload a function call of
 - a member access (e.g. foo.bar(x, y, z)), the attributes memberCallProd and memberDerefCallProd
 - may be used, having the same type as a regular call prod.  The attribute name is passed via
 - otherName, and the parameter types via otherTypes.  
 - Note that by default, all possible overloads are checked before the built-in meanings of
 - operators are used.  This can also make type checking / error reporting rather simple because
 - all type checking can simply be done in the overload equation.  If the other types/name are
 - invalid, then nothing() can be returned, meaning the built-in productions will be used.  Either
 - the types can be handled by the built-in production, or an appropriate error message will be
 - produced.  
 -}

inherited attribute otherType::Type occurs on Type;
inherited attribute otherType2::Type occurs on Type;
inherited attribute otherTypes::[Type] occurs on Type; -- Note: extensions usually shouldn't depend on otherTypes for determining whether to dispatch, that error checking is best done manually
inherited attribute otherName::String occurs on Type;

synthesized attribute callProd::Maybe<(Expr ::= Expr Exprs Location)> occurs on Type;
synthesized attribute memberProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute memberDerefProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute memberCallProd::Maybe<(Expr ::= Expr Exprs Location)> occurs on Type;
synthesized attribute memberDerefCallProd::Maybe<(Expr ::= Expr Exprs Location)> occurs on Type;
synthesized attribute subscriptProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute subscriptAssignProd::Maybe<(Expr ::= Expr Expr AssignOp Expr Location)> occurs on Type;

synthesized attribute preIncProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute preDecProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute postIncProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute postDecProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute unaryAndProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute unaryStarProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute unaryPlusProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute unaryMinusProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute unaryTildaProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute unaryBangProd::Maybe<(Expr ::= Expr Location)> occurs on Type;

synthesized attribute lAssignProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignStarProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignSlashProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignPercentProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignPlusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignMinusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignDoubleLtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignDoubleGtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignSingleAndProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignSingleOrProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignCaratProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryDoubleAndProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryDoubleOrProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinarySingleAndProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinarySingleOrProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryCaratProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryDoubleLtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryDoubleGtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryEqProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryNeqProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryGtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryLtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryGteProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryLteProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryPlusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryMinusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryStarProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinarySlashProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryPercentProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignStarProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignSlashProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignPercentProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignPlusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignMinusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignDoubleLtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignDoubleGtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignSingleAndProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignSingleOrProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignCaratProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryDoubleAndProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryDoubleOrProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinarySingleAndProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinarySingleOrProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryCaratProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryDoubleLtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryDoubleGtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryEqProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryNeqProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryGtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryLtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryGteProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryLteProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryPlusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryMinusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryStarProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinarySlashProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryPercentProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;

aspect default production
top::Type ::= 
{
  top.callProd = nothing();
  top.memberProd = nothing();
  top.memberDerefProd = nothing();
  top.memberCallProd = nothing();
  top.memberDerefCallProd = nothing();
  top.subscriptProd = nothing();
  top.subscriptAssignProd = nothing();
  top.preIncProd = nothing();
  top.preDecProd = nothing();
  top.postIncProd = nothing();
  top.postDecProd = nothing();
  top.unaryAndProd = nothing();
  top.unaryStarProd = nothing();
  top.unaryPlusProd = nothing();
  top.unaryMinusProd = nothing();
  top.unaryTildaProd = nothing();
  top.unaryBangProd = nothing();
  top.lAssignProd = nothing();
  top.lAssignStarProd = nothing();
  top.lAssignSlashProd = nothing();
  top.lAssignPercentProd = nothing();
  top.lAssignPlusProd = nothing();
  top.lAssignMinusProd = nothing();
  top.lAssignDoubleLtProd = nothing();
  top.lAssignDoubleGtProd = nothing();
  top.lAssignSingleAndProd = nothing();
  top.lAssignSingleOrProd = nothing();
  top.lAssignCaratProd = nothing();
  top.lBinaryDoubleAndProd = nothing();
  top.lBinaryDoubleOrProd = nothing();
  top.lBinarySingleAndProd = nothing();
  top.lBinarySingleOrProd = nothing();
  top.lBinaryCaratProd = nothing();
  top.lBinaryDoubleLtProd = nothing();
  top.lBinaryDoubleGtProd = nothing();
  top.lBinaryEqProd = nothing();
  top.lBinaryNeqProd = nothing();
  top.lBinaryGtProd = nothing();
  top.lBinaryLtProd = nothing();
  top.lBinaryGteProd = nothing();
  top.lBinaryLteProd = nothing();
  top.lBinaryPlusProd = nothing();
  top.lBinaryMinusProd = nothing();
  top.lBinaryStarProd = nothing();
  top.lBinarySlashProd = nothing();
  top.lBinaryPercentProd = nothing();
  top.rAssignProd = nothing();
  top.rAssignStarProd = nothing();
  top.rAssignSlashProd = nothing();
  top.rAssignPercentProd = nothing();
  top.rAssignPlusProd = nothing();
  top.rAssignMinusProd = nothing();
  top.rAssignDoubleLtProd = nothing();
  top.rAssignDoubleGtProd = nothing();
  top.rAssignSingleAndProd = nothing();
  top.rAssignSingleOrProd = nothing();
  top.rAssignCaratProd = nothing();
  top.rBinaryDoubleAndProd = nothing();
  top.rBinaryDoubleOrProd = nothing();
  top.rBinarySingleAndProd = nothing();
  top.rBinarySingleOrProd = nothing();
  top.rBinaryCaratProd = nothing();
  top.rBinaryDoubleLtProd = nothing();
  top.rBinaryDoubleGtProd = nothing();
  top.rBinaryEqProd = nothing();
  top.rBinaryNeqProd = nothing();
  top.rBinaryGtProd = nothing();
  top.rBinaryLtProd = nothing();
  top.rBinaryGteProd = nothing();
  top.rBinaryLteProd = nothing();
  top.rBinaryPlusProd = nothing();
  top.rBinaryMinusProd = nothing();
  top.rBinaryStarProd = nothing();
  top.rBinarySlashProd = nothing();
  top.rBinaryPercentProd = nothing();
}

-- Make binaryOverload depend on otherType
abstract production hackUnusedType2
top::Type ::=
{
  top.callProd = case top.otherTypes of [errorType()] -> error("unused") | _ -> error("unused1") end;
  top.subscriptProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.subscriptAssignProd = case top.otherType, top.otherType2 of errorType(), errorType() -> error("unused") | _, _ -> error("unused1") end;
  top.memberProd = case top.otherName of "" -> error("unused") | _ -> error("unused1") end;
  top.memberDerefProd = case top.otherName of "" -> error("unused") | _ -> error("unused1") end;
  top.memberCallProd = case top.otherName, top.otherTypes of "", [errorType()] -> error("unused") | _, _ -> error("unused1") end;
  top.memberDerefCallProd = case top.otherName, top.otherTypes of "", [errorType()] -> error("unused") | _, _ -> error("unused1") end;
  top.lAssignProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignStarProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignSlashProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignPercentProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignPlusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignMinusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignDoubleLtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignDoubleGtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignSingleAndProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignSingleOrProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignCaratProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryDoubleAndProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryDoubleOrProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinarySingleAndProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinarySingleOrProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryCaratProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryDoubleLtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryDoubleGtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryEqProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryNeqProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryGtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryGteProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryLtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryLteProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryPlusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryMinusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryStarProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinarySlashProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryPercentProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignStarProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignSlashProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignPercentProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignPlusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignMinusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignDoubleLtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignDoubleGtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignSingleAndProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignSingleOrProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignCaratProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryDoubleAndProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryDoubleOrProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinarySingleAndProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinarySingleOrProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryCaratProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryDoubleLtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryDoubleGtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryEqProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryNeqProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryGtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryGteProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryLtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryLteProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryPlusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryMinusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryStarProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinarySlashProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryPercentProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  
  forwards to errorType();
}