#include <stdio.h>
#include <math.h>

template<a>
struct loc {
  a x;
  a y;
};

template<a>
a distance(loc<a> p, loc<a> q) {
  return (a)sqrt((p.x - q.x) * (p.x - q.x) + (p.y - q.y) * (p.y - q.y));
}

int main() {
  loc<int> a = {1, 2};
  loc<int> b = {3, 4};
  loc<float> c = {1.2, 3.4};
  loc<float> d = {5.6, 7.8};

  printf("%d\n", distance<int>(a, b));
  printf("%f\n", distance<float>(c, d));
}
