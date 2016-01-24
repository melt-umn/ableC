#include <gc.h>

#ifndef __CLOSURE_H
#define __CLOSURE_H

struct __attribute__((refId("edu:umn:cs:melt:exts:ableC:closure:_closure_s"))) _closure_s {
  char *fn_name; // For debugging
  void **env;
  void *fn; // Always a function pointer with void *env as second param, but have to use a void pointer because param/return type can differ
};

typedef struct _closure_s *_closure;

#endif
