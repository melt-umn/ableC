
int foo(int a[10]) {
  int b[10] = a;
}

int main() {
  int a[10];
  foo(a);
}
