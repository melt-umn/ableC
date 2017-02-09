#include <vector.xh>

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  vector<int> v = vec<int> [1, 2, 3];
  vector<int> v1 = copy_vector(v);
  printf("%d\n", v1[2]);

  vector<int> a = vec<int> [1, 2, 3];
  //printf("a: %s\n", show(a));
  vector<int> b = vec<int> [4, 5, 6];
  //printf("b: %s\n", show(b));
  //vector<int> c = a + b;
  //printf("c: %s\n", show(c));
  //a += b;
  //printf("a: %s\n", show(a));
  b[1] += 7;
  b[3] = 6;
  //printf("b: %s\n", show(b));
  //if (a != c)
  //  return 1;
  //if (a == b)
  //  return 2;
  if (b[1] != 12)
    return 3;
  if (b[3] != 6)
    return 4;
  if (b.length != 4)
    return 5;

  return 0;
}
