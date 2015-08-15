grammar edu:umn:cs:melt:ableC:abstractsyntax:construction;

imports silver:langutil;
imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:concretesyntax as cst;


function figureOutTypeFromSpecifiers
BaseTypeExpr ::= l::Location  q::[Qualifier]  pre_ts::[String]  real_ts::[BaseTypeExpr]  mod::[TypeSpecifierMutator]
{
  return if !null(mod) then
    case mod of
    | modifyTypeSpecifier(f) :: [] -> 
        f(q, figureOutTypeFromSpecifiers(l, [], pre_ts, real_ts, []))
    | _ ->
        errorTypeExpr([err(l, "Multiple type specifiers" {- TODO -})])
    end
  else if null(pre_ts) && null(real_ts) then
    warnTypeExpr([wrn(l, "Implicit int type specifier -- illegal in C11")],
      directTypeExpr(builtinType(q, signedType(intType()))))
  else if !null(pre_ts) && !null(real_ts) then
    errorTypeExpr([err(l, "Multiple type specifiers" {- TODO -})])
  else if null(pre_ts) then
    if length(real_ts) > 1 then
      errorTypeExpr([err(l, "Multiple type specifiers" {- TODO -})])
    else
      head(real_ts)
  else
    fromMaybe(
      errorTypeExpr([err(l, "Unable to interpret type specifiers: " ++ implode(" ", pre_ts))]),
      interpretTypeSpecifiers(q, sortBy(stringLte, pre_ts)));
}


{--
 - Translates a *sorted* type specifier multiset (list) into a BaseTypeExpr,
 - according to the C11 standard.
 -}
function interpretTypeSpecifiers
Maybe<BaseTypeExpr> ::= q::[Qualifier]  sorted_type_specifiers::[String]
{
  return case sorted_type_specifiers of
  -- signed char:
  | "char" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(charType()))))
  | "char" :: "signed" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(charType()))))
  -- unsigned char:
  | "char" :: "unsigned" :: [] ->
      just(directTypeExpr(builtinType(q, unsignedType(charType()))))
  -- signed short:
  | "short" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(shortType()))))
  | "short" :: "signed" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(shortType()))))
  | "int" :: "short" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(shortType()))))
  | "int" :: "short" :: "signed" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(shortType()))))
  -- unsigned short:
  | "int" :: "short" :: "unsigned" :: [] ->
      just(directTypeExpr(builtinType(q, unsignedType(shortType()))))
  | "short" :: "unsigned" :: [] ->
      just(directTypeExpr(builtinType(q, unsignedType(shortType()))))
  -- signed int:
  | "int" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(intType()))))
  | "signed" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(intType()))))
  | "int" :: "signed" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(intType()))))
  -- unsigned int:
  | "unsigned" :: [] ->
      just(directTypeExpr(builtinType(q, unsignedType(intType()))))
  | "int" :: "unsigned" :: [] ->
      just(directTypeExpr(builtinType(q, unsignedType(intType()))))
  -- signed long:
  | "long" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(longType()))))
  | "long" :: "signed" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(longType()))))
  | "int" :: "long" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(longType()))))
  | "int" :: "long" :: "signed" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(longType()))))
  -- unsigned long:
  | "int" :: "long" :: "unsigned" :: [] ->
      just(directTypeExpr(builtinType(q, unsignedType(longType()))))
  | "long" :: "unsigned" :: [] ->
      just(directTypeExpr(builtinType(q, unsignedType(longType()))))
  -- signed long long:
  | "long" :: "long" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(longlongType()))))
  | "long" :: "long" :: "signed" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(longlongType()))))
  | "int" :: "long" :: "long" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(longlongType()))))
  | "int" :: "long" :: "long" :: "signed" :: [] ->
      just(directTypeExpr(builtinType(q, signedType(longlongType()))))
  -- unsigned long:
  | "int" :: "long" :: "long" :: "unsigned" :: [] ->
      just(directTypeExpr(builtinType(q, unsignedType(longlongType()))))
  | "long" :: "long" :: "unsigned" :: [] ->
      just(directTypeExpr(builtinType(q, unsignedType(longlongType()))))
  -- float:
  | "float" :: [] ->
      just(directTypeExpr(builtinType(q, realType(floatType()))))
  -- double:
  | "double" :: [] ->
      just(directTypeExpr(builtinType(q, realType(doubleType()))))
  -- long double:
  | "double" :: "long" :: [] ->
      just(directTypeExpr(builtinType(q, realType(longdoubleType()))))
  -- float _Complex:
  | "_Complex" :: "float" :: [] ->
      just(directTypeExpr(builtinType(q, complexType(floatType()))))
  -- double _Complex:
  | "_Complex" :: "double" :: [] ->
      just(directTypeExpr(builtinType(q, complexType(doubleType()))))
  -- long double _Complex:
  | "_Complex" :: "double" :: "long" :: [] ->
      just(directTypeExpr(builtinType(q, complexType(longdoubleType()))))
  -- float _Imaginary:
  | "_Imaginary" :: "float" :: [] ->
      just(directTypeExpr(builtinType(q, imaginaryType(floatType()))))
  -- double _Imaginary:
  | "_Imaginary" :: "double" :: [] ->
      just(directTypeExpr(builtinType(q, imaginaryType(doubleType()))))
  -- long double _Imaginary:
  | "_Imaginary" :: "double" :: "long" :: [] ->
      just(directTypeExpr(builtinType(q, imaginaryType(longdoubleType()))))
  -- char _Complex:
  | "_Complex" :: "char" :: [] ->
      just(directTypeExpr(builtinType(q, complexIntegerType(charType()))))
  -- short _Complex:
  | "_Complex" :: "short" :: [] ->
      just(directTypeExpr(builtinType(q, complexIntegerType(shortType()))))
  -- int _Complex:
  | "_Complex" :: "int" :: [] ->
      just(directTypeExpr(builtinType(q, complexIntegerType(intType()))))
  -- long _Complex:
  | "_Complex" :: "long" :: [] ->
      just(directTypeExpr(builtinType(q, complexIntegerType(longType()))))
  -- long long _Complex:
  | "_Complex" :: "long" :: "long" :: [] ->
      just(directTypeExpr(builtinType(q, complexIntegerType(longlongType()))))
  
  | _ -> nothing()
  end;
}

nonterminal TypeSpecifierMutator;
{-- Takes a type specifier, *and* qualifiers (instead of allowing that te to have them)
 -}
abstract production modifyTypeSpecifier
top::TypeSpecifierMutator ::= f::(BaseTypeExpr ::= [Qualifier] BaseTypeExpr)
{
}


