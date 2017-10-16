grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

function ppAttributes
Document ::= l::Attributes
{
  return terminate(space(), l.pps);
}
function ppAttributesRHS
Document ::= l::Attributes
{
  return initiate(space(), l.pps);
}

function appendAttribute
Attributes ::= l1::Attributes l2::Attributes
{
  return
    case l1 of
      nilAttribute() -> l2
    | consAttribute(h, t) -> consAttribute(h, appendAttribute(t, l2))
    end;
}

abstract production consAttribute
top::Attributes ::= h::Attribute t::Attributes
{
  propagate host, lifted;
  top.pps = h.pp :: t.pps;
}

abstract production nilAttribute
top::Attributes ::= 
{
  propagate host, lifted;
  top.pps = [];
}

abstract production gccAttribute
top::Attribute ::= l::Attribs
{
  propagate host, lifted;
  top.pp = ppConcat([text("__attribute__(("), l.pp, text("))")]);
}

abstract production simpleAsm
top::Attribute ::= s::String
{
  propagate host, lifted;
  top.pp = text("__asm__(" ++ s ++ ")");
}

-- e.g. __attribute__(())
abstract production emptyAttrib
top::Attrib ::=
{
  propagate host, lifted;
  top.pp = notext();
}
-- e.g. __attribute__((deprecated))
abstract production wordAttrib
top::Attrib ::= n::AttribName
{
  propagate host, lifted;
  top.pp = n.pp;
}
-- e.g. __attribute__((deprecated("don't use this duh")))
abstract production appliedAttrib
top::Attrib ::= n::AttribName  e::Exprs
{
  propagate host, lifted;
  top.pp = ppConcat([n.pp, parens(ppImplode(text(", "), e.pps))]);
}
-- e.g. __attribute__((something(foo, "well whatever")))
-- OR __attribute__((something(foo)))
abstract production idAppliedAttrib
top::Attrib ::= n::AttribName  id::Name  e::Exprs
{
  propagate host, lifted;
  top.pp = ppConcat([n.pp, parens(ppImplode(text(", "), id.pp :: e.pps))]);
  top.isHostAttrib = true;
}

abstract production attribName
top::AttribName ::= n::Name
{
  propagate host, lifted;
  top.pp = n.pp;
}

