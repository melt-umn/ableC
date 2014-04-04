/* { dg-do compile } */

extern double cabs(double _Complex); // AbleC change

double mandel(double _Complex C)
{
  int py;
  C = (__extension__ 1.0iF) * (double)py;
  return cabs(C);  /* { dg-warning "incompatible" } */
}

