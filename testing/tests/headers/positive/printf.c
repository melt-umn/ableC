# 1 "printf.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "printf.c"
# 23 "printf.c"
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
# 24 "printf.c" 2




# 1 "/usr/include/stdio.h" 1 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 29 "printf.c" 2


# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 212 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 324 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef int wchar_t;
# 32 "printf.c" 2
# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stdarg.h" 1 3 4
# 40 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 98 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stdarg.h" 3 4
typedef __gnuc_va_list va_list;
# 33 "printf.c" 2


struct printf_info
{
  int prec;
  int width;
  wchar_t spec;
  unsigned int is_long_double:1;
  unsigned int is_short:1;
  unsigned int is_long:1;
  unsigned int alt:1;
  unsigned int space:1;
  unsigned int left:1;
  unsigned int showsign:1;
  unsigned int group:1;
  unsigned int extra:1;
  unsigned int is_char:1;
  unsigned int wide:1;
  unsigned int i18n:1;
  unsigned int __pad:4;
  unsigned short int user;
  wchar_t pad;
};
# 68 "printf.c"
typedef int printf_function (FILE *__stream,
        __const struct printf_info *__info,
        __const void *__const *__args);
# 80 "printf.c"
typedef int printf_arginfo_size_function (__const struct printf_info *__info,
       size_t __n, int *__argtypes,
       int *__size);



typedef int printf_arginfo_function (__const struct printf_info *__info,
         size_t __n, int *__argtypes);



typedef void printf_va_arg_function (void *__mem, va_list *__ap);






extern int register_printf_specifier (int __spec, printf_function __func,
          printf_arginfo_size_function __arginfo)
  __attribute__ ((__nothrow__ , __leaf__));






extern int register_printf_function (int __spec, printf_function __func,
         printf_arginfo_function __arginfo)
  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__deprecated__));






extern int register_printf_modifier (__const wchar_t *__str) __attribute__ ((__nothrow__ , __leaf__));





extern int register_printf_type (printf_va_arg_function __fct) __attribute__ ((__nothrow__ , __leaf__));
# 136 "printf.c"
extern size_t parse_printf_format (__const char *__restrict __fmt, size_t __n,
       int *__restrict __argtypes) __attribute__ ((__nothrow__ , __leaf__));
# 146 "printf.c"
enum
{
  PA_INT,
  PA_CHAR,
  PA_WCHAR,
  PA_STRING,
  PA_WSTRING,
  PA_POINTER,
  PA_FLOAT,
  PA_DOUBLE,
  PA_LAST
};
# 175 "printf.c"
extern int printf_size (FILE *__restrict __fp,
   __const struct printf_info *__info,
   __const void *__const *__restrict __args) __attribute__ ((__nothrow__ , __leaf__));


extern int printf_size_info (__const struct printf_info *__restrict
        __info, size_t __n, int *__restrict __argtypes)
     __attribute__ ((__nothrow__ , __leaf__));






