# 1 "ttyent.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "ttyent.c"
# 35 "ttyent.c"
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
# 36 "ttyent.c" 2
# 44 "ttyent.c"
struct ttyent {
 char *ty_name;
 char *ty_getty;
 char *ty_type;


 int ty_status;
 char *ty_window;
 char *ty_comment;
};




extern struct ttyent *getttyent (void) __attribute__ ((__nothrow__ , __leaf__));
extern struct ttyent *getttynam (__const char *__tty) __attribute__ ((__nothrow__ , __leaf__));
extern int setttyent (void) __attribute__ ((__nothrow__ , __leaf__));
extern int endttyent (void) __attribute__ ((__nothrow__ , __leaf__));


