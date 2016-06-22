#include <closure.h>

int main() {
  closure((int) -> int) fn() {
    closure((int) -> int) fn1() {
      return lambda (int x) . (x);
    }
    return fn1();
  }
  return fn()(1) != 1;
}
