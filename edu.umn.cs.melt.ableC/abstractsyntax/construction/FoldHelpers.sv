
import edu:umn:cs:melt:ableC:abstractsyntax:env;

function foldStructItem
StructItemList ::= l::[StructItem]
{
  return foldr(consStructItem, nilStructItem(), l);
}

function foldEnumItem
EnumItemList ::= l::[EnumItem]
{
  return foldr(consEnumItem, nilEnumItem(), l);
}

function foldDecl
Decls ::= l::[Decl]
{
  return foldr(consDecl, nilDecl(), l);
}

function foldGlobalDecl
GlobalDecls ::= l::[Decl]
{
  return foldr(consGlobalDecl, nilGlobalDecl(), l);
}

function foldInit
InitList ::= l::[InitItem]
{
  return foldr(consInit, nilInit(), l);
}

function foldExpr
Exprs ::= l::[Expr]
{
  return foldr(consExpr, nilExpr(), l);
}

function foldGenericAssoc
GenericAssocs ::= l::[GenericAssoc]
{
  return foldr(consGenericAssoc, nilGenericAssoc(), l);
}

function foldStructDeclarator
StructDeclarators ::= l::[StructDeclarator]
{
  return foldr(consStructDeclarator, nilStructDeclarator(), l);
}

function foldDeclarator
Declarators ::= l::[Declarator]
{
  return foldr(consDeclarator, nilDeclarator(), l);
}

function foldStmt
Stmt ::= l::[Stmt]
{
  return if null(l) then nullStmt() else foldr1(seqStmt, l);
}

function foldParameterDecl
Parameters ::= l::[ParameterDecl]
{
  return case l of
  -- A special case.  "type name(void)"  means no parameters.
  | [d] ->
  -- TODO: Possible bug with flow analysis, doesn't complain if this decorate is removed
    case decorate d with {env = emptyEnv(); returnType = nothing();} of
      parameterDecl([], builtinTypeExpr(nilQualifier(), voidType()), baseTypeExpr(), nothingName(), nilAttribute()) -> nilParameters()
    | _ -> foldr(consParameters, nilParameters(), l)
    end
  | _ -> foldr(consParameters, nilParameters(), l)
  end;
}

function foldAttribute
Attributes ::= l::[Attribute]
{
  return foldr(consAttribute, nilAttribute(), l);
}

function foldQualifier
Qualifiers ::= l::[Qualifier]
{
  return foldr(consQualifier, nilQualifier(), l);
}
