#include <stdio.h>

struct foo {
  int x;
};

int main() {
  struct foo f = (struct foo){};
  printf("%d\n", f.x);
}
