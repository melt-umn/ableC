/* Simple expresssion evaluation 
   using algebraic datatype as in
   ML or Haskell. */

#include <stdio.h>
#include <stdlib.h>

typedef  datatype Expr  Expr;

datatype Expr {
  Add (Expr*, Expr*);
  Sub (Expr*, Expr*);
  Mul (Expr*, Expr*);
  Div (Expr*, Expr*);
  Const (int);
};

int value (Expr *e) {
  match (e) {
    Add(e1,e2): { return value(e1) + value(e2); }
    Sub(e1,e2): { return value(e1) - value(e2); }
    Mul(e1,e2): { return value(e1) * value(e2); }
    Div(e1,e2@!Const(0)): { return value(e1) / value(e2); }
    Const(v):  { return v; }
    _: { return -12345; }
  };
}

int free_Expr (Expr *e) {
  match(e) {
    Add(e1,e2): { free_Expr(e1); free_Expr(e2); }
    Sub(e1,e2): { free_Expr(e1); free_Expr(e2); }
    Mul(e1,e2): { free_Expr(e1); free_Expr(e2); }
    Div(e1,e2): { free_Expr(e1); free_Expr(e2); }
    Const(v): {}
  };
  free(e);
}

int main () {
  Expr *t = Add( Const(3), 
                 Div(Const(1), Const(0)) ) ;
 
  int result = value(t);

  printf("value is %d\n", result );
  
  free_Expr(t);
 
  if (result == -12342)  
    return 0;   // correct answer
  else
    return 1;   // incorrect answer

}
