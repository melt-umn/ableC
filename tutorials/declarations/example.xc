#include <stdio.h>

tuple foo {int, float, char*}

int main() {
  foo a = {1, 2.3, "hello"};
  printf("%d\n%f\n%s\n", a.f0, a.f1, a.f2);
}
