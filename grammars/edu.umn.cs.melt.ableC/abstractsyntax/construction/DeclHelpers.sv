import edu:umn:cs:melt:ableC:abstractsyntax:env;
import silver:langutil:pp;

-- TODO: Most of these are essentially obsolete with the use of silver-ableC,
-- we should remove them at some point.

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
             exprInitializer( mkIntExpr(val, l), location=l ) ),
           l);
}

function mkIntDeclExpr
Stmt ::= n::String val::Expr l::Location
{
  return mkIntDeclGeneral( 
           n, 
           justInitializer(
             exprInitializer( val, location=l ) ),
           l);
}


function mkIntDeclGeneral
Stmt ::= n::String init::MaybeInitializer l::Location
{
  return  declStmt( 
            variableDecls(nilStorageClass(), nilAttribute(), 
              directTypeExpr(
                builtinType(nilQualifier(), signedType(intType()))),
              consDeclarator( 
                declarator( name(n, location=l), baseTypeExpr(), nilAttribute(), 
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
            variableDecls(nilStorageClass(), nilAttribute(), bty,
              consDeclarator( 
                declarator( name(n, location=l), baseTypeExpr(), nilAttribute(), 
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
            variableDecls(nilStorageClass(), nilAttribute(), bty,
              consDeclarator( 
                declarator( name(n, location=l), baseTypeExpr(), nilAttribute(), 
                    justInitializer(exprInitializer(v, location=l)) ) , 
                nilDeclarator() )
            )
          ) ;
}

function makeDeclIntInit
Decl ::= n::String val::String l::Location
{
  return makeDeclIntGeneral( 
           n, 
           justInitializer(
             exprInitializer( mkIntExpr(val, l), location=l ) ),
           l);
}
function makeDeclIntGeneral
Decl ::= n::String init::MaybeInitializer l::Location
{
  return variableDecls(nilStorageClass(), nilAttribute(), 
           directTypeExpr(
             builtinType(nilQualifier(), signedType(intType()))),
           consDeclarator( 
             declarator( name(n, location=l), baseTypeExpr(), nilAttribute(), 
               init) , 
             nilDeclarator() 
           ) ) ;
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
