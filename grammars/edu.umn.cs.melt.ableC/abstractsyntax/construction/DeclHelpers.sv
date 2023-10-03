import edu:umn:cs:melt:ableC:abstractsyntax:env;
import silver:langutil:pp;

-- TODO: Most of these are essentially obsolete with the use of silver-ableC,
-- we should remove them at some point.

-- Decl --

-- int n ;
function mkIntDecl
Stmt ::= n::String
{
  return  mkIntDeclGeneral( n, nothingInitializer());
}

function mkNamedTypeDecl
Stmt ::= n::String
{
  return  mkIntDeclGeneral( n, nothingInitializer());
}

-- int n = val;
function mkIntDeclInit
Stmt ::= n::String val::String
{
  return mkIntDeclGeneral( 
           n, 
           justInitializer(
             exprInitializer( mkIntExpr(val) ) ));
}

function mkIntDeclExpr
Stmt ::= n::String val::Expr
{
  return mkIntDeclGeneral( 
           n, 
           justInitializer(
             exprInitializer( val ) ));
}


function mkIntDeclGeneral
Stmt ::= n::String init::MaybeInitializer
{
  return  declStmt( 
            variableDecls(nilStorageClass(), nilAttribute(), 
              directTypeExpr(
                builtinType(nilQualifier(), signedType(intType()))),
              consDeclarator( 
                declarator( name(n), baseTypeExpr(), nilAttribute(), 
                  init) , 
                nilDeclarator() 
              )
            )
          ) ;
}

function mkDeclGeneral
Stmt ::= n::String typ::Type
{
  local bty::BaseTypeExpr = directTypeExpr(typ);

  return  declStmt( 
            variableDecls(nilStorageClass(), nilAttribute(), bty,
              consDeclarator( 
                declarator( name(n), baseTypeExpr(), nilAttribute(), 
                    nothingInitializer() ) , 
                nilDeclarator() )
            )
          ) ;
}


function mkDecl
Stmt ::= n::String typ::Type v::Expr
{
  local bty::BaseTypeExpr = directTypeExpr(typ);

  return  declStmt( 
            variableDecls(nilStorageClass(), nilAttribute(), bty,
              consDeclarator( 
                declarator( name(n), baseTypeExpr(), nilAttribute(), 
                    justInitializer(exprInitializer(v)) ) , 
                nilDeclarator() )
            )
          ) ;
}

function makeDeclIntInit
Decl ::= n::String val::String
{
  return makeDeclIntGeneral( 
           n, 
           justInitializer(
             exprInitializer( mkIntExpr(val) ) ));
}
function makeDeclIntGeneral
Decl ::= n::String init::MaybeInitializer
{
  return variableDecls(nilStorageClass(), nilAttribute(), 
           directTypeExpr(
             builtinType(nilQualifier(), signedType(intType()))),
           consDeclarator( 
             declarator( name(n), baseTypeExpr(), nilAttribute(), 
               init) , 
             nilDeclarator() 
           ) ) ;
}


{-
function mkDeclGeneral
Stmt ::= n::String type: init::MaybeInitializer
{
  return  declStmt( 
            variableDecls( [], [], 
              directTypeExpr(
                builtinType([], signedType(intType()))),
              consDeclarator( 
                declarator( name(n), baseTypeExpr(), [], 
                    init) , 
                nilDeclarator() )
            )
          ) ;
}
 -}
