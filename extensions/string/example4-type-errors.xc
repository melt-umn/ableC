#include <string.xh>

#include <stdio.h>
#include <stdlib.h>

typedef struct {int a;} t;

int main(int argc, char **argv) {
  string a = str((t){4});
  string b = 4 * "q";

  return 0;
}
