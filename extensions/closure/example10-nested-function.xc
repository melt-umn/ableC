#include <gc.h>
#include <stdio.h>

int main() {
  int total = 0;
  void inc(int val) {
    total += val;
  }
  
  int *total_addr = &total;

  closure<(int) -> int> fn = lambda (int x) -> (({inc(x); *total_addr;}));
  printf("%d\n", fn(1));
  printf("%d\n", fn(2));
  printf("%d\n", fn(3));
  printf("%d\n", fn(4));
  return total != 10;
}
