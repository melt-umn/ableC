# 1 "err.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "err.c"
# 23 "err.c"
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
# 24 "err.c" 2


# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stdarg.h" 1 3 4
# 40 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 27 "err.c" 2








extern void warn (__const char *__format, ...)
     __attribute__ ((__format__ (__printf__, 1, 2)));
extern void vwarn (__const char *__format, __gnuc_va_list)
     __attribute__ ((__format__ (__printf__, 1, 0)));


extern void warnx (__const char *__format, ...)
     __attribute__ ((__format__ (__printf__, 1, 2)));
extern void vwarnx (__const char *__format, __gnuc_va_list)
     __attribute__ ((__format__ (__printf__, 1, 0)));


extern void err (int __status, __const char *__format, ...)
     __attribute__ ((__noreturn__, __format__ (__printf__, 2, 3)));
extern void verr (int __status, __const char *__format, __gnuc_va_list)
     __attribute__ ((__noreturn__, __format__ (__printf__, 2, 0)));
extern void errx (int __status, __const char *__format, ...)
     __attribute__ ((__noreturn__, __format__ (__printf__, 2, 3)));
extern void verrx (int __status, __const char *, __gnuc_va_list)
     __attribute__ ((__noreturn__, __format__ (__printf__, 2, 0)));


