#include <stdio.h>
#include <stdlib.h>

typedef  datatype Tree  Tree;

datatype Tree {
  Node (Tree*, Tree*);
  Leaf (int);
};

int value (Tree *e) {
  int res;

  match (e) {
    Node(e1,e2): { res = value(e1) + value(e2); }
    Leaf(v): { res = v; }
  };

  return res;  
}
int main () {
  Tree *t = Node( Leaf(3), 
                 Node(Leaf(2), Leaf(4)) ) ;

  int result = value(t);

  printf("value is %d\n", result );
  
  if (result == 9)  
    return 0;   // correct answer
  else
    return 1;   // incorrect answer

}
