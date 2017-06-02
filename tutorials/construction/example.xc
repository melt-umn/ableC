#include <stdio.h>

int main (int argc, char **argv) {
  int test1 = (2 ** 2 ** 2) ** 2;
  double test2 = 1.01 ** test1;
  float test3 = 10.0f ** -5;
  //"a" ** 6.7; // Error
  
  printf("%d\n%f\n%f\n", test1, test2, test3);
  
  return 0; 
}
