# 1 "mntent.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "mntent.c"
# 23 "mntent.c"
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
# 24 "mntent.c" 2

# 1 "/usr/include/stdio.h" 1 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 26 "mntent.c" 2
# 1 "/usr/include/paths.h" 1 3 4
# 27 "mntent.c" 2
# 51 "mntent.c"



struct mntent
  {
    char *mnt_fsname;
    char *mnt_dir;
    char *mnt_type;
    char *mnt_opts;
    int mnt_freq;
    int mnt_passno;
  };




extern FILE *setmntent (__const char *__file, __const char *__mode) __attribute__ ((__nothrow__ , __leaf__));




extern struct mntent *getmntent (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
# 84 "mntent.c"
extern int addmntent (FILE *__restrict __stream,
        __const struct mntent *__restrict __mnt) __attribute__ ((__nothrow__ , __leaf__));


extern int endmntent (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));



extern char *hasmntopt (__const struct mntent *__mnt,
   __const char *__opt) __attribute__ ((__nothrow__ , __leaf__));



