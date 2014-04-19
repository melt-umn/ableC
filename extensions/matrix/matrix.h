#ifndef MATRIX__H
#define MATRIX__H

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

typedef struct Matrix_double {
  double *data;
  size_t rows;
  size_t cols;
} Matrix;

static inline void matrix_alloc(Matrix *a, size_t rows, size_t cols)
{
  a->data = malloc(sizeof(*a->data) * rows * cols);
  a->rows = rows;
  a->cols = cols;
}
static inline void matrix_free(Matrix *a)
{
  free(a->data);
  a->data = 0;
  a->rows = a->cols = 0;
}
static inline double *matrix_index(Matrix *a, size_t row, size_t col)
{
  return a->data + (row * a->cols + col);
}

static inline void matrix_matrix_multiply(Matrix * restrict a, Matrix * restrict b, Matrix * restrict c)
{
  const size_t rows = a->rows;
  const size_t cols = b->cols;
  const size_t inner = a->cols;
  assert(a->cols == b->rows);

  matrix_alloc(c, rows, cols);

  for(size_t i = 0; i < rows; i++) {
    for(size_t j = 0; j < cols; j++) {
      double sum = 0;
      for(size_t k = 0; k < inner; k++) {
        sum += *matrix_index(a, i, k) * *matrix_index(b, k, j);
      }
      *matrix_index(c, i, j) = sum;
    }
  }
}

static inline void matrix_matrix_elementwise_multiply(Matrix * restrict a, Matrix * restrict b, Matrix * restrict c)
{
  const size_t rows = a->rows;
  const size_t cols = a->cols;
  assert(a->cols == b->cols);
  assert(a->rows == b->rows);

  matrix_alloc(c, rows, cols);
  
  for(size_t i = 0; i < rows; i++) {
    for(size_t j = 0; j < cols; j++) {
      *matrix_index(c, i, j) = *matrix_index(a, i, j) * *matrix_index(b, i, j);
    }
  }
}

static inline void matrix_matrix_elementwise_add(Matrix * restrict a, Matrix * restrict b, Matrix * restrict c)
{
  const size_t rows = a->rows;
  const size_t cols = a->cols;
  assert(a->cols == b->cols);
  assert(a->rows == b->rows);

  matrix_alloc(c, rows, cols);
  
  for(size_t i = 0; i < rows; i++) {
    for(size_t j = 0; j < cols; j++) {
      *matrix_index(c, i, j) = *matrix_index(a, i, j) + *matrix_index(b, i, j);
    }
  }
}

static inline void matrix_define(double (*f)(size_t, size_t), Matrix * restrict a, size_t rows, size_t cols)
{
  matrix_alloc(a, rows, cols);
  
  for(size_t i = 0; i < rows; i++) {
    for(size_t j = 0; j < cols; j++) {
      *matrix_index(a, i, j) = f(i, j);
    }
  }
}

static inline void matrix_print(FILE *f, Matrix *a)
{
  const size_t rows = a->rows;
  const size_t cols = a->cols;

  for(size_t i = 0; i < rows; i++) {
    for(size_t j = 0; j < cols; j++) {
      fprintf(f, "%8.2f", *matrix_index(a, i, j));
    }
    fprintf(f, "\n");
  }
}

static inline void matrix_copy(Matrix *dest, Matrix *src)
{
  const size_t rows = src->rows;
  const size_t cols = src->cols;

  matrix_alloc(dest, rows, cols);
  
  for(size_t i = 0; i < rows; i++) {
    for(size_t j = 0; j < cols; j++) {
      *matrix_index(dest, i, j) = *matrix_index(src, i, j);
    }
  }
}

#endif
