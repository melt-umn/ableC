# 1 "ieee754.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "ieee754.c"
# 22 "ieee754.c"
# 1 "/usr/include/features.h" 1 3 4
# 367 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 410 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 411 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 368 "/usr/include/features.h" 2 3 4
# 391 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 392 "/usr/include/features.h" 2 3 4
# 23 "ieee754.c" 2

# 1 "/usr/include/endian.h" 1 3 4
# 36 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h" 1 3 4
# 37 "/usr/include/endian.h" 2 3 4
# 25 "ieee754.c" 2



union ieee754_float
  {
    float f;


    struct
      {






 unsigned int mantissa:23;
 unsigned int exponent:8;
 unsigned int negative:1;

      } ieee;


    struct
      {







 unsigned int mantissa:22;
 unsigned int quiet_nan:1;
 unsigned int exponent:8;
 unsigned int negative:1;

      } ieee_nan;
  };




union ieee754_double
  {
    double d;


    struct
      {
# 90 "ieee754.c"
 unsigned int mantissa1:32;
 unsigned int mantissa0:20;
 unsigned int exponent:11;
 unsigned int negative:1;


      } ieee;


    struct
      {
# 117 "ieee754.c"
 unsigned int mantissa1:32;
 unsigned int mantissa0:19;
 unsigned int quiet_nan:1;
 unsigned int exponent:11;
 unsigned int negative:1;


      } ieee_nan;
  };




union ieee854_long_double
  {
    long double d;


    struct
      {
# 152 "ieee754.c"
 unsigned int mantissa1:32;
 unsigned int mantissa0:32;
 unsigned int exponent:15;
 unsigned int negative:1;
 unsigned int empty:16;


      } ieee;


    struct
      {
# 183 "ieee754.c"
 unsigned int mantissa1:32;
 unsigned int mantissa0:30;
 unsigned int quiet_nan:1;
 unsigned int one:1;
 unsigned int exponent:15;
 unsigned int negative:1;
 unsigned int empty:16;


      } ieee_nan;
  };




