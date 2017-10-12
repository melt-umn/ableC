grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;


aspect production seedingForwardsToEquationDependencies
top::Expr ::=
{
  top.substituted = error("hack");
}

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
aspect production declRefExpr
top::Expr ::= id::Name
{
  local substitutions::Substitutions = top.substitutions;
  substitutions.nameIn = id.name;
  top.substituted =
    case substitutions.declRefSub of
      just(sub) -> sub
    | nothing() -> declRefExpr(id.substituted, location=top.location)
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
aspect production dereferenceExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production dereferenceHostExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  propagate substituted;
}
aspect production unaryOpHostExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  propagate substituted;
}
aspect production unaryExprOrTypeTraitExpr
top::Expr ::= op::UnaryTypeOp  e::ExprOrTypeName
{
  propagate substituted;
}
aspect production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  propagate substituted;
}
aspect production arraySubscriptHostExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  propagate substituted;
}
aspect production directCallExpr
top::Expr ::= f::Name  a::Exprs
{
  propagate substituted;
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
aspect production memberHostExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  propagate substituted;
}
aspect production qualifiedExpr
top::Expr ::= q::Qualifiers e::Expr
{
  propagate substituted;
}
aspect production addExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  propagate substituted;
}
aspect production addHostExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate substituted;
}
aspect production subtractExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  propagate substituted;
}
aspect production subtractHostExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate substituted;
}
aspect production binaryOpExpr
top::Expr ::= lhs::Expr  op::BinOp  rhs::Expr
{
  propagate substituted;
}
aspect production binaryOpHostExpr
top::Expr ::= lhs::Expr  op::BinOp  rhs::Expr
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
aspect production explicitCastHostExpr
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

aspect production ovrld:dereferenceExpr
top::Expr ::= e::Expr
{
  propagate substituted;
}
aspect production ovrld:unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
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
aspect production ovrld:addExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  propagate substituted;
}
aspect production ovrld:subtractExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  propagate substituted;
}
aspect production ovrld:binaryOpExpr
top::Expr ::= lhs::Expr  op::BinOp  rhs::Expr
{
  propagate substituted;
}
