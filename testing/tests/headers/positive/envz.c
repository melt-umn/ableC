# 1 "envz.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "envz.c"
# 23 "envz.c"
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
# 24 "envz.c" 2

# 1 "/usr/include/errno.h" 1 3 4
# 31 "/usr/include/errno.h" 3 4




# 1 "/usr/include/x86_64-linux-gnu/bits/errno.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/errno.h" 3 4
# 1 "/usr/include/linux/errno.h" 1 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/errno.h" 1 3 4
# 1 "/usr/include/asm-generic/errno.h" 1 3 4



# 1 "/usr/include/asm-generic/errno-base.h" 1 3 4
# 5 "/usr/include/asm-generic/errno.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/asm/errno.h" 2 3 4
# 1 "/usr/include/linux/errno.h" 2 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/errno.h" 2 3 4
# 50 "/usr/include/x86_64-linux-gnu/bits/errno.h" 3 4
extern int *__errno_location (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 36 "/usr/include/errno.h" 2 3 4
# 58 "/usr/include/errno.h" 3 4

# 26 "envz.c" 2



# 1 "/usr/include/argz.h" 1 3 4
# 25 "/usr/include/argz.h" 3 4
# 1 "/usr/include/errno.h" 1 3 4
# 68 "/usr/include/errno.h" 3 4
typedef int error_t;
# 26 "/usr/include/argz.h" 2 3 4
# 1 "/usr/include/string.h" 1 3 4
# 27 "/usr/include/string.h" 3 4





# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 212 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 33 "/usr/include/string.h" 2 3 4









extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

# 60 "/usr/include/string.h" 3 4


extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 92 "/usr/include/string.h" 3 4
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 123 "/usr/include/string.h" 3 4


extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));






# 1 "/usr/include/xlocale.h" 1 3 4
# 27 "/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 160 "/usr/include/string.h" 2 3 4


extern int strcoll_l (const char *__s1, const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));




extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 206 "/usr/include/string.h" 3 4

# 231 "/usr/include/string.h" 3 4
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 258 "/usr/include/string.h" 3 4
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 277 "/usr/include/string.h" 3 4



extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 310 "/usr/include/string.h" 3 4
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 337 "/usr/include/string.h" 3 4
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
# 392 "/usr/include/string.h" 3 4


extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));

# 422 "/usr/include/string.h" 3 4
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__ , __leaf__))

                        __attribute__ ((__nonnull__ (2)));
# 440 "/usr/include/string.h" 3 4
extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));





extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 559 "/usr/include/string.h" 3 4
extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));


extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
# 658 "/usr/include/string.h" 3 4

# 27 "/usr/include/argz.h" 2 3 4











extern error_t __argz_create (char *const __argv[], char **__restrict __argz,
         size_t *__restrict __len) __attribute__ ((__nothrow__ , __leaf__));
extern error_t argz_create (char *const __argv[], char **__restrict __argz,
       size_t *__restrict __len) __attribute__ ((__nothrow__ , __leaf__));





extern error_t __argz_create_sep (const char *__restrict __string,
      int __sep, char **__restrict __argz,
      size_t *__restrict __len) __attribute__ ((__nothrow__ , __leaf__));
extern error_t argz_create_sep (const char *__restrict __string,
    int __sep, char **__restrict __argz,
    size_t *__restrict __len) __attribute__ ((__nothrow__ , __leaf__));


extern size_t __argz_count (const char *__argz, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__));
extern size_t argz_count (const char *__argz, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__));



extern void __argz_extract (const char *__restrict __argz, size_t __len,
       char **__restrict __argv) __attribute__ ((__nothrow__ , __leaf__));
extern void argz_extract (const char *__restrict __argz, size_t __len,
     char **__restrict __argv) __attribute__ ((__nothrow__ , __leaf__));



extern void __argz_stringify (char *__argz, size_t __len, int __sep) __attribute__ ((__nothrow__ , __leaf__));
extern void argz_stringify (char *__argz, size_t __len, int __sep) __attribute__ ((__nothrow__ , __leaf__));


extern error_t __argz_append (char **__restrict __argz,
         size_t *__restrict __argz_len,
         const char *__restrict __buf, size_t __buf_len)
     __attribute__ ((__nothrow__ , __leaf__));
extern error_t argz_append (char **__restrict __argz,
       size_t *__restrict __argz_len,
       const char *__restrict __buf, size_t __buf_len)
     __attribute__ ((__nothrow__ , __leaf__));


extern error_t __argz_add (char **__restrict __argz,
      size_t *__restrict __argz_len,
      const char *__restrict __str) __attribute__ ((__nothrow__ , __leaf__));
extern error_t argz_add (char **__restrict __argz,
    size_t *__restrict __argz_len,
    const char *__restrict __str) __attribute__ ((__nothrow__ , __leaf__));



extern error_t __argz_add_sep (char **__restrict __argz,
          size_t *__restrict __argz_len,
          const char *__restrict __string, int __delim)
     __attribute__ ((__nothrow__ , __leaf__));
extern error_t argz_add_sep (char **__restrict __argz,
        size_t *__restrict __argz_len,
        const char *__restrict __string, int __delim)
     __attribute__ ((__nothrow__ , __leaf__));


extern void __argz_delete (char **__restrict __argz,
      size_t *__restrict __argz_len,
      char *__restrict __entry) __attribute__ ((__nothrow__ , __leaf__));
extern void argz_delete (char **__restrict __argz,
    size_t *__restrict __argz_len,
    char *__restrict __entry) __attribute__ ((__nothrow__ , __leaf__));







extern error_t __argz_insert (char **__restrict __argz,
         size_t *__restrict __argz_len,
         char *__restrict __before,
         const char *__restrict __entry) __attribute__ ((__nothrow__ , __leaf__));
extern error_t argz_insert (char **__restrict __argz,
       size_t *__restrict __argz_len,
       char *__restrict __before,
       const char *__restrict __entry) __attribute__ ((__nothrow__ , __leaf__));




extern error_t __argz_replace (char **__restrict __argz,
          size_t *__restrict __argz_len,
          const char *__restrict __str,
          const char *__restrict __with,
          unsigned int *__restrict __replace_count);
extern error_t argz_replace (char **__restrict __argz,
        size_t *__restrict __argz_len,
        const char *__restrict __str,
        const char *__restrict __with,
        unsigned int *__restrict __replace_count);
# 152 "/usr/include/argz.h" 3 4
extern char *__argz_next (const char *__restrict __argz, size_t __argz_len,
     const char *__restrict __entry) __attribute__ ((__nothrow__ , __leaf__));
extern char *argz_next (const char *__restrict __argz, size_t __argz_len,
   const char *__restrict __entry) __attribute__ ((__nothrow__ , __leaf__));
# 180 "/usr/include/argz.h" 3 4

# 30 "envz.c" 2




extern char *envz_entry (__const char *__restrict __envz, size_t __envz_len,
    __const char *__restrict __name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__));



extern char *envz_get (__const char *__restrict __envz, size_t __envz_len,
         __const char *__restrict __name)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__));







extern error_t envz_add (char **__restrict __envz,
    size_t *__restrict __envz_len,
    __const char *__restrict __name,
    __const char *__restrict __value) __attribute__ ((__nothrow__ , __leaf__));




extern error_t envz_merge (char **__restrict __envz,
      size_t *__restrict __envz_len,
      __const char *__restrict __envz2,
      size_t __envz2_len, int __override) __attribute__ ((__nothrow__ , __leaf__));


extern void envz_remove (char **__restrict __envz,
    size_t *__restrict __envz_len,
    __const char *__restrict __name) __attribute__ ((__nothrow__ , __leaf__));


extern void envz_strip (char **__restrict __envz,
   size_t *__restrict __envz_len) __attribute__ ((__nothrow__ , __leaf__));


