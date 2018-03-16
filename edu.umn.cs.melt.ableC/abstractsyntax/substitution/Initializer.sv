

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
  -- Since we pattern match on e, we need to supply its forward dependancies
  -- We don't really care about these, since all we want to know is whether e is a declRefExpr.
  local e1::Expr = e;
  e1.env = emptyEnv();
  e1.returnType = nothing();

  local substitutions::Substitutions = top.substitutions;
  substitutions.nameIn =
    case e1 of
      declRefExpr(id) -> id.name
    | _ -> ""
    end;
  top.substituted =
    case substitutions.initializerSub of
      just(sub) -> sub
    | nothing() -> exprInitializer(e.substituted)
    end;
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


aspect production positionalInit
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

