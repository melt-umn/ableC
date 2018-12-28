#include <stdio.h>
#include <stdlib.h>

// Forward declaration of struct bar
struct bar;

tuple foo {struct bar, struct bar}

// Here foo is an incomplete type
foo *f;

struct bar {
  int x, y;
};
// The definition of foo as a complete struct type occurs here

int main() {
  f = malloc(sizeof(foo));
  *f = (foo){{1, 2}, {3, 4}};
  printf("%d %d %d %d\n", f->f0.x, f->f0.y, f->f1.x, f->f1.y);
}
