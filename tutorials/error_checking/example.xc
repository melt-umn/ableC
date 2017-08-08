
#include <stdio.h>

int main() {
  printf("%d\n", 3 ~~ 4);
  printf("%f\n", 3.0 ~~ 4);
  //3.0 ~~ "abcd"; // Error
}
