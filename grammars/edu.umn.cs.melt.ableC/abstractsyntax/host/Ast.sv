grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

imports silver:langutil;
imports silver:langutil:pp;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;

-- Treat the substitution module like an export for modular analyses,
-- but don't add it to the reference set.
option edu:umn:cs:melt:ableC:abstractsyntax:substitution;

-- Flowtypes for imported attributes that are the same w.r.t. the reference set on all nonterminals
flowtype pp {} on
  Attribute, Attribs, Attrib, AttribName,
  Decl, FunctionDecl, ParameterDecl, StructDecl, UnionDecl, EnumDecl, StructItem, EnumItem, StorageClass,
  MemberDesignator,
  ArrayType, ExtType, StructOrEnumOrUnion,
  AsmStatement, AsmArgument, AsmClobbers, AsmOperands, AsmOperand,
  Qualifier, SpecialSpecifier,
  Expr, GenericAssoc,
  TypeName, BaseTypeExpr,
  BuiltinType, RealType, IntegerType,
  NumericConstant,
  MaybeExpr, ExprOrTypeName,
  Stmt,
  Name, MaybeName,
  MaybeInitializer, Initializer, Init, Designator;
flowtype pps {} on 
  Attributes,
  GlobalDecls, Decls, Declarators, Declarator, Parameters, StructItemList, EnumItemList, StructDeclarators, StructDeclarator, StorageClasses,
  ArraySizeModifier,
  Qualifiers, SpecialSpecifiers,
  GenericAssocs,
  TypeNames,
  Exprs,
  InitList;
flowtype lpp {} on
  Type, FunctionType, NoncanonicalType,
  TypeModifierExpr;
flowtype rpp {} on
  Type, FunctionType, NoncanonicalType,
  TypeModifierExpr;

flowtype errors {decorate} on
  Root, Compilation,
  GlobalDecls, Decls, Decl, Declarators, Declarator, FunctionDecl, Parameters, ParameterDecl, StructDecl, UnionDecl, EnumDecl, StructItemList, EnumItemList, StructItem, StructDeclarators, StructDeclarator, EnumItem,
  MemberDesignator,
  Expr, GenericAssocs, GenericAssoc,
  TypeName, BaseTypeExpr, TypeModifierExpr, TypeNames,
  NumericConstant,
  MaybeExpr, Exprs, ExprOrTypeName,
  Stmt,
  MaybeInitializer, Initializer, InitList, Init, Designator,
  SpecialSpecifiers;

flowtype defs {decorate} on
  Decls, Decl, Declarators, Declarator, FunctionDecl, Parameters, ParameterDecl, StructDecl, UnionDecl, EnumDecl, StructItemList, EnumItemList, StructItem, StructDeclarators, StructDeclarator, EnumItem,
  MemberDesignator,
  SpecialSpecifier, SpecialSpecifiers,
  Expr, GenericAssocs, GenericAssoc,
  TypeName, BaseTypeExpr, TypeModifierExpr, TypeNames,
  MaybeExpr, Exprs, ExprOrTypeName,
  Stmt,
  MaybeInitializer, Initializer, InitList, Init, Designator;
flowtype functionDefs {decorate} on
  Parameters, ParameterDecl;
-- Empty within function bodies since functionDefs is used in computing the env
flowtype functionDefs {} on
  Stmt;
flowtype localDefs {decorate} on
  StructItemList, StructItem, StructDeclarators, StructDeclarator;

flowtype typerep {decorate} on
  Declarator, FunctionDecl, ParameterDecl, StructDeclarator, EnumItem,
  Expr,
  TypeName, BaseTypeExpr, TypeModifierExpr,
  ExprOrTypeName;

-- Set all forward flowtypes on 'collection' and 'wrapper' nonterminals to be empty, since we
-- typically don't forward on these, and may want to pattern match without providing all attributes
flowtype forward {} on
  Attributes, Attribs, AttribName,
  Decls, Declarators, Parameters, StructItemList, EnumItemList, StructDeclarators,
  AsmClobbers, AsmOperands,
  Qualifiers, SpecialSpecifiers,
  GenericAssocs,
  TypeNames,
  MaybeExpr, Exprs, ExprOrTypeName,
  Name, MaybeName,
  MaybeInitializer, InitList;

-- Set all other forward flowtypes to be the same as reference sets
flowtype forward {decorate} on
  Root, Compilation,
  Attribute, Attrib,
  GlobalDecls, Decl, Declarator, FunctionDecl, ParameterDecl, StructDecl, UnionDecl, EnumDecl, StructItem, StructDeclarator, EnumItem, StorageClass,
  MemberDesignator,
  Type, ArrayType, ArraySizeModifier, FunctionType, NoncanonicalType,
  AsmStatement, AsmArgument, AsmOperand,
  Qualifier, SpecialSpecifier,
  Expr, GenericAssoc,
  TypeName, BaseTypeExpr, TypeModifierExpr,
  BuiltinType, RealType, IntegerType,
  NumericConstant,
  Stmt,
  Initializer, Init, Designator;
