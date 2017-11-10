
aspect production justExpr
top::MaybeExpr ::= e::Expr
{
  propagate substituted;
}
aspect production nothingExpr
top::MaybeExpr ::=
{
  propagate substituted;
}

aspect production consExpr
top::Exprs ::= h::Expr  t::Exprs
{
  -- Since we pattern match on h, we need to supply its forward dependancies
  -- We don't really care about these, since all we want to know is whether h is a declRefExpr.
  local h1::Expr = h;
  h1.env = emptyEnv();
  h1.labelEnv = [];
  h1.returnType = nothing();
  
  local substitutions::Substitutions = top.substitutions;
  substitutions.nameIn =
    case h1 of
      declRefExpr(id) -> id.name
    | _ -> ""
    end;
  top.substituted =
    case substitutions.exprsSub of
      just(sub) -> sub
    | nothing() -> consExpr(h.substituted, t.substituted)
    end;
}
aspect production nilExpr
top::Exprs ::=
{
  propagate substituted;
}

aspect production exprExpr
top::ExprOrTypeName ::= e::Expr
{
  propagate substituted;
}
aspect production typeNameExpr
top::ExprOrTypeName ::= ty::TypeName
{
  propagate substituted;
}


