grammar edu:umn:cs:melt:exts:ableC:string:abstractsyntax;

import edu:umn:cs:melt:ableC:abstractsyntax:overload;

synthesized attribute showProd::Maybe<(Expr ::= Expr Location)> occurs on Type, BuiltinType;--, IntegerType, RealType;
synthesized attribute pointerShowProd::Maybe<(Expr ::= Expr Location)> occurs on Type, BuiltinType;--, IntegerType, RealType;
synthesized attribute strProd::Maybe<(Expr ::= Expr Location)> occurs on Type, BuiltinType;--, IntegerType, RealType;
synthesized attribute pointerStrProd::Maybe<(Expr ::= Expr Location)> occurs on Type, BuiltinType;--, IntegerType, RealType;

aspect default production
top::Type ::=
{
  top.showProd = nothing();
  top.pointerShowProd = nothing();
  top.strProd = nothing();
  top.pointerStrProd = nothing();
}

aspect default production
top::BuiltinType ::=
{
  top.showProd = nothing();
  top.pointerShowProd = nothing();
  top.strProd = nothing();
  top.pointerStrProd = nothing();
}
{-
aspect default production
top::IntegerType ::=
{
  top.showProd = nothing();
  top.pointerShowProd = nothing();
  top.strProd = nothing();
  top.pointerStrProd = nothing();
}

aspect default production
top::RealType ::=
{
  top.showProd = nothing();
  top.pointerShowProd = nothing();
  top.strProd = nothing();
  top.pointerStrProd = nothing();
}
-}

abstract production stringTypeExpr 
top::BaseTypeExpr ::= 
{
  propagate substituted;
  forwards to directTypeExpr(stringType());
}

abstract production stringType
top::Type ::= 
{
  top.lpp = pp"string";
  top.rpp = pp"";
  
  top.lBinaryPlusProd =
    case top.otherType.showProd of
      just(p) -> just(appendString(_, _, location=_))
    | _ -> nothing()
    end;
  top.rBinaryPlusProd = top.lBinaryPlusProd;
  
  top.lBinaryMinusProd =
    case top.otherType.showProd of
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
    
  top.subscriptProd = just(subscriptString(_, _, location=_));
  top.subscriptAssignProd = just(subscriptAssignString(_, _, _, _, location=_));
    
  top.memberCallProd = 
    case top.otherName of
      "substring" -> just(substringString(_, _, location=_))
    | _ -> nothing()
    end;
    
  top.memberProd = 
    case top.otherName of
      "length" -> just(lengthString(_, location=_))
    | _ -> nothing()
    end;
  
  top.showProd = just(showString(_, location=_));
  top.strProd = just(strString(_, location=_));

  forwards to pointerType([], builtinType([constQualifier()], signedType(charType())));
}

aspect production pointerType
top::Type ::= quals::[Qualifier] sub::Type
{
  top.showProd =
    case sub.pointerShowProd of
      just(prod) -> just(prod)
    | nothing() -> just(showPointer(_, location=_))
    end;
  top.strProd =
    case sub.pointerStrProd of
      just(prod) -> just(prod)
    | nothing() -> just(strPointer(_, location=_))
    end;
}

aspect production builtinType
top::Type ::= quals::[Qualifier] sub::BuiltinType
{
  top.showProd = sub.showProd;
  top.pointerShowProd = sub.pointerShowProd;
  top.strProd = sub.strProd;
  top.pointerStrProd = sub.pointerStrProd;
}

aspect production realType
top::BuiltinType ::= sub::RealType
{
  top.showProd = just(showFloat(_, location=_));
  top.strProd = just(showFloat(_, location=_));
}

aspect production signedType
top::BuiltinType ::= sub::IntegerType
{
  top.showProd = 
    case sub of
      charType() -> just(showChar(_, location=_))
    | _ -> just(showInt(_, location=_))
    end;
  top.pointerShowProd =
    case sub of
      charType() -> just(showString(_, location=_))
    | _ -> nothing()
    end;
  top.strProd = 
    case sub of
      charType() -> just(strChar(_, location=_))
    | _ -> just(showInt(_, location=_))
    end;
  top.pointerStrProd =
    case sub of
      charType() -> just(strString(_, location=_))
    | _ -> nothing()
    end;
}

aspect production unsignedType
top::BuiltinType ::= sub::IntegerType
{
  top.showProd = 
    case sub of
      charType() -> just(showChar(_, location=_))
    | _ -> just(showInt(_, location=_))
    end;
  top.pointerShowProd =
    case sub of
      charType() -> just(showString(_, location=_))
    | _ -> nothing()
    end;
  top.strProd = 
    case sub of
      charType() -> just(strChar(_, location=_))
    | _ -> just(showInt(_, location=_))
    end;
  top.pointerStrProd =
    case sub of
      charType() -> just(strString(_, location=_))
    | _ -> nothing()
    end;
}