#include <closure.h>
#include <gc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int main (int argc, char **argv) {
  int data[2] = {0, 1};
  
  closure(() -> int) fib =
    lambda () . (({int temp = data[1]; data[1] += data[0]; data[0] = temp;}));
  
  printf("%d\n", fib());
  printf("%d\n", fib());
  printf("%d\n", fib());
  printf("%d\n", fib());
  printf("%d\n", fib());
  printf("%d\n", fib());
  printf("%d\n", fib());
  printf("%d\n", fib());
}
