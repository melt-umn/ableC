
function ppAttributes
Document ::= l::[Attribute]
{
  return terminate(space(), map((.pp), l));
}
function ppAttributesRHS
Document ::= l::[Attribute]
{
  return initiate(space(), map((.pp), l));
}


{-- __attribute__ syntax representation -}
nonterminal Attribute with pp;

abstract production gccAttribute
top::Attribute ::= l::[Attrib]
{
  top.pp = concat([text("__attribute__(("), ppImplode(text(", "), map((.pp), l)), text("))")]);
}

abstract production simpleAsm
top::Attribute ::= s::String
{
  top.pp = text("__asm__(" ++ s ++ ")");
}


nonterminal Attrib with pp, env;

-- e.g. __attribute__(())
abstract production emptyAttrib
top::Attrib ::=
{
  top.pp = notext();
}
-- e.g. __attribute__((deprecated))
abstract production wordAttrib
top::Attrib ::= n::AttribName
{
  top.pp = n.pp;
}
-- e.g. __attribute__((deprecated("don't use this duh")))
abstract production appliedAttrib
top::Attrib ::= n::AttribName  e::Exprs
{
  top.pp = concat([n.pp, parens(ppImplode(text(", "), e.pps))]);
}
-- e.g. __attribute__((something(foo, "well whatever")))
-- OR __attribute__((something(foo)))
abstract production idAppliedAttrib
top::Attrib ::= n::AttribName  id::Name  e::Exprs
{
  top.pp = concat([n.pp, parens(ppImplode(text(", "), id.pp :: e.pps))]);
}


nonterminal AttribName with pp;

abstract production attribName
top::AttribName ::= n::Name
{
  top.pp = n.pp;
}

