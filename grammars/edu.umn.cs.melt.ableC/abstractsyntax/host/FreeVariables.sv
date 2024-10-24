grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

-- For effeciency and simplicity, duplicates are not removed automaticly.  
-- This must be done at the top level, where the attribute is used, by calling removeDuplicateNames.  
monoid attribute freeVariables::[Name];
flowtype freeVariables {decorate} on
  GlobalDecls, Decls, Decl, Declarators, Declarator, FunctionDecl, Parameters, ParameterDecl, StructDecl, UnionDecl, EnumDecl, StructItemList, EnumItemList, StructItem, StructDeclarators, StructDeclarator, EnumItem,
  MemberDesignator,
  AsmStatement, AsmArgument, AsmOperands, AsmOperand,
  Expr, GenericAssocs, GenericAssoc,
  TypeName, BaseTypeExpr, TypeModifierExpr, TypeNames,
  Type, ArrayType, FunctionType,
  MaybeExpr, Exprs, ExprOrTypeName,
  Stmt,
  MaybeInitializer, Initializer, InitList, Init, Designator;

fun removeDefsFromNames [Name] ::= defs::[Def] names::[Name] =
  if null(names)
  then []
  else if !null(filter(definesVarWithName(_, head(names).name), defs))
  then removeDefsFromNames(defs, tail(names))
  else head(names) :: removeDefsFromNames(defs, tail(names));

fun definesVarWithName Boolean ::= d::Def n::String =
  case d of
    valueDef(n1, _) -> n == n1
  | _ -> false
  end;
