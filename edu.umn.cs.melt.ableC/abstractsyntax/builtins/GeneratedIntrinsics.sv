grammar edu:umn:cs:melt:ableC:abstractsyntax:builtins;
--GENERATED FILE, DO NOT EDIT. see :tools:builtins
aspect function getInitialEnvDefs [Def] ::= {
d <- [valueDef("__builtin_ia32_femms", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgusb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pf2id", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfacc", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfadd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfcmpeq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfcmpge", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfcmpgt", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfmax", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfmin", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfmul", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfrcp", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfrcpit1", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfrcpit2", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfrsqrt", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfrsqit1", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfsub", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfsubr", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pi2fd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhrw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pf2iw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfnacc", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfpnacc", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float, __attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pi2fw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pswapdsf", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) float(__attribute__((__vector_size__(2))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pswapdsi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_emms", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmullw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddwd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pand", builtinFunctionValueItem( {-  __attribute__((__vector_size__(1))) signed long long(__attribute__((__vector_size__(1))) signed long long, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pandn", builtinFunctionValueItem( {-  __attribute__((__vector_size__(1))) signed long long(__attribute__((__vector_size__(1))) signed long long, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_por", builtinFunctionValueItem( {-  __attribute__((__vector_size__(1))) signed long long(__attribute__((__vector_size__(1))) signed long long, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pxor", builtinFunctionValueItem( {-  __attribute__((__vector_size__(1))) signed long long(__attribute__((__vector_size__(1))) signed long long, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslld", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(1))) signed long long(__attribute__((__vector_size__(1))) signed long long, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrld", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(1))) signed long long(__attribute__((__vector_size__(1))) signed long long, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psraw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrad", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllwi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslldi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllqi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(1))) signed long long(__attribute__((__vector_size__(1))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlwi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrldi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlqi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(1))) signed long long(__attribute__((__vector_size__(1))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrawi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psradi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packsswb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packssdw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packuswb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_punpckhbw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_punpckhwd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_punpckhdq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_punpcklbw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_punpcklwd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_punpckldq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpeqb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpeqw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpeqd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpgtb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpgtw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpgtd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskmovq", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char, char * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType())))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntq", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(1))) signed long long * , __attribute__((__vector_size__(1))) signed long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_init_v2si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_init_v4hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(signed short, signed short, signed short, signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([builtinType(nilQualifier(), signedType(shortType())), builtinType(nilQualifier(), signedType(shortType())), builtinType(nilQualifier(), signedType(shortType())), builtinType(nilQualifier(), signedType(shortType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_init_v8qi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(char, char, char, char, char, char, char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_ext_v2si", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) signed int, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpi2ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2pi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2pi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxub", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminub", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovmskb", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(8))) char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhuw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psadbw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2pi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpi2pd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2pi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(1))) signed long long(__attribute__((__vector_size__(1))) signed long long, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmuludq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(1))) signed long long(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(1))) signed long long(__attribute__((__vector_size__(1))) signed long long, __attribute__((__vector_size__(1))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 1)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_palignr", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddubsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhrsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed short(__attribute__((__vector_size__(4))) signed short, __attribute__((__vector_size__(4))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 4), vectorType(builtinType(nilQualifier(), signedType(shortType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed int(__attribute__((__vector_size__(2))) signed int, __attribute__((__vector_size__(2))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 2), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comieq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comilt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comile", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comigt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comige", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comineq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomieq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomilt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomile", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomigt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomige", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomineq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comisdeq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comisdlt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comisdle", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comisdgt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comisdge", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comisdneq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomisdeq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomisdlt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomisdle", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomisdgt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomisdge", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomisdneq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmppd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxub128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminub128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packsswb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packssdw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packuswb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhuw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_addsubps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_addsubpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_haddps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_haddpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_hsubps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_hsubpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddubsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhrsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ldmxcsr", builtinFunctionValueItem( {-  void(unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_stmxcsr", builtinFunctionValueItem( {-  unsigned int(void) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtss2si", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtss2si64", builtinFunctionValueItem( {-  signed long long(__attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(longlongType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeups", builtinFunctionValueItem( {-  void(float * , __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(floatType()))), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storehps", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(2))) signed int * , __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storelps", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(2))) signed int * , __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 2)), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movmskps", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntps", builtinFunctionValueItem( {-  void(float * , __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(floatType()))), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sfence", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcpps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcpss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrtps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrtss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskmovdqu", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType())))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeupd", builtinFunctionValueItem( {-  void(double * , __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(doubleType()))), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movmskpd", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovmskb128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movnti", builtinFunctionValueItem( {-  void(signed int * , signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType()))), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntpd", builtinFunctionValueItem( {-  void(double * , __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(doubleType()))), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntdq", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(2))) signed long long * , __attribute__((__vector_size__(2))) signed long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psadbw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtdq2pd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtdq2ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2dq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2dq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtsd2si", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtsd2si64", builtinFunctionValueItem( {-  signed long long(__attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(longlongType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2dq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2pd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2dq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_clflush", builtinFunctionValueItem( {-  void(const void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_lfence", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_mfence", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedqu", builtinFunctionValueItem( {-  void(char * , __attribute__((__vector_size__(16))) char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmuludq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psraw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrad128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrld128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslldqi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrldqi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslld128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllwi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslldi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllqi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlwi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrldi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlqi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrawi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psradi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddwd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_monitor", builtinFunctionValueItem( {-  void(void * , unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_mwait", builtinFunctionValueItem( {-  void(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_lddqu", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(const char * ) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_palignr128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insertps128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pblendvb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pblendw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendvpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendvps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packusdw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxud128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxuw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminud128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminuw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsxbd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsxbq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsxbw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsxdq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsxwd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsxwq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovzxbd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovzxbq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovzxbw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovzxdq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovzxwd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovzxwq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmuldq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulld128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_roundps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_roundss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_roundsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_roundpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_dpps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_dppd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntdqa", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long * ) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ptestz128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ptestc128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ptestnzc128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_mpsadbw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phminposuw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistrm128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistri128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestrm128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestri128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistria128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistric128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistrio128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistris128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistriz128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestria128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestric128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestrio128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestris128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestriz128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_crc32qi", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_crc32hi", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(shortType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_crc32si", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_crc32di", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extrqi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extrq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insertqi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long, char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insertq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntsd", builtinFunctionValueItem( {-  void(double * , __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(doubleType()))), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntss", builtinFunctionValueItem( {-  void(float * , __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(floatType()))), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesenc128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesenclast128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesdec128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesdeclast128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesimc128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aeskeygenassist128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pclmulqdq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_addsubpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_addsubps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_haddpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_hsubps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_hsubpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_haddps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilvarpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilvarps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilvarpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilvarps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendvpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendvps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_dpps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmppd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vextractf128_pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(4))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vextractf128_ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(8))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vextractf128_si256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(8))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtdq2pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtdq2ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2dq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2dq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2dq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2dq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vperm2f128_pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vperm2f128_ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vperm2f128_si256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vinsertf128_pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(2))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vinsertf128_ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(4))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vinsertf128_si256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(4))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrtps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcpps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_roundpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_roundps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestzpd", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestcpd", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestnzcpd", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestzps", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestcps", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestnzcps", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestzpd256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestcpd256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestnzcpd256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestzps256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestcps256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestnzcps256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ptestz256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ptestc256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ptestnzc256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movmskpd256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(4))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movmskps256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(8))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vzeroall", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vzeroupper", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vbroadcastss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(const float * ) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vbroadcastsd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(const double * ) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vbroadcastss256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(const float * ) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vbroadcastf128_pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(2))) const double * ) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())), 2))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vbroadcastf128_ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(4))) const float * ) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())), 4))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeupd256", builtinFunctionValueItem( {-  void(double * , __attribute__((__vector_size__(4))) double) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(doubleType()))), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeups256", builtinFunctionValueItem( {-  void(float * , __attribute__((__vector_size__(8))) float) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(floatType()))), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedqu256", builtinFunctionValueItem( {-  void(char * , __attribute__((__vector_size__(32))) char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_lddqu256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(const char * ) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntdq256", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(4))) signed long long * , __attribute__((__vector_size__(4))) signed long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntpd256", builtinFunctionValueItem( {-  void(double * , __attribute__((__vector_size__(4))) double) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(doubleType()))), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntps256", builtinFunctionValueItem( {-  void(float * , __attribute__((__vector_size__(8))) float) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(floatType()))), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) const double * , __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())), 2)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) const float * , __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())), 4)), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) const double * , __attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())), 4)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) const float * , __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())), 8)), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstorepd", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(2))) double * , __attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstoreps", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(4))) float * , __attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstorepd256", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(4))) double * , __attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstoreps256", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(8))) float * , __attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_mpsadbw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packsswb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packssdw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packuswb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packusdw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_palignr256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pblendvb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pblendw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddubsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddwd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxub256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxuw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxud256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminub256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminuw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminud256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovmskb256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsxbw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsxbd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsxbq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsxwd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsxwq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsxdq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovzxbw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovzxbd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovzxbq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovzxwd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovzxwq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovzxdq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmuldq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhrsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhuw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmuludq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psadbw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslldqi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllwi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslldi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslld256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllqi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrawi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psraw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psradi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrad256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrldqi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlwi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrldi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrld256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlqi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntdqa256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long * ) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vbroadcastss_ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vbroadcastss_ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vbroadcastsd_pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vbroadcastsi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(2))) const signed long long * ) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 2))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pblendd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pblendd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pbroadcastb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pbroadcastw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pbroadcastd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pbroadcastq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pbroadcastb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pbroadcastw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pbroadcastd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pbroadcastq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvarsi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvarsf256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permti256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extract128i256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(4))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insert128i256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(2))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) const signed int * , __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), 8)), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) const signed long long * , __attribute__((__vector_size__(4))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 4)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) const signed int * , __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), 4)), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) const signed long long * , __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 2)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstored256", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(8))) signed int * , __attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)), vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstoreq256", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(4))) signed long long * , __attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) signed long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstored", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(4))) signed int * , __attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstoreq", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(2))) signed long long * , __attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllv8si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllv4si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllv4di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllv2di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrav8si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrav4si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlv8si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlv4si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlv4di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlv2di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_pd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) const double * , __attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(2))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())), 2)), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) const double * , __attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())), 4)), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_pd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) const double * , __attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())), 2)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) const double * , __attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())), 4)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) const float * , __attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())), 4)), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) const float * , __attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())), 8)), vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) const float * , __attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(4))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())), 4)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) const float * , __attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())), 4)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_q", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) const signed long long * , __attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(2))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 2)), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_q256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) const signed long long * , __attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 4)), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_q", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) const signed long long * , __attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 2)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_q256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) const signed long long * , __attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 4)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_d", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) const signed int * , __attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), 4)), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_d256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) const signed int * , __attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), 8)), vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_d", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) const signed int * , __attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(4))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), 4)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_d256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) const signed int * , __attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), 4)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtps2ph", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(4))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtps2ph256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), builtinType(nilQualifier(), signedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtph2ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtph2ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdrand16_step", builtinFunctionValueItem( {-  unsigned int(unsigned short * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(shortType())))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdrand32_step", builtinFunctionValueItem( {-  unsigned int(unsigned int * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdrand64_step", builtinFunctionValueItem( {-  unsigned int(unsigned long long * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longlongType())))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdseed16_step", builtinFunctionValueItem( {-  unsigned int(unsigned short * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(shortType())))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdseed32_step", builtinFunctionValueItem( {-  unsigned int(unsigned int * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdseed64_step", builtinFunctionValueItem( {-  unsigned int(unsigned long long * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longlongType())))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_bextr_u32", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_bextr_u64", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_bzhi_si", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_bzhi_di", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pdep_si", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pdep_di", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pext_si", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pext_di", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfnmaddps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfnmaddpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfnmaddss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfnmaddsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfnmsubps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfnmsubpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfnmsubss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfnmsubsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubaddps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubaddpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfnmaddps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfnmaddpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfnmsubps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfnmsubpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubaddps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubaddpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacssww", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacsww", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacsswd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacswd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacssdd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacsdd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacssdql", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacsdql", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacssdqh", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacsdqh", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmadcsswd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmadcswd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddbw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddbd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddbq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddwd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddwq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphadddq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddubw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddubd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddubq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphadduwd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphadduwq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddudq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphsubbw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphsubwd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphsubdq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcmov", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcmov_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed long long(__attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) signed long long, __attribute__((__vector_size__(4))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpperm", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotbi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotwi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotdi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotqi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshlb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshlw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshld", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshlq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshab", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshaw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshad", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshaq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomub", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomuw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomud", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomuq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) signed int(__attribute__((__vector_size__(4))) signed int, __attribute__((__vector_size__(4))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) signed long long(__attribute__((__vector_size__(2))) signed long long, __attribute__((__vector_size__(2))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermil2pd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) double, __attribute__((__vector_size__(2))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 2), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermil2pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) double, __attribute__((__vector_size__(4))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermil2ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) float, __attribute__((__vector_size__(4))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), realType(floatType())), 4), vectorType(builtinType(nilQualifier(), signedType(intType())), 4), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermil2ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8), builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfrczss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfrczsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfrczps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) float(__attribute__((__vector_size__(4))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfrczpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(2))) double(__attribute__((__vector_size__(2))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 2), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 2)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfrczps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfrczpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(4))) double(__attribute__((__vector_size__(4))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 4), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 4)], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xbegin", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xend", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xabort", builtinFunctionValueItem( {-  void(char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), signedType(charType()))], false)),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xtest", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], false)),
    ordinaryFunctionHandler))];
}
