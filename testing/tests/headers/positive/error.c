# 1 "error.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "error.c"
# 23 "error.c"
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
# 24 "error.c" 2








extern void error (int __status, int __errnum, __const char *__format, ...)
     __attribute__ ((__format__ (__printf__, 3, 4)));

extern void error_at_line (int __status, int __errnum, __const char *__fname,
      unsigned int __lineno, __const char *__format, ...)
     __attribute__ ((__format__ (__printf__, 5, 6)));




extern void (*error_print_progname) (void);


extern unsigned int error_message_count;



extern int error_one_per_line;



# 1 "/usr/include/x86_64-linux-gnu/bits/error.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/error.h" 3 4
extern void __error_alias (int __status, int __errnum, const char *__format, ...) __asm__ ("" "error")


  __attribute__ ((__format__ (__printf__, 3, 4)));
extern void __error_noreturn (int __status, int __errnum, const char *__format, ...) __asm__ ("" "error")


  __attribute__ ((__noreturn__, __format__ (__printf__, 3, 4)));




extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) void
error (int __status, int __errnum, const char *__format, ...)
{
  if (__builtin_constant_p (__status) && __status != 0)
    __error_noreturn (__status, __errnum, __format, __builtin_va_arg_pack ());
  else
    __error_alias (__status, __errnum, __format, __builtin_va_arg_pack ());
}


extern void __error_at_line_alias (int __status, int __errnum, const char *__fname, unsigned int __line, const char *__format, ...) __asm__ ("" "error_at_line")




  __attribute__ ((__format__ (__printf__, 5, 6)));
extern void __error_at_line_noreturn (int __status, int __errnum, const char *__fname, unsigned int __line, const char *__format, ...) __asm__ ("" "error_at_line")





  __attribute__ ((__noreturn__, __format__ (__printf__, 5, 6)));




extern __inline __attribute__ ((__always_inline__)) __attribute__ ((__gnu_inline__)) void
error_at_line (int __status, int __errnum, const char *__fname,
        unsigned int __line, const char *__format, ...)
{
  if (__builtin_constant_p (__status) && __status != 0)
    __error_at_line_noreturn (__status, __errnum, __fname, __line, __format,
         __builtin_va_arg_pack ());
  else
    __error_at_line_alias (__status, __errnum, __fname, __line,
      __format, __builtin_va_arg_pack ());
}
# 54 "error.c" 2



