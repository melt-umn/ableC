# 1 "shadow.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "shadow.c"
# 24 "shadow.c"
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
# 25 "shadow.c" 2

# 1 "/usr/include/paths.h" 1 3 4
# 27 "shadow.c" 2


# 1 "/usr/include/stdio.h" 1 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 30 "shadow.c" 2

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 212 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 32 "shadow.c" 2








struct spwd
  {
    char *sp_namp;
    char *sp_pwdp;
    long int sp_lstchg;
    long int sp_min;
    long int sp_max;
    long int sp_warn;

    long int sp_inact;

    long int sp_expire;

    unsigned long int sp_flag;
  };
# 63 "shadow.c"
extern void setspent (void);







extern void endspent (void);







extern struct spwd *getspent (void);







extern struct spwd *getspnam (__const char *__name);







extern struct spwd *sgetspent (__const char *__string);







extern struct spwd *fgetspent (FILE *__stream);







extern int putspent (__const struct spwd *__p, FILE *__stream);
# 142 "shadow.c"
extern int lckpwdf (void) __attribute__ ((__nothrow__ , __leaf__));


extern int ulckpwdf (void) __attribute__ ((__nothrow__ , __leaf__));


