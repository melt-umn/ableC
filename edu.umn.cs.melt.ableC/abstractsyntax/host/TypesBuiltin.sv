grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

-- It might be nice to have an enum in Silver or something to represent these.
-- That's Clang's design, complete with duplicate entries for signed/unsigned ints.

{-- void -}
abstract production voidType
top::BuiltinType ::=
{
  propagate host;
  top.pp = text("void");
  top.mangledName = "void";
  top.integerPromotionsBuiltin = top;
  top.defaultArgumentPromotionsBuiltin = top;
  top.isIntegerType = false;
  top.isArithmeticType = false;
}

{-- _Bool -}
abstract production boolType
top::BuiltinType ::=
{
  propagate host;
  top.pp = text("_Bool");
  top.mangledName = "bool";
  top.integerPromotionsBuiltin = signedType(intType()); -- yep.
  top.defaultArgumentPromotionsBuiltin = top.integerPromotionsBuiltin;
  top.isIntegerType = true;
  top.isArithmeticType = true;
}

{-- any real type -}
abstract production realType
top::BuiltinType ::= rt::RealType
{
  propagate host;
  top.pp = rt.pp;
  top.mangledName = "real_" ++ rt.mangledName;
  top.integerPromotionsBuiltin = top;
  top.defaultArgumentPromotionsBuiltin =
    realType(
      case rt of
      | floatType() -> doubleType()
      | _ -> rt
      end);
  top.isIntegerType = false;
  top.isArithmeticType = true;
}

{-- any _Complex type -}
abstract production complexType
top::BuiltinType ::= rt::RealType
{
  propagate host;
  top.pp = ppConcat([ text("_Complex "), rt.pp ]);
  top.mangledName = "complex_" ++ rt.mangledName;
  top.integerPromotionsBuiltin = top;
  top.defaultArgumentPromotionsBuiltin =
    complexType(
      case rt of
      | floatType() -> doubleType()
      | _ -> rt
      end);
  top.isIntegerType = false;
  top.isArithmeticType = true;
}

{-- any _Imaginary type -}
abstract production imaginaryType
top::BuiltinType ::= rt::RealType
{
  propagate host;
  top.pp = ppConcat([ text("_Imaginary "), rt.pp ]);
  top.mangledName = "imaginary_" ++ rt.mangledName;
  top.integerPromotionsBuiltin = top;
  top.defaultArgumentPromotionsBuiltin =
    imaginaryType(
      case rt of
      | floatType() -> doubleType()
      | _ -> rt
      end);
  top.isIntegerType = false;
  top.isArithmeticType = true;
}

{-- any signed integer type -}
abstract production signedType
top::BuiltinType ::= it::IntegerType
{
  propagate host;
  top.pp = ppConcat([ text(signed), it.pp ]);
  local signed :: String =
    case it of
    | charType() -> ""
    | _ -> "signed "
    end;
  top.mangledName = "signed_" ++ it.mangledName;

  top.integerPromotionsBuiltin = 
    signedType(
      case it of
      | charType() -> intType()
      | shortType() -> intType()
      | _ -> it
      end);
  top.defaultArgumentPromotionsBuiltin = top.integerPromotionsBuiltin;
  top.isIntegerType = true;
  top.isArithmeticType = true;
}

{-- any unsigned integer type -}
abstract production unsignedType
top::BuiltinType ::= it::IntegerType
{
  propagate host;
  top.pp = ppConcat([ text("unsigned "), it.pp ]);
  top.mangledName = "unsigned_" ++ it.mangledName;
  top.integerPromotionsBuiltin = 
    case it of
    | charType() -> signedType(intType())
    | shortType() -> signedType(intType())
    | _ -> top
    end;
  top.defaultArgumentPromotionsBuiltin = top.integerPromotionsBuiltin;
  top.isIntegerType = true;
  top.isArithmeticType = true;
}

{-- any _Complex *integer* type -- probably a gcc extension? -}
abstract production complexIntegerType
top::BuiltinType ::= it::IntegerType
{
  propagate host;
  top.pp = ppConcat([ text("_Complex "), it.pp ]);
  top.mangledName = "complexinteger_" ++ it.mangledName;
  top.integerPromotionsBuiltin = 
    complexIntegerType(
      case it of
      | charType() -> intType()
      | shortType() -> intType()
      | _ -> it
      end);
  top.defaultArgumentPromotionsBuiltin = top.integerPromotionsBuiltin;
  top.isIntegerType = false; -- even though based on integers, not defined to be so
  top.isArithmeticType = true;
}

abstract production floatType
top::RealType ::=
{
  propagate host;
  top.pp = text("float");
  top.mangledName = "float";
}

abstract production doubleType
top::RealType ::=
{
  propagate host;
  top.pp = text("double");
  top.mangledName = "double";
}

abstract production longdoubleType
top::RealType ::=
{
  propagate host;
  top.pp = text("long double");
  top.mangledName = "longdouble";
}

abstract production charType
top::IntegerType ::=
{
  propagate host;
  top.pp = text("char");
  top.mangledName = "char";
  top.integerConversionRank = 0;
}

abstract production shortType
top::IntegerType ::=
{
  propagate host;
  top.pp = text("short");
  top.mangledName = "short";
  top.integerConversionRank = 1;
}

abstract production intType
top::IntegerType ::=
{
  propagate host;
  top.pp = text("int");
  top.mangledName = "int";
  top.integerConversionRank = 2;
}

abstract production longType
top::IntegerType ::=
{
  propagate host;
  top.pp = text("long");
  top.mangledName = "long";
  top.integerConversionRank = 3;
}

abstract production longlongType
top::IntegerType ::=
{
  propagate host;
  top.pp = text("long long");
  top.mangledName = "longlong";
  top.integerConversionRank = 4;
}

abstract production int128Type
top::IntegerType ::=
{
  propagate host;
  top.pp = text("__int128");
  top.mangledName = "int128";
  top.integerConversionRank = 5;
}

