

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
top::Decl ::= storage::[StorageClass]  attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  propagate substituted;
}

aspect production typeExprDecl
top::Decl ::= attrs::Attributes ty::BaseTypeExpr
{
  propagate substituted;
}

aspect production typedefDecls
top::Decl ::= attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
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
top::Declarator ::= name::Name  ty::TypeModifierExpr  attrs::Attributes  initializer::MaybeInitializer
{
  propagate substituted;
}

aspect production errorDeclarator
top::Declarator ::= msg::[Message]
{
  propagate substituted;
}

aspect production functionDecl
top::FunctionDecl ::= storage::[StorageClass]  fnquals::SpecialSpecifiers  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::Attributes  decls::Decls  body::Stmt
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
  -- Since we pattern match on h, we need to supply its forward dependancies
  -- We don't really care about these, since all we want to know is whether d is a typedefTypeExpr.
  local h1::ParameterDecl = h;
  h1.env = emptyEnv();
  h1.returnType = nothing();
  
  local substitutions::Substitutions = top.substitutions;
  substitutions.nameIn =
    case h1 of
      parameterDecl([], typedefTypeExpr(nilQualifier(), id), baseTypeExpr(), nothingName(), nilAttribute()) -> id.name
    | _ -> ""
    end;
  top.substituted =
    case substitutions.parametersSub of
      just(sub) -> sub
    | nothing() -> consParameters(h.substituted, t.substituted)
    end;
}
aspect production nilParameters
top::Parameters ::=
{
  propagate substituted;
}


aspect production parameterDecl
top::ParameterDecl ::= storage::[StorageClass]  bty::BaseTypeExpr  mty::TypeModifierExpr  name::MaybeName  attrs::Attributes
{
  propagate substituted;
}


aspect production structDecl
top::StructDecl ::= attrs::Attributes  name::MaybeName  dcls::StructItemList
{
  propagate substituted;
}

aspect production unionDecl
top::UnionDecl ::= attrs::Attributes  name::MaybeName  dcls::StructItemList
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
top::StructItem ::= attrs::Attributes  ty::BaseTypeExpr  dcls::StructDeclarators
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
top::StructDeclarator ::= name::Name  ty::TypeModifierExpr  attrs::Attributes
{
  propagate substituted;
}
aspect production structBitfield
top::StructDeclarator ::= name::MaybeName  ty::TypeModifierExpr  e::Expr  attrs::Attributes
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
