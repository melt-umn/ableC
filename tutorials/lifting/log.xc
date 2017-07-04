#include <stdio.h>

#define GET_LOG(fn) globalint fn ## _calls
#define LOG(fn) GET_LOG(fn) ++;

void foo() {
  LOG(foo);
}

void bar() {
  LOG(bar);
  foo();
  foo();
}

int main() {
  foo();
  bar();
  printf("Calls to foo: %d\n", GET_LOG(foo));
  printf("Calls to bar: %d\n", GET_LOG(bar));
}
