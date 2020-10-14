# 1 "gettext-po.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "gettext-po.c"
# 21 "gettext-po.c"
# 1 "/usr/include/stdlib.h" 1 3 4
# 24 "/usr/include/stdlib.h" 3 4
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
# 25 "/usr/include/stdlib.h" 2 3 4







# 1 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 1 3 4
# 212 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 324 "/soft/gcc/4.9.2/ubuntuamd2010/lib/gcc/x86_64-linux-gnu/4.9.2/include/stddef.h" 3 4
typedef int wchar_t;
# 33 "/usr/include/stdlib.h" 2 3 4








# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 1 3 4
# 50 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 3 4
typedef enum
{
  P_ALL,
  P_PID,
  P_PGID
} idtype_t;
# 42 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 1 3 4
# 43 "/usr/include/stdlib.h" 2 3 4
# 95 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 139 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) ;




extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 206 "/usr/include/stdlib.h" 3 4


__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 372 "/usr/include/stdlib.h" 3 4


extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));




extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));
# 464 "/usr/include/stdlib.h" 3 4


extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));

# 503 "/usr/include/stdlib.h" 3 4
extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;




extern void *aligned_alloc (size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__alloc_size__ (2))) ;




extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







extern int at_quick_exit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



# 539 "/usr/include/stdlib.h" 3 4




extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));





extern void quick_exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));







extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));






extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

# 584 "/usr/include/stdlib.h" 3 4
extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 619 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 662 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 711 "/usr/include/stdlib.h" 3 4





extern int system (const char *__command) ;

# 741 "/usr/include/stdlib.h" 3 4
typedef int (*__compar_fn_t) (const void *, const void *);
# 751 "/usr/include/stdlib.h" 3 4



extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;







extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 774 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;

# 859 "/usr/include/stdlib.h" 3 4



extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));

# 898 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3))) ;
# 954 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 955 "/usr/include/stdlib.h" 2 3 4
# 967 "/usr/include/stdlib.h" 3 4

# 22 "gettext-po.c" 2
# 32 "gettext-po.c"
extern int libgettextpo_version;




typedef struct po_file *po_file_t;



typedef struct po_message_iterator *po_message_iterator_t;


typedef struct po_message *po_message_t;


typedef struct po_filepos *po_filepos_t;


struct po_error_handler
{




  void (*error) (int status, int errnum,
                 const char *format, ...)

  __attribute__ ((__format__ (__printf__, 3, 4)))

  ;






  void (*error_at_line) (int status, int errnum,
                         const char *filename, unsigned int lineno,
                         const char *format, ...)

  __attribute__ ((__format__ (__printf__, 5, 6)))

  ;



  void (*multiline_warning) (char *prefix, char *message);





  void (*multiline_error) (char *prefix, char *message);
};
typedef const struct po_error_handler *po_error_handler_t;





struct po_xerror_handler
{
# 103 "gettext-po.c"
  void (*xerror) (int severity,
                  po_message_t message,
                  const char *filename, size_t lineno, size_t column,
                  int multiline_p, const char *message_text);




  void (*xerror2) (int severity,
                   po_message_t message1,
                   const char *filename1, size_t lineno1, size_t column1,
                   int multiline_p1, const char *message_text1,
                   po_message_t message2,
                   const char *filename2, size_t lineno2, size_t column2,
                   int multiline_p2, const char *message_text2);
};
typedef const struct po_xerror_handler *po_xerror_handler_t;
# 131 "gettext-po.c"
extern po_file_t po_file_create (void);




extern po_file_t po_file_read_v3 (const char *filename,
                               po_xerror_handler_t handler);




extern po_file_t po_file_write_v2 (po_file_t file, const char *filename,
                                po_xerror_handler_t handler);


extern void po_file_free (po_file_t file);


extern const char * const * po_file_domains (po_file_t file);







extern const char * po_file_domain_header (po_file_t file, const char *domain);




extern char * po_header_field (const char *header, const char *field);




extern char * po_header_set_field (const char *header, const char *field, const char *value);






extern po_message_iterator_t po_message_iterator (po_file_t file, const char *domain);


extern void po_message_iterator_free (po_message_iterator_t iterator);



extern po_message_t po_next_message (po_message_iterator_t iterator);




extern void po_message_insert (po_message_iterator_t iterator, po_message_t message);






extern po_message_t po_message_create (void);



extern const char * po_message_msgctxt (po_message_t message);



extern void po_message_set_msgctxt (po_message_t message, const char *msgctxt);


extern const char * po_message_msgid (po_message_t message);


extern void po_message_set_msgid (po_message_t message, const char *msgid);



extern const char * po_message_msgid_plural (po_message_t message);



extern void po_message_set_msgid_plural (po_message_t message, const char *msgid_plural);



extern const char * po_message_msgstr (po_message_t message);



extern void po_message_set_msgstr (po_message_t message, const char *msgstr);



extern const char * po_message_msgstr_plural (po_message_t message, int index);



extern void po_message_set_msgstr_plural (po_message_t message, int index, const char *msgstr);


extern const char * po_message_comments (po_message_t message);



extern void po_message_set_comments (po_message_t message, const char *comments);


extern const char * po_message_extracted_comments (po_message_t message);



extern void po_message_set_extracted_comments (po_message_t message, const char *comments);



extern po_filepos_t po_message_filepos (po_message_t message, int i);




extern void po_message_remove_filepos (po_message_t message, int i);






extern void po_message_add_filepos (po_message_t message, const char *file, size_t start_line);


extern const char * po_message_prev_msgctxt (po_message_t message);


extern void po_message_set_prev_msgctxt (po_message_t message, const char *prev_msgctxt);



extern const char * po_message_prev_msgid (po_message_t message);



extern void po_message_set_prev_msgid (po_message_t message, const char *prev_msgid);



extern const char * po_message_prev_msgid_plural (po_message_t message);



extern void po_message_set_prev_msgid_plural (po_message_t message, const char *prev_msgid_plural);


extern int po_message_is_obsolete (po_message_t message);


extern void po_message_set_obsolete (po_message_t message, int obsolete);


extern int po_message_is_fuzzy (po_message_t message);


extern void po_message_set_fuzzy (po_message_t message, int fuzzy);



extern int po_message_is_format (po_message_t message, const char *format_type);


extern void po_message_set_format (po_message_t message, const char *format_type, int value);



extern int po_message_is_range (po_message_t message, int *minp, int *maxp);




extern void po_message_set_range (po_message_t message, int min, int max);





extern const char * po_filepos_file (po_filepos_t filepos);



extern size_t po_filepos_start_line (po_filepos_t filepos);





extern const char * const * po_format_list (void);




extern const char * po_format_pretty_name (const char *format_type);






extern void po_file_check_all (po_file_t file, po_xerror_handler_t handler);




extern void po_message_check_all (po_message_t message, po_message_iterator_t iterator, po_xerror_handler_t handler);





extern void po_message_check_format_v2 (po_message_t message, po_xerror_handler_t handler);
