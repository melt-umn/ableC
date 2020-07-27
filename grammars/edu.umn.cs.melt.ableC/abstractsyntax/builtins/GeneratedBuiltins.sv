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
d <- [valueDef("__builtin_copysignl", builtinFunctionValueItem( {-  long double(long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fabs", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fabsf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fabsl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fmod", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fmodf", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
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
d <- [valueDef("__builtin_inf", builtinFunctionValueItem( {-  double(void) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_inff", builtinFunctionValueItem( {-  float(void) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_infl", builtinFunctionValueItem( {-  long double(void) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
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
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nanf", builtinFunctionValueItem( {-  float(const char * ) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nanl", builtinFunctionValueItem( {-  long double(const char * ) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nans", builtinFunctionValueItem( {-  double(const char * ) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nansf", builtinFunctionValueItem( {-  float(const char * ) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nansl", builtinFunctionValueItem( {-  long double(const char * ) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
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
d <- [valueDef("__builtin_ceill", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cos", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_cosf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
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
d <- [valueDef("__builtin_expl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_exp2", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_exp2f", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
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
d <- [valueDef("__builtin_floorl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fma", builtinFunctionValueItem( {-  double(double, double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fmaf", builtinFunctionValueItem( {-  float(float, float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fmal", builtinFunctionValueItem( {-  long double(long double, long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fmax", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fmaxf", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fmaxl", builtinFunctionValueItem( {-  long double(long double, long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType())), builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fmin", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_fminf", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
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
d <- [valueDef("__builtin_nexttoward", builtinFunctionValueItem( {-  double(double, double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType())), builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_nexttowardf", builtinFunctionValueItem( {-  float(float, float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType())), builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
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
d <- [valueDef("__builtin_rintl", builtinFunctionValueItem( {-  long double(long double) -}
    functionType(builtinType(nilQualifier(), realType(longdoubleType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_round", builtinFunctionValueItem( {-  double(double) -}
    functionType(builtinType(nilQualifier(), realType(doubleType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_roundf", builtinFunctionValueItem( {-  float(float) -}
    functionType(builtinType(nilQualifier(), realType(floatType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
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
d <- [valueDef("__builtin_fpclassify", builtinFunctionValueItem( {-  signed int(signed int, signed int, signed int, signed int, ...) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], true), nilQualifier()),
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
d <- [valueDef("__builtin_signbit", builtinFunctionValueItem( {-  signed int(double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), realType(doubleType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_signbitf", builtinFunctionValueItem( {-  signed int(float) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), realType(floatType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_signbitl", builtinFunctionValueItem( {-  signed int(long double) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), realType(longdoubleType()))], false), nilQualifier()),
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
d <- [valueDef("__builtin_bswap16", builtinFunctionValueItem( {-  unsigned short(unsigned short) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(shortType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bswap32", builtinFunctionValueItem( {-  unsigned int(unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bswap64", builtinFunctionValueItem( {-  unsigned long long(unsigned long long) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(nilQualifier(), unsignedType(longlongType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_constant_p on line 401
-- Ignored __builtin_classify_type on line 402
-- Ignored __builtin___CFStringMakeConstantString on line 403
-- Ignored __builtin___NSStringMakeConstantString on line 404
-- Ignored __builtin_va_start on line 405
d <- [valueDef("__builtin_va_end", builtinFunctionValueItem( {-  void(void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_va_copy", builtinFunctionValueItem( {-  void(void * , void * ) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_stdarg_start", builtinFunctionValueItem( {-  void(void * , ...) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType()))], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bcmp", builtinFunctionValueItem( {-  signed int(void * , void * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bcopy", builtinFunctionValueItem( {-  void(void * , void * , signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_bzero", builtinFunctionValueItem( {-  void(void * , signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_fprintf on line 412
d <- [valueDef("__builtin_memchr", builtinFunctionValueItem( {-  void * (const void * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_memcmp", builtinFunctionValueItem( {-  signed int(const void * , const void * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_memcpy", builtinFunctionValueItem( {-  void * (void * , const void * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_memmove", builtinFunctionValueItem( {-  void * (void * , const void * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_mempcpy", builtinFunctionValueItem( {-  void * (void * , const void * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_memset", builtinFunctionValueItem( {-  void * (void * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_printf", builtinFunctionValueItem( {-  signed int(const char * , ...) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_stpcpy", builtinFunctionValueItem( {-  char * (char * , const char * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_stpncpy", builtinFunctionValueItem( {-  char * (char * , const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strcasecmp", builtinFunctionValueItem( {-  signed int(const char * , const char * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strcat", builtinFunctionValueItem( {-  char * (char * , const char * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strchr", builtinFunctionValueItem( {-  char * (const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strcmp", builtinFunctionValueItem( {-  signed int(const char * , const char * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strcpy", builtinFunctionValueItem( {-  char * (char * , const char * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strcspn", builtinFunctionValueItem( {-  signed int(const char * , const char * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strdup", builtinFunctionValueItem( {-  char * (const char * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strlen", builtinFunctionValueItem( {-  signed int(const char * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strncasecmp", builtinFunctionValueItem( {-  signed int(const char * , const char * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strncat", builtinFunctionValueItem( {-  char * (char * , const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strncmp", builtinFunctionValueItem( {-  signed int(const char * , const char * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strncpy", builtinFunctionValueItem( {-  char * (char * , const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strndup", builtinFunctionValueItem( {-  char * (const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strpbrk", builtinFunctionValueItem( {-  char * (const char * , const char * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strrchr", builtinFunctionValueItem( {-  char * (const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strspn", builtinFunctionValueItem( {-  signed int(const char * , const char * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_strstr", builtinFunctionValueItem( {-  char * (const char * , const char * ) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], false), nilQualifier()),
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
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_vsprintf", builtinFunctionValueItem( {-  signed int(char * , const char * , void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), voidType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_vsnprintf", builtinFunctionValueItem( {-  signed int(char * , signed int, const char * , void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), voidType())], false), nilQualifier()),
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
-- Ignored __builtin_object_size on line 460
d <- [valueDef("__builtin___memcpy_chk", builtinFunctionValueItem( {-  void * (void * , const void * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___memccpy_chk", builtinFunctionValueItem( {-  void * (void * , const void * , signed int, signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___memmove_chk", builtinFunctionValueItem( {-  void * (void * , const void * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___mempcpy_chk", builtinFunctionValueItem( {-  void * (void * , const void * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___memset_chk", builtinFunctionValueItem( {-  void * (void * , signed int, signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___stpcpy_chk", builtinFunctionValueItem( {-  char * (char * , const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___strcat_chk", builtinFunctionValueItem( {-  char * (char * , const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___strcpy_chk", builtinFunctionValueItem( {-  char * (char * , const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___strlcat_chk", builtinFunctionValueItem( {-  signed int(char * , const char * , signed int, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___strlcpy_chk", builtinFunctionValueItem( {-  signed int(char * , const char * , signed int, signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___strncat_chk", builtinFunctionValueItem( {-  char * (char * , const char * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___strncpy_chk", builtinFunctionValueItem( {-  char * (char * , const char * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___stpncpy_chk", builtinFunctionValueItem( {-  char * (char * , const char * , signed int, signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___snprintf_chk", builtinFunctionValueItem( {-  signed int(char * , signed int, signed int, signed int, const char * , ...) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___sprintf_chk", builtinFunctionValueItem( {-  signed int(char * , signed int, signed int, const char * , ...) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___vsnprintf_chk", builtinFunctionValueItem( {-  signed int(char * , signed int, signed int, signed int, const char * , void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), voidType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin___vsprintf_chk", builtinFunctionValueItem( {-  signed int(char * , signed int, signed int, const char * , void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), builtinType(nilQualifier(), signedType(intType())), builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), voidType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin___fprintf_chk on line 478
d <- [valueDef("__builtin___printf_chk", builtinFunctionValueItem( {-  signed int(signed int, const char * , ...) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType())))], true), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin___vfprintf_chk on line 480
d <- [valueDef("__builtin___vprintf_chk", builtinFunctionValueItem( {-  signed int(signed int, const char * , void) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), voidType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_expect", builtinFunctionValueItem( {-  signed long(signed long, signed long) -}
    functionType(builtinType(nilQualifier(), signedType(longType())), protoFunctionType([builtinType(nilQualifier(), signedType(longType())), builtinType(nilQualifier(), signedType(longType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_prefetch", builtinFunctionValueItem( {-  void(const void * , ...) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType()))], true), nilQualifier()),
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
d <- [valueDef("__builtin_shufflevector", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_alloca", builtinFunctionValueItem( {-  void * (signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __sync_fetch_and_add on line 500
-- Ignored __sync_fetch_and_add_1 on line 501
-- Ignored __sync_fetch_and_add_2 on line 502
-- Ignored __sync_fetch_and_add_4 on line 503
-- Ignored __sync_fetch_and_add_8 on line 504
-- Ignored __sync_fetch_and_add_16 on line 505
-- Ignored __sync_fetch_and_sub on line 507
-- Ignored __sync_fetch_and_sub_1 on line 508
-- Ignored __sync_fetch_and_sub_2 on line 509
-- Ignored __sync_fetch_and_sub_4 on line 510
-- Ignored __sync_fetch_and_sub_8 on line 511
-- Ignored __sync_fetch_and_sub_16 on line 512
-- Ignored __sync_fetch_and_or on line 514
-- Ignored __sync_fetch_and_or_1 on line 515
-- Ignored __sync_fetch_and_or_2 on line 516
-- Ignored __sync_fetch_and_or_4 on line 517
-- Ignored __sync_fetch_and_or_8 on line 518
-- Ignored __sync_fetch_and_or_16 on line 519
-- Ignored __sync_fetch_and_and on line 521
-- Ignored __sync_fetch_and_and_1 on line 522
-- Ignored __sync_fetch_and_and_2 on line 523
-- Ignored __sync_fetch_and_and_4 on line 524
-- Ignored __sync_fetch_and_and_8 on line 525
-- Ignored __sync_fetch_and_and_16 on line 526
-- Ignored __sync_fetch_and_xor on line 528
-- Ignored __sync_fetch_and_xor_1 on line 529
-- Ignored __sync_fetch_and_xor_2 on line 530
-- Ignored __sync_fetch_and_xor_4 on line 531
-- Ignored __sync_fetch_and_xor_8 on line 532
-- Ignored __sync_fetch_and_xor_16 on line 533
-- Ignored __sync_add_and_fetch on line 536
-- Ignored __sync_add_and_fetch_1 on line 537
-- Ignored __sync_add_and_fetch_2 on line 538
-- Ignored __sync_add_and_fetch_4 on line 539
-- Ignored __sync_add_and_fetch_8 on line 540
-- Ignored __sync_add_and_fetch_16 on line 541
-- Ignored __sync_sub_and_fetch on line 543
-- Ignored __sync_sub_and_fetch_1 on line 544
-- Ignored __sync_sub_and_fetch_2 on line 545
-- Ignored __sync_sub_and_fetch_4 on line 546
-- Ignored __sync_sub_and_fetch_8 on line 547
-- Ignored __sync_sub_and_fetch_16 on line 548
-- Ignored __sync_or_and_fetch on line 550
-- Ignored __sync_or_and_fetch_1 on line 551
-- Ignored __sync_or_and_fetch_2 on line 552
-- Ignored __sync_or_and_fetch_4 on line 553
-- Ignored __sync_or_and_fetch_8 on line 554
-- Ignored __sync_or_and_fetch_16 on line 555
-- Ignored __sync_and_and_fetch on line 557
-- Ignored __sync_and_and_fetch_1 on line 558
-- Ignored __sync_and_and_fetch_2 on line 559
-- Ignored __sync_and_and_fetch_4 on line 560
-- Ignored __sync_and_and_fetch_8 on line 561
-- Ignored __sync_and_and_fetch_16 on line 562
-- Ignored __sync_xor_and_fetch on line 564
-- Ignored __sync_xor_and_fetch_1 on line 565
-- Ignored __sync_xor_and_fetch_2 on line 566
-- Ignored __sync_xor_and_fetch_4 on line 567
-- Ignored __sync_xor_and_fetch_8 on line 568
-- Ignored __sync_xor_and_fetch_16 on line 569
-- Ignored __sync_bool_compare_and_swap on line 571
-- Ignored __sync_bool_compare_and_swap_1 on line 572
-- Ignored __sync_bool_compare_and_swap_2 on line 573
-- Ignored __sync_bool_compare_and_swap_4 on line 574
-- Ignored __sync_bool_compare_and_swap_8 on line 575
-- Ignored __sync_bool_compare_and_swap_16 on line 576
-- Ignored __sync_val_compare_and_swap on line 578
-- Ignored __sync_val_compare_and_swap_1 on line 579
-- Ignored __sync_val_compare_and_swap_2 on line 580
-- Ignored __sync_val_compare_and_swap_4 on line 581
-- Ignored __sync_val_compare_and_swap_8 on line 582
-- Ignored __sync_val_compare_and_swap_16 on line 583
-- Ignored __sync_lock_test_and_set on line 585
-- Ignored __sync_lock_test_and_set_1 on line 586
-- Ignored __sync_lock_test_and_set_2 on line 587
-- Ignored __sync_lock_test_and_set_4 on line 588
-- Ignored __sync_lock_test_and_set_8 on line 589
-- Ignored __sync_lock_test_and_set_16 on line 590
-- Ignored __sync_lock_release on line 592
-- Ignored __sync_lock_release_1 on line 593
-- Ignored __sync_lock_release_2 on line 594
-- Ignored __sync_lock_release_4 on line 595
-- Ignored __sync_lock_release_8 on line 596
-- Ignored __sync_lock_release_16 on line 597
-- Ignored __sync_swap on line 599
-- Ignored __sync_swap_1 on line 600
-- Ignored __sync_swap_2 on line 601
-- Ignored __sync_swap_4 on line 602
-- Ignored __sync_swap_8 on line 603
-- Ignored __sync_swap_16 on line 604
-- Ignored __c11_atomic_init on line 613
-- Ignored __c11_atomic_load on line 614
-- Ignored __c11_atomic_store on line 615
-- Ignored __c11_atomic_exchange on line 616
-- Ignored __c11_atomic_compare_exchange_strong on line 617
-- Ignored __c11_atomic_compare_exchange_weak on line 618
-- Ignored __c11_atomic_fetch_add on line 619
-- Ignored __c11_atomic_fetch_sub on line 620
-- Ignored __c11_atomic_fetch_and on line 621
-- Ignored __c11_atomic_fetch_or on line 622
-- Ignored __c11_atomic_fetch_xor on line 623
d <- [valueDef("__c11_atomic_thread_fence", builtinFunctionValueItem( {-  void(signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__c11_atomic_signal_fence", builtinFunctionValueItem( {-  void(signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__c11_atomic_is_lock_free", builtinFunctionValueItem( {-  signed int(signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __atomic_load on line 629
-- Ignored __atomic_load_n on line 630
-- Ignored __atomic_store on line 631
-- Ignored __atomic_store_n on line 632
-- Ignored __atomic_exchange on line 633
-- Ignored __atomic_exchange_n on line 634
-- Ignored __atomic_compare_exchange on line 635
-- Ignored __atomic_compare_exchange_n on line 636
-- Ignored __atomic_fetch_add on line 637
-- Ignored __atomic_fetch_sub on line 638
-- Ignored __atomic_fetch_and on line 639
-- Ignored __atomic_fetch_or on line 640
-- Ignored __atomic_fetch_xor on line 641
-- Ignored __atomic_fetch_nand on line 642
-- Ignored __atomic_add_fetch on line 643
-- Ignored __atomic_sub_fetch on line 644
-- Ignored __atomic_and_fetch on line 645
-- Ignored __atomic_or_fetch on line 646
-- Ignored __atomic_xor_fetch on line 647
-- Ignored __atomic_nand_fetch on line 648
d <- [valueDef("__atomic_test_and_set", builtinFunctionValueItem( {-  _Bool(volatile void * , signed int) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__atomic_clear", builtinFunctionValueItem( {-  void(volatile void * , signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__atomic_thread_fence", builtinFunctionValueItem( {-  void(signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__atomic_signal_fence", builtinFunctionValueItem( {-  void(signed int) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__atomic_always_lock_free", builtinFunctionValueItem( {-  signed int(signed int, const volatile void * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), consQualifier(volatileQualifier(), nilQualifier())), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__atomic_is_lock_free", builtinFunctionValueItem( {-  signed int(signed int, const volatile void * ) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([builtinType(nilQualifier(), signedType(intType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), consQualifier(volatileQualifier(), nilQualifier())), voidType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__sync_synchronize", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__sync_fetch_and_min", builtinFunctionValueItem( {-  signed int(volatile signed int * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(), nilQualifier()), signedType(intType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__sync_fetch_and_max", builtinFunctionValueItem( {-  signed int(volatile signed int * , signed int) -}
    functionType(builtinType(nilQualifier(), signedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(), nilQualifier()), signedType(intType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__sync_fetch_and_umin", builtinFunctionValueItem( {-  unsigned int(volatile unsigned int * , unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(), nilQualifier()), unsignedType(intType()))), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__sync_fetch_and_umax", builtinFunctionValueItem( {-  unsigned int(volatile unsigned int * , unsigned int) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(volatileQualifier(), nilQualifier()), unsignedType(intType()))), builtinType(nilQualifier(), unsignedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_abort", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_index", builtinFunctionValueItem( {-  char * (const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_rindex", builtinFunctionValueItem( {-  char * (const char * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(charType()))), protoFunctionType([pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(charType()))), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__assume", builtinFunctionValueItem( {-  void(_Bool) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([builtinType(nilQualifier(), boolType())], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__noop", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], true), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__debugbreak", builtinFunctionValueItem( {-  void(void) -}
    functionType(builtinType(nilQualifier(), voidType()), protoFunctionType([], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_objc_memmove_collectable", builtinFunctionValueItem( {-  void * (void * , const void * , signed int) -}
    functionType(pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), protoFunctionType([pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())), pointerType(nilQualifier(), builtinType(consQualifier(constQualifier(), nilQualifier()), voidType())), builtinType(nilQualifier(), signedType(intType()))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_annotation on line 928
d <- [valueDef("__builtin_addcb", builtinFunctionValueItem( {-  unsigned char(const unsigned char, const unsigned char, const unsigned char, unsigned char * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(charType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(charType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(charType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_addcs", builtinFunctionValueItem( {-  unsigned short(const unsigned short, const unsigned short, const unsigned short, unsigned short * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(shortType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(shortType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(shortType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(shortType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_addc", builtinFunctionValueItem( {-  unsigned int(const unsigned int, const unsigned int, const unsigned int, unsigned int * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_addcl", builtinFunctionValueItem( {-  unsigned long(const unsigned long, const unsigned long, const unsigned long, unsigned long * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(longType())), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_addcll", builtinFunctionValueItem( {-  unsigned long long(const unsigned long long, const unsigned long long, const unsigned long long, unsigned long long * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_subcb", builtinFunctionValueItem( {-  unsigned char(const unsigned char, const unsigned char, const unsigned char, unsigned char * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(charType())), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(charType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(charType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(charType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(charType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_subcs", builtinFunctionValueItem( {-  unsigned short(const unsigned short, const unsigned short, const unsigned short, unsigned short * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(shortType())), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(shortType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(shortType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(shortType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(shortType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_subc", builtinFunctionValueItem( {-  unsigned int(const unsigned int, const unsigned int, const unsigned int, unsigned int * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(intType())), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_subcl", builtinFunctionValueItem( {-  unsigned long(const unsigned long, const unsigned long, const unsigned long, unsigned long * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(longType())), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_subcll", builtinFunctionValueItem( {-  unsigned long long(const unsigned long long, const unsigned long long, const unsigned long long, unsigned long long * ) -}
    functionType(builtinType(nilQualifier(), unsignedType(longlongType())), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_uadd_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned int, const unsigned int, unsigned int * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_uaddl_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned long, const unsigned long, unsigned long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_uaddll_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned long long, const unsigned long long, unsigned long long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_usub_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned int, const unsigned int, unsigned int * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_usubl_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned long, const unsigned long, unsigned long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_usubll_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned long long, const unsigned long long, unsigned long long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_umul_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned int, const unsigned int, unsigned int * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(intType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_umull_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned long, const unsigned long, unsigned long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_umulll_overflow", builtinFunctionValueItem( {-  _Bool(const unsigned long long, const unsigned long long, unsigned long long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longlongType())), builtinType(consQualifier(constQualifier(), nilQualifier()), unsignedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), unsignedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_sadd_overflow", builtinFunctionValueItem( {-  _Bool(const signed int, const signed int, signed int * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_saddl_overflow", builtinFunctionValueItem( {-  _Bool(const signed long, const signed long, signed long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longType())), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_saddll_overflow", builtinFunctionValueItem( {-  _Bool(const signed long long, const signed long long, signed long long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ssub_overflow", builtinFunctionValueItem( {-  _Bool(const signed int, const signed int, signed int * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ssubl_overflow", builtinFunctionValueItem( {-  _Bool(const signed long, const signed long, signed long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longType())), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_ssubll_overflow", builtinFunctionValueItem( {-  _Bool(const signed long long, const signed long long, signed long long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_smul_overflow", builtinFunctionValueItem( {-  _Bool(const signed int, const signed int, signed int * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(intType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(intType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_smull_overflow", builtinFunctionValueItem( {-  _Bool(const signed long, const signed long, signed long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longType())), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
d <- [valueDef("__builtin_smulll_overflow", builtinFunctionValueItem( {-  _Bool(const signed long long, const signed long long, signed long long * ) -}
    functionType(builtinType(nilQualifier(), boolType()), protoFunctionType([builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), builtinType(consQualifier(constQualifier(), nilQualifier()), signedType(longlongType())), pointerType(nilQualifier(), builtinType(nilQualifier(), signedType(longlongType())))], false), nilQualifier()),
    ordinaryFunctionHandler))];
-- Ignored __builtin_addressof on line 963
}
