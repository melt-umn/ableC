# 1 "wordexp.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "wordexp.c"
# 22 "wordexp.c"
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
# 23 "wordexp.c" 2

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 212 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 25 "wordexp.c" 2




enum
  {
    WRDE_DOOFFS = (1 << 0),
    WRDE_APPEND = (1 << 1),
    WRDE_NOCMD = (1 << 2),
    WRDE_REUSE = (1 << 3),
    WRDE_SHOWERR = (1 << 4),
    WRDE_UNDEF = (1 << 5),
    __WRDE_FLAGS = (WRDE_DOOFFS | WRDE_APPEND | WRDE_NOCMD |
      WRDE_REUSE | WRDE_SHOWERR | WRDE_UNDEF)
  };


typedef struct
  {
    size_t we_wordc;
    char **we_wordv;
    size_t we_offs;
  } wordexp_t;


enum
  {



    WRDE_NOSPACE = 1,
    WRDE_BADCHAR,
    WRDE_BADVAL,
    WRDE_CMDSUB,
    WRDE_SYNTAX
  };


extern int wordexp (__const char *__restrict __words,
      wordexp_t *__restrict __pwordexp, int __flags);


extern void wordfree (wordexp_t *__wordexp) __attribute__ ((__nothrow__ , __leaf__));


