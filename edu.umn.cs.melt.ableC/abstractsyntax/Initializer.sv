
nonterminal MaybeInitializer with pp, host<MaybeInitializer>, lifted<MaybeInitializer>, errors, globalDecls, defs, env, freeVariables, returnType;
--nonterminal MaybeInitializer with pp, host<MaybeInitializer>, lifted<MaybeInitializer>, errors, globalDecls, defs, env, freeVariables, returnType, inferredQualsIn;

abstract production nothingInitializer
top::MaybeInitializer ::=
{
  propagate host, lifted;
  top.pp = notext();
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
}
abstract production justInitializer
top::MaybeInitializer ::= i::Initializer
{
  propagate host, lifted;
  top.pp = ppConcat([ text(" = "), i.pp ]);
  top.errors := i.errors;
  top.globalDecls := i.globalDecls;
  top.defs := i.defs;
  top.freeVariables = i.freeVariables;
}

nonterminal Initializer with pp, host<Initializer>, lifted<Initializer>, errors, globalDecls, defs, env, freeVariables, returnType;
--nonterminal Initializer with pp, host<Initializer>, lifted<Initializer>, errors, globalDecls, defs, env, freeVariables, returnType, inferredQualsIn;

abstract production exprInitializer
top::Initializer ::= e::Expr
{
  propagate host, lifted;
  top.pp = e.pp;
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.defs := e.defs;
  top.freeVariables = e.freeVariables;
}

abstract production objectInitializer
top::Initializer ::= l::InitList
{
  propagate host, lifted;
  top.pp = ppConcat([text("{"), ppImplode(text(", "), l.pps), text("}")]);
  top.errors := l.errors;
  top.globalDecls := l.globalDecls;
  top.defs := l.defs;
  top.freeVariables = l.freeVariables;
}

nonterminal InitList with pps, host<InitList>, lifted<InitList>, errors, globalDecls, defs, env, freeVariables, returnType;

abstract production consInit
top::InitList ::= h::Init  t::InitList
{
  propagate host, lifted;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.defs := h.defs ++ t.defs;
  top.freeVariables = h.freeVariables ++ removeDefsFromNames(h.defs, t.freeVariables);
  
  t.env = addEnv(h.defs, h.env);
}

abstract production nilInit
top::InitList ::=
{
  propagate host, lifted;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
}

nonterminal Init with pp, host<Init>, lifted<Init>, errors, globalDecls, defs, env, freeVariables, returnType;

abstract production init
top::Init ::= i::Initializer
{
  propagate host, lifted;
  top.pp = i.pp;
  top.errors := i.errors;
  top.globalDecls := i.globalDecls;
  top.defs := i.defs;
  top.freeVariables = i.freeVariables;
}

abstract production designatedInit
top::Init ::= d::Designator  i::Initializer
{
  propagate host, lifted;
  top.pp = ppConcat([d.pp, text(" = "), i.pp]);
  top.errors := d.errors ++ i.errors;
  top.globalDecls := d.globalDecls ++ i.globalDecls;
  top.defs := d.defs ++ i.defs;
  top.freeVariables = d.freeVariables ++ i.freeVariables;
  
  i.env = addEnv(d.defs, d.env);
}

{--
 - Tree access pattern for designators.
 - e.g.  "[1].d[0] = e" gives "array(0, field(d, array(1, initial)))"
 -}
nonterminal Designator with pp, host<Designator>, lifted<Designator>, errors, globalDecls, defs, env, freeVariables, returnType;

abstract production initialDesignator
top::Designator ::=
{
  propagate host, lifted;
  top.pp = notext();
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
}

abstract production fieldDesignator
top::Designator ::= d::Designator  f::Name
{
  propagate host, lifted;
  top.pp = ppConcat([d.pp, text("."), f.pp]);
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.defs := d.defs;
  top.freeVariables = d.freeVariables;
}

abstract production arrayDesignator
top::Designator ::= d::Designator  e::Expr
{
  propagate host, lifted;
  top.pp = ppConcat([d.pp, text("["), e.pp, text("]")]);
  top.errors := d.errors ++ e.errors;
  top.globalDecls := d.globalDecls ++ e.globalDecls;
  top.defs := d.defs ++ e.defs; -- Yep...
  top.freeVariables = d.freeVariables ++ e.freeVariables;
  
  e.env = addEnv(d.defs, d.env);
}

-- GCC extension
abstract production arrayRangeDesignator
top::Designator ::= d::Designator  l::Expr  u::Expr
{
  propagate host, lifted;
  top.pp = ppConcat([d.pp, text("["), l.pp, text("..."), u.pp, text("]")]);
  top.errors := d.errors ++ l.errors ++ u.errors;
  top.globalDecls := d.globalDecls ++ l.globalDecls ++ u.globalDecls;
  top.defs := d.defs ++ l.defs ++ u.defs;
  top.freeVariables = d.freeVariables ++ l.freeVariables ++ u.freeVariables;
}

