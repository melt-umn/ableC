/* Copyright (C) 2000  Free Software Foundation.

   by Alexandre Oliva  <oliva@lsd.ic.unicamp.br>  */

/* { dg-do compile } */

extern void do_something(); // AbleC change: function prototype

__inline int
foo (int **q) {
  return *q && **q;
}

void
bar () {
  int **p;
  if (foo (p))
    do_something ();
}
