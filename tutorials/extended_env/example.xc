#include <stdio.h>

int foo = 24;
intconst foo = 42;
//intconst foo = 43;

int main (int argc, char **argv) {
  printf("foo: %d\n", foo);
  printf("intconst foo: %d\n", intconst foo);
  return 0; 
}
