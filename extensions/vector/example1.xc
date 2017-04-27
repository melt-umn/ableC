#include <vector.xh>

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  vector<int> a = vec<int> [1, 2, 3];
  printf("a: %s\n", show(a).text);
  vector<int> b = vec<int> [4, 5, 6];
  printf("b: %s\n", show(b).text);
  vector<int> c = a + b;
  printf("c: %s\n", show(c).text);
  printf("a: %s\n", show(a).text);
  a += b;
  printf("a: %s\n", show(a).text);
  b[1] += 7;
  b[3] = 6;
  printf("b: %s\n", show(b).text);
  vector<int> d = copy_vector(b);
  b[2] = 7;
  printf("b: %s\n", show(b).text);
  printf("d: %s\n", show(d).text);
  
  if (a != c)
    return 1;
  if (a == b)
    return 2;
  if (b[1] != 12)
    return 3;
  if (b[3] != 6)
    return 4;
  if (b.length != 4)
    return 5;
  if (b == d)
    return 6;

  return 0;
}
