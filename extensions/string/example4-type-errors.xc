#include <string.xh>

#include <stdio.h>
#include <stdlib.h>

typedef struct {int a;} t;

int main(int argc, char **argv) {
  string a = str((t){4});
  string b = 4 * "q";

  b.substring("a");

  char *c = a.text;
  char *d = a;

  a[2] = 'a';
  a.length = 4;
  a.text = "qwerty";

  return 0;
}
