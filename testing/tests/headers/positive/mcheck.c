# 1 "mcheck.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "mcheck.c"
# 22 "mcheck.c"
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
# 23 "mcheck.c" 2





enum mcheck_status
  {
    MCHECK_DISABLED = -1,
    MCHECK_OK,
    MCHECK_FREE,
    MCHECK_HEAD,
    MCHECK_TAIL
  };






extern int mcheck (void (*__abortfunc) (enum mcheck_status)) __attribute__ ((__nothrow__ , __leaf__));



extern int mcheck_pedantic (void (*__abortfunc) (enum mcheck_status)) __attribute__ ((__nothrow__ , __leaf__));


extern void mcheck_check_all (void);




extern enum mcheck_status mprobe (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));


extern void mtrace (void) __attribute__ ((__nothrow__ , __leaf__));
extern void muntrace (void) __attribute__ ((__nothrow__ , __leaf__));


