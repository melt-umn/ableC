grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

{--
 - Functor attribute to compute the host AST corresponding to an extended AST
 - Invariant:
 - All forwarding (extension) productions should leave host undefined
 - All non-forwarding (host) productions should define host
 - Productions that correspond to C should functor-propagate host, while productions
 - part of the 'extended' host language may have other semantics
 -}
synthesized attribute host<a>::a;
flowtype host {decorate} on
  Root,
  Attributes, Attribute, Attribs, Attrib, AttribName,
  GlobalDecls, Decls, Decl, Declarators, Declarator, FunctionDecl, Parameters, ParameterDecl, StructDecl, UnionDecl, EnumDecl, StructItemList, EnumItemList, StructItem, StructDeclarators, StructDeclarator, EnumItem,
  MemberDesignator,
  Type, ArrayType, FunctionType, TagType, NoncanonicalType,
  AsmStatement, AsmArgument, AsmClobbers, AsmOperands, AsmOperand,
  Qualifiers, SpecialSpecifier, SpecialSpecifiers,
  Expr, GenericAssocs, GenericAssoc,
  TypeName, BaseTypeExpr, TypeModifierExpr, TypeNames,
  BuiltinType, RealType, IntegerType,
  NumericConstant,
  MaybeExpr, Exprs, ExprOrTypeName,
  Stmt,
  UnaryOp, UnaryTypeOp,
  Name, MaybeName,
  BinOp, AssignOp, BoolOp, BitOp, CompareOp, NumOp,
  MaybeInitializer, Initializer, InitList, Init, Designator;
