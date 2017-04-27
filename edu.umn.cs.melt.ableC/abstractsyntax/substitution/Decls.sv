

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
  top.substituted =
    variableDecls(
      storage,
      map(
        \ a::Attribute -> decorate a with {substitutions = top.substitutions;}.substituted,
        attrs),
      ty.substituted,
      dcls.substituted);
}

aspect production typeExprDecl
top::Decl ::= attrs::[Attribute] ty::BaseTypeExpr
{
  top.substituted =
    typeExprDecl(
      map(
        \ a::Attribute -> decorate a with {substitutions = top.substitutions;}.substituted,
        attrs),
      ty.substituted);
}

aspect production typedefDecls
top::Decl ::= attrs::[Attribute]  ty::BaseTypeExpr  dcls::Declarators
{
  top.substituted =
    typedefDecls(
      map(
        \ a::Attribute -> decorate a with {substitutions = top.substitutions;}.substituted,
        attrs),
      ty.substituted,
      dcls.substituted);
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
  top.substituted =
    declarator(
      name.substituted,
      ty.substituted,
      map(
        \ a::Attribute -> decorate a with {substitutions = top.substitutions;}.substituted,
        attrs),
      initializer.substituted);
}

aspect production errorDeclarator
top::Declarator ::= msg::[Message]
{
  propagate substituted;
}

aspect production functionDecl
top::FunctionDecl ::= storage::[StorageClass]  fnquals::[SpecialSpecifier]  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::[Attribute]  decls::Decls  body::Stmt
{
  top.substituted =
    functionDecl(
      storage,
      fnquals,
      bty.substituted,
      mty.substituted,
      name.substituted,
      map(
        \ a::Attribute -> decorate a with {substitutions = top.substitutions;}.substituted,
        attrs),
      decls.substituted,
      body.substituted);
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
      parameterDecl([], typedefTypeExpr([], id), baseTypeExpr(), nothingName(), []) -> id.name
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
top::ParameterDecl ::= storage::[StorageClass]  bty::BaseTypeExpr  mty::TypeModifierExpr  name::MaybeName  attrs::[Attribute]
{
  top.substituted =
    parameterDecl(
      storage,
      bty.substituted,
      mty.substituted,
      name.substituted,
      map(
        \ a::Attribute -> decorate a with {substitutions = top.substitutions;}.substituted,
        attrs));
}


aspect production structDecl
top::StructDecl ::= attrs::[Attribute]  name::MaybeName  dcls::StructItemList
{
  top.substituted =
    structDecl(
      map(
        \ a::Attribute -> decorate a with {substitutions = top.substitutions;}.substituted,
        attrs),
      name.substituted,
      dcls.substituted,
      location=top.location);
}

aspect production unionDecl
top::UnionDecl ::= attrs::[Attribute]  name::MaybeName  dcls::StructItemList
{
  top.substituted =
    unionDecl(
      map(
        \ a::Attribute -> decorate a with {substitutions = top.substitutions;}.substituted,
        attrs),
      name.substituted,
      dcls.substituted,
      location=top.location);
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
  top.substituted =
    structItem(
      map(
        \ a::Attribute -> decorate a with {substitutions = top.substitutions;}.substituted,
        attrs),
      ty.substituted,
      dcls.substituted);
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
  top.substituted =
    structField(
      name.substituted,
      ty.substituted,
      map(
        \ a::Attribute -> decorate a with {substitutions = top.substitutions;}.substituted,
        attrs));
}
aspect production structBitfield
top::StructDeclarator ::= name::MaybeName  ty::TypeModifierExpr  e::Expr  attrs::[Attribute]
{
  top.substituted =
    structBitfield(
      name.substituted,
      ty.substituted,
      e.substituted,
      map(
        \ a::Attribute -> decorate a with {substitutions = top.substitutions;}.substituted,
        attrs));
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



