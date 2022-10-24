
int foo(int a[static 10]) {
}

int main() {
  int a[4];
  foo(a);
}
