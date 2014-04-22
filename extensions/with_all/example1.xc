#include <stdio.h>
#include <stdlib.h>

typedef datatype Expr Expr;

datatype Expr {
  Const(_Bool);
  And(Expr*, Expr*);
  Implies(Expr*, Expr*);
}

_Bool eval(Expr *e) {
  match(e) {
    Const(v): return v;
    And(l, r): return eval(l) && eval(r);
    Implies(l, r): return table {
                            eval(l) : F T
                            eval(r) : * T };
  };
}

int main() {
  Expr * test =
    Implies(And(Const(1), Const(0)), Const(1)); // (t & f) -> t  ==>  t
  
  printf("Returned %s\n", eval(test) ? "true" : "false");
  
  // Skip freeing test.
}
