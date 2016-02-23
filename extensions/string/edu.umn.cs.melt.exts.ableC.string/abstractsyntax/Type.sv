grammar edu:umn:cs:melt:exts:ableC:string:abstractsyntax;

import edu:umn:cs:melt:ableC:abstractsyntax:overload;

synthesized attribute toStringProd::Maybe<(Expr ::= Expr Location)> occurs on Type, BuiltinType;--, IntegerType, RealType;

aspect default production
top::Type ::=
{
  top.toStringProd = nothing();
}

aspect default production
top::BuiltinType ::=
{
  top.toStringProd = nothing();
}
{-
aspect default production
top::IntegerType ::=
{
  top.toStringProd = nothing();
}

aspect default production
top::RealType ::=
{
  top.toStringProd = nothing();
}
-}
abstract production stringTypeExpr 
top::BaseTypeExpr ::= 
{
  forwards to directTypeExpr(stringType());
}

abstract production stringType
top::Type ::= 
{
  top.lBinaryPlusProd =
    case top.otherType.toStringProd of
      just(p) -> just(appendString(_, _, location=_))
    | _ -> nothing()
    end;
  top.rBinaryPlusProd = top.lBinaryPlusProd;
  
  top.lBinaryMinusProd =
    case top.otherType.toStringProd of
      just(p) -> just(removeString(_, _, location=_))
    | _ -> nothing()
    end;
  top.rBinaryMinusProd = top.lBinaryPlusProd;
  
  top.lBinaryStarProd =
    if top.otherType.isIntegerType
    then just(repeatString(_, _, location=_))
    else nothing();
  
  top.lBinaryEqProd =
    case top.otherType of
      stringType() -> just(eqString(_, _, location=_))
    | pointerType(_, builtinType(_, signedType(charType()))) ->
        just(eqString(_, _, location=_))
    | _ -> nothing()
    end;
  top.rBinaryEqProd = top.lBinaryEqProd;
  
  top.lAssignProd = just(assignString(_, _, location=_));
  top.rAssignProd = 
    case top.otherType of
      pointerType(_, builtinType(_, signedType(charType()))) ->
        just(
          binaryOpExpr(
            _,
            assignOp(eqOp(location=builtIn()), location=builtIn()),
            _,
            location=_))
    | _ -> nothing()
    end;
  
  top.toStringProd = just(constructStringFromString(_, location=_));

  forwards to pointerType([], builtinType([constQualifier()], signedType(charType())));
}

aspect production pointerType
top::Type ::= quals::[Qualifier] sub::Type
{
  top.toStringProd =
    case sub of
      builtinType(_, signedType(charType())) -> just(constructStringFromString(_, location=_))
    | builtinType(_, unsignedType(charType())) -> just(constructStringFromString(_, location=_))
    | _ -> nothing()
    end;
}

aspect production builtinType
top::Type ::= quals::[Qualifier] sub::BuiltinType
{
  top.toStringProd = sub.toStringProd;
}

aspect production realType
top::BuiltinType ::= sub::RealType
{
  top.toStringProd = just(constructStringFromFloat(_, location=_));
}

aspect production signedType
top::BuiltinType ::= sub::IntegerType
{
  top.toStringProd = 
    case sub of
      charType() -> just(constructStringFromChar(_, location=_))
    | _ -> just(constructStringFromInt(_, location=_))
    end;
}

aspect production unsignedType
top::BuiltinType ::= sub::IntegerType
{
  top.toStringProd = 
    case sub of
      charType() -> just(constructStringFromChar(_, location=_))
    | _ -> just(constructStringFromInt(_, location=_))
    end;
}