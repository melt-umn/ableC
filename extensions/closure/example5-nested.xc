#include <closure.h>
#include <gc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int main (int argc, char **argv) {
  closure(closure(int, int), closure(int, int)) repeat = 
    lambda {} (closure(int, int) f) .
                (lambda {f} (int x) . (appclosure (f) to (appclosure (f) to (x))));

  closure(int, int) inc = lambda {} (int x) . (x + 1);

  closure(int, int) addtwo = appclosure (repeat) to (inc);
  
  int a = appclosure (inc) to (1);
  int b = appclosure (addtwo) to (1);

  printf("%d %d\n", a, b);
  return 0;
}
