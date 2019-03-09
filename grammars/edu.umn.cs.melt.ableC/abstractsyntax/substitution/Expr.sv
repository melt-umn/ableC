grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

aspect production errorExpr
top::Expr ::= msg::[Message]
{
  propagate substituted;
}
aspect production warnExpr
top::Expr ::= msg::[Message] e::Expr
{
  propagate substituted;
}
aspect production decExpr
top::Expr ::= e::Decorated Expr
{
  local newE::Expr = new(e);
  newE.substitutions = top.substitutions;
  top.substituted = newE.substituted;
}
aspect production transformedExpr
top::Expr ::= original::Expr  resolved::Expr
{
  propagate substituted;
}
aspect production directRefExpr
top::Expr ::= id::Name
{
  local substitutions::Substitutions = top.substitutions;
  substitutions.nameIn = id.name;
  top.substituted =
    case substitutions.declRefSub, substitutions.declRefLocSub of
    | just(sub), _ -> sub
    | nothing(), just(sub) -> sub(top.location)
    | _, _ -> directRefExpr(id.substituted, location=top.location)
    end;
}
aspect production declRefExpr
top::Expr ::= id::Name
{
  local substitutions::Substitutions = top.substitutions;
  substitutions.nameIn = id.name;
  top.substituted =
    case substitutions.declRefSub, substitutions.declRefLocSub of
    | just(sub), _ -> sub
    | nothing(), just(sub) -> sub(top.location)
    | _, _ -> declRefExpr(id.substituted, location=top.location)
    end;
}
aspect production stringLiteral
top::Expr ::= l::String
{
  propagate substituted;
}
aspect production parenExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  propagate substituted;
}
aspect production directCallExpr
top::Expr ::= f::Name  a::Exprs
{
  local substitutions::Substitutions = top.substitutions;
  substitutions.nameIn = f.name;
  top.substituted =
    case substitutions.declRefSub, substitutions.declRefLocSub of
    | just(sub), _ -> callExpr(sub, a.substituted, location=top.location)
    | nothing(), just(sub) -> callExpr(sub(top.location), a.substituted, location=top.location)
    | _, _ -> directCallExpr(f.substituted, a.substituted, location=top.location)
    end;
}
aspect production callExpr
top::Expr ::= f::Expr  a::Exprs
{
  propagate substituted;
}
aspect production memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  propagate substituted;
}
aspect production qualifiedExpr
top::Expr ::= q::Qualifiers e::Expr
{
  propagate substituted;
}
aspect production conditionalExpr
top::Expr ::= cond::Expr  t::Expr  e::Expr
{
  propagate substituted;
}
aspect production binaryConditionalExpr -- GCC extension.
top::Expr ::= cond::Expr  e::Expr
{
  propagate substituted;
}
aspect production explicitCastExpr
top::Expr ::= ty::TypeName  e::Expr
{
  propagate substituted;
}
aspect production compoundLiteralExpr
top::Expr ::= ty::TypeName  init::InitList
{
  propagate substituted;
}
aspect production predefinedFuncExpr
top::Expr ::= 
{
  propagate substituted;
}
aspect production genericSelectionExpr
top::Expr ::= e::Expr  gl::GenericAssocs  def::MaybeExpr
{
  propagate substituted;
}

aspect production consGenericAssoc
top::GenericAssocs ::= h::GenericAssoc  t::GenericAssocs
{
  propagate substituted;
}
aspect production nilGenericAssoc
top::GenericAssocs ::=
{
  propagate substituted;
}


aspect production genericAssoc
top::GenericAssoc ::= ty::TypeName  fun::Expr
{
  propagate substituted;
}

aspect production stmtExpr
top::Expr ::= body::Stmt result::Expr
{
  propagate substituted;
}

aspect production comment
top::Expr ::= s::String
{
  propagate substituted;
}
aspect production ovrld:explicitCastExpr
top::Expr ::= ty::TypeName e::Expr
{
  propagate substituted;
}
aspect production ovrld:arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  propagate substituted;
}
aspect production ovrld:callExpr
top::Expr ::= f::Expr  a::Exprs
{
  propagate substituted;
}
aspect production ovrld:memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  propagate substituted;
}

aspect production inj:explicitCastExpr
top::Expr ::= ty::TypeName e::Expr
{
  propagate substituted;
}
aspect production inj:arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  propagate substituted;
}
aspect production inj:memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  propagate substituted;
}
aspect production inj:callExpr
top::Expr ::= f::Expr  a::Exprs
{
  propagate substituted;
}
