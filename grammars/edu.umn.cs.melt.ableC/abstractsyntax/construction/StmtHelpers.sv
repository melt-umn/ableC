-- x = a ;
function mkIntAssign
Stmt ::= x::String a::String
{ return exprStmt (
           eqExpr(
             declRefExpr(name(x)),
             mkIntExpr(a)
            )
          );
}

function mkAssign
Stmt ::= x::String e::Expr
{ return exprStmt (
           eqExpr(
             declRefExpr(name(x)),
             e
            )
          );
}
