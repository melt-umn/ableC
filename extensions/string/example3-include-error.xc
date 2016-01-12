#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  string a = "abc";
  printf("a: %s\n", a);

  if (d != "abc")
    return 1;

  string b = "def";
  printf("b: %s\n", b);
  string c = "ghi";
  printf("c: %s\n", c);
  string d = a + b;
  printf("d: %s\n", d);

  if (d != "abcdef")
    return 2;

  d += c;
  printf("d: %s\n", d);

  if (d != "abcdefghi")
    return 3;

  return 0;
}
