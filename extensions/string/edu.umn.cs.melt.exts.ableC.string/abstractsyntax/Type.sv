grammar edu:umn:cs:melt:exts:ableC:string:abstractsyntax;

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
top::BaseTypeExpr ::= q::[Qualifier]
{
  propagate substituted;
  forwards to directTypeExpr(stringType(q));
}

abstract production stringType
top::Type ::= q::[Qualifier]
{
  top.lpp = pp"string";
  top.rpp = pp"";

  forwards to
    tagType(q, refIdTagType(structSEU(), "_string_s", s"edu:umn:cs:melt:exts:ableC:string:string"));
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
      charType() -> just(showCharPointer(_, location=_))
    | _ -> nothing()
    end;
  top.strProd = 
    case sub of
      charType() -> just(strChar(_, location=_))
    | _ -> just(showInt(_, location=_))
    end;
  top.pointerStrProd =
    case sub of
      charType() -> just(strCharPointer(_, location=_))
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
      charType() -> just(showCharPointer(_, location=_))
    | _ -> nothing()
    end;
  top.strProd = 
    case sub of
      charType() -> just(strChar(_, location=_))
    | _ -> just(showInt(_, location=_))
    end;
  top.pointerStrProd =
    case sub of
      charType() -> just(strCharPointer(_, location=_))
    | _ -> nothing()
    end;
}