
function mkAssign
Stmt ::= x::String e::Expr
{ return exprStmt (
           eqExpr(
             declRefExpr(name(x)),
             ^e
            )
          );
}
