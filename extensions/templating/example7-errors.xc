#include <stdio.h>
#include <stdlib.h>

template<a, b>
struct ptr {
  a *contents;
};

template<a>
struct ptr {
  a *contents;
};

template<a, a>
ptr<a> new(a x) {
  ptr<a> res = {malloc(sizeof(a))};
  *res.contents = x;
  return res;
}

template<a>
a deref(ptr<a> x) {
  return &(x.contents);
  return &(x.contents);
  return &(x.contents);
}

template<a>
void delete(ptr<a> x) {
  free(x.contents);
}

int main() {
  ptr<ptr<int>> x = new<ptr<int>>(new<int>(42));
  printf("%d\n", deref<int>(deref<ptr<int>>(x)));
  delete<int>(deref<ptr<int>>(x));
  delete<ptr<int>>(x);

  typedef int foo;
  ptr<foo> y;
  delete<foo>(y);
}
