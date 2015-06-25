#include <stdio.h>
#include <stdlib.h>
#include <gc.h>

typedef  datatype Tree  Tree;

datatype Tree {
  Node (Tree*, Tree*);
  Leaf (int);
};

int value (Tree *e) {
  int res;

  match (e) {
    Node(e1,e2): res = value(e1) + value(e2);
    Leaf(v):  res = v;
  };

  return res;  
}
int main () {
  Tree *t = Node( Leaf(3), 
                 Node(Leaf(2), Leaf(4)) ) ;

  printf("value is %d\n", value(t) );
  return 0;   
}
