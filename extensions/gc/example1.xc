#include <gc.h>
#include <stdio.h>

int main (int argc, char **argv) {
    int *a = gcmalloc (10 * sizeof(int));
    //gcrealloc (a, 12);
    
    //int *b = gcnew int;
}
