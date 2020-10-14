struct foo {
  struct {
    struct {
      int x;
    };
    float y;
  };
  char *z;
};

struct bar {
  int x;
  float y;
  char *z;
};

struct baz {
  struct {
    struct bar b;
  };
};

struct qux {
  struct bar b1, b2;
};

struct riq {
  struct qux q1, q2, q3; 
};

int main() {
  struct foo f1 = {42, 3.14, "abc"};
  struct foo f2 = {{42, 3.14}, "abc"};
  struct foo f3 = {{{42}, 3.14}, "abc"};
  //struct foo f4 = {{{42}}, 3.14, "abc"};
  
  struct bar b1 = {42, 3.14, "abc"};
  //struct bar b2 = {{42, 3.14}, "abc"};
  //struct bar b3 = {{{42}, 3.14}, "abc"};
  struct bar b4 = {.x=42};
  //struct bar b5 = 42;
  struct bar b6 = {.y=4.2, "a"};

  struct bar bs[] = {42, 3.14, "abc", 42, 3.14};

  struct baz z1 = {42, 3.14, "abc"};
  struct baz z2 = {{42, 3.14, "abc"}};
  struct baz z3 = {{{42, 3.14, "abc"}}};
  //struct baz z4 = {{{{42, 3.14, "abc"}}}};

  struct qux q1 = {42, 3.14, "abc", 42, 3.14, "abc"};
  struct qux q2 = {b1, 42, 3.14, "abc"};
  struct qux q3 = {b1, b1};

  struct riq r1 = {42, 3.14, "abc", 42, 3.14, "abc"};
  struct riq r2 = {q1, 42, 3.14, "abc"};
  struct riq r3 = {b1, 42, 3.14, "abc"};
  //struct riq r4 = {42, .y=3.14};
  struct riq r5 = {42, .q2={123, 43.34, "x"}, 32, 3.14, "zxcv"};
  //struct riq r6 = {42, .q2={123, 43.34, "x"}, 32, 3.14, "zxcv", 32, 3.14, "zxcv", 54};
}
