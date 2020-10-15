# 1 "gshadow.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "gshadow.c"
# 24 "gshadow.c"
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
# 25 "gshadow.c" 2

# 1 "/usr/include/paths.h" 1 3 4
# 27 "gshadow.c" 2


# 1 "/usr/include/stdio.h" 1 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 30 "gshadow.c" 2

# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 212 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 32 "gshadow.c" 2








struct sgrp
  {
    char *sg_namp;
    char *sg_passwd;
    char **sg_adm;
    char **sg_mem;
  };
# 55 "gshadow.c"
extern void setsgent (void);







extern void endsgent (void);







extern struct sgrp *getsgent (void);







extern struct sgrp *getsgnam (__const char *__name);







extern struct sgrp *sgetsgent (__const char *__string);







extern struct sgrp *fgetsgent (FILE *__stream);







extern int putsgent (__const struct sgrp *__g, FILE *__stream);
# 129 "gshadow.c"

