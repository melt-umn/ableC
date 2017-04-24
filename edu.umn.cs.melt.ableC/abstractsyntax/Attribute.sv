
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

nonterminal Attributes with pps, host<Attributes>, lifted<Attributes>, env, returnType;

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

{-- __attribute__ syntax representation -}
nonterminal Attribute with pp, host<Attribute>, lifted<Attribute>, env, returnType;

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

nonterminal Attribs with pp, host<Attribs>, lifted<Attribs>, env, returnType;

abstract production consAttrib
top::Attribs ::= h::Attrib t::Attribs
{
  propagate lifted;
  top.host = if h.isHostAttrib then consAttrib(h.host, t.host) else t.host;
  top.pp =
    case t of
    | consAttrib(_, _) -> pp"${h.pp}, ${t.pp}"
    | nilAttrib() -> h.pp
    end;
}

abstract production nilAttrib
top::Attribs ::= 
{
  propagate host, lifted;
  top.pp = text("");
}

synthesized attribute isHostAttrib::Boolean;
nonterminal Attrib with pp, host<Attrib>, lifted<Attrib>, env, isHostAttrib, returnType;

-- e.g. __attribute__(())
abstract production emptyAttrib
top::Attrib ::=
{
  propagate host, lifted;
  top.pp = notext();
  top.isHostAttrib = true;
}
-- e.g. __attribute__((deprecated))
abstract production wordAttrib
top::Attrib ::= n::AttribName
{
  propagate host, lifted;
  top.pp = n.pp;
  top.isHostAttrib = true;
}
-- e.g. __attribute__((deprecated("don't use this duh")))
abstract production appliedAttrib
top::Attrib ::= n::AttribName  e::Exprs
{
  propagate host, lifted;
  top.pp = ppConcat([n.pp, parens(ppImplode(text(", "), e.pps))]);
  top.isHostAttrib =
    case n of
      attribName(name("refId")) -> false
    | attribName(name("module")) -> false
    | _ -> true
    end;
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


nonterminal AttribName with pp, host<AttribName>, lifted<AttribName>;

abstract production attribName
top::AttribName ::= n::Name
{
  propagate host, lifted;
  top.pp = n.pp;
}

