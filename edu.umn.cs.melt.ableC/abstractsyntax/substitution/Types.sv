grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

 -- TODO: Should we really bother performing substitutions on Types?  
 -- Not possible in host AST anyway, can't think of why someone would want to do this.  

aspect production errorType
top::Type ::=
{
  propagate substituted;
}
aspect production builtinType
top::Type ::= q::[Qualifier]  bt::BuiltinType
{
  propagate substituted;
}
aspect production pointerType
top::Type ::= q::[Qualifier]  target::Type
{
  propagate substituted;
}
aspect production arrayType
top::Type ::= element::Type  indexQualifiers::[Qualifier]  sizeModifier::ArraySizeModifier  sub::ArrayType
{
  propagate substituted;
}

aspect production constantArrayType
top::ArrayType ::= size::Integer
{
  propagate substituted;
}
aspect production incompleteArrayType
top::ArrayType ::=
{
  propagate substituted;
}
aspect production variableArrayType
top::ArrayType ::= size::Decorated Expr
{
  propagate substituted;
}

aspect production functionType
top::Type ::= result::Type  sub::FunctionType
{
  propagate substituted;
}

aspect production protoFunctionType
top::FunctionType ::= args::[Type]  variadic::Boolean
{
  propagate substituted;
}
aspect production noProtoFunctionType
top::FunctionType ::=
{
  propagate substituted;
}

aspect production tagType
top::Type ::= q::[Qualifier]  sub::TagType
{
  propagate substituted;
}

aspect production enumTagType
top::TagType ::= ref::Decorated EnumDecl
{
  propagate substituted;
}
aspect production refIdTagType
top::TagType ::= kwd::StructOrEnumOrUnion  name::String  refId::String
{
  propagate substituted;
}

aspect production atomicType
top::Type ::= q::[Qualifier]  bt::Type
{
  propagate substituted;
}
aspect production vectorType
top::Type ::= bt::Type  bytes::Integer
{
  propagate substituted;
}
aspect production noncanonicalType
top::Type ::= sub::NoncanonicalType
{
  propagate substituted;
}

aspect production resolvedType
top::NoncanonicalType ::= resolved::Type
{
  propagate substituted;
}
aspect production parenType
top::NoncanonicalType ::= wrapped::Type
{
  propagate substituted;
}
aspect production decayedType
top::NoncanonicalType ::= original::Type  pointer::Type
{
  propagate substituted;
}
aspect production typedefType
top::NoncanonicalType ::= q::[Qualifier]  n::String  resolved::Type
{
  local substitutions::Substitutions = top.substitutions;
  substitutions.nameIn = n;
  top.substituted =
    case substitutions.typedefSub of
      just(sub) -> resolvedType(sub)
    | nothing() -> typedefType(q, n, resolved.substituted) -- TODO: handle nameSub
    end;
}

aspect production typeofType
top::NoncanonicalType ::= q::[Qualifier]  resolved::Type
{
  propagate substituted;
}
