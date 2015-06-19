#include <gc.h>
#include <stdio.h>

int main (int argc, char **argv) {
    int a = gcmalloc (10 * sizeof(int)); // Type error: Not a pointer
    //gcrealloc (a, 12);
    
    //float *b = gcnew int; // Type error: Wrong type of pointer
}
