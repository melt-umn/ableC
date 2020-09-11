grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

propagate host, errors, globalDecls, functionDecls, defs on MaybeInitializer, Initializer, InitList, Init, Designator;
propagate freeVariables on MaybeInitializer, Initializer, Init, Designator;

nonterminal MaybeInitializer with pp, host, errors, globalDecls, functionDecls, defs, env, freeVariables, returnType;
flowtype MaybeInitializer = decorate {env, returnType};

abstract production nothingInitializer
top::MaybeInitializer ::=
{
  top.pp = notext();
}
abstract production justInitializer
top::MaybeInitializer ::= i::Initializer
{
  top.pp = ppConcat([ text(" = "), i.pp ]);
}

nonterminal Initializer with pp, host, errors, globalDecls, functionDecls, defs, env, freeVariables, returnType;
flowtype Initializer = decorate {env, returnType};

abstract production exprInitializer
top::Initializer ::= e::Expr
{
  top.pp = e.pp;
}

abstract production objectInitializer
top::Initializer ::= l::InitList
{
  top.pp = ppConcat([text("{"), ppImplode(text(", "), l.pps), text("}")]);
}

nonterminal InitList with pps, host, errors, globalDecls, functionDecls, defs, env, freeVariables, returnType;
flowtype InitList = decorate {env, returnType};

abstract production consInit
top::InitList ::= h::Init  t::InitList
{
  top.pps = h.pp :: t.pps;
  top.freeVariables := h.freeVariables ++ removeDefsFromNames(h.defs, t.freeVariables);
  
  t.env = addEnv(h.defs, h.env);
}

abstract production nilInit
top::InitList ::=
{
  top.pps = [];
  top.freeVariables := [];
}

nonterminal Init with pp, host, errors, globalDecls, functionDecls, defs, env, freeVariables, returnType;
flowtype Init = decorate {env, returnType};

abstract production positionalInit
top::Init ::= i::Initializer
{
  top.pp = i.pp;
}

abstract production designatedInit
top::Init ::= d::Designator  i::Initializer
{
  top.pp = ppConcat([d.pp, text(" = "), i.pp]);
  
  i.env = addEnv(d.defs, d.env);
}

{--
 - Tree access pattern for designators.
 - e.g.  "[1].d[0] = e" gives "array(0, field(d, array(1, initial)))"
 -}
nonterminal Designator with pp, host, errors, globalDecls, functionDecls, defs, env, freeVariables, returnType;
flowtype Designator = decorate {env, returnType};

abstract production initialDesignator
top::Designator ::=
{
  top.pp = notext();
}

abstract production fieldDesignator
top::Designator ::= d::Designator  f::Name
{
  top.pp = ppConcat([d.pp, text("."), f.pp]);
}

abstract production arrayDesignator
top::Designator ::= d::Designator  e::Expr
{
  top.pp = ppConcat([d.pp, text("["), e.pp, text("]")]);
  
  e.env = addEnv(d.defs, d.env);
}

-- GCC extension
abstract production arrayRangeDesignator
top::Designator ::= d::Designator  l::Expr  u::Expr
{
  top.pp = ppConcat([d.pp, text("["), l.pp, text("..."), u.pp, text("]")]);
}

