#include <stdio.h>

int main (int argc, char **argv) {
  int a = prefix(+ 1 - 2 * 3 / 4 5);
  int b = prefix(+ - * / 6 5 4 3 2);
  int c = prefix(* a + b 1);
  
  printf("%d\n", a);
  printf("%d\n", b);
  printf("%d\n", c);
  return 0; 
}
