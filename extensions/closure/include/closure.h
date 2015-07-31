#include <gc.h>

#ifndef __CLOSURE_H
#define __CLOSURE_H

typedef struct _closure_s _closure_s;
typedef _closure_s *_closure;

struct _closure_s {
  char *fn_name; // For debugging
  void **env;
  void *fn; // Always a function pointer with void *env as second param, but have to use a void pointer because param/return type can differ
};

#endif
