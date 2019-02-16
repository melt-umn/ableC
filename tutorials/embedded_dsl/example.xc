#include <stdio.h>

int main (int argc, char **argv) {
  int a = prefix(+ 1 2);
  printf("%d\n", a);
  int b = prefix(+ 1 * 3 4);
  printf("%d\n", b);

  /* 
  // Extend this extension to support subtraction and division,
  // as seen below.

  int c = prefix(- + 4 2 3);
  printf("%d\n", c);
  int d = prefix(+ 1 / 8 2);
  printf("%d\n", d);
  */

  return 0; 
}
