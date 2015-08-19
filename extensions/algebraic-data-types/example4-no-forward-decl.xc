/* Simple expresssion evaluation 
   using algebraic datatype as in
   ML or Haskell. */

#include <stdio.h>
#include <stdlib.h>

datatype Expr {
  Add (Expr*, Expr*);
  Sub (Expr*, Expr*);
  Mul (Expr*, Expr*);
  Div (Expr*, Expr*);
  Const (int);
};

typedef datatype Expr Expr;

int value (Expr *e) {
  match (e) {
    Add(e1,e2): { return value(e1) + value(e2); }
    Sub(e1,e2): { return value(e1) - value(e2); }
    Mul(e1,e2): { return value(e1) * value(e2); }
    Div(e1,e2): { return value(e1) / value(e2); }
    Const(v):  { return v; }
  };
}

int free_Expr (Expr *e) {
  match(e) {
    Add(e1,e2): { free_Expr(e1); free_Expr(e2); }
    Sub(e1,e2): { free_Expr(e1); free_Expr(e2); }
    Mul(e1,e2): { free_Expr(e1); free_Expr(e2); }
    Div(e1,e2): { free_Expr(e1); free_Expr(e2); }
    Const(v): {;}
  };
  free(e);
}

int main () {
  Expr *t = Add( Const(3), 
                 Mul(Const(2), Const(4)) ) ;
 
  printf("value is %d\n", value(t) );
  
  free_Expr(t);
  
  return 0;   
}
