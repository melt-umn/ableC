#include "matrix.h"


int main()
{
  Matrix a;
  Matrix b;
  Matrix c;
  
  double smrnd(size_t i, size_t j) { return rand()%2; }
  
  matrix_define(smrnd, &a, 2, 4);
  matrix_define(smrnd, &b, 4, 3);
  
  printf("A:\n"); matrix_print(stdout, &a);
  printf("B:\n"); matrix_print(stdout, &b);
  
  matrix_matrix_multiply(&a, &b, &c);
  printf("A * B:\n"); matrix_print(stdout, &c);
  matrix_free(&c);
  
  matrix_free(&b);
  matrix_free(&a);

  matrix_define(smrnd, &a, 2, 2);
  matrix_define(smrnd, &b, 2, 2);

  printf("A:\n"); matrix_print(stdout, &a);
  printf("B:\n"); matrix_print(stdout, &b);

  matrix_matrix_elementwise_multiply(&a, &b, &c);
  printf("A .* B:\n"); matrix_print(stdout, &c);
  matrix_free(&c);
  
  matrix_matrix_elementwise_add(&a, &b, &c);
  printf("A + B:\n"); matrix_print(stdout, &c);
  matrix_free(&c);

  matrix_free(&b);
  matrix_free(&a);
  
  return 0;
}
