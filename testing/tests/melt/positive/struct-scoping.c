
struct foo; // fwd dcl 0

struct foo { int x; }; // dcl of 0

struct bar { struct bar * x; }; // fwd dcl 1, reference to 1.

struct undefined; // fwd dcl 2

int baz(void) {

  struct foo; // ref to 0
  
  struct foo { struct bar * k; }; // fwd dcl 3 (NOT 0), ref to 1
  
  struct foo; // ref to 3 (NOT 0)
  
  struct undefined { int p; }; // fwd dcl 4 (NOT ref to 2)
  

}
