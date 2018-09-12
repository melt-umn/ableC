-- x = a ;
function mkIntAssign
Stmt ::= x::String a::String l::Location
{ return exprStmt (
           eqExpr(
             declRefExpr(name(x,location=l),location=l),
             mkIntExpr(a,l),
             location=l
            )
          );
}

function mkAssign
Stmt ::= x::String e::Expr l::Location
{ return exprStmt (
           eqExpr(
             declRefExpr(name(x,location=l),location=l),
             e,
             location=l
            )
          );
}
