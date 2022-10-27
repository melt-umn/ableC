struct foo {
  struct {
    int x;
  } __attribute__((aligned(32)));
  int y;
};
