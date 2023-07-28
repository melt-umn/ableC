# 1 "ar.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "ar.c"
# 23 "ar.c"
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
# 24 "ar.c" 2
# 34 "ar.c"


struct ar_hdr
  {
    char ar_name[16];
    char ar_date[12];
    char ar_uid[6], ar_gid[6];
    char ar_mode[8];
    char ar_size[10];
    char ar_fmag[2];
  };


