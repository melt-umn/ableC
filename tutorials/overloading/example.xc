#include <interval.xh>
#include <stdio.h>

void print_interval(interval x) {
  printf("[%f, %f]\n", x.min, x.max);
}

int main (int argc, char **argv) {
  interval a = intr[0, 10];
  interval b = intr[3, 17];
  interval c = a + b;
  interval d = a - b;
  interval e = a * b;
  interval f = a / b;
  interval g = -c;
  interval h = ~d;

  print_interval(a);
  print_interval(b);
  print_interval(c);
  print_interval(d);
  print_interval(e);
  print_interval(f);
  print_interval(g);
  print_interval(h);
  
  return 0; 
}
