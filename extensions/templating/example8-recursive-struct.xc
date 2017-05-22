
template<a>
struct foo {
  a x;
  foo<int> *b;
};

int main(int argc, char **argv) {
  foo<float> q;
}
