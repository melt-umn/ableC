grammar edu:umn:cs:melt:ableC:abstractsyntax;

{--
 - Primitive C types.
 - Design note: signed and unsigned having 'IntegerType' is ableC's own idiosyntactic design.
 - This can be changed if it turns out that's an annoying choice somehow.
 -}
nonterminal BuiltinType with pp, host<BuiltinType>, integerPromotionsBuiltin, defaultArgumentPromotionsBuiltin, isIntegerType, isArithmeticType;

synthesized attribute integerPromotionsBuiltin :: BuiltinType;
synthesized attribute defaultArgumentPromotionsBuiltin :: BuiltinType;

-- It might be nice to have an enum in Silver or something to represent these.
-- That's Clang's design, complete with duplicate entries for signed/unsigned ints.

{-- void -}
abstract production voidType
top::BuiltinType ::=
{
  propagate host;
  top.pp = text("void");
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
  top.pp = concat([ text("_Complex "), rt.pp ]);
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
  top.pp = concat([ text("_Imaginary "), rt.pp ]);
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
  top.pp = concat([ text(signed), it.pp ]);
  local signed :: String =
    case it of
    | charType() -> ""
    | _ -> "signed "
    end;

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
  top.pp = concat([ text("unsigned "), it.pp ]);
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
  top.pp = concat([ text("_Complex "), it.pp ]);
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


{-- Floating types, for which there is a normal and complex variant -}
nonterminal RealType with pp, host<RealType>;

abstract production floatType
top::RealType ::=
{
  propagate host;
  top.pp = text("float");
}

abstract production doubleType
top::RealType ::=
{
  propagate host;
  top.pp = text("double");
}

abstract production longdoubleType
top::RealType ::=
{
  propagate host;
  top.pp = text("long double");
}


{-- Integer types, for which there is a signed and unsigned variant -}
nonterminal IntegerType with pp, host<IntegerType>, integerConversionRank;

synthesized attribute integerConversionRank :: Integer;

abstract production charType
top::IntegerType ::=
{
  propagate host;
  top.pp = text("char");
  top.integerConversionRank = 0;
}

abstract production shortType
top::IntegerType ::=
{
  propagate host;
  top.pp = text("short");
  top.integerConversionRank = 1;
}

abstract production intType
top::IntegerType ::=
{
  propagate host;
  top.pp = text("int");
  top.integerConversionRank = 2;
}

abstract production longType
top::IntegerType ::=
{
  propagate host;
  top.pp = text("long");
  top.integerConversionRank = 3;
}

abstract production longlongType
top::IntegerType ::=
{
  propagate host;
  top.pp = text("long long");
  top.integerConversionRank = 4;
}

abstract production int128Type
top::IntegerType ::=
{
  propagate host;
  top.pp = text("__int128");
  top.integerConversionRank = 5;
}

