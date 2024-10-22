grammar edu:umn:cs:melt:ableC:abstractsyntax:construction;

imports silver:langutil;
imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:ableC:concretesyntax as cst;


fun figureOutTypeFromSpecifiers
BaseTypeExpr ::=  q::Qualifiers  pre_ts::[String]  real_ts::[BaseTypeExpr]  mod::[TypeSpecifierMutator] =
  if !null(mod) then
    case mod of
    | modifyTypeSpecifier(f) :: [] -> 
        f(q, figureOutTypeFromSpecifiers(nilQualifier(), pre_ts, real_ts, []))
    | _ ->
        errorTypeExpr([errFromOrigin(q, "Multiple type specifiers" {- TODO -})])
    end
  else if null(pre_ts) && null(real_ts) then
    warnTypeExpr([wrnFromOrigin(q, "Implicit int type specifier -- illegal in C11")],
      builtinTypeExpr(q, signedType(intType())))
  else if !null(pre_ts) && !null(real_ts) then
    errorTypeExpr([errFromOrigin(q, "Multiple type specifiers" {- TODO -})])
  else if null(pre_ts) then
    if length(real_ts) > 1 then
      errorTypeExpr([errFromOrigin(q, "Multiple type specifiers" {- TODO -})])
    else
      head(real_ts)
  else
    fromMaybe(
      errorTypeExpr([errFromOrigin(q, "Unable to interpret type specifiers: " ++ implode(" ", pre_ts))]),
      interpretTypeSpecifiers(q, sort(pre_ts)));


{--
 - Translates a *sorted* type specifier multiset (list) into a BaseTypeExpr,
 - according to the C11 standard.
 -}
fun interpretTypeSpecifiers
Maybe<BaseTypeExpr> ::= q::Qualifiers  sorted_type_specifiers::[String] =
  case sorted_type_specifiers of
  -- signed char:
  | "char" :: [] ->
      just(builtinTypeExpr(q, signedType(charType())))
  | "char" :: "signed" :: [] ->
      just(builtinTypeExpr(q, signedType(charType())))
  -- unsigned char:
  | "char" :: "unsigned" :: [] ->
      just(builtinTypeExpr(q, unsignedType(charType())))
  -- signed short:
  | "short" :: [] ->
      just(builtinTypeExpr(q, signedType(shortType())))
  | "short" :: "signed" :: [] ->
      just(builtinTypeExpr(q, signedType(shortType())))
  | "int" :: "short" :: [] ->
      just(builtinTypeExpr(q, signedType(shortType())))
  | "int" :: "short" :: "signed" :: [] ->
      just(builtinTypeExpr(q, signedType(shortType())))
  -- unsigned short:
  | "int" :: "short" :: "unsigned" :: [] ->
      just(builtinTypeExpr(q, unsignedType(shortType())))
  | "short" :: "unsigned" :: [] ->
      just(builtinTypeExpr(q, unsignedType(shortType())))
  -- signed int:
  | "int" :: [] ->
      just(builtinTypeExpr(q, signedType(intType())))
  | "signed" :: [] ->
      just(builtinTypeExpr(q, signedType(intType())))
  | "int" :: "signed" :: [] ->
      just(builtinTypeExpr(q, signedType(intType())))
  -- unsigned int:
  | "unsigned" :: [] ->
      just(builtinTypeExpr(q, unsignedType(intType())))
  | "int" :: "unsigned" :: [] ->
      just(builtinTypeExpr(q, unsignedType(intType())))
  -- signed long:
  | "long" :: [] ->
      just(builtinTypeExpr(q, signedType(longType())))
  | "long" :: "signed" :: [] ->
      just(builtinTypeExpr(q, signedType(longType())))
  | "int" :: "long" :: [] ->
      just(builtinTypeExpr(q, signedType(longType())))
  | "int" :: "long" :: "signed" :: [] ->
      just(builtinTypeExpr(q, signedType(longType())))
  -- unsigned long:
  | "int" :: "long" :: "unsigned" :: [] ->
      just(builtinTypeExpr(q, unsignedType(longType())))
  | "long" :: "unsigned" :: [] ->
      just(builtinTypeExpr(q, unsignedType(longType())))
  -- signed long long:
  | "long" :: "long" :: [] ->
      just(builtinTypeExpr(q, signedType(longlongType())))
  | "long" :: "long" :: "signed" :: [] ->
      just(builtinTypeExpr(q, signedType(longlongType())))
  | "int" :: "long" :: "long" :: [] ->
      just(builtinTypeExpr(q, signedType(longlongType())))
  | "int" :: "long" :: "long" :: "signed" :: [] ->
      just(builtinTypeExpr(q, signedType(longlongType())))
  -- unsigned long long:
  | "int" :: "long" :: "long" :: "unsigned" :: [] ->
      just(builtinTypeExpr(q, unsignedType(longlongType())))
  | "long" :: "long" :: "unsigned" :: [] ->
      just(builtinTypeExpr(q, unsignedType(longlongType())))
  -- signed __int128:
  | "__int128" :: [] ->
      just(builtinTypeExpr(q, signedType(int128Type())))
  | "__int128" :: "signed" :: [] ->
      just(builtinTypeExpr(q, signedType(int128Type())))
  -- unsigned __int128:
  | "__int128" :: "unsigned" :: [] ->
      just(builtinTypeExpr(q, unsignedType(int128Type())))
  -- float:
  | "float" :: [] ->
      just(builtinTypeExpr(q, realType(floatType())))
  -- double:
  | "double" :: [] ->
      just(builtinTypeExpr(q, realType(doubleType())))
  -- long double:
  | "double" :: "long" :: [] ->
      just(builtinTypeExpr(q, realType(longdoubleType())))
  -- float _Complex:
  | "_Complex" :: "float" :: [] ->
      just(builtinTypeExpr(q, complexType(floatType())))
  -- double _Complex:
  | "_Complex" :: "double" :: [] ->
      just(builtinTypeExpr(q, complexType(doubleType())))
  -- long double _Complex:
  | "_Complex" :: "double" :: "long" :: [] ->
      just(builtinTypeExpr(q, complexType(longdoubleType())))
  -- float _Imaginary:
  | "_Imaginary" :: "float" :: [] ->
      just(builtinTypeExpr(q, imaginaryType(floatType())))
  -- double _Imaginary:
  | "_Imaginary" :: "double" :: [] ->
      just(builtinTypeExpr(q, imaginaryType(doubleType())))
  -- long double _Imaginary:
  | "_Imaginary" :: "double" :: "long" :: [] ->
      just(builtinTypeExpr(q, imaginaryType(longdoubleType())))
  -- char _Complex:
  | "_Complex" :: "char" :: [] ->
      just(builtinTypeExpr(q, complexIntegerType(charType())))
  -- short _Complex:
  | "_Complex" :: "short" :: [] ->
      just(builtinTypeExpr(q, complexIntegerType(shortType())))
  -- int _Complex:
  | "_Complex" :: "int" :: [] ->
      just(builtinTypeExpr(q, complexIntegerType(intType())))
  -- long _Complex:
  | "_Complex" :: "long" :: [] ->
      just(builtinTypeExpr(q, complexIntegerType(longType())))
  -- long long _Complex:
  | "_Complex" :: "long" :: "long" :: [] ->
      just(builtinTypeExpr(q, complexIntegerType(longlongType())))
  
  | _ -> nothing()
  end;

tracked nonterminal TypeSpecifierMutator;
{-- Takes a type specifier, *and* qualifiers (instead of allowing that te to have them)
 -}
abstract production modifyTypeSpecifier
top::TypeSpecifierMutator ::= f::(BaseTypeExpr ::= Qualifiers BaseTypeExpr)
{
}


