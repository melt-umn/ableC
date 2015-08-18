// Forget to include header file
#include <stdio.h>
#include <stdlib.h>

typedef struct test test;
struct test {
  int a;
};

int main (int argc, char **argv) {
    int *a = gcmalloc (10 * sizeof(int));
    gcrealloc (a) to (12);
    
    test *b = gcnew(test);
}
