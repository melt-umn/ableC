
template<a> struct bar;

template<a>
struct foo {
  a x;
  bar<a> *b;
};

template<a>
struct bar {
  a x;
  foo<a> b;
};

int main(int argc, char **argv) {
  bar<float> p;
  //foo<float> q = p.b;
}

