grammar edu:umn:cs:melt:ableC:abstractsyntax;

{--
 - Type representations, with qualifiers on appropriate constructors,
 - distinct from type expressions which are environment-independent.
 -
 - Host is included, we might want that, but lifted doesn't make sense in this context.
 -
 - Variants: builtin, pointer, array, function, tagged, noncanonical.
 - Noncanonical forwards, and so doesn't need any attributes, etc attached to it.
 -}
nonterminal Type with lpp, rpp, host<Type>, baseTypeExpr, typeModifierExpr, mangledName, integerPromotions, defaultArgumentPromotions, defaultLvalueConversion, defaultFunctionArrayLvalueConversion, isIntegerType, isScalarType, isArithmeticType, withoutAttributes, withoutTypeQualifiers, withoutExtensionQualifiers<Type>, withTypeQualifiers, addedTypeQualifiers, qualifiers, mergeQualifiers<Type>, errors;
flowtype Type = decorate {}, baseTypeExpr {}, typeModifierExpr {}, integerPromotions {}, defaultArgumentPromotions {}, defaultLvalueConversion {}, defaultFunctionArrayLvalueConversion {}, isIntegerType {}, isScalarType {}, isArithmeticType {}, withoutAttributes {}, withoutTypeQualifiers {}, withoutExtensionQualifiers {}, withTypeQualifiers {addedTypeQualifiers}, qualifiers {}, mergeQualifiers {};

-- Used to turn a Type back into a TypeName
synthesized attribute baseTypeExpr :: BaseTypeExpr;
synthesized attribute typeModifierExpr :: TypeModifierExpr;

-- Compute a unique name for a type that is a valid C identifier
synthesized attribute mangledName :: String;
flowtype mangledName {} on
  Type, FunctionType, TagType, StructOrEnumOrUnion,
  Qualifiers, Qualifier,
  BuiltinType, RealType, IntegerType;

-- char -> int and stuff in operations
synthesized attribute integerPromotions :: Type;
-- float -> double for variadic args
synthesized attribute defaultArgumentPromotions :: Type;
-- drop qualifiers and attributes
synthesized attribute defaultLvalueConversion :: Type;
-- conversion to pointers
synthesized attribute defaultFunctionArrayLvalueConversion :: Type;

-- Strip top-level only of GCC __attribute__s from the type
synthesized attribute withoutAttributes :: Type;

-- Strip top-level only of qualifiers from the type
synthesized attribute withoutTypeQualifiers :: Type;

-- Strip non-host qualifiers from all levels of the type
synthesized attribute withoutExtensionQualifiers<a> :: a;

-- To support accumulation of extension qualifiers on redeclaration
synthesized attribute mergeQualifiers<a> :: (a ::= a);

-- Used in addQualifiers to add qualifiers to a type
synthesized attribute withTypeQualifiers :: Type;
inherited attribute addedTypeQualifiers :: [Qualifier];

{-- The subtypes of arrays -}
nonterminal ArrayType with pp, host<ArrayType>;
flowtype ArrayType = decorate {};

{-- Modifiers attached to array types that are function parameters -}
nonterminal ArraySizeModifier with pps;
flowtype ArraySizeModifier = decorate {};

{-- The subtypes of functions -}
nonterminal FunctionType with lpp, rpp, host<FunctionType>, mangledName, errors, withoutExtensionQualifiers<FunctionType>, mergeQualifiers<FunctionType>;
flowtype FunctionType = decorate {};
-- clang has an 'extinfo' structure with calling convention, noreturn, 'produces'?, regparam

{-- Structs, unions and enums -}
nonterminal TagType with pp, host<TagType>, mangledName, isIntegerType;
flowtype TagType = decorate {}, isIntegerType {};

nonterminal StructOrEnumOrUnion with pp, mangledName; -- Silver enums would be nice.
{-- Types that resolve to other types. -}
nonterminal NoncanonicalType with canonicalType, lpp, rpp, host<NoncanonicalType>, baseTypeExpr, typeModifierExpr;
flowtype NoncanonicalType = decorate {}, canonicalType {}, baseTypeExpr {}, typeModifierExpr {};

synthesized attribute canonicalType :: Type;

