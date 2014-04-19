#include "matrix.h"


int main()
{
  matrix let a = { (i,j) < (2,4), rand()%2 };
  matrix let b = { (i,j) < (4,3), rand()%2 };
  
  printf("A:\n"); matrix_print(stdout, &a);
  printf("B:\n"); matrix_print(stdout, &b);
  
  matrix let c = a * b;

  printf("A * B:\n"); matrix_print(stdout, &c);

  matrix a = { (i,j) < (2,2), rand()%2 };
  matrix b = { (i,j) < (2,2), rand()%2 };

  printf("A:\n"); matrix_print(stdout, &a);
  printf("B:\n"); matrix_print(stdout, &b);

  matrix c = a .* b;
  
  printf("A .* B:\n"); matrix_print(stdout, &c);
  
  matrix c = a + b;
  
  printf("A + B:\n"); matrix_print(stdout, &c);
  
  matrix_free(&c);
  matrix_free(&b);
  matrix_free(&a);

  return 0;
}
