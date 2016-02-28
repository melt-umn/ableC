
function ppAttributes
Document ::= l::[Attribute]  env::Decorated Env
{
  return terminate(space(), map(ppAttribute(_, env), l));
}
function ppAttributesRHS
Document ::= l::[Attribute]  env::Decorated Env
{
  return initiate(space(), map(ppAttribute(_, env), l));
}


function ppAttribute
Document ::= a::Attribute env::Decorated Env
{
  a.env = env;
  a.returnType = nothing(); -- TODO: fix flow dependencies
  return a.pp;
}
function ppAttrib
Document ::= a::Attrib env::Decorated Env
{
  a.env = env;
  a.returnType = nothing(); -- TODO: fix flow dependencies
  return a.pp;
}

{-- __attribute__ syntax representation -}
nonterminal Attribute with pp, host<Attribute>, env, returnType;

abstract production gccAttribute
top::Attribute ::= l::[Attrib]
{
  propagate host;
  top.pp = concat([text("__attribute__(("), ppImplode(text(", "), map(ppAttrib(_, top.env), filter((.attribNeedsTrans), l))), text("))")]);
}

abstract production simpleAsm
top::Attribute ::= s::String
{
  propagate host;
  top.pp = text("__asm__(" ++ s ++ ")");
}

synthesized attribute attribNeedsTrans::Boolean;
nonterminal Attrib with pp, host<Attrib>, attribNeedsTrans, env, returnType;

-- e.g. __attribute__(())
abstract production emptyAttrib
top::Attrib ::=
{
  propagate host;
  top.pp = notext();
  top.attribNeedsTrans = true;
}
-- e.g. __attribute__((deprecated))
abstract production wordAttrib
top::Attrib ::= n::AttribName
{
  propagate host;
  top.pp = n.pp;
  top.attribNeedsTrans = true;
}
-- e.g. __attribute__((deprecated("don't use this duh")))
abstract production appliedAttrib
top::Attrib ::= n::AttribName  e::Exprs
{
  propagate host;
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
  propagate host;
  top.pp = concat([n.pp, parens(ppImplode(text(", "), id.pp :: e.pps))]);
  top.attribNeedsTrans = true;
}


nonterminal AttribName with pp, host<AttribName>, env;

abstract production attribName
top::AttribName ::= n::Name
{
  propagate host;
  top.pp = n.pp;
}

