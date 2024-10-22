
import edu:umn:cs:melt:ableC:abstractsyntax:env;

fun foldStructItem StructItemList ::= l::[StructItem] = foldr(consStructItem, nilStructItem(), l);

fun foldEnumItem EnumItemList ::= l::[EnumItem] = foldr(consEnumItem, nilEnumItem(), l);

fun foldDecl Decls ::= l::[Decl] = foldr(consDecl, nilDecl(), l);

fun foldGlobalDecl GlobalDecls ::= l::[Decl] = foldr(consGlobalDecl, nilGlobalDecl(), l);

fun foldInit InitList ::= l::[Init] = foldr(consInit, nilInit(), l);

fun foldExpr Exprs ::= l::[Expr] = foldr(consExpr, nilExpr(), l);

fun foldName Names ::= l::[Name] = foldr(consName, nilName(), l);

fun foldGenericAssoc GenericAssocs ::= l::[GenericAssoc] =
  foldr(consGenericAssoc, nilGenericAssoc(), l);

fun foldStructDeclarator StructDeclarators ::= l::[StructDeclarator] =
  foldr(consStructDeclarator, nilStructDeclarator(), l);

fun foldDeclarator Declarators ::= l::[Declarator] = foldr(consDeclarator, nilDeclarator(), l);

fun foldStmt Stmt ::= l::[Stmt] = if null(l) then nullStmt() else foldr1(seqStmt, l);

fun foldParameterDecl Parameters ::= l::[ParameterDecl] =
  case l of
  -- A special case.  "type name(void)"  means no parameters.
  | [d] ->
    case decorate d with {env = emptyEnv(); position = 0; 
          controlStmtContext = initialControlStmtContext;} of
      parameterDecl(nilStorageClass(), builtinTypeExpr(nilQualifier(), voidType()), baseTypeExpr(), nothingName(), nilAttribute()) -> nilParameters()
    | _ -> foldr(consParameters, nilParameters(), l)
    end
  | _ -> foldr(consParameters, nilParameters(), l)
  end;

fun foldStorageClass StorageClasses ::= l::[StorageClass] =
  foldr(consStorageClass, nilStorageClass(), l);

fun foldAttribute Attributes ::= l::[Attribute] = foldr(consAttribute, nilAttribute(), l);

fun foldQualifier Qualifiers ::= l::[Qualifier] = foldr(consQualifier, nilQualifier(), l);
