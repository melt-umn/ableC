# 1 "stropts.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "stropts.c"
# 22 "stropts.c"
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
# 23 "stropts.c" 2
# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 121 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 122 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 24 "stropts.c" 2
# 1 "/usr/include/x86_64-linux-gnu/bits/xtitypes.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/xtitypes.h" 3 4
typedef int __t_scalar_t;
typedef unsigned int __t_uscalar_t;
# 25 "stropts.c" 2


typedef __gid_t gid_t;




typedef __uid_t uid_t;



typedef __t_uscalar_t t_uscalar_t;


# 1 "/usr/include/x86_64-linux-gnu/bits/stropts.h" 1 3 4
# 173 "/usr/include/x86_64-linux-gnu/bits/stropts.h" 3 4
struct bandinfo
  {
    unsigned char bi_pri;
    int bi_flag;
  };

struct strbuf
  {
    int maxlen;
    int len;
    char *buf;
  };

struct strpeek
  {
    struct strbuf ctlbuf;
    struct strbuf databuf;
    t_uscalar_t flags;
  };

struct strfdinsert
  {
    struct strbuf ctlbuf;
    struct strbuf databuf;
    t_uscalar_t flags;
    int fildes;
    int offset;
  };

struct strioctl
  {
    int ic_cmd;
    int ic_timout;
    int ic_len;
    char *ic_dp;
  };

struct strrecvfd
  {
    int fd;
    uid_t uid;
    gid_t gid;
    char __fill[8];
  };


struct str_mlist
  {
    char l_name[8 + 1];
  };

struct str_list
  {
    int sl_nmods;
    struct str_mlist *sl_modlist;
  };
# 40 "stropts.c" 2





extern int isastream (int __fildes) __attribute__ ((__nothrow__ , __leaf__));





extern int getmsg (int __fildes, struct strbuf *__restrict __ctlptr,
     struct strbuf *__restrict __dataptr,
     int *__restrict __flagsp);






extern int getpmsg (int __fildes, struct strbuf *__restrict __ctlptr,
      struct strbuf *__restrict __dataptr,
      int *__restrict __bandp, int *__restrict __flagsp);




extern int ioctl (int __fd, unsigned long int __request, ...) __attribute__ ((__nothrow__ , __leaf__));





extern int putmsg (int __fildes, __const struct strbuf *__ctlptr,
     __const struct strbuf *__dataptr, int __flags);





extern int putpmsg (int __fildes, __const struct strbuf *__ctlptr,
      __const struct strbuf *__dataptr, int __band, int __flags);



extern int fattach (int __fildes, __const char *__path) __attribute__ ((__nothrow__ , __leaf__));


extern int fdetach (__const char *__path) __attribute__ ((__nothrow__ , __leaf__));


