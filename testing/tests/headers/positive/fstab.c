# 1 "fstab.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "fstab.c"
# 35 "fstab.c"
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
# 36 "fstab.c" 2
# 57 "fstab.c"
struct fstab
  {
    char *fs_spec;
    char *fs_file;
    char *fs_vfstype;
    char *fs_mntops;
    const char *fs_type;
    int fs_freq;
    int fs_passno;
  };




extern struct fstab *getfsent (void) __attribute__ ((__nothrow__ , __leaf__));
extern struct fstab *getfsspec (__const char *__name) __attribute__ ((__nothrow__ , __leaf__));
extern struct fstab *getfsfile (__const char *__name) __attribute__ ((__nothrow__ , __leaf__));
extern int setfsent (void) __attribute__ ((__nothrow__ , __leaf__));
extern void endfsent (void) __attribute__ ((__nothrow__ , __leaf__));


