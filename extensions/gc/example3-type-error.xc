#include <gc.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct test test;
struct test {
  int a;
};


int main (int argc, char **argv) {
    int a = gcmalloc (10 * sizeof(int)); // Type error: Not a pointer
    gcrealloc (a) to (12); // Type error: Not a pointer
    
    float *b = gcnew test; // Type error: Wrong type of pointer
}
