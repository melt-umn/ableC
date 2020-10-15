# 1 "glob.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "glob.c"
# 23 "glob.c"
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 391 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 392 "/usr/include/features.h" 2 3 4
# 24 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 410 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 411 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 24 "glob.c" 2





typedef long unsigned int __size_t;

typedef long unsigned int size_t;
# 84 "glob.c"
typedef struct
  {
    __size_t gl_pathc;
    char **gl_pathv;
    __size_t gl_offs;
    int gl_flags;



    void (*gl_closedir) (void *);



    void *(*gl_readdir) (void *);

    void *(*gl_opendir) (__const char *);




    int (*gl_lstat) (__const char *__restrict, void *__restrict);
    int (*gl_stat) (__const char *__restrict, void *__restrict);

  } glob_t;
# 148 "glob.c"
extern int glob (__const char *__restrict __pattern, int __flags,
   int (*__errfunc) (__const char *, int),
   glob_t *__restrict __pglob) __attribute__ ((__nothrow__ , __leaf__));


extern void globfree (glob_t *__pglob) __attribute__ ((__nothrow__ , __leaf__));
# 181 "glob.c"

