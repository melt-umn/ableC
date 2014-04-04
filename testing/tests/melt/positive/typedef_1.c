// A simple program with type defs

typedef int length ;

typedef struct S { int i; int j; } pair ;

int main() {
    length z;
    pair p ;
    p.i = 1 ;
    p.j = 3 ;
    z = p.i * p.j + 2 ;
}
