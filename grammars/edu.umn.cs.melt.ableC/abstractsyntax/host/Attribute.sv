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

tracked nonterminal Attributes with pps, host, env, envScope, controlStmtContext;
flowtype Attributes = decorate {env, envScope, controlStmtContext};

abstract production consAttribute
top::Attributes ::= h::Attribute t::Attributes
{
  propagate env, envScope, controlStmtContext;
  top.pps = h.pp :: t.pps;
}

abstract production nilAttribute
top::Attributes ::=
{
  top.pps = [];
}

{-- __attribute__ syntax representation -}
tracked nonterminal Attribute with pp, host, env, envScope, controlStmtContext;
flowtype Attribute = decorate {env, envScope, controlStmtContext};

abstract production gccAttribute
top::Attribute ::= l::Attribs
{
  propagate env, envScope, controlStmtContext;
  top.pp = ppConcat([text("__attribute__(("), l.pp, text("))")]);
}

abstract production simpleAsm
top::Attribute ::= s::String
{
  top.pp = text("__asm__(" ++ s ++ ")");
}

tracked nonterminal Attribs with pp, host, env, envScope, controlStmtContext;
flowtype Attribs = decorate {env, envScope, controlStmtContext};

abstract production consAttrib
top::Attribs ::= h::Attrib t::Attribs
{
  propagate env, envScope, controlStmtContext;

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

tracked nonterminal Attrib with pp, host, env, envScope, controlStmtContext;
flowtype Attrib = decorate {env, envScope, controlStmtContext};

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
  propagate env, envScope;
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
  propagate env, envScope, controlStmtContext;
  top.pp = ppConcat([n.pp, parens(ppImplode(text(", "), id.pp :: e.pps))]);
  top.isHostAttrib = true;
}

tracked nonterminal AttribName with pp, env, envScope, host;
flowtype AttribName = decorate {env, envScope};

abstract production attribName
top::AttribName ::= n::Name
{
  propagate env, envScope;
  top.pp = n.pp;
}