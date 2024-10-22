
function fromId
Name ::= n::cst:Identifier_t
{
  return name(n.lexeme);
}
function fromTy
Name ::= n::cst:TypeName_t
{
  return name(n.lexeme);
}

