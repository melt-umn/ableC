#include <stdio.h>

void foo() {
  globalint x = 1;
  x += 2;
}

int main() {
  foo();
  printf("%d\n", globalint x);
}
