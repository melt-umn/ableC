Matrix extension
================

In this directory are `matrix.h` and `test.c` that define and demo a tiny little matrix manipulation library.

This language extension introduces three pieces of concrete syntax:

1. Matrix declaration (`matrix let ID = MExpr`) to introduce a new matrix `ID`.
2. Matrix assignment (`matrix ID = MExpr`) to define a new matrix.
3. Matrix indexing expression (`matrix ID(i,j)`) to index in to matrixes in any expression.

Each declared matrix (with `matrix let`) must be freed explicitly, still (`matrix_free(&ID)`).
The extension is unable to help with that bit of memory management.

MExpr
-----

The matrix expressions sublanguage consists of the following:

1. C Identifiers, function calls, parenthesis. All function normally.
2. Element-wise addition of matrixes (`+`)
3. Element-wise multiplication of matrixes (`.*`)
4. Matrix multiplication (`*`)
5. Matrix literals ( `{ (i,j) < (3,4), i==j ? 1 : 0 }` creates a 3 by 4 matrix, with ones along the diagonal.
6. C expression escape hatch with double parens (`((flag ? x : y ))`) 

