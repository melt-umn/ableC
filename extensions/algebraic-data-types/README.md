Algebraic datatypes extension
=============================

This extension introduces algebraic datatype declarations, and an associated matching syntax.

The datatype are translated using the usual struct/union/enum tag representation you would expect.

As an example:

```
datatype Expr {
  Add (Expr*, Expr*);
  Const (int);
};
```

This introduces the type `Expr` and special constuctors like `Add`. The return type of each constructor is a `Expr *` and it is the creator's responsibility to eventually free this memory:

```
int free_Expr (Expr *e) {
  match(e) {
    Add(e1,e2): { free_Expr(e1); free_Expr(e2); }
    Const(v): ;
  };
  free(e);
}
```

