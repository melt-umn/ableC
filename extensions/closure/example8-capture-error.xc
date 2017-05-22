#include <closure.h>

int main() {
  int fn(int x) {
    return x + 1;
  }
  closure<(int) -> int) c = lambda (int a) . (fn(a));

  return c(1) != 2;
}
