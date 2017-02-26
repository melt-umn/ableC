

aspect production consDecl
top::Decls ::= h::Decl  t::Decls
{
  propagate substituted;
}

aspect production nilDecl
top::Decls ::=
{
  propagate substituted;
}

aspect production decls
top::Decl ::= d::Decls
{
  propagate substituted;
}

aspect production defsDecl
top::Decl ::= d::[Def]
{
  propagate substituted;
}

aspect production variableDecls
top::Decl ::= storage::[StorageClass]  attrs::[Attribute]  ty::BaseTypeExpr  dcls::Declarators
{
  propagate substituted;
}

aspect production typeExprDecl
top::Decl ::= attrs::[Attribute] ty::BaseTypeExpr
{
  propagate substituted;
}

aspect production typedefDecls
top::Decl ::= attrs::[Attribute]  ty::BaseTypeExpr  dcls::Declarators
{
  propagate substituted;
}

aspect production functionDeclaration
top::Decl ::= f::FunctionDecl
{
  propagate substituted;
}

aspect production warnDecl
top::Decl ::= msg::[Message]
{
  propagate substituted;
}

aspect production staticAssertDecl
top::Decl ::= e::Expr  s::String
{
  propagate substituted;
}

aspect production fileScopeAsm
top::Decl ::= s::String
{
  propagate substituted;
}

aspect production consDeclarator
top::Declarators ::= h::Declarator  t::Declarators
{
  propagate substituted;
}

aspect production nilDeclarator
top::Declarators ::=
{
  propagate substituted;
}


aspect production declarator
top::Declarator ::= name::Name  ty::TypeModifierExpr  attrs::[Attribute]  initializer::MaybeInitializer
{
  propagate substituted;
}

aspect production errorDeclarator
top::Declarator ::= msg::[Message]
{
  propagate substituted;
}

aspect production functionDecl
top::FunctionDecl ::= storage::[StorageClass]  fnquals::[SpecialSpecifier]  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::[Attribute]  decls::Decls  body::Stmt
{
  propagate substituted;
}

aspect production badFunctionDecl
top::FunctionDecl ::= msg::[Message]
{
  propagate substituted;
}


aspect production consParameters
top::Parameters ::= h::ParameterDecl  t::Parameters
{
  propagate substituted;
}
aspect production nilParameters
top::Parameters ::=
{
  propagate substituted;
}


aspect production parameterDecl
top::ParameterDecl ::= storage::[StorageClass]  bty::BaseTypeExpr  mty::TypeModifierExpr  name::MaybeName  attrs::[Attribute]
{
  propagate substituted;
}


aspect production structDecl
top::StructDecl ::= attrs::[Attribute]  name::MaybeName  dcls::StructItemList
{
  propagate substituted;
}

aspect production unionDecl
top::UnionDecl ::= attrs::[Attribute]  name::MaybeName  dcls::StructItemList
{
  propagate substituted;
}

aspect production enumDecl
top::EnumDecl ::= name::MaybeName  dcls::EnumItemList
{
  propagate substituted;
}


aspect production consStructItem
top::StructItemList ::= h::StructItem  t::StructItemList
{
  propagate substituted;
}
aspect production nilStructItem
top::StructItemList ::=
{
  propagate substituted;
}


aspect production consEnumItem
top::EnumItemList ::= h::EnumItem  t::EnumItemList
{
  propagate substituted;
}
aspect production nilEnumItem
top::EnumItemList ::=
{
  propagate substituted;
}

aspect production structItem
top::StructItem ::= attrs::[Attribute]  ty::BaseTypeExpr  dcls::StructDeclarators
{
  propagate substituted;
}
aspect production warnStructItem
top::StructItem ::= msg::[Message]
{
  propagate substituted;
}


aspect production consStructDeclarator
top::StructDeclarators ::= h::StructDeclarator  t::StructDeclarators
{
  propagate substituted;
}
aspect production nilStructDeclarator
top::StructDeclarators ::=
{
  propagate substituted;
}


aspect production structField
top::StructDeclarator ::= name::Name  ty::TypeModifierExpr  attrs::[Attribute]
{
  propagate substituted;
}
aspect production structBitfield
top::StructDeclarator ::= name::MaybeName  ty::TypeModifierExpr  e::Expr  attrs::[Attribute]
{
  propagate substituted;
}
aspect production warnStructField
top::StructDeclarator ::= msg::[Message]
{
  propagate substituted;
}

aspect production enumItem
top::EnumItem ::= name::Name  e::MaybeExpr
{
  propagate substituted;
}

aspect production hackUnusedDecl
top::Decl ::=
{
  -- substituted doesn't depend on env
  top.substituted = error("hack");
}



