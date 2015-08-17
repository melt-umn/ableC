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
    Add(Sub(e1,e2),Mul(e3,e4)): { return (value(e1) - value(e2)) + (value(e3) * value(e4)); }
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
    Const(v):   { ; } 
  };
  free(e);
}

int main () {
  Expr *t = Add( Const(3), 
                 Mul(Const(2), Const(4)) ) ;
 
  int result = value(t);

  printf("value is %d\n", result );
  
  free_Expr(t);
 
  if (result == 11)  
    return 0;   // correct answer
  else
    return 1;   // incorrect answer

}
