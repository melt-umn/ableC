

aspect production nothingInitializer
top::MaybeInitializer ::=
{
  propagate substituted;
}
aspect production justInitializer
top::MaybeInitializer ::= i::Initializer
{
  propagate substituted;
}


aspect production exprInitializer
top::Initializer ::= e::Expr
{
  propagate substituted;
}

aspect production objectInitializer
top::Initializer ::= l::InitList
{
  propagate substituted;
}


aspect production consInit
top::InitList ::= h::Init  t::InitList
{
  propagate substituted;
}

aspect production nilInit
top::InitList ::=
{
  propagate substituted;
}


aspect production init
top::Init ::= i::Initializer
{
  propagate substituted;
}

aspect production designatedInit
top::Init ::= d::Designator  i::Initializer
{
  propagate substituted;
}



aspect production initialDesignator
top::Designator ::=
{
  propagate substituted;
}

aspect production fieldDesignator
top::Designator ::= d::Designator  f::Name
{
  propagate substituted;
}

aspect production arrayDesignator
top::Designator ::= d::Designator  e::Expr
{
  propagate substituted;
}

aspect production arrayRangeDesignator
top::Designator ::= d::Designator  l::Expr  u::Expr
{
  propagate substituted;
}

