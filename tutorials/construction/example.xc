#include <stdio.h>

int main (int argc, char **argv) {
  int test1 = 2 ** 2 ** 2 ** 2;
  double test2 = 1.0001 ** test1;
  //"a" ** 6.7; // Error
  
  printf("%d\n%f\n", test1, test2);
  
  return 0; 
}
