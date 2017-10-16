
nonterminal Attributes with pps, host<Attributes>, lifted<Attributes>, env, returnType;
flowtype Attributes = decorate {env, returnType};

{-- __attribute__ syntax representation -}
nonterminal Attribute with pp, host<Attribute>, lifted<Attribute>, env, returnType;
flowtype Attribute = decorate {env, returnType};

nonterminal Attribs with pp, host<Attribs>, lifted<Attribs>, env, returnType;
flowtype Attribs = decorate {env, returnType};

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

nonterminal Attrib with pp, host<Attrib>, lifted<Attrib>, env, returnType;
flowtype Attrib = decorate {env, returnType};

nonterminal AttribName with pp, env, host<AttribName>, lifted<AttribName>;
flowtype AttribName = decorate {env};

