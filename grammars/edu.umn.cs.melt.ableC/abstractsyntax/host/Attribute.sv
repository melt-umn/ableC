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

propagate host on Attributes, Attribute, Attrib, AttribName;

nonterminal Attributes with pps, host, env, returnType;
flowtype Attributes = decorate {env, returnType};

abstract production consAttribute
top::Attributes ::= h::Attribute t::Attributes
{
  top.pps = h.pp :: t.pps;
}

abstract production nilAttribute
top::Attributes ::= 
{
  top.pps = [];
}

{-- __attribute__ syntax representation -}
nonterminal Attribute with pp, host, env, returnType;
flowtype Attribute = decorate {env, returnType};

abstract production gccAttribute
top::Attribute ::= l::Attribs
{
  top.pp = ppConcat([text("__attribute__(("), l.pp, text("))")]);
}

abstract production simpleAsm
top::Attribute ::= s::String
{
  top.pp = text("__asm__(" ++ s ++ ")");
}

nonterminal Attribs with pp, host, env, returnType;
flowtype Attribs = decorate {env, returnType};

abstract production consAttrib
top::Attribs ::= h::Attrib t::Attribs
{
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
  propagate host;
  top.pp = text("");
}

nonterminal Attrib with pp, host, env, returnType;
flowtype Attrib = decorate {env, returnType};

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
  top.pp = ppConcat([n.pp, parens(ppImplode(text(", "), e.pps))]);
}
-- e.g. __attribute__((something(foo, "well whatever")))
-- OR __attribute__((something(foo)))
abstract production idAppliedAttrib
top::Attrib ::= n::AttribName  id::Name  e::Exprs
{
  top.pp = ppConcat([n.pp, parens(ppImplode(text(", "), id.pp :: e.pps))]);
  top.isHostAttrib = true;
}

nonterminal AttribName with pp, env, host;
flowtype AttribName = decorate {env};

abstract production attribName
top::AttribName ::= n::Name
{
  top.pp = n.pp;
}

