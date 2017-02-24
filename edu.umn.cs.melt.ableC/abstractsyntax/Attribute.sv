
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
nonterminal Attribute with pp, host<Attribute>, lifted<Attribute>, substituted<Attribute>, env, substitutions, returnType;

abstract production gccAttribute
top::Attribute ::= l::Attribs
{
  propagate host, lifted, substituted;
  top.pp = concat([text("__attribute__(("), l.pp, text("))")]);
}

abstract production simpleAsm
top::Attribute ::= s::String
{
  propagate host, lifted, substituted;
  top.pp = text("__asm__(" ++ s ++ ")");
}

nonterminal Attribs with pp, host<Attribs>, lifted<Attribs>, substituted<Attribs>, env, substitutions, returnType;

abstract production consAttrib
top::Attribs ::= h::Attrib t::Attribs
{
  propagate host, lifted, substituted;
  top.pp =
    if h.attribNeedsTrans
    then case t of
           consAttrib(_, _) -> pp"${h.pp}, ${t.pp}"
         | nilAttrib() -> h.pp
         end
    else t.pp;
}

abstract production nilAttrib
top::Attribs ::= 
{
  propagate host, lifted, substituted;
  top.pp = text("");
}

synthesized attribute attribNeedsTrans::Boolean;
nonterminal Attrib with pp, host<Attrib>, lifted<Attrib>, substituted<Attrib>, env, substitutions, attribNeedsTrans, returnType;

-- e.g. __attribute__(())
abstract production emptyAttrib
top::Attrib ::=
{
  propagate host, lifted, substituted;
  top.pp = notext();
  top.attribNeedsTrans = true;
}
-- e.g. __attribute__((deprecated))
abstract production wordAttrib
top::Attrib ::= n::AttribName
{
  propagate host, lifted, substituted;
  top.pp = n.pp;
  top.attribNeedsTrans = true;
}
-- e.g. __attribute__((deprecated("don't use this duh")))
abstract production appliedAttrib
top::Attrib ::= n::AttribName  e::Exprs
{
  propagate host, lifted, substituted;
  top.pp = concat([n.pp, parens(ppImplode(text(", "), e.pps))]);
  top.attribNeedsTrans =
    case n of
      attribName(name("refId")) -> false
    | _ -> true
    end;
}
-- e.g. __attribute__((something(foo, "well whatever")))
-- OR __attribute__((something(foo)))
abstract production idAppliedAttrib
top::Attrib ::= n::AttribName  id::Name  e::Exprs
{
  propagate host, lifted, substituted;
  top.pp = concat([n.pp, parens(ppImplode(text(", "), id.pp :: e.pps))]);
  top.attribNeedsTrans = true;
}


nonterminal AttribName with pp, host<AttribName>, lifted<AttribName>, substituted<AttribName>;

abstract production attribName
top::AttribName ::= n::Name
{
  propagate host, lifted, substituted;
  top.pp = n.pp;
}

