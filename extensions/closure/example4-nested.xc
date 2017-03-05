#include <closure.h>
#include <gc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int main (int argc, char **argv) {
  closure<((int) -> int) -> (int) -> int> repeat = 
    lambda {} (closure<(int) -> int> f) ->
                (lambda {f} (int x) -> (f(f(x))));

  closure<(int) -> int> inc = lambda {} (int x) -> (x + 1);

  closure<(int) -> int> addtwo = repeat(inc);
  
  int a = inc(1);
  int b = addtwo(1);

  printf("%d %d\n", a, b);
  if (a != 2)
    return 1;
  if (b != 3)
    return 2;
  else
    return 0;
}
