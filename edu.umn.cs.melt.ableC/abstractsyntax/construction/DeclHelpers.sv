-- Decl --

-- int n ;
function mkIntDecl
Stmt ::= n::String l::Location
{
  return  mkIntDeclGeneral( n, nothingInitializer() , l);
}

function mkNamedTypeDecl
Stmt ::= n::String l::Location
{
  return  mkIntDeclGeneral( n, nothingInitializer() , l);
}

-- int n = val;
function mkIntDeclInit
Stmt ::= n::String val::String l::Location
{
  return mkIntDeclGeneral( 
           n, 
           justInitializer(
             exprInitializer( mkIntExpr(val, l) ) ),
           l);
}

function mkIntDeclGeneral
Stmt ::= n::String init::MaybeInitializer l::Location
{
  return  declStmt( 
            variableDecls( [], [], 
              directTypeExpr(
                builtinType([], signedType(intType()))),
              consDeclarator( 
                declarator( name(n, location=l), baseTypeExpr(), [], 
                  init) , 
                nilDeclarator() 
              )
            )
          ) ;
}

function mkDeclGeneral
Stmt ::= n::String typ::Type l::Location
{
  local bty::BaseTypeExpr = directTypeExpr(typ);

  return  declStmt( 
            variableDecls( [], [], bty,
              consDeclarator( 
                declarator( name(n, location=l), baseTypeExpr(), [], 
                    nothingInitializer() ) , 
                nilDeclarator() )
            )
          ) ;
}


function mkDecl
Stmt ::= n::String typ::Type v::Expr l::Location
{
  local bty::BaseTypeExpr = directTypeExpr(typ);

  return  declStmt( 
            variableDecls( [], [], bty,
              consDeclarator( 
                declarator( name(n, location=l), baseTypeExpr(), [], 
                    justInitializer(exprInitializer(v)) ) , 
                nilDeclarator() )
            )
          ) ;
}

{-
function mkDeclGeneral
Stmt ::= n::String type: init::MaybeInitializer l::Location
{
  return  declStmt( 
            variableDecls( [], [], 
              directTypeExpr(
                builtinType([], signedType(intType()))),
              consDeclarator( 
                declarator( name(n, location=l), baseTypeExpr(), [], 
                    init) , 
                nilDeclarator() )
            )
          ) ;
}
 -}  

