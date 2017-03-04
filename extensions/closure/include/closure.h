#include <gc.h>

#ifndef __CLOSURE_H
#define __CLOSURE_H

struct __attribute__((refId("edu:umn:cs:melt:exts:ableC:closure:_closure_s"))) _closure_s {
  const char *fn_name; // For debugging
  void *env; // Pointer to generated struct containing env
  void *fn; // Always a function pointer with void *env as second param, but have to use a void pointer because param and return types can vary
};

#endif
