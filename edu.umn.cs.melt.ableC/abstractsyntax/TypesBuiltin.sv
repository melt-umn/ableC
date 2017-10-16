grammar edu:umn:cs:melt:ableC:abstractsyntax;

nonterminal BuiltinType with pp, host<BuiltinType>, mangledName, integerPromotionsBuiltin, defaultArgumentPromotionsBuiltin, isIntegerType, isArithmeticType;
flowtype BuiltinType = decorate {}, integerPromotionsBuiltin {}, defaultArgumentPromotionsBuiltin {}, isIntegerType {}, isArithmeticType {};

synthesized attribute integerPromotionsBuiltin :: BuiltinType;
synthesized attribute defaultArgumentPromotionsBuiltin :: BuiltinType;

{-- Floating types, for which there is a normal and complex variant -}
nonterminal RealType with pp, host<RealType>, mangledName;
flowtype RealType = decorate {};

{-- Integer types, for which there is a signed and unsigned variant -}
nonterminal IntegerType with pp, host<IntegerType>, mangledName, integerConversionRank;
flowtype IntegerType = decorate {}, integerConversionRank {};

synthesized attribute integerConversionRank :: Integer;

