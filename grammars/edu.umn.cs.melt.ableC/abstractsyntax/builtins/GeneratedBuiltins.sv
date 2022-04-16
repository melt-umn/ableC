grammar edu:umn:cs:melt:ableC:abstractsyntax:builtins;
--GENERATED FILE, DO NOT EDIT. see edu:umn:cs:melt:ableC:tools:builtins
aspect function getInitialEnvDefs [Def] ::= {
d <- [valueDef("__builtin_atan2", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_atan2f", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_atan2l", builtinFunctionValueItem( {-  long double(long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_abs", builtinFunctionValueItem( {-  signed int(signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_copysign", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_copysignf", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_copysignf16 on line 116
d <- [valueDef("__builtin_copysignl", builtinFunctionValueItem( {-  long double(long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_copysignf128 on line 118
d <- [valueDef("__builtin_fabs", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fabsf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fabsl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_fabsf16 on line 122
-- Ignored __builtin_fabsf128 on line 123
d <- [valueDef("__builtin_fmod", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fmodf", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_fmodf16 on line 126
d <- [valueDef("__builtin_fmodl", builtinFunctionValueItem( {-  long double(long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_frexp", builtinFunctionValueItem( {-  double(double, signed int * ) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_frexpf", builtinFunctionValueItem( {-  float(float, signed int * ) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_frexpl", builtinFunctionValueItem( {-  long double(long double, signed int * ) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_huge_val", builtinFunctionValueItem( {-  double(void) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_huge_valf", builtinFunctionValueItem( {-  float(void) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_huge_vall", builtinFunctionValueItem( {-  long double(void) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_huge_valf128 on line 134
d <- [valueDef("__builtin_inf", builtinFunctionValueItem( {-  double(void) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_inff", builtinFunctionValueItem( {-  float(void) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_infl", builtinFunctionValueItem( {-  long double(void) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_inff128 on line 138
d <- [valueDef("__builtin_labs", builtinFunctionValueItem( {-  signed long(signed long) -}
    functionType(builtinType(nilQualifier(), signedType(longType())), protoFunctionType([builtinType(nilQualifier(), signedType(longType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_llabs", builtinFunctionValueItem( {-  signed long long(signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), signedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ldexp", builtinFunctionValueItem( {-  double(double, signed int) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ldexpf", builtinFunctionValueItem( {-  float(float, signed int) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ldexpl", builtinFunctionValueItem( {-  long double(long double, signed int) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_modf", builtinFunctionValueItem( {-  double(double, double * ) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), pointerType(nilQualifier(), builtinType(nilQualifier(), realType(doubleType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_modff", builtinFunctionValueItem( {-  float(float, float * ) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), pointerType(nilQualifier(), builtinType(nilQualifier(), realType(floatType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_modfl", builtinFunctionValueItem( {-  long double(long double, long double * ) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), pointerType(nilQualifier(), builtinType(nilQualifier(), realType(longdoubleType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nan", builtinFunctionValueItem( {-  double(const char * ) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nanf", builtinFunctionValueItem( {-  float(const char * ) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nanl", builtinFunctionValueItem( {-  long double(const char * ) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_nanf128 on line 150
d <- [valueDef("__builtin_nans", builtinFunctionValueItem( {-  double(const char * ) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nansf", builtinFunctionValueItem( {-  float(const char * ) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nansl", builtinFunctionValueItem( {-  long double(const char * ) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_nansf128 on line 154
d <- [valueDef("__builtin_powi", builtinFunctionValueItem( {-  double(double, signed int) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_powif", builtinFunctionValueItem( {-  float(float, signed int) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_powil", builtinFunctionValueItem( {-  long double(long double, signed int) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_pow", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_powf", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_powf16 on line 160
d <- [valueDef("__builtin_powl", builtinFunctionValueItem( {-  long double(long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_acos", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_acosf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_acosl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_acosh", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_acoshf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_acoshl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_asin", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_asinf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_asinl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_asinh", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_asinhf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_asinhl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_atan", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_atanf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_atanl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_atanh", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_atanhf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_atanhl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cbrt", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cbrtf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cbrtl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ceil", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ceilf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_ceilf16 on line 187
d <- [valueDef("__builtin_ceill", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cos", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cosf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_cosf16 on line 191
d <- [valueDef("__builtin_cosh", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coshf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coshl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cosl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_erf", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_erff", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_erfl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_erfc", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_erfcf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_erfcl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_exp", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_expf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_expf16 on line 204
d <- [valueDef("__builtin_expl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_exp2", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_exp2f", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_exp2f16 on line 208
d <- [valueDef("__builtin_exp2l", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_expm1", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_expm1f", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_expm1l", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fdim", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fdimf", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fdiml", builtinFunctionValueItem( {-  long double(long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_floor", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_floorf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_floorf16 on line 218
d <- [valueDef("__builtin_floorl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fma", builtinFunctionValueItem( {-  double(double, double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fmaf", builtinFunctionValueItem( {-  float(float, float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_fmaf16 on line 222
d <- [valueDef("__builtin_fmal", builtinFunctionValueItem( {-  long double(long double, long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fmax", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fmaxf", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_fmaxf16 on line 226
d <- [valueDef("__builtin_fmaxl", builtinFunctionValueItem( {-  long double(long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fmin", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fminf", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_fminf16 on line 230
d <- [valueDef("__builtin_fminl", builtinFunctionValueItem( {-  long double(long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_hypot", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_hypotf", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_hypotl", builtinFunctionValueItem( {-  long double(long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ilogb", builtinFunctionValueItem( {-  signed int(double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ilogbf", builtinFunctionValueItem( {-  signed int(float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ilogbl", builtinFunctionValueItem( {-  signed int(long double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_lgamma", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_lgammaf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_lgammal", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_llrint", builtinFunctionValueItem( {-  signed long long(double) -}
    functionType(builtinType(nilQualifier(), signedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_llrintf", builtinFunctionValueItem( {-  signed long long(float) -}
    functionType(builtinType(nilQualifier(), signedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_llrintl", builtinFunctionValueItem( {-  signed long long(long double) -}
    functionType(builtinType(nilQualifier(), signedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_llround", builtinFunctionValueItem( {-  signed long long(double) -}
    functionType(builtinType(nilQualifier(), signedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_llroundf", builtinFunctionValueItem( {-  signed long long(float) -}
    functionType(builtinType(nilQualifier(), signedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_llroundl", builtinFunctionValueItem( {-  signed long long(long double) -}
    functionType(builtinType(nilQualifier(), signedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_log", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_log10", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_log10f", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_log10f16 on line 250
d <- [valueDef("__builtin_log10l", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_log1p", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_log1pf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_log1pl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_log2", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_log2f", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_log2f16 on line 257
d <- [valueDef("__builtin_log2l", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_logb", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_logbf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_logbl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_logf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_logf16 on line 263
d <- [valueDef("__builtin_logl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_lrint", builtinFunctionValueItem( {-  signed long(double) -}
    functionType(builtinType(nilQualifier(), signedType(longType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_lrintf", builtinFunctionValueItem( {-  signed long(float) -}
    functionType(builtinType(nilQualifier(), signedType(longType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_lrintl", builtinFunctionValueItem( {-  signed long(long double) -}
    functionType(builtinType(nilQualifier(), signedType(longType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_lround", builtinFunctionValueItem( {-  signed long(double) -}
    functionType(builtinType(nilQualifier(), signedType(longType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_lroundf", builtinFunctionValueItem( {-  signed long(float) -}
    functionType(builtinType(nilQualifier(), signedType(longType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_lroundl", builtinFunctionValueItem( {-  signed long(long double) -}
    functionType(builtinType(nilQualifier(), signedType(longType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nearbyint", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nearbyintf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nearbyintl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nextafter", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nextafterf", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nextafterl", builtinFunctionValueItem( {-  long double(long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nexttoward", builtinFunctionValueItem( {-  double(double, long double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nexttowardf", builtinFunctionValueItem( {-  float(float, long double) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nexttowardl", builtinFunctionValueItem( {-  long double(long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_remainder", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_remainderf", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_remainderl", builtinFunctionValueItem( {-  long double(long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_remquo", builtinFunctionValueItem( {-  double(double, double, signed int * ) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_remquof", builtinFunctionValueItem( {-  float(float, float, signed int * ) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_remquol", builtinFunctionValueItem( {-  long double(long double, long double, signed int * ) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_rint", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_rintf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_rintf16 on line 288
d <- [valueDef("__builtin_rintl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_round", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_roundf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_roundf16 on line 292
d <- [valueDef("__builtin_roundl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_scalbln", builtinFunctionValueItem( {-  double(double, signed long) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), signedType(longType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_scalblnf", builtinFunctionValueItem( {-  float(float, signed long) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), signedType(longType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_scalblnl", builtinFunctionValueItem( {-  long double(long double, signed long) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), signedType(longType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_scalbn", builtinFunctionValueItem( {-  double(double, signed int) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_scalbnf", builtinFunctionValueItem( {-  float(float, signed int) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_scalbnl", builtinFunctionValueItem( {-  long double(long double, signed int) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_sin", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_sinf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_sinf16 on line 302
d <- [valueDef("__builtin_sinh", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_sinhf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_sinhl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_sinl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_sqrt", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_sqrtf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_sqrtf16 on line 309
d <- [valueDef("__builtin_sqrtl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_tan", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_tanf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_tanh", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_tanhf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_tanhl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_tanl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_tgamma", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_tgammaf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_tgammal", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_trunc", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_truncf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_truncl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_truncf16 on line 323
d <- [valueDef("__builtin_cabs", builtinFunctionValueItem( {-  double(_Complex double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cabsf", builtinFunctionValueItem( {-  float(_Complex float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cabsl", builtinFunctionValueItem( {-  long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cacos", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cacosf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cacosh", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cacoshf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cacoshl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cacosl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_carg", builtinFunctionValueItem( {-  double(_Complex double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cargf", builtinFunctionValueItem( {-  float(_Complex float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cargl", builtinFunctionValueItem( {-  long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_casin", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_casinf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_casinh", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_casinhf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_casinhl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_casinl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_catan", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_catanf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_catanh", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_catanhf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_catanhl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_catanl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ccos", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ccosf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ccosl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ccosh", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ccoshf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ccoshl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cexp", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cexpf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cexpl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cimag", builtinFunctionValueItem( {-  double(_Complex double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cimagf", builtinFunctionValueItem( {-  float(_Complex float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cimagl", builtinFunctionValueItem( {-  long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_conj", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_conjf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_conjl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_clog", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_clogf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_clogl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cproj", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cprojf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cprojl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cpow", builtinFunctionValueItem( {-  _Complex double(_Complex double, _Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType())), builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cpowf", builtinFunctionValueItem( {-  _Complex float(_Complex float, _Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType())), builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cpowl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double, _Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType())), builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_creal", builtinFunctionValueItem( {-  double(_Complex double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_crealf", builtinFunctionValueItem( {-  float(_Complex float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_creall", builtinFunctionValueItem( {-  long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_csin", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_csinf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_csinl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_csinh", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_csinhf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_csinhl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_csqrt", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_csqrtf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_csqrtl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ctan", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ctanf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ctanl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ctanh", builtinFunctionValueItem( {-  _Complex double(_Complex double) -}
    functionType(builtinType(nilQualifier(), complexType(doubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ctanhf", builtinFunctionValueItem( {-  _Complex float(_Complex float) -}
    functionType(builtinType(nilQualifier(), complexType(floatType())), protoFunctionType([builtinType(nilQualifier(), complexType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ctanhl", builtinFunctionValueItem( {-  _Complex long double(_Complex long double) -}
    functionType(builtinType(nilQualifier(), complexType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), complexType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_isgreater", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_isgreaterequal", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_isless", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_islessequal", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_islessgreater", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_isunordered", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fpclassify", builtinFunctionValueItem( {-  signed int(signed int, signed int, signed int, signed int, signed int, ...) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_isfinite", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_isinf", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_isinf_sign", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_isnan", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_isnormal", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_signbit", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_signbitf", builtinFunctionValueItem( {-  signed int(float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_signbitl", builtinFunctionValueItem( {-  signed int(long double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_canonicalize", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_canonicalizef", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_canonicalizef16 on line 417
d <- [valueDef("__builtin_canonicalizel", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_clzs", builtinFunctionValueItem( {-  signed int(unsigned short) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_clz", builtinFunctionValueItem( {-  signed int(unsigned int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_clzl", builtinFunctionValueItem( {-  signed int(unsigned long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_clzll", builtinFunctionValueItem( {-  signed int(unsigned long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ctzs", builtinFunctionValueItem( {-  signed int(unsigned short) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ctz", builtinFunctionValueItem( {-  signed int(unsigned int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ctzl", builtinFunctionValueItem( {-  signed int(unsigned long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ctzll", builtinFunctionValueItem( {-  signed int(unsigned long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ffs", builtinFunctionValueItem( {-  signed int(signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ffsl", builtinFunctionValueItem( {-  signed int(signed long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(longType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ffsll", builtinFunctionValueItem( {-  signed int(signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_parity", builtinFunctionValueItem( {-  signed int(unsigned int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_parityl", builtinFunctionValueItem( {-  signed int(unsigned long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_parityll", builtinFunctionValueItem( {-  signed int(unsigned long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_popcount", builtinFunctionValueItem( {-  signed int(unsigned int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_popcountl", builtinFunctionValueItem( {-  signed int(unsigned long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_popcountll", builtinFunctionValueItem( {-  signed int(unsigned long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_clrsb", builtinFunctionValueItem( {-  signed int(signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_clrsbl", builtinFunctionValueItem( {-  signed int(signed long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(longType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_clrsbll", builtinFunctionValueItem( {-  signed int(signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bswap16", builtinFunctionValueItem( {-  unsigned short(unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bswap32", builtinFunctionValueItem( {-  unsigned int(unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bswap64", builtinFunctionValueItem( {-  unsigned long long(unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bitreverse8", builtinFunctionValueItem( {-  unsigned char(unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bitreverse16", builtinFunctionValueItem( {-  unsigned short(unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bitreverse32", builtinFunctionValueItem( {-  unsigned int(unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bitreverse64", builtinFunctionValueItem( {-  unsigned long long(unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_rotateleft8", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_rotateleft16", builtinFunctionValueItem( {-  unsigned short(unsigned short, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_rotateleft32", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_rotateleft64", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_rotateright8", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_rotateright16", builtinFunctionValueItem( {-  unsigned short(unsigned short, unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_rotateright32", builtinFunctionValueItem( {-  unsigned int(unsigned int, unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_rotateright64", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_constant_p on line 467
-- Ignored __builtin_classify_type on line 468
-- Ignored __builtin___CFStringMakeConstantString on line 469
-- Ignored __builtin___NSStringMakeConstantString on line 470
-- Ignored __builtin_va_start on line 471
d <- [valueDef("__builtin_va_end", builtinFunctionValueItem( {-  void(void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_va_copy", builtinFunctionValueItem( {-  void(void * , void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_stdarg_start", builtinFunctionValueItem( {-  void(void * , ...) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_assume_aligned", builtinFunctionValueItem( {-  void * (const void * , signed int, ...) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bcmp", builtinFunctionValueItem( {-  signed int(const void * , const void * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bcopy", builtinFunctionValueItem( {-  void(void * , void * , signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bzero", builtinFunctionValueItem( {-  void(void * , signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_fprintf on line 479
d <- [valueDef("__builtin_memchr", builtinFunctionValueItem( {-  void * (const void * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_memcmp", builtinFunctionValueItem( {-  signed int(const void * , const void * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_memcpy", builtinFunctionValueItem( {-  void * (void * , const void * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_memmove", builtinFunctionValueItem( {-  void * (void * , const void * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_mempcpy", builtinFunctionValueItem( {-  void * (void * , const void * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_memset", builtinFunctionValueItem( {-  void * (void * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_printf", builtinFunctionValueItem( {-  signed int(const char * , ...) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_stpcpy", builtinFunctionValueItem( {-  char * (char * , const char * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_stpncpy", builtinFunctionValueItem( {-  char * (char * , const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strcasecmp", builtinFunctionValueItem( {-  signed int(const char * , const char * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strcat", builtinFunctionValueItem( {-  char * (char * , const char * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strchr", builtinFunctionValueItem( {-  char * (const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strcmp", builtinFunctionValueItem( {-  signed int(const char * , const char * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strcpy", builtinFunctionValueItem( {-  char * (char * , const char * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strcspn", builtinFunctionValueItem( {-  signed int(const char * , const char * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strdup", builtinFunctionValueItem( {-  char * (const char * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strlen", builtinFunctionValueItem( {-  signed int(const char * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strncasecmp", builtinFunctionValueItem( {-  signed int(const char * , const char * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strncat", builtinFunctionValueItem( {-  char * (char * , const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strncmp", builtinFunctionValueItem( {-  signed int(const char * , const char * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strncpy", builtinFunctionValueItem( {-  char * (char * , const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strndup", builtinFunctionValueItem( {-  char * (const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strpbrk", builtinFunctionValueItem( {-  char * (const char * , const char * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strrchr", builtinFunctionValueItem( {-  char * (const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strspn", builtinFunctionValueItem( {-  signed int(const char * , const char * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strstr", builtinFunctionValueItem( {-  char * (const char * , const char * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_wcschr", builtinFunctionValueItem( {-  signed int * (const signed int * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_wcscmp", builtinFunctionValueItem( {-  signed int(const signed int * , const signed int * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_wcslen", builtinFunctionValueItem( {-  signed int(const signed int * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_wcsncmp", builtinFunctionValueItem( {-  signed int(const signed int * , const signed int * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_wmemchr", builtinFunctionValueItem( {-  signed int * (const signed int * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_wmemcmp", builtinFunctionValueItem( {-  signed int(const signed int * , const signed int * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_wmemcpy", builtinFunctionValueItem( {-  signed int * (signed int * , const signed int * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_wmemmove", builtinFunctionValueItem( {-  signed int * (signed int * , const signed int * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_return_address", builtinFunctionValueItem( {-  void * (unsigned int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_extract_return_addr", builtinFunctionValueItem( {-  void * (void * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_frame_address", builtinFunctionValueItem( {-  void * (unsigned int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___clear_cache", builtinFunctionValueItem( {-  void(char * , char * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_flt_rounds", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_setjmp", builtinFunctionValueItem( {-  signed int(void *  * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_longjmp", builtinFunctionValueItem( {-  void(void *  * , signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_unwind_init", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_eh_return_data_regno", builtinFunctionValueItem( {-  signed int(signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_snprintf", builtinFunctionValueItem( {-  signed int(char * , signed int, const char * , ...) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_vsprintf", builtinFunctionValueItem( {-  signed int(char * , const char * , void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), voidType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_vsnprintf", builtinFunctionValueItem( {-  signed int(char * , signed int, const char * , void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), voidType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_thread_pointer", builtinFunctionValueItem( {-  void * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_launder on line 527
d <- [valueDef("__builtin_is_constant_evaluated", builtinFunctionValueItem( {-  _Bool(void) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_eh_return", builtinFunctionValueItem( {-  void(signed int, void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_frob_return_addr", builtinFunctionValueItem( {-  void * (void * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_dwarf_cfa", builtinFunctionValueItem( {-  void * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_init_dwarf_reg_size_table", builtinFunctionValueItem( {-  void(void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_dwarf_sp_column", builtinFunctionValueItem( {-  unsigned int(void) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_extend_pointer", builtinFunctionValueItem( {-  unsigned long long(void * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_object_size on line 539
-- Ignored __builtin_dynamic_object_size on line 540
d <- [valueDef("__builtin___memcpy_chk", builtinFunctionValueItem( {-  void * (void * , const void * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___memccpy_chk", builtinFunctionValueItem( {-  void * (void * , const void * , signed int, signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___memmove_chk", builtinFunctionValueItem( {-  void * (void * , const void * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___mempcpy_chk", builtinFunctionValueItem( {-  void * (void * , const void * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___memset_chk", builtinFunctionValueItem( {-  void * (void * , signed int, signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___stpcpy_chk", builtinFunctionValueItem( {-  char * (char * , const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___strcat_chk", builtinFunctionValueItem( {-  char * (char * , const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___strcpy_chk", builtinFunctionValueItem( {-  char * (char * , const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___strlcat_chk", builtinFunctionValueItem( {-  signed int(char * , const char * , signed int, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___strlcpy_chk", builtinFunctionValueItem( {-  signed int(char * , const char * , signed int, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___strncat_chk", builtinFunctionValueItem( {-  char * (char * , const char * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___strncpy_chk", builtinFunctionValueItem( {-  char * (char * , const char * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___stpncpy_chk", builtinFunctionValueItem( {-  char * (char * , const char * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___snprintf_chk", builtinFunctionValueItem( {-  signed int(char * , signed int, signed int, signed int, const char * , ...) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___sprintf_chk", builtinFunctionValueItem( {-  signed int(char * , signed int, signed int, const char * , ...) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___vsnprintf_chk", builtinFunctionValueItem( {-  signed int(char * , signed int, signed int, signed int, const char * , void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), voidType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___vsprintf_chk", builtinFunctionValueItem( {-  signed int(char * , signed int, signed int, const char * , void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), voidType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin___fprintf_chk on line 558
d <- [valueDef("__builtin___printf_chk", builtinFunctionValueItem( {-  signed int(signed int, const char * , ...) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType())))], true), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin___vfprintf_chk on line 560
d <- [valueDef("__builtin___vprintf_chk", builtinFunctionValueItem( {-  signed int(signed int, const char * , void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), voidType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_unpredictable", builtinFunctionValueItem( {-  signed long(signed long) -}
    functionType(builtinType(nilQualifier(), signedType(longType())), protoFunctionType([builtinType(nilQualifier(), signedType(longType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_expect", builtinFunctionValueItem( {-  signed long(signed long, signed long) -}
    functionType(builtinType(nilQualifier(), signedType(longType())), protoFunctionType([builtinType(nilQualifier(), signedType(longType())), builtinType(nilQualifier(), signedType(longType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_prefetch", builtinFunctionValueItem( {-  void(const void * , ...) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType()))], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_readcyclecounter", builtinFunctionValueItem( {-  unsigned long long(void) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_trap", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_debugtrap", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_unreachable", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_shufflevector on line 570
-- Ignored __builtin_convertvector on line 571
d <- [valueDef("__builtin_alloca", builtinFunctionValueItem( {-  void * (signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_alloca_with_align", builtinFunctionValueItem( {-  void * (signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_call_with_static_chain on line 574
-- Ignored __sync_fetch_and_add on line 584
-- Ignored __sync_fetch_and_add_1 on line 585
-- Ignored __sync_fetch_and_add_2 on line 586
-- Ignored __sync_fetch_and_add_4 on line 587
-- Ignored __sync_fetch_and_add_8 on line 588
-- Ignored __sync_fetch_and_add_16 on line 589
-- Ignored __sync_fetch_and_sub on line 591
-- Ignored __sync_fetch_and_sub_1 on line 592
-- Ignored __sync_fetch_and_sub_2 on line 593
-- Ignored __sync_fetch_and_sub_4 on line 594
-- Ignored __sync_fetch_and_sub_8 on line 595
-- Ignored __sync_fetch_and_sub_16 on line 596
-- Ignored __sync_fetch_and_or on line 598
-- Ignored __sync_fetch_and_or_1 on line 599
-- Ignored __sync_fetch_and_or_2 on line 600
-- Ignored __sync_fetch_and_or_4 on line 601
-- Ignored __sync_fetch_and_or_8 on line 602
-- Ignored __sync_fetch_and_or_16 on line 603
-- Ignored __sync_fetch_and_and on line 605
-- Ignored __sync_fetch_and_and_1 on line 606
-- Ignored __sync_fetch_and_and_2 on line 607
-- Ignored __sync_fetch_and_and_4 on line 608
-- Ignored __sync_fetch_and_and_8 on line 609
-- Ignored __sync_fetch_and_and_16 on line 610
-- Ignored __sync_fetch_and_xor on line 612
-- Ignored __sync_fetch_and_xor_1 on line 613
-- Ignored __sync_fetch_and_xor_2 on line 614
-- Ignored __sync_fetch_and_xor_4 on line 615
-- Ignored __sync_fetch_and_xor_8 on line 616
-- Ignored __sync_fetch_and_xor_16 on line 617
-- Ignored __sync_fetch_and_nand on line 619
-- Ignored __sync_fetch_and_nand_1 on line 620
-- Ignored __sync_fetch_and_nand_2 on line 621
-- Ignored __sync_fetch_and_nand_4 on line 622
-- Ignored __sync_fetch_and_nand_8 on line 623
-- Ignored __sync_fetch_and_nand_16 on line 624
-- Ignored __sync_add_and_fetch on line 626
-- Ignored __sync_add_and_fetch_1 on line 627
-- Ignored __sync_add_and_fetch_2 on line 628
-- Ignored __sync_add_and_fetch_4 on line 629
-- Ignored __sync_add_and_fetch_8 on line 630
-- Ignored __sync_add_and_fetch_16 on line 631
-- Ignored __sync_sub_and_fetch on line 633
-- Ignored __sync_sub_and_fetch_1 on line 634
-- Ignored __sync_sub_and_fetch_2 on line 635
-- Ignored __sync_sub_and_fetch_4 on line 636
-- Ignored __sync_sub_and_fetch_8 on line 637
-- Ignored __sync_sub_and_fetch_16 on line 638
-- Ignored __sync_or_and_fetch on line 640
-- Ignored __sync_or_and_fetch_1 on line 641
-- Ignored __sync_or_and_fetch_2 on line 642
-- Ignored __sync_or_and_fetch_4 on line 643
-- Ignored __sync_or_and_fetch_8 on line 644
-- Ignored __sync_or_and_fetch_16 on line 645
-- Ignored __sync_and_and_fetch on line 647
-- Ignored __sync_and_and_fetch_1 on line 648
-- Ignored __sync_and_and_fetch_2 on line 649
-- Ignored __sync_and_and_fetch_4 on line 650
-- Ignored __sync_and_and_fetch_8 on line 651
-- Ignored __sync_and_and_fetch_16 on line 652
-- Ignored __sync_xor_and_fetch on line 654
-- Ignored __sync_xor_and_fetch_1 on line 655
-- Ignored __sync_xor_and_fetch_2 on line 656
-- Ignored __sync_xor_and_fetch_4 on line 657
-- Ignored __sync_xor_and_fetch_8 on line 658
-- Ignored __sync_xor_and_fetch_16 on line 659
-- Ignored __sync_nand_and_fetch on line 661
-- Ignored __sync_nand_and_fetch_1 on line 662
-- Ignored __sync_nand_and_fetch_2 on line 663
-- Ignored __sync_nand_and_fetch_4 on line 664
-- Ignored __sync_nand_and_fetch_8 on line 665
-- Ignored __sync_nand_and_fetch_16 on line 666
-- Ignored __sync_bool_compare_and_swap on line 668
-- Ignored __sync_bool_compare_and_swap_1 on line 669
-- Ignored __sync_bool_compare_and_swap_2 on line 670
-- Ignored __sync_bool_compare_and_swap_4 on line 671
-- Ignored __sync_bool_compare_and_swap_8 on line 672
-- Ignored __sync_bool_compare_and_swap_16 on line 673
-- Ignored __sync_val_compare_and_swap on line 675
-- Ignored __sync_val_compare_and_swap_1 on line 676
-- Ignored __sync_val_compare_and_swap_2 on line 677
-- Ignored __sync_val_compare_and_swap_4 on line 678
-- Ignored __sync_val_compare_and_swap_8 on line 679
-- Ignored __sync_val_compare_and_swap_16 on line 680
-- Ignored __sync_lock_test_and_set on line 682
-- Ignored __sync_lock_test_and_set_1 on line 683
-- Ignored __sync_lock_test_and_set_2 on line 684
-- Ignored __sync_lock_test_and_set_4 on line 685
-- Ignored __sync_lock_test_and_set_8 on line 686
-- Ignored __sync_lock_test_and_set_16 on line 687
-- Ignored __sync_lock_release on line 689
-- Ignored __sync_lock_release_1 on line 690
-- Ignored __sync_lock_release_2 on line 691
-- Ignored __sync_lock_release_4 on line 692
-- Ignored __sync_lock_release_8 on line 693
-- Ignored __sync_lock_release_16 on line 694
-- Ignored __sync_swap on line 696
-- Ignored __sync_swap_1 on line 697
-- Ignored __sync_swap_2 on line 698
-- Ignored __sync_swap_4 on line 699
-- Ignored __sync_swap_8 on line 700
-- Ignored __sync_swap_16 on line 701
-- Ignored __c11_atomic_init on line 710
-- Ignored __c11_atomic_load on line 711
-- Ignored __c11_atomic_store on line 712
-- Ignored __c11_atomic_exchange on line 713
-- Ignored __c11_atomic_compare_exchange_strong on line 714
-- Ignored __c11_atomic_compare_exchange_weak on line 715
-- Ignored __c11_atomic_fetch_add on line 716
-- Ignored __c11_atomic_fetch_sub on line 717
-- Ignored __c11_atomic_fetch_and on line 718
-- Ignored __c11_atomic_fetch_or on line 719
-- Ignored __c11_atomic_fetch_xor on line 720
d <- [valueDef("__c11_atomic_thread_fence", builtinFunctionValueItem( {-  void(signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__c11_atomic_signal_fence", builtinFunctionValueItem( {-  void(signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__c11_atomic_is_lock_free", builtinFunctionValueItem( {-  signed int(signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __atomic_load on line 726
-- Ignored __atomic_load_n on line 727
-- Ignored __atomic_store on line 728
-- Ignored __atomic_store_n on line 729
-- Ignored __atomic_exchange on line 730
-- Ignored __atomic_exchange_n on line 731
-- Ignored __atomic_compare_exchange on line 732
-- Ignored __atomic_compare_exchange_n on line 733
-- Ignored __atomic_fetch_add on line 734
-- Ignored __atomic_fetch_sub on line 735
-- Ignored __atomic_fetch_and on line 736
-- Ignored __atomic_fetch_or on line 737
-- Ignored __atomic_fetch_xor on line 738
-- Ignored __atomic_fetch_nand on line 739
-- Ignored __atomic_add_fetch on line 740
-- Ignored __atomic_sub_fetch on line 741
-- Ignored __atomic_and_fetch on line 742
-- Ignored __atomic_or_fetch on line 743
-- Ignored __atomic_xor_fetch on line 744
-- Ignored __atomic_nand_fetch on line 745
d <- [valueDef("__atomic_test_and_set", builtinFunctionValueItem( {-  _Bool(volatile void * , signed int) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__atomic_clear", builtinFunctionValueItem( {-  void(volatile void * , signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__atomic_thread_fence", builtinFunctionValueItem( {-  void(signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__atomic_signal_fence", builtinFunctionValueItem( {-  void(signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__atomic_always_lock_free", builtinFunctionValueItem( {-  signed int(signed int, const volatile void * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier())), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__atomic_is_lock_free", builtinFunctionValueItem( {-  signed int(signed int, const volatile void * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier())), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __opencl_atomic_init on line 754
-- Ignored __opencl_atomic_load on line 755
-- Ignored __opencl_atomic_store on line 756
-- Ignored __opencl_atomic_exchange on line 757
-- Ignored __opencl_atomic_compare_exchange_strong on line 758
-- Ignored __opencl_atomic_compare_exchange_weak on line 759
-- Ignored __opencl_atomic_fetch_add on line 760
-- Ignored __opencl_atomic_fetch_sub on line 761
-- Ignored __opencl_atomic_fetch_and on line 762
-- Ignored __opencl_atomic_fetch_or on line 763
-- Ignored __opencl_atomic_fetch_xor on line 764
-- Ignored __opencl_atomic_fetch_min on line 765
-- Ignored __opencl_atomic_fetch_max on line 766
-- Ignored __atomic_fetch_min on line 769
-- Ignored __atomic_fetch_max on line 770
d <- [valueDef("__sync_synchronize", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__sync_fetch_and_min", builtinFunctionValueItem( {-  signed int(volatile signed int * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__sync_fetch_and_max", builtinFunctionValueItem( {-  signed int(volatile signed int * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__sync_fetch_and_umin", builtinFunctionValueItem( {-  unsigned int(volatile unsigned int * , unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType()))), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__sync_fetch_and_umax", builtinFunctionValueItem( {-  unsigned int(volatile unsigned int * , unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType()))), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_abort", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_index", builtinFunctionValueItem( {-  char * (const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_rindex", builtinFunctionValueItem( {-  char * (const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_alloca", builtinFunctionValueItem( {-  void * (signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__annotation", builtinFunctionValueItem( {-  const signed int * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType()))), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__assume", builtinFunctionValueItem( {-  void(_Bool) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), boolType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored _bittest on line 791
-- Ignored _bittestandcomplement on line 792
-- Ignored _bittestandreset on line 793
-- Ignored _bittestandset on line 794
d <- [valueDef("_bittest64", builtinFunctionValueItem( {-  unsigned char(const signed long long * , signed long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longlongType()))), builtinType(nilQualifier(), signedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_bittestandcomplement64", builtinFunctionValueItem( {-  unsigned char(signed long long * , signed long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longlongType()))), builtinType(nilQualifier(), signedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_bittestandreset64", builtinFunctionValueItem( {-  unsigned char(signed long long * , signed long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longlongType()))), builtinType(nilQualifier(), signedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_bittestandset64", builtinFunctionValueItem( {-  unsigned char(signed long long * , signed long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longlongType()))), builtinType(nilQualifier(), signedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__debugbreak", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __exception_code on line 803
-- Ignored _exception_code on line 804
d <- [valueDef("__exception_info", builtinFunctionValueItem( {-  void * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_exception_info", builtinFunctionValueItem( {-  void * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__abnormal_termination", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_abnormal_termination", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __GetExceptionInfo on line 809
d <- [valueDef("_InterlockedAnd8", builtinFunctionValueItem( {-  char(volatile char * , char) -}
    functionType(builtinType(nilQualifier(), signedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_InterlockedAnd16", builtinFunctionValueItem( {-  signed short(volatile signed short * , signed short) -}
    functionType(builtinType(nilQualifier(), signedType(shortType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(shortType()))), builtinType(nilQualifier(), signedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored _InterlockedAnd on line 812
d <- [valueDef("_InterlockedCompareExchange8", builtinFunctionValueItem( {-  char(volatile char * , char, char) -}
    functionType(builtinType(nilQualifier(), signedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(charType())), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_InterlockedCompareExchange16", builtinFunctionValueItem( {-  signed short(volatile signed short * , signed short, signed short) -}
    functionType(builtinType(nilQualifier(), signedType(shortType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(shortType()))), builtinType(nilQualifier(), signedType(shortType())), builtinType(nilQualifier(), signedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored _InterlockedCompareExchange on line 815
d <- [valueDef("_InterlockedCompareExchange64", builtinFunctionValueItem( {-  signed long long(volatile signed long long * , signed long long, signed long long) -}
    functionType(builtinType(nilQualifier(), signedType(longlongType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longlongType()))), builtinType(nilQualifier(), signedType(longlongType())), builtinType(nilQualifier(), signedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_InterlockedCompareExchangePointer", builtinFunctionValueItem( {-  void * (volatile void *  * , void * , void * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType()))), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_InterlockedCompareExchangePointer_nf", builtinFunctionValueItem( {-  void * (volatile void *  * , void * , void * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType()))), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_InterlockedDecrement16", builtinFunctionValueItem( {-  signed short(volatile signed short * ) -}
    functionType(builtinType(nilQualifier(), signedType(shortType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(shortType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored _InterlockedDecrement on line 820
-- Ignored _InterlockedExchange on line 821
d <- [valueDef("_InterlockedExchange8", builtinFunctionValueItem( {-  char(volatile char * , char) -}
    functionType(builtinType(nilQualifier(), signedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_InterlockedExchange16", builtinFunctionValueItem( {-  signed short(volatile signed short * , signed short) -}
    functionType(builtinType(nilQualifier(), signedType(shortType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(shortType()))), builtinType(nilQualifier(), signedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_InterlockedExchangeAdd8", builtinFunctionValueItem( {-  char(volatile char * , char) -}
    functionType(builtinType(nilQualifier(), signedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_InterlockedExchangeAdd16", builtinFunctionValueItem( {-  signed short(volatile signed short * , signed short) -}
    functionType(builtinType(nilQualifier(), signedType(shortType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(shortType()))), builtinType(nilQualifier(), signedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored _InterlockedExchangeAdd on line 826
d <- [valueDef("_InterlockedExchangePointer", builtinFunctionValueItem( {-  void * (volatile void *  * , void * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType()))), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_InterlockedExchangeSub8", builtinFunctionValueItem( {-  char(volatile char * , char) -}
    functionType(builtinType(nilQualifier(), signedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_InterlockedExchangeSub16", builtinFunctionValueItem( {-  signed short(volatile signed short * , signed short) -}
    functionType(builtinType(nilQualifier(), signedType(shortType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(shortType()))), builtinType(nilQualifier(), signedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored _InterlockedExchangeSub on line 830
d <- [valueDef("_InterlockedIncrement16", builtinFunctionValueItem( {-  signed short(volatile signed short * ) -}
    functionType(builtinType(nilQualifier(), signedType(shortType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(shortType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored _InterlockedIncrement on line 832
d <- [valueDef("_InterlockedOr8", builtinFunctionValueItem( {-  char(volatile char * , char) -}
    functionType(builtinType(nilQualifier(), signedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_InterlockedOr16", builtinFunctionValueItem( {-  signed short(volatile signed short * , signed short) -}
    functionType(builtinType(nilQualifier(), signedType(shortType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(shortType()))), builtinType(nilQualifier(), signedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored _InterlockedOr on line 835
d <- [valueDef("_InterlockedXor8", builtinFunctionValueItem( {-  char(volatile char * , char) -}
    functionType(builtinType(nilQualifier(), signedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_InterlockedXor16", builtinFunctionValueItem( {-  signed short(volatile signed short * , signed short) -}
    functionType(builtinType(nilQualifier(), signedType(shortType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(shortType()))), builtinType(nilQualifier(), signedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored _InterlockedXor on line 838
-- Ignored _interlockedbittestandreset on line 839
d <- [valueDef("_interlockedbittestandreset64", builtinFunctionValueItem( {-  unsigned char(volatile signed long long * , signed long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longlongType()))), builtinType(nilQualifier(), signedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored _interlockedbittestandreset_acq on line 841
-- Ignored _interlockedbittestandreset_nf on line 842
-- Ignored _interlockedbittestandreset_rel on line 843
-- Ignored _interlockedbittestandset on line 844
d <- [valueDef("_interlockedbittestandset64", builtinFunctionValueItem( {-  unsigned char(volatile signed long long * , signed long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longlongType()))), builtinType(nilQualifier(), signedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored _interlockedbittestandset_acq on line 846
-- Ignored _interlockedbittestandset_nf on line 847
-- Ignored _interlockedbittestandset_rel on line 848
d <- [valueDef("__iso_volatile_load8", builtinFunctionValueItem( {-  char(const volatile char * ) -}
    functionType(builtinType(nilQualifier(), signedType(charType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier())), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__iso_volatile_load16", builtinFunctionValueItem( {-  signed short(const volatile signed short * ) -}
    functionType(builtinType(nilQualifier(), signedType(shortType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier())), signedType(shortType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__iso_volatile_load32", builtinFunctionValueItem( {-  signed int(const volatile signed int * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier())), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__iso_volatile_load64", builtinFunctionValueItem( {-  signed long long(const volatile signed long long * ) -}
    functionType(builtinType(nilQualifier(), signedType(longlongType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier())), signedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__iso_volatile_store8", builtinFunctionValueItem( {-  void(volatile char * , char) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__iso_volatile_store16", builtinFunctionValueItem( {-  void(volatile signed short * , signed short) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(shortType()))), builtinType(nilQualifier(), signedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__iso_volatile_store32", builtinFunctionValueItem( {-  void(volatile signed int * , signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__iso_volatile_store64", builtinFunctionValueItem( {-  void(volatile signed long long * , signed long long) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longlongType()))), builtinType(nilQualifier(), signedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__noop", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__lzcnt16", builtinFunctionValueItem( {-  unsigned short(unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__lzcnt", builtinFunctionValueItem( {-  unsigned int(unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__lzcnt64", builtinFunctionValueItem( {-  unsigned long long(unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__popcnt16", builtinFunctionValueItem( {-  unsigned short(unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__popcnt", builtinFunctionValueItem( {-  unsigned int(unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__popcnt64", builtinFunctionValueItem( {-  unsigned long long(unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_ReturnAddress", builtinFunctionValueItem( {-  void * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_rotl8", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_rotl16", builtinFunctionValueItem( {-  unsigned short(unsigned short, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_rotl", builtinFunctionValueItem( {-  unsigned int(unsigned int, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_lrotl", builtinFunctionValueItem( {-  unsigned long(unsigned long, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(longType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_rotl64", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_rotr8", builtinFunctionValueItem( {-  unsigned char(unsigned char, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(charType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_rotr16", builtinFunctionValueItem( {-  unsigned short(unsigned short, unsigned char) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType())), builtinType(nilQualifier(), unsignedType(charType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_rotr", builtinFunctionValueItem( {-  unsigned int(unsigned int, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_lrotr", builtinFunctionValueItem( {-  unsigned long(unsigned long, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(longType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("_rotr64", builtinFunctionValueItem( {-  unsigned long long(unsigned long long, signed int) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __va_start on line 875
d <- [valueDef("__fastfail", builtinFunctionValueItem( {-  void(unsigned int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_objc_memmove_collectable", builtinFunctionValueItem( {-  void * (void * , const void * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_annotation on line 1425
d <- [valueDef("__builtin_assume", builtinFunctionValueItem( {-  void(_Bool) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), boolType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_addcb", builtinFunctionValueItem( {-  unsigned char(const unsigned char, const unsigned char, const unsigned char, unsigned char * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(charType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(charType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(charType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_addcs", builtinFunctionValueItem( {-  unsigned short(const unsigned short, const unsigned short, const unsigned short, unsigned short * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(shortType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(shortType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(shortType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(shortType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_addc", builtinFunctionValueItem( {-  unsigned int(const unsigned int, const unsigned int, const unsigned int, unsigned int * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_addcl", builtinFunctionValueItem( {-  unsigned long(const unsigned long, const unsigned long, const unsigned long, unsigned long * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(longType())), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_addcll", builtinFunctionValueItem( {-  unsigned long long(const unsigned long long, const unsigned long long, const unsigned long long, unsigned long long * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_subcb", builtinFunctionValueItem( {-  unsigned char(const unsigned char, const unsigned char, const unsigned char, unsigned char * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(charType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(charType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(charType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_subcs", builtinFunctionValueItem( {-  unsigned short(const unsigned short, const unsigned short, const unsigned short, unsigned short * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(shortType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(shortType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(shortType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(shortType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_subc", builtinFunctionValueItem( {-  unsigned int(const unsigned int, const unsigned int, const unsigned int, unsigned int * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_subcl", builtinFunctionValueItem( {-  unsigned long(const unsigned long, const unsigned long, const unsigned long, unsigned long * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(longType())), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_subcll", builtinFunctionValueItem( {-  unsigned long long(const unsigned long long, const unsigned long long, const unsigned long long, unsigned long long * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_add_overflow on line 1443
-- Ignored __builtin_sub_overflow on line 1444
-- Ignored __builtin_mul_overflow on line 1445
d <- [valueDef("__builtin_uadd_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned int, const unsigned int, unsigned int * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_uaddl_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned long, const unsigned long, unsigned long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_uaddll_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned long long, const unsigned long long, unsigned long long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_usub_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned int, const unsigned int, unsigned int * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_usubl_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned long, const unsigned long, unsigned long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_usubll_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned long long, const unsigned long long, unsigned long long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_umul_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned int, const unsigned int, unsigned int * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_umull_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned long, const unsigned long, unsigned long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_umulll_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned long long, const unsigned long long, unsigned long long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), unsignedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_sadd_overflow", builtinFunctionValueItem( {-  _Bool(const signed int, const signed int, signed int * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_saddl_overflow", builtinFunctionValueItem( {-  _Bool(const signed long, const signed long, signed long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_saddll_overflow", builtinFunctionValueItem( {-  _Bool(const signed long long, const signed long long, signed long long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longlongType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ssub_overflow", builtinFunctionValueItem( {-  _Bool(const signed int, const signed int, signed int * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ssubl_overflow", builtinFunctionValueItem( {-  _Bool(const signed long, const signed long, signed long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ssubll_overflow", builtinFunctionValueItem( {-  _Bool(const signed long long, const signed long long, signed long long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longlongType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_smul_overflow", builtinFunctionValueItem( {-  _Bool(const signed int, const signed int, signed int * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_smull_overflow", builtinFunctionValueItem( {-  _Bool(const signed long, const signed long, signed long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_smulll_overflow", builtinFunctionValueItem( {-  _Bool(const signed long long, const signed long long, signed long long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longlongType())), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_addressof on line 1466
-- Ignored __builtin_operator_new on line 1467
-- Ignored __builtin_operator_delete on line 1468
d <- [valueDef("__builtin_char_memchr", builtinFunctionValueItem( {-  char * (const char * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_dump_struct on line 1470
-- Ignored __builtin_preserve_access_index on line 1471
d <- [valueDef("__builtin___get_unsafe_stack_start", builtinFunctionValueItem( {-  void * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___get_unsafe_stack_bottom", builtinFunctionValueItem( {-  void * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___get_unsafe_stack_top", builtinFunctionValueItem( {-  void * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___get_unsafe_stack_ptr", builtinFunctionValueItem( {-  void * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_nontemporal_store on line 1480
-- Ignored __builtin_nontemporal_load on line 1481
d <- [valueDef("__builtin_coro_resume", builtinFunctionValueItem( {-  void(void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coro_destroy", builtinFunctionValueItem( {-  void(void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coro_done", builtinFunctionValueItem( {-  _Bool(void * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coro_promise", builtinFunctionValueItem( {-  void * (void * , signed int, _Bool) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), boolType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coro_size", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coro_frame", builtinFunctionValueItem( {-  void * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coro_noop", builtinFunctionValueItem( {-  void * (void) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coro_free", builtinFunctionValueItem( {-  void * (void * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coro_id", builtinFunctionValueItem( {-  void * (signed int, void * , void * , void * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coro_alloc", builtinFunctionValueItem( {-  _Bool(void) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coro_begin", builtinFunctionValueItem( {-  void * (void * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coro_end", builtinFunctionValueItem( {-  _Bool(void * , _Bool) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), boolType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coro_suspend", builtinFunctionValueItem( {-  char(_Bool) -}
    functionType(builtinType(nilQualifier(), signedType(charType())), protoFunctionType([builtinType(nilQualifier(), boolType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_coro_param", builtinFunctionValueItem( {-  _Bool(void * , void * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored read_pipe on line 1503
-- Ignored write_pipe on line 1504
-- Ignored reserve_read_pipe on line 1506
-- Ignored reserve_write_pipe on line 1507
-- Ignored commit_write_pipe on line 1509
-- Ignored commit_read_pipe on line 1510
-- Ignored sub_group_reserve_read_pipe on line 1512
-- Ignored sub_group_reserve_write_pipe on line 1513
-- Ignored sub_group_commit_read_pipe on line 1515
-- Ignored sub_group_commit_write_pipe on line 1516
-- Ignored work_group_reserve_read_pipe on line 1518
-- Ignored work_group_reserve_write_pipe on line 1519
-- Ignored work_group_commit_read_pipe on line 1521
-- Ignored work_group_commit_write_pipe on line 1522
-- Ignored get_pipe_num_packets on line 1524
-- Ignored get_pipe_max_packets on line 1525
-- Ignored enqueue_kernel on line 1529
-- Ignored get_kernel_work_group_size on line 1530
-- Ignored get_kernel_preferred_work_group_size_multiple on line 1531
-- Ignored get_kernel_max_sub_group_size_for_ndrange on line 1532
-- Ignored get_kernel_sub_group_count_for_ndrange on line 1533
-- Ignored to_global on line 1538
-- Ignored to_local on line 1539
-- Ignored to_private on line 1540
-- Ignored __builtin_store_half on line 1543
-- Ignored __builtin_store_halff on line 1544
-- Ignored __builtin_load_half on line 1545
-- Ignored __builtin_load_halff on line 1546
-- Ignored __builtin_os_log_format_buffer_size on line 1549
-- Ignored __builtin_os_log_format on line 1550
d <- [valueDef("omp_is_initial_device", builtinFunctionValueItem( {-  signed int(void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__xray_customevent", builtinFunctionValueItem( {-  void(const char * , signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__xray_typedevent", builtinFunctionValueItem( {-  void(signed int, const char * , signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(location=txtLoc("Built in from host")), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_ms_va_start on line 1560
-- Ignored __builtin_ms_va_end on line 1561
-- Ignored __builtin_ms_va_copy on line 1562
}
