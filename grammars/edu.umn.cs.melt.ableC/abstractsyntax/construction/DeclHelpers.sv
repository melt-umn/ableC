import edu:umn:cs:melt:ableC:abstractsyntax:env;
import silver:langutil:pp;

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

function mkIntDeclExpr
Stmt ::= n::String val::Expr l::Location
{
  return mkIntDeclGeneral( 
           n, 
           justInitializer(
             exprInitializer( val ) ),
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
                    justInitializer(exprInitializer(v)) ) , 
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
             exprInitializer( mkIntExpr(val, l) ) ),
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
 
abstract production autoDecl
top::Decl ::= n::Name e::Expr
{
  top.pp = pp"auto ${n.pp} = ${e.pp};";

  local bty::BaseTypeExpr = directTypeExpr(e.typerep);

  forwards to
    variableDecls(
      nilStorageClass(), nilAttribute(), bty,
      consDeclarator(
        declarator(
          n, baseTypeExpr(), nilAttribute(),
          justInitializer(exprInitializer(e))),
        nilDeclarator()));
}
