#include <vector.xh>

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  vector(int) a = new_vector(float) [1, 2, 3]; // TODO, fix this, no sub type checking
  printf("a: %s\n", tostring(a));
  vector(int) b = new_vector(int) [4, 5, 6];
  printf("b: %s\n", tostring(b));
  vector(int) c = a + b;
  printf("c: %s\n", tostring(c));
  a += b;
  printf("a: %s\n", tostring(a));
  b[1] += 7;
  b[3] = 6;
  printf("b: %s\n", tostring(b));
  if (a != c)
    return 1;
  if (a == b)
    return 2;
  if (b[1] != 12)
    return 3;
  if (b[3] != 6)
    return 4;

  return 0;
}
