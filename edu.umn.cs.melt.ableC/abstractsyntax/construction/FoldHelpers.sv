
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

function unfoldDecl
[Decl] ::= decl::Decls
{
  return case decl of
           nilDecl() -> []
         | consDecl(d,ds) -> d :: unfoldDecl(ds)
         | _ -> error ("Incorrect application of unfoldDecl.")
         end;
}

function foldGlobalDecl
Decls ::= l::[Decl]
{
  return foldr(consGlobalDecl, nilDecl(), l);
}

function foldInit
InitList ::= l::[Init]
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
  | parameterDecl([], directTypeExpr(builtinType([], voidType())), baseTypeExpr(), nothingName(), []) :: [] -> nilParameters()
  | _ -> foldr(consParameters, nilParameters(), l)
  end;
}
