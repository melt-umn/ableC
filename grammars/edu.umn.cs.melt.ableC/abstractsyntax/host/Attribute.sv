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
      nilAttribute() -> ^l2
    | consAttribute(h, t) -> consAttribute(^h, appendAttribute(^t, ^l2))
    end;
}

propagate host on Attributes, Attribute, Attrib, AttribName;

tracked nonterminal Attributes with pps, host, env, controlStmtContext;
flowtype Attributes = decorate {env, controlStmtContext};

abstract production consAttribute
top::Attributes ::= h::Attribute t::Attributes
{
  propagate env, controlStmtContext;
  top.pps = h.pp :: t.pps;
}

abstract production nilAttribute
top::Attributes ::=
{
  top.pps = [];
}

{-- __attribute__ syntax representation -}
tracked nonterminal Attribute with pp, host, env, controlStmtContext;
flowtype Attribute = decorate {env, controlStmtContext};

abstract production gccAttribute
top::Attribute ::= l::Attribs
{
  propagate env, controlStmtContext;
  top.pp = ppConcat([text("__attribute__(("), l.pp, text("))")]);
}

abstract production simpleAsm
top::Attribute ::= s::String
{
  top.pp = text("__asm__(" ++ s ++ ")");
}

tracked nonterminal Attribs with pp, host, env, controlStmtContext;
flowtype Attribs = decorate {env, controlStmtContext};

abstract production consAttrib
top::Attribs ::= h::Attrib t::Attribs
{
  propagate env, controlStmtContext;

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

tracked nonterminal Attrib with pp, host, env, controlStmtContext;
flowtype Attrib = decorate {env, controlStmtContext};

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
  propagate env;
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
  propagate env, controlStmtContext;
  top.pp = ppConcat([n.pp, parens(ppImplode(text(", "), id.pp :: e.pps))]);
  top.isHostAttrib = true;
}

tracked nonterminal AttribName with pp, env, host;
flowtype AttribName = decorate {env};

abstract production attribName
top::AttribName ::= n::Name
{
  propagate env;
  top.pp = n.pp;
}