grammar edu:umn:cs:melt:ableC:abstractsyntax:builtins;
--GENERATED FILE, DO NOT EDIT. see edu:umn:cs:melt:ableC:tools:builtins
aspect function getInitialEnvDefs [Def] ::= {
d <- [valueDef("__builtin_cpu_init", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cpu_supports", builtinFunctionValueItem( {-  _Bool(const char * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cpu_is", builtinFunctionValueItem( {-  _Bool(const char * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_undef128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(void) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_undef256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(void) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_undef512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(void) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_readeflags_u32", builtinFunctionValueItem( {-  unsigned int(void) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_writeeflags_u32", builtinFunctionValueItem( {-  void(unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_femms", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgusb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pf2id", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfacc", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfadd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfcmpeq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfcmpge", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfcmpgt", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfmax", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfmin", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfmul", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfrcp", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfrcpit1", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfrcpit2", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfrsqrt", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfrsqit1", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfsub", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfsubr", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pi2fd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhrw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pf2iw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfnacc", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pfpnacc", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float, __attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8), vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pi2fw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pswapdsf", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) float(__attribute__((__vector_size__(8))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pswapdsi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_mm_prefetch", builtinFunctionValueItem( {-  void(const char * , signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_emms", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmullw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddwd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pand", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed long long(__attribute__((__vector_size__(8))) signed long long, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pandn", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed long long(__attribute__((__vector_size__(8))) signed long long, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_por", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed long long(__attribute__((__vector_size__(8))) signed long long, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pxor", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed long long(__attribute__((__vector_size__(8))) signed long long, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslld", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed long long(__attribute__((__vector_size__(8))) signed long long, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrld", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed long long(__attribute__((__vector_size__(8))) signed long long, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psraw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrad", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllwi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslldi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllqi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed long long(__attribute__((__vector_size__(8))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlwi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrldi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlqi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed long long(__attribute__((__vector_size__(8))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrawi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psradi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packsswb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packssdw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packuswb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_punpckhbw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_punpckhwd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_punpckhdq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_punpcklbw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_punpcklwd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_punpckldq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpeqb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpeqw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpeqd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpgtb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpgtw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpgtd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskmovq", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char, char * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntq", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(8))) signed long long * , __attribute__((__vector_size__(8))) signed long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_init_v2si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_init_v4hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(signed short, signed short, signed short, signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([builtinType(nilQualifier(), signedType(shortType())), builtinType(nilQualifier(), signedType(shortType())), builtinType(nilQualifier(), signedType(shortType())), builtinType(nilQualifier(), signedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_init_v8qi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(char, char, char, char, char, char, char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_ext_v2si", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(8))) signed int, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpi2ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2pi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2pi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxub", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminub", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovmskb", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(8))) char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhuw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psadbw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_ext_v4hi", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(8))) signed short, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_set_v4hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2pi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpi2pd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2pi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed long long(__attribute__((__vector_size__(8))) signed long long, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmuludq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed long long(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed long long(__attribute__((__vector_size__(8))) signed long long, __attribute__((__vector_size__(8))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_palignr", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddubsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhrsw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed short(__attribute__((__vector_size__(8))) signed short, __attribute__((__vector_size__(8))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 8), vectorType(builtinType(nilQualifier(), signedType(shortType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) char(__attribute__((__vector_size__(8))) char, __attribute__((__vector_size__(8))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 8), vectorType(builtinType(nilQualifier(), signedType(charType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(8))) signed int(__attribute__((__vector_size__(8))) signed int, __attribute__((__vector_size__(8))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 8), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 8), vectorType(builtinType(nilQualifier(), signedType(intType())), 8)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comieq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comilt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comile", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comigt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comige", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comineq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomieq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomilt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomile", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomigt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomige", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomineq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comisdeq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comisdlt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comisdle", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comisdgt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comisdge", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_comisdneq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomisdeq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomisdlt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomisdle", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomisdgt", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomisdge", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucomisdneq", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpeqps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpltps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpleps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpunordps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpneqps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpnltps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpnleps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpordps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpeqss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpltss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpless", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpunordss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpneqss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpnltss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpnless", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpordss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpeqpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpltpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmplepd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpunordpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpneqpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpnltpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpnlepd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpordpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpeqsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpltsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmplesd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpunordsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpneqsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpnltsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpnlesd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpordsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxub128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminub128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packsswb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packssdw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packuswb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhuw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_ext_v4si", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_ext_v4sf", builtinFunctionValueItem( {-  float(__attribute__((__vector_size__(16))) float, signed int) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_ext_v8hi", builtinFunctionValueItem( {-  signed short(__attribute__((__vector_size__(16))) signed short, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_set_v8hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_addsubps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_addsubpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_haddps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_haddpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_hsubps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_hsubpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddubsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhrsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ldmxcsr", builtinFunctionValueItem( {-  void(unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_mm_setcsr", builtinFunctionValueItem( {-  void(unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_stmxcsr", builtinFunctionValueItem( {-  unsigned int(void) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_mm_getcsr", builtinFunctionValueItem( {-  unsigned int(void) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtss2si", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttss2si", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movmskps", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sfence", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_mm_sfence", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcpps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcpss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrtps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrtss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shufps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskmovdqu", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movmskpd", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovmskb128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movnti", builtinFunctionValueItem( {-  void(signed int * , signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshuflw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufhw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psadbw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shufpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2dq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2dq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtsd2si", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttsd2si", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtsd2ss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2dq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2dq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_clflush", builtinFunctionValueItem( {-  void(const void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_mm_clflush", builtinFunctionValueItem( {-  void(const void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_lfence", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_mm_lfence", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_mfence", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_mm_mfence", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pause", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_mm_pause", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmuludq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psraw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrad128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrld128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslld128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllwi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslldi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllqi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlwi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrldi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlqi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrawi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psradi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddwd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslldqi128_byteshift", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrldqi128_byteshift", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_monitor", builtinFunctionValueItem( {-  void(void * , unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_mwait", builtinFunctionValueItem( {-  void(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_lddqu", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(const char * ) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_palignr128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insertps128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pblendvb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pblendw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendvpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendvps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packusdw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxud128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxuw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminud128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminuw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmuldq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_roundps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_roundss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_roundsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_roundpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_dpps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_dppd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ptestz128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ptestc128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ptestnzc128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_mpsadbw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phminposuw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_ext_v16qi", builtinFunctionValueItem( {-  char(__attribute__((__vector_size__(16))) char, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_set_v16qi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_set_v4si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistrm128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistri128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestrm128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestri128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistria128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistric128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistrio128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistris128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpistriz128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestria128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestric128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestrio128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestris128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pcmpestriz128", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) char, signed int, __attribute__((__vector_size__(16))) char, signed int, char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_crc32qi", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_crc32hi", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_crc32si", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extrqi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extrq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insertqi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insertq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntsd", builtinFunctionValueItem( {-  void(double * , __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(doubleType()))), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movntss", builtinFunctionValueItem( {-  void(float * , __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(floatType()))), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesenc128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesenclast128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesdec128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesdeclast128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesimc128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aeskeygenassist128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesenc256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesenc512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesenclast256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesenclast512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesdec256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesdec512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesdeclast256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_aesdeclast512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vgf2p8affineinvqb_v16qi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vgf2p8affineinvqb_v32qi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vgf2p8affineinvqb_v64qi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vgf2p8affineqb_v16qi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vgf2p8affineqb_v32qi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vgf2p8affineqb_v64qi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vgf2p8mulb_v16qi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vgf2p8mulb_v32qi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vgf2p8mulb_v64qi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pclmulqdq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pclmulqdq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pclmulqdq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_addsubpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_addsubps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_haddpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_hsubps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_hsubpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_haddps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilvarpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilvarps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilvarpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilvarps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendvpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_blendvps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shufpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shufps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_dpps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmppd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmppd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vextractf128_pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(32))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vextractf128_ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(32))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vextractf128_si256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2dq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2dq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2dq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2dq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vperm2f128_pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vperm2f128_ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vperm2f128_si256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vinsertf128_pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(16))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vinsertf128_ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(16))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vinsertf128_si256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrtps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcpps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_roundpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_roundps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestzpd", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestcpd", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestnzcpd", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestzps", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestcps", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestnzcps", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestzpd256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestcpd256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestnzcpd256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestzps256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestcps256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vtestnzcps256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ptestz256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ptestc256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ptestnzc256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movmskpd256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movmskps256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vzeroall", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vzeroupper", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_lddqu256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(const char * ) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) const double * , __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) const float * , __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) const double * , __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())), 32)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) const float * , __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())), 32)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstorepd", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) double * , __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) double) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstoreps", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) float * , __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) float) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstorepd256", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) double * , __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) double) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstoreps256", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) float * , __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) float) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_ext_v32qi", builtinFunctionValueItem( {-  char(__attribute__((__vector_size__(32))) char, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_ext_v16hi", builtinFunctionValueItem( {-  signed short(__attribute__((__vector_size__(32))) signed short, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_ext_v8si", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_set_v32qi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_set_v16hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), signedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vec_set_v8si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_mpsadbw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packsswb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packssdw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packuswb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packusdw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_palignr256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pblendvb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pblendw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phaddsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_phsubsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddubsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddwd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxub256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxuw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxud256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminub256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminuw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminud256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovmskb256", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(32))) char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmuldq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhrsw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhuw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmuludq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psadbw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshuflw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufhw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psignd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllwi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslldqi256_byteshift", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslldi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslld256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllqi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrawi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psraw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psradi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrad256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrldqi256_byteshift", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlwi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrldi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrld256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlqi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pblendd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pblendd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvarsi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permdf256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvarsf256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permti256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permdi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extract128i256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insert128i256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) const signed int * , __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), 32)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) const signed long long * , __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 32)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) const signed int * , __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskloadq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) const signed long long * , __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstored256", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed int * , __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstoreq256", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed long long * , __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstored", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed int * , __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maskstoreq", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed long long * , __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllv8si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllv4si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllv4di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllv2di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrav8si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrav4si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlv8si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlv4si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlv4di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlv2di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_pd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, const double * , __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType()))), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, const double * , __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(32))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType()))), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_pd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, const double * , __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType()))), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, const double * , __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) double, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType()))), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, const float * , __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType()))), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, const float * , __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType()))), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, const float * , __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType()))), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, const float * , __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) float, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType()))), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_q", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, const signed long long * , __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType()))), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_q256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, const signed long long * , __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(32))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType()))), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_q", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, const signed long long * , __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType()))), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_q256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, const signed long long * , __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType()))), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_d", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, const signed int * , __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType()))), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherd_d256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, const signed int * , __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType()))), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_d", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, const signed int * , __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType()))), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherq_d256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, const signed int * , __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType()))), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtps2ph", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtps2ph256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(32))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtph2ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtph2ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdrand16_step", builtinFunctionValueItem( {-  unsigned int(unsigned short * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(shortType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdrand32_step", builtinFunctionValueItem( {-  unsigned int(unsigned int * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fxrstor", builtinFunctionValueItem( {-  void(void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fxsave", builtinFunctionValueItem( {-  void(void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xsave", builtinFunctionValueItem( {-  void(void * , unsigned long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xrstor", builtinFunctionValueItem( {-  void(void * , unsigned long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xgetbv", builtinFunctionValueItem( {-  unsigned long long(unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_xgetbv", builtinFunctionValueItem( {-  unsigned long long(unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xsetbv", builtinFunctionValueItem( {-  void(unsigned int, unsigned long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_xsetbv", builtinFunctionValueItem( {-  void(unsigned int, unsigned long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xsaveopt", builtinFunctionValueItem( {-  void(void * , unsigned long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xrstors", builtinFunctionValueItem( {-  void(void * , unsigned long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xsavec", builtinFunctionValueItem( {-  void(void * , unsigned long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xsaves", builtinFunctionValueItem( {-  void(void * , unsigned long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_incsspd", builtinFunctionValueItem( {-  void(unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdsspd", builtinFunctionValueItem( {-  unsigned int(unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_saveprevssp", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rstorssp", builtinFunctionValueItem( {-  void(void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_wrssd", builtinFunctionValueItem( {-  void(unsigned int, void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_wrussd", builtinFunctionValueItem( {-  void(unsigned int, void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_setssbsy", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_clrssbsy", builtinFunctionValueItem( {-  void(void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_clflushopt", builtinFunctionValueItem( {-  void(const void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_clwb", builtinFunctionValueItem( {-  void(const void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_wbinvd", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_wbnoinvd", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_addcarryx_u32", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned int, unsigned int, unsigned int * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_subborrow_u32", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned int, unsigned int, unsigned int * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdseed16_step", builtinFunctionValueItem( {-  unsigned int(unsigned short * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(shortType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdseed32_step", builtinFunctionValueItem( {-  unsigned int(unsigned int * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_lzcnt_u16", builtinFunctionValueItem( {-  unsigned short(unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_lzcnt_u32", builtinFunctionValueItem( {-  unsigned int(unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_bextr_u32", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_tzcnt_u16", builtinFunctionValueItem( {-  unsigned short(unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_tzcnt_u32", builtinFunctionValueItem( {-  unsigned int(unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_bzhi_si", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pdep_si", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pext_si", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_bextri_u32", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_llwpcb", builtinFunctionValueItem( {-  void(void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_slwpcb", builtinFunctionValueItem( {-  void * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_lwpins32", builtinFunctionValueItem( {-  unsigned char(unsigned int, unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_lwpval32", builtinFunctionValueItem( {-  void(unsigned int, unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sha1rnds4", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sha1nexte", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sha1msg1", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sha1msg2", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sha256rnds2", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sha256msg1", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sha256msg2", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddss3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsd3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddpd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddpd512_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddpd512_mask3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubpd512_mask3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddps512_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddps512_mask3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubps512_mask3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubpd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubpd512_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubpd512_mask3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubaddpd512_mask3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubps512_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsubps512_mask3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubaddps512_mask3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacssww", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacsww", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacsswd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacswd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacssdd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacsdd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacssdql", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacsdql", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacssdqh", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmacsdqh", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmadcsswd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmadcswd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddbw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddbd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddbq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddwd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddwq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphadddq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddubw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddubd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddubq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphadduwd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphadduwq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphaddudq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphsubbw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphsubwd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vphsubdq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpperm", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotbi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotwi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotdi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vprotqi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshlb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshlw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshld", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshlq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshab", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshaw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshad", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshaq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomub", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomuw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomud", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomuq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomb", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomw", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpcomq", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermil2pd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermil2pd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) signed long long, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermil2ps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermil2ps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) signed int, char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfrczss", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfrczsd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfrczps", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfrczpd", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfrczps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfrczpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xbegin", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xend", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xabort", builtinFunctionValueItem( {-  void(char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_xtest", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdpmc", builtinFunctionValueItem( {-  unsigned long long(signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdtsc", builtinFunctionValueItem( {-  unsigned long long(void) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__rdtsc", builtinFunctionValueItem( {-  unsigned long long(void) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdtscp", builtinFunctionValueItem( {-  unsigned long long(unsigned int * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdpid", builtinFunctionValueItem( {-  unsigned int(void) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rdpkru", builtinFunctionValueItem( {-  unsigned int(void) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_wrpkru", builtinFunctionValueItem( {-  void(unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtpd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtps512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrt14sd_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrt14ss_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrt14pd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrt14ps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrt28sd_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrt28ss_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrt28pd_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrt28ps_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcp14sd_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcp14ss_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcp14pd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcp14ps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcp28sd_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcp28ss_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcp28pd_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcp28ps_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_exp2pd_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_exp2ps_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2dq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) signed int, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2udq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) signed int, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2dq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(32))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2udq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(32))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpps512_mask", builtinFunctionValueItem( {-  unsigned short(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, signed int, unsigned short, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpps256_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpps128_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmppd512_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, signed int, unsigned char, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmppd256_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmppd128_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rndscaleps_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, signed int, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rndscalepd_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, signed int, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2dq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) signed int, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2dq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(32))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2udq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) signed int, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2udq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(32))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minps512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minpd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxps512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxpd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtdq2ps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtudq2ps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2ps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(32))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtps2ph512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(64))) float, signed int, __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtph2ps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxud512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxuq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminud512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminuq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmuldq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmuludq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loaddqusi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(const signed int * , __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType()))), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loaddqudi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(const signed long long * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType()))), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadups512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(const float * , __attribute__((__vector_size__(64))) float, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType()))), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadaps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) const float * , __attribute__((__vector_size__(64))) float, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())), 64)), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadupd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(const double * , __attribute__((__vector_size__(64))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType()))), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadapd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) const double * , __attribute__((__vector_size__(64))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())), 64)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedqudi512_mask", builtinFunctionValueItem( {-  void(signed long long * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longlongType()))), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedqusi512_mask", builtinFunctionValueItem( {-  void(signed int * , __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType()))), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeupd512_mask", builtinFunctionValueItem( {-  void(double * , __attribute__((__vector_size__(64))) double, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(doubleType()))), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeapd512_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) double * , __attribute__((__vector_size__(64))) double, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeups512_mask", builtinFunctionValueItem( {-  void(float * , __attribute__((__vector_size__(64))) float, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), realType(floatType()))), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeaps512_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) float * , __attribute__((__vector_size__(64))) float, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 64)), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_alignq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_alignd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_alignd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_alignd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_alignq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_alignq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extractf64x4_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(64))) double, signed int, __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extractf32x4_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(64))) float, signed int, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpdpbusd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpdpbusd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpdpbusd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpdpbusds128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpdpbusds256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpdpbusds512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpdpwssd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpdpwssd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpdpwssd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpdpwssds128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpdpwssds256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpdpwssds512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3div2df", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, const void * , __attribute__((__vector_size__(16))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3div2di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, const void * , __attribute__((__vector_size__(16))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3div4df", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, const void * , __attribute__((__vector_size__(32))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3div4di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, const void * , __attribute__((__vector_size__(32))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3div4sf", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, const void * , __attribute__((__vector_size__(16))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3div4si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, const void * , __attribute__((__vector_size__(16))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3div8sf", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, const void * , __attribute__((__vector_size__(32))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3div8si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, const void * , __attribute__((__vector_size__(32))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3siv2df", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, const void * , __attribute__((__vector_size__(16))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3siv2di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, const void * , __attribute__((__vector_size__(16))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3siv4df", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, const void * , __attribute__((__vector_size__(16))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3siv4di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, const void * , __attribute__((__vector_size__(16))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3siv4sf", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, const void * , __attribute__((__vector_size__(16))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3siv4si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, const void * , __attribute__((__vector_size__(16))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3siv8sf", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, const void * , __attribute__((__vector_size__(32))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gather3siv8si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, const void * , __attribute__((__vector_size__(32))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gathersiv8df", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, const void * , __attribute__((__vector_size__(32))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gathersiv16sf", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, const void * , __attribute__((__vector_size__(64))) signed int, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherdiv8df", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, const void * , __attribute__((__vector_size__(64))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherdiv16sf", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, const void * , __attribute__((__vector_size__(64))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gathersiv8di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, const void * , __attribute__((__vector_size__(32))) signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gathersiv16si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, const void * , __attribute__((__vector_size__(64))) signed int, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherdiv8di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, const void * , __attribute__((__vector_size__(64))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherdiv16si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, const void * , __attribute__((__vector_size__(64))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scattersiv8df", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(64))) double, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scattersiv16sf", builtinFunctionValueItem( {-  void(void * , unsigned short, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) float, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(shortType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterdiv8df", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) double, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterdiv16sf", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(32))) float, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scattersiv8di", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scattersiv16si", builtinFunctionValueItem( {-  void(void * , unsigned short, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(shortType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterdiv8di", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterdiv16si", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherpfdpd", builtinFunctionValueItem( {-  void(unsigned char, __attribute__((__vector_size__(32))) signed int, const void * , signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherpfdps", builtinFunctionValueItem( {-  void(unsigned short, __attribute__((__vector_size__(64))) signed int, const void * , signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherpfqpd", builtinFunctionValueItem( {-  void(unsigned char, __attribute__((__vector_size__(64))) signed long long, const void * , signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_gatherpfqps", builtinFunctionValueItem( {-  void(unsigned char, __attribute__((__vector_size__(64))) signed long long, const void * , signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterpfdpd", builtinFunctionValueItem( {-  void(unsigned char, __attribute__((__vector_size__(32))) signed int, void * , signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterpfdps", builtinFunctionValueItem( {-  void(unsigned short, __attribute__((__vector_size__(64))) signed int, void * , signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterpfqpd", builtinFunctionValueItem( {-  void(unsigned char, __attribute__((__vector_size__(64))) signed long long, void * , signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterpfqps", builtinFunctionValueItem( {-  void(unsigned char, __attribute__((__vector_size__(64))) signed long long, void * , signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_knotqi", builtinFunctionValueItem( {-  unsigned char(unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_knothi", builtinFunctionValueItem( {-  unsigned short(unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_knotsi", builtinFunctionValueItem( {-  unsigned int(unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_knotdi", builtinFunctionValueItem( {-  unsigned long long(unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpb128_mask", builtinFunctionValueItem( {-  unsigned short(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpd128_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpq128_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpw128_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpb256_mask", builtinFunctionValueItem( {-  unsigned int(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, signed int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpd256_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpq256_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpw256_mask", builtinFunctionValueItem( {-  unsigned short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short, signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpb512_mask", builtinFunctionValueItem( {-  unsigned long long(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char, signed int, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpd512_mask", builtinFunctionValueItem( {-  unsigned short(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpq512_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpw512_mask", builtinFunctionValueItem( {-  unsigned int(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short, signed int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucmpb128_mask", builtinFunctionValueItem( {-  unsigned short(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucmpd128_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucmpq128_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucmpw128_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucmpb256_mask", builtinFunctionValueItem( {-  unsigned int(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, signed int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucmpd256_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucmpq256_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucmpw256_mask", builtinFunctionValueItem( {-  unsigned short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short, signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucmpb512_mask", builtinFunctionValueItem( {-  unsigned long long(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char, signed int, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucmpd512_mask", builtinFunctionValueItem( {-  unsigned short(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucmpq512_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ucmpw512_mask", builtinFunctionValueItem( {-  unsigned int(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short, signed int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsb512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packssdw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packsswb512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packusdw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_packuswb512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsb512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddsw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusb512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_paddusw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgb512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pavgw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsb512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxub512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxuw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsb512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminub512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminuw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufb512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsb512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubsw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusb512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psubusw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpconflictdi_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpconflictdi_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpconflictsi_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpconflictsi_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpconflictdi_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpconflictsi_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vplzcntd_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vplzcntq_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpopcntd_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpopcntq_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpopcntd_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpopcntq_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpopcntd_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpopcntq_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpopcntb_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpopcntw_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpopcntb_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpopcntw_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpopcntb_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpopcntw_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshufbitqmb128_mask", builtinFunctionValueItem( {-  unsigned short(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshufbitqmb256_mask", builtinFunctionValueItem( {-  unsigned int(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshufbitqmb512_mask", builtinFunctionValueItem( {-  unsigned long long(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhrsw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhuw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmulhw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_addpd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_addps512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_divpd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_divps512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_mulpd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_mulps512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_subpd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_subps512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddubsw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaddwd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_addss_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_divss_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_mulss_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_subss_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxss_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minss_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_addsd_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_divsd_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_mulsd_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_subsd_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_maxsd_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_minsd_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressdf128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressdf256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressdi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressdi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compresshi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compresshi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressqi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressqi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, unsigned int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compresssf128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compresssf256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compresssi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compresssi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoredf128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) double * , __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoredf256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) double * , __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoredi128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed long long * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoredi256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed long long * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstorehi128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstorehi256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed short * , __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoreqi128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(16))) char, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoreqi256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) char * , __attribute__((__vector_size__(32))) char, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoresf128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) float * , __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoresf256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) float * , __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoresi128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed int * , __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoresi256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed int * , __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2dq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2ps_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2udq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2udq256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2udq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2udq256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2dq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2udq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2udq256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2udq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2udq256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expanddf128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expanddf256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expanddi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expanddi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandhi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandhi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandqi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandqi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, unsigned int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloaddf128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) const double * , __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())), 16)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloaddf256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) const double * , __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())), 32)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloaddi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) const signed long long * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloaddi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) const signed long long * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 32)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloadhi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) const signed short * , __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloadhi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) const signed short * , __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(shortType())), 32)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloadqi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) const char * , __attribute__((__vector_size__(16))) char, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloadqi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) const char * , __attribute__((__vector_size__(32))) char, unsigned int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())), 32)), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloadsf128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) const float * , __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())), 16)), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloadsf256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) const float * , __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())), 32)), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloadsi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) const signed int * , __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloadsi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) const signed int * , __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), 32)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandsf128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandsf256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandsi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandsi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getexppd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getexppd256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getexpps128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getexpps256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pabsq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxsq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxuq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmaxuq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminsq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminuq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pminuq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rndscalepd_128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, signed int, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rndscalepd_256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, signed int, __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rndscaleps_128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, signed int, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rndscaleps_256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, signed int, __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scalefpd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scalefpd256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scalefps128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scalefps256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterdiv2df", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) double, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterdiv2di", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterdiv4df", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) double, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterdiv4di", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterdiv4sf", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) float, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterdiv4si", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterdiv8sf", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) float, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scatterdiv8si", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scattersiv2df", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) double, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scattersiv2di", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scattersiv4df", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(32))) double, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scattersiv4di", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scattersiv4sf", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) float, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scattersiv4si", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scattersiv8sf", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) float, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scattersiv8si", builtinFunctionValueItem( {-  void(void * , unsigned char, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2vard128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2vard256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2vard512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varpd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varpd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varpd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varps128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varps256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varps512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varqi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varqi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varqi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varhi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varhi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermi2varhi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldvd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldvd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldvd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldvq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldvq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldvq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldvw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldvw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshldvw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdvd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdvd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdvd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdvq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdvq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdvq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdvw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdvw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdvw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpshrdw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovswb512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(32))) char, unsigned int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovuswb512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(32))) char, unsigned int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovwb512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(32))) char, unsigned int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2qq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2qq256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2uqq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2uqq256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2qq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2qq256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2uqq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2uqq256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtqq2ps128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2qq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2qq256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2uqq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2uqq256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2qq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2qq256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2uqq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2uqq256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtuqq2ps128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rangepd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, signed int, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rangepd256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, signed int, __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rangeps128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, signed int, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rangeps256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, signed int, __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rangesd128_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rangess128_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_reducepd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, signed int, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_reducepd256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, signed int, __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_reduceps128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, signed int, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_reduceps256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, signed int, __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_reducesd_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_reducess_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovswb128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovswb256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(16))) char, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovuswb128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovuswb256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(16))) char, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovwb128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2qq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtpd2uqq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2qq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(64))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2uqq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(64))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtqq2pd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtqq2ps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(32))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2qq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttpd2uqq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2qq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(64))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvttps2uqq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(64))) signed long long, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtuqq2pd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtuqq2ps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(32))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rangepd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, signed int, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rangeps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, signed int, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_reducepd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, signed int, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_reduceps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, signed int, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prold512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prolq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prold128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prold256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prolq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prolq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prolvd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prolvq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prord512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prorq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prolvd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prolvd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prolvq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prolvq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prord128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prord256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prorq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prorq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prorvd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prorvq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prorvd128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prorvd256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prorvq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_prorvq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufhw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshuflw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllv32hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllwi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllv16hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllv8hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslldi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllqi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlv32hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlv16hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlv8hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrldi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlqi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrav32hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrav16hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrav8hi", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psravq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psravq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psraw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrawi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlwi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslldqi512_byteshift", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrldqi512_byteshift", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movdqa32load128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int * , __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movdqa32load256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int * , __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movdqa32load512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) const signed int * , __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), 64)), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movdqa32store512_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) signed int * , __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movdqa64load512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) const signed long long * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 64)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movdqa64store512_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) signed long long * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movdqa32store128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed int * , __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movdqa32store256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed int * , __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movdqa64load128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) const signed long long * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movdqa64load256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) const signed long long * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 32)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movdqa64store128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed long long * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movdqa64store256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed long long * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmadd52huq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmadd52luq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmadd52huq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmadd52huq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmadd52luq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmadd52luq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcomisd", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, signed int, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcomiss", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, signed int, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kunpckdi", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kunpcksi", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loaddquhi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short * , __attribute__((__vector_size__(64))) signed short, unsigned int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loaddquqi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char * , __attribute__((__vector_size__(64))) char, unsigned long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmpd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) signed long long, signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmpd512_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) signed long long, signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) signed int, signed int, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmps512_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) signed int, signed int, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmsd_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed long long, signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmsd_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed long long, signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmss_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed int, signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmss_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed int, signed int, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getexpsd128_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getexpss128_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getmantsd_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, signed int, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getmantss_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, signed int, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loaddquhi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loaddquhi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short * , __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loaddquqi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(16))) char, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loaddquqi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char * , __attribute__((__vector_size__(32))) char, unsigned int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmpd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed long long, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmpd128_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) signed long long, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmpd256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) signed long long, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmpd256_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) signed long long, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmps128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed int, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmps128_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed int, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmps256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) signed int, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fixupimmps256_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) signed int, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadapd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double * , __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadsd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double * , __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadapd256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double * , __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadaps128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float * , __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadss128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float * , __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadaps256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float * , __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loaddqudi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loaddqudi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loaddqusi128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int * , __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loaddqusi256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int * , __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadupd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double * , __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadupd256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double * , __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadups128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float * , __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_loadups256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float * , __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedquhi512_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) signed short * , __attribute__((__vector_size__(64))) signed short, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedquqi512_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) char * , __attribute__((__vector_size__(64))) char, unsigned long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedquhi128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedquhi256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed short * , __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedquqi128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(16))) char, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedquqi256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) char * , __attribute__((__vector_size__(32))) char, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeapd128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) double * , __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storesd128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) double * , __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeapd256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) double * , __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeaps128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) float * , __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storess128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) float * , __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeaps256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) float * , __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedqudi128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed long long * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedqudi256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed long long * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedqusi128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed int * , __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storedqusi256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed int * , __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeupd128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) double * , __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeupd256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) double * , __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeups128_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) float * , __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_storeups256_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) float * , __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcp14pd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcp14pd256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcp14ps128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rcp14ps256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vplzcntd_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vplzcntd_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vplzcntq_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vplzcntq_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtsd2si32", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtsd2usi32", builtinFunctionValueItem( {-  unsigned int(__attribute__((__vector_size__(16))) double, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtss2si32", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtss2usi32", builtinFunctionValueItem( {-  unsigned int(__attribute__((__vector_size__(16))) float, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvttsd2si32", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) double, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvttsd2usi32", builtinFunctionValueItem( {-  unsigned int(__attribute__((__vector_size__(16))) double, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvttss2si32", builtinFunctionValueItem( {-  signed int(__attribute__((__vector_size__(16))) float, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvttss2usi32", builtinFunctionValueItem( {-  unsigned int(__attribute__((__vector_size__(16))) float, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilpd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilps512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilvarpd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpermilvarps512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rndscalesd_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rndscaless_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scalefpd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scalefps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scalefsd_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_scalefss_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psradi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psraqi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psraq128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psraq256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psraqi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psraqi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pslld512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllv16si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psllv8di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrad512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psraq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrav16si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrav8di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrld512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlq512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlv16si", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psrlv8di", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pternlogd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, signed int, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pternlogd512_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, signed int, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pternlogq512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pternlogq512_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pternlogd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pternlogd128_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pternlogd256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pternlogd256_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pternlogq128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pternlogq128_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pternlogq256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pternlogq256_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shuf_f32x4", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shuf_f64x2", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shuf_i32x4", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shuf_i64x2", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shufpd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shufps512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shuf_f32x4_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shuf_f64x2_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shuf_i32x4_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_shuf_i64x2_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtsd_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_sqrtss_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrt14pd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrt14pd256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrt14ps128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_rsqrt14ps256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtb2mask512", builtinFunctionValueItem( {-  unsigned long long(__attribute__((__vector_size__(64))) char) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtmask2b512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(unsigned long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtmask2w512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(unsigned int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtd2mask512", builtinFunctionValueItem( {-  unsigned short(__attribute__((__vector_size__(64))) signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtmask2d512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtmask2q512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtq2mask512", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(64))) signed long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtb2mask128", builtinFunctionValueItem( {-  unsigned short(__attribute__((__vector_size__(16))) char) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtb2mask256", builtinFunctionValueItem( {-  unsigned int(__attribute__((__vector_size__(32))) char) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtmask2b128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtmask2b256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(unsigned int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtmask2w128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtmask2w256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtd2mask128", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtd2mask256", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(32))) signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtmask2d128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtmask2d256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtmask2q128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtmask2q256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtq2mask128", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) signed long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtq2mask256", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(32))) signed long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsdb512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(16))) char, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsdb512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovswb512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) char * , __attribute__((__vector_size__(64))) signed short, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsdw512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsdw512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed short * , __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqb512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqb512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqd512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed int * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqw512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqw512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsdb128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsdb128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovswb128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsdb256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsdb256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovswb256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsdw128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsdw128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsdw256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsdw256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqb128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqb128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqb256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqb256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqd128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed int * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqd256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqd256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed int * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqw128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqw128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqw256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovsqw256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusdb512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(16))) char, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusdb512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovuswb512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) char * , __attribute__((__vector_size__(64))) signed short, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusdw512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusdw512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed short * , __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqb512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqb512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqd512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed int * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqw512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqw512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusdb128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusdb128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovuswb128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusdb256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusdb256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovuswb256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusdw128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusdw128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusdw256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusdw256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqb128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqb128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqb256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqb256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqd128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed int * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqd256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqd256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed int * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqw128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqw128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqw256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovusqw256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovdb512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(16))) char, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovdb512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovwb512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) char * , __attribute__((__vector_size__(64))) signed short, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovdw512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovdw512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed short * , __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqb512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqb512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqd512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed int * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqw512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqw512mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovdb128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovwb128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovdb128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovdb256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovdb256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovwb256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovdw128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovdw128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovdw256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovdw256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqb128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqb128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqb256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) char, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqb256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) char * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqd128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed int * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqd256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed int * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqw128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqw128mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqw256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pmovqw256mem_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed short * , __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extractf32x8_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(64))) float, signed int, __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extractf64x2_512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(64))) double, signed int, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extracti32x8_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(64))) signed int, signed int, __attribute__((__vector_size__(32))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extracti64x2_512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(64))) signed long long, signed int, __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extracti32x4_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(64))) signed int, signed int, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extracti64x4_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(64))) signed long long, signed int, __attribute__((__vector_size__(32))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extractf64x2_256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(32))) double, signed int, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extracti64x2_256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(__attribute__((__vector_size__(32))) signed long long, signed int, __attribute__((__vector_size__(16))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extractf32x4_256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(32))) float, signed int, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_extracti32x4_256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(__attribute__((__vector_size__(32))) signed int, signed int, __attribute__((__vector_size__(16))) signed int, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insertf32x8", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(32))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insertf64x2_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(16))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_inserti32x8", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(32))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_inserti64x2_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insertf64x4", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(32))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_inserti64x4", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(32))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insertf64x2_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(16))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_inserti64x2_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(16))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insertf32x4_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(16))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_inserti32x4_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_insertf32x4", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(16))) float, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_inserti32x4", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(16))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getmantpd128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, signed int, __attribute__((__vector_size__(16))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getmantpd256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, signed int, __attribute__((__vector_size__(32))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getmantps128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, signed int, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getmantps256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, signed int, __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getmantpd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, signed int, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getmantps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, signed int, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getexppd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_getexpps512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddss3_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddss3_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddss3_mask3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsd3_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsd3_maskz", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmaddsd3_mask3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubsd3_mask3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vfmsubss3_mask3", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permdf512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permdi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvarhi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvardf512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvardi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvarsf512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvarsi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvarqi512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvarqi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvarqi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvarhi128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvarhi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvardf256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(__attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_permvardi256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fpclasspd128_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) double, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fpclasspd256_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(32))) double, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fpclassps128_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) float, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fpclassps256_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(32))) float, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fpclassps512_mask", builtinFunctionValueItem( {-  unsigned short(__attribute__((__vector_size__(64))) float, signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fpclasspd512_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(64))) double, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fpclasssd_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) double, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_fpclassss_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) float, signed int, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kaddqi", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kaddhi", builtinFunctionValueItem( {-  unsigned short(unsigned short, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kaddsi", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kadddi", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kandqi", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kandhi", builtinFunctionValueItem( {-  unsigned short(unsigned short, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kandsi", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kanddi", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kandnqi", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kandnhi", builtinFunctionValueItem( {-  unsigned short(unsigned short, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kandnsi", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kandndi", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_korqi", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_korhi", builtinFunctionValueItem( {-  unsigned short(unsigned short, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_korsi", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kordi", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kortestcqi", builtinFunctionValueItem( {-  signed int(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kortestzqi", builtinFunctionValueItem( {-  signed int(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kortestchi", builtinFunctionValueItem( {-  signed int(unsigned short, unsigned short) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kortestzhi", builtinFunctionValueItem( {-  signed int(unsigned short, unsigned short) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kortestcsi", builtinFunctionValueItem( {-  signed int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kortestzsi", builtinFunctionValueItem( {-  signed int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kortestcdi", builtinFunctionValueItem( {-  signed int(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kortestzdi", builtinFunctionValueItem( {-  signed int(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ktestcqi", builtinFunctionValueItem( {-  signed int(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ktestzqi", builtinFunctionValueItem( {-  signed int(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ktestchi", builtinFunctionValueItem( {-  signed int(unsigned short, unsigned short) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ktestzhi", builtinFunctionValueItem( {-  signed int(unsigned short, unsigned short) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ktestcsi", builtinFunctionValueItem( {-  signed int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ktestzsi", builtinFunctionValueItem( {-  signed int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ktestcdi", builtinFunctionValueItem( {-  signed int(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ktestzdi", builtinFunctionValueItem( {-  signed int(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kunpckhi", builtinFunctionValueItem( {-  unsigned short(unsigned short, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kxnorqi", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kxnorhi", builtinFunctionValueItem( {-  unsigned short(unsigned short, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kxnorsi", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kxnordi", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kxorqi", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kxorhi", builtinFunctionValueItem( {-  unsigned short(unsigned short, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kxorsi", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kxordi", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kshiftliqi", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kshiftlihi", builtinFunctionValueItem( {-  unsigned short(unsigned short, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kshiftlisi", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kshiftlidi", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kshiftriqi", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kshiftrihi", builtinFunctionValueItem( {-  unsigned short(unsigned short, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kshiftrisi", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kshiftridi", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kmovb", builtinFunctionValueItem( {-  unsigned char(unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kmovw", builtinFunctionValueItem( {-  unsigned short(unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kmovd", builtinFunctionValueItem( {-  unsigned int(unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_kmovq", builtinFunctionValueItem( {-  unsigned long long(unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_palignr512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_dbpsadbw128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_dbpsadbw256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_dbpsadbw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_psadbw512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressdf512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressdi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compresshi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short, unsigned int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressqi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char, unsigned long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compresssf512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compresssi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpsd_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double, signed int, unsigned char, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cmpss_mask", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float, signed int, unsigned char, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_pshufd512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expanddf512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expanddi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandhi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short, unsigned int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandqi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char, unsigned long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloaddf512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(64))) const double * , __attribute__((__vector_size__(64))) double, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(doubleType())), 64)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloaddi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(__attribute__((__vector_size__(64))) const signed long long * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), 64)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloadhi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) const signed short * , __attribute__((__vector_size__(64))) signed short, unsigned int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(shortType())), 64)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloadqi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) const char * , __attribute__((__vector_size__(64))) char, unsigned long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())), 64)), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloadsf512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) const float * , __attribute__((__vector_size__(64))) float, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), realType(floatType())), 64)), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandloadsi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) const signed int * , __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), 64)), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandsf512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_expandsi512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtps2pd512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(64))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoredf512_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) double * , __attribute__((__vector_size__(64))) double, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64)), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoredi512_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) signed long long * , __attribute__((__vector_size__(64))) signed long long, unsigned char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstorehi512_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) signed short * , __attribute__((__vector_size__(64))) signed short, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoreqi512_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) char * , __attribute__((__vector_size__(64))) char, unsigned long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoresf512_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) float * , __attribute__((__vector_size__(64))) float, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), realType(floatType())), 64)), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_compressstoresi512_mask", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) signed int * , __attribute__((__vector_size__(64))) signed int, unsigned short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtph2ps_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtph2ps256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(32))) float, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtps2ph_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) float, signed int, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vcvtps2ph256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(32))) float, signed int, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), builtinType(nilQualifier(), signedType(intType())), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtw2mask512", builtinFunctionValueItem( {-  unsigned int(__attribute__((__vector_size__(64))) signed short) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtw2mask128", builtinFunctionValueItem( {-  unsigned char(__attribute__((__vector_size__(16))) signed short) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtw2mask256", builtinFunctionValueItem( {-  unsigned short(__attribute__((__vector_size__(32))) signed short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtsd2ss_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) float, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtsi2ss32", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, signed int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtss2sd_round_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(__attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) double, unsigned char, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtusi2ss32", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, unsigned int, signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmultishiftqb512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(__attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmultishiftqb128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(__attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vpmultishiftqb256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(__attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtne2ps2bf16_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtne2ps2bf16_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtne2ps2bf16_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtneps2bf16_128_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtneps2bf16_256_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(16))) signed short, unsigned char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtneps2bf16_512_mask", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(32))) signed short, unsigned short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_dpbf16ps_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(__attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_dpbf16ps_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(__attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_dpbf16ps_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(__attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cvtsbf162ss_32", builtinFunctionValueItem( {-  float(unsigned short) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vp2intersect_q_512", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long, unsigned char * , unsigned char * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType()))), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vp2intersect_q_256", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long, unsigned char * , unsigned char * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType()))), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vp2intersect_q_128", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long, unsigned char * , unsigned char * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType()))), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vp2intersect_d_512", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int, unsigned short * , unsigned short * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(shortType()))), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(shortType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vp2intersect_d_256", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int, unsigned char * , unsigned char * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType()))), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_vp2intersect_d_128", builtinFunctionValueItem( {-  void(__attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int, unsigned char * , unsigned char * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType()))), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectb_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) char(unsigned short, __attribute__((__vector_size__(16))) char, __attribute__((__vector_size__(16))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 16), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 16), vectorType(builtinType(nilQualifier(), signedType(charType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectb_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) char(unsigned int, __attribute__((__vector_size__(32))) char, __attribute__((__vector_size__(32))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 32), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 32), vectorType(builtinType(nilQualifier(), signedType(charType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectb_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) char(unsigned long long, __attribute__((__vector_size__(64))) char, __attribute__((__vector_size__(64))) char) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(charType())), 64), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), vectorType(builtinType(nilQualifier(), signedType(charType())), 64), vectorType(builtinType(nilQualifier(), signedType(charType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectw_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed short(unsigned char, __attribute__((__vector_size__(16))) signed short, __attribute__((__vector_size__(16))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16), vectorType(builtinType(nilQualifier(), signedType(shortType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectw_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed short(unsigned short, __attribute__((__vector_size__(32))) signed short, __attribute__((__vector_size__(32))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32), vectorType(builtinType(nilQualifier(), signedType(shortType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectw_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed short(unsigned int, __attribute__((__vector_size__(64))) signed short, __attribute__((__vector_size__(64))) signed short) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64), vectorType(builtinType(nilQualifier(), signedType(shortType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectd_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed int(unsigned char, __attribute__((__vector_size__(16))) signed int, __attribute__((__vector_size__(16))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 16), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 16), vectorType(builtinType(nilQualifier(), signedType(intType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectd_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed int(unsigned char, __attribute__((__vector_size__(32))) signed int, __attribute__((__vector_size__(32))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 32), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 32), vectorType(builtinType(nilQualifier(), signedType(intType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectd_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed int(unsigned short, __attribute__((__vector_size__(64))) signed int, __attribute__((__vector_size__(64))) signed int) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(intType())), 64), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), vectorType(builtinType(nilQualifier(), signedType(intType())), 64), vectorType(builtinType(nilQualifier(), signedType(intType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectq_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) signed long long(unsigned char, __attribute__((__vector_size__(16))) signed long long, __attribute__((__vector_size__(16))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectq_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) signed long long(unsigned char, __attribute__((__vector_size__(32))) signed long long, __attribute__((__vector_size__(32))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectq_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) signed long long(unsigned char, __attribute__((__vector_size__(64))) signed long long, __attribute__((__vector_size__(64))) signed long long) -}
    functionType(vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64), vectorType(builtinType(nilQualifier(), signedType(longlongType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectps_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(unsigned char, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectps_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) float(unsigned char, __attribute__((__vector_size__(32))) float, __attribute__((__vector_size__(32))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 32), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 32), vectorType(builtinType(nilQualifier(), realType(floatType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectps_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) float(unsigned short, __attribute__((__vector_size__(64))) float, __attribute__((__vector_size__(64))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 64), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 64), vectorType(builtinType(nilQualifier(), realType(floatType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectpd_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(unsigned char, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectpd_256", builtinFunctionValueItem( {-  __attribute__((__vector_size__(32))) double(unsigned char, __attribute__((__vector_size__(32))) double, __attribute__((__vector_size__(32))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32), vectorType(builtinType(nilQualifier(), realType(doubleType())), 32)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectpd_512", builtinFunctionValueItem( {-  __attribute__((__vector_size__(64))) double(unsigned char, __attribute__((__vector_size__(64))) double, __attribute__((__vector_size__(64))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64), vectorType(builtinType(nilQualifier(), realType(doubleType())), 64)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectss_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) float(unsigned char, __attribute__((__vector_size__(16))) float, __attribute__((__vector_size__(16))) float) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(floatType())), 16), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), realType(floatType())), 16), vectorType(builtinType(nilQualifier(), realType(floatType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_selectsd_128", builtinFunctionValueItem( {-  __attribute__((__vector_size__(16))) double(unsigned char, __attribute__((__vector_size__(16))) double, __attribute__((__vector_size__(16))) double) -}
    functionType(vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16), vectorType(builtinType(nilQualifier(), realType(doubleType())), 16)], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_monitorx", builtinFunctionValueItem( {-  void(void * , unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_mwaitx", builtinFunctionValueItem( {-  void(unsigned int, unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_umonitor", builtinFunctionValueItem( {-  void(void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_umwait", builtinFunctionValueItem( {-  unsigned char(unsigned int, unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_tpause", builtinFunctionValueItem( {-  unsigned char(unsigned int, unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_clzero", builtinFunctionValueItem( {-  void(void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_cldemote", builtinFunctionValueItem( {-  void(const void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_directstore_u32", builtinFunctionValueItem( {-  void(unsigned int * , unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType()))), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_movdir64b", builtinFunctionValueItem( {-  void(void * , const void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_ptwrite32", builtinFunctionValueItem( {-  void(unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_invpcid", builtinFunctionValueItem( {-  void(unsigned int, void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_enqcmd", builtinFunctionValueItem( {-  unsigned char(void * , const void * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ia32_enqcmds", builtinFunctionValueItem( {-  unsigned char(void * , const void * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored _BitScanForward on line -1
-- Ignored _BitScanReverse on line -1
d <- [valueDef("_ReadWriteBarrier", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_ReadBarrier", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_WriteBarrier", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__emul", builtinFunctionValueItem( {-  signed long long(signed int, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__emulu", builtinFunctionValueItem( {-  unsigned long long(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_AddressOfReturnAddress", builtinFunctionValueItem( {-  void * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__stosb", builtinFunctionValueItem( {-  void(unsigned char * , unsigned char, signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType()))), builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__int2c", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__ud2", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __readfsbyte on line -1
-- Ignored __readfsword on line -1
-- Ignored __readfsdword on line -1
-- Ignored __readfsqword on line -1
-- Ignored __readgsbyte on line -1
-- Ignored __readgsword on line -1
-- Ignored __readgsdword on line -1
-- Ignored __readgsqword on line -1
}
