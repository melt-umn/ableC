# 1 "fmtmsg.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "fmtmsg.c"
# 23 "fmtmsg.c"
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
# 24 "fmtmsg.c" 2





enum
{
  MM_HARD = 0x001,

  MM_SOFT = 0x002,

  MM_FIRM = 0x004,

  MM_APPL = 0x008,

  MM_UTIL = 0x010,

  MM_OPSYS = 0x020,

  MM_RECOVER = 0x040,

  MM_NRECOV = 0x080,

  MM_PRINT = 0x100,

  MM_CONSOLE = 0x200

};


enum
{
  MM_NOSEV = 0,

  MM_HALT,

  MM_ERROR,

  MM_WARNING,


  MM_INFO

};
# 80 "fmtmsg.c"
enum
{
  MM_NOTOK = -1,

  MM_OK = 0,

  MM_NOMSG = 1,

  MM_NOCON = 4

};




extern int fmtmsg (long int __classification, __const char *__label,
     int __severity, __const char *__text,
     __const char *__action, __const char *__tag);







