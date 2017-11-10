grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;



aspect production nullStmt
top::Stmt ::=
{
  propagate substituted;
}

aspect production seqStmt
top::Stmt ::= h::Stmt  t::Stmt
{
  propagate substituted;
}

aspect production compoundStmt
top::Stmt ::= s::Stmt
{
  propagate substituted;
}

aspect production warnStmt
top::Stmt ::= msg::[Message]
{
  propagate substituted;
}

aspect production declStmt
top::Stmt ::= d::Decl
{
  propagate substituted;
}

-- TODO: remove this
aspect production basicVarDeclStmt
top::Stmt ::= t::Type n::Name init::Expr
{
  --propagate substituted;
}

aspect production exprStmt
top::Stmt ::= d::Expr
{
  -- Since we pattern match on d, we need to supply its forward dependancies
  -- We don't really care about these, since all we want to know is whether d is a declRefExpr.
  local d1::Expr = d;
  d1.env = emptyEnv();
  d1.labelEnv = [];
  d1.returnType = nothing();

  local substitutions::Substitutions = top.substitutions;
  substitutions.nameIn =
    case d1 of
      declRefExpr(id) -> id.name
    | _ -> ""
    end;
  top.substituted =
    case substitutions.stmtSub of
      just(sub) -> sub
    | nothing() -> exprStmt(d.substituted)
    end;
}

aspect production ifStmt
top::Stmt ::= c::Expr  t::Stmt  e::Stmt
{
  propagate substituted;
}

aspect production ifStmtNoElse
top::Stmt ::= c::Expr  t::Stmt
{
  propagate substituted;
}

aspect production whileStmt
top::Stmt ::= e::Expr  b::Stmt
{
  propagate substituted;
}

aspect production doStmt
top::Stmt ::= b::Stmt  e::Expr
{
  propagate substituted;
}

aspect production forStmt
top::Stmt ::= i::MaybeExpr  c::MaybeExpr  s::MaybeExpr  b::Stmt
{
  propagate substituted;
}

aspect production gotoStmt
top::Stmt ::= l::Name
{
  propagate substituted;
}

aspect production continueStmt
top::Stmt ::=
{
  propagate substituted;
}

aspect production breakStmt
top::Stmt ::=
{
  propagate substituted;
}

aspect production labelStmt
top::Stmt ::= l::Name  s::Stmt
{
  propagate substituted;
}

aspect production caseLabelStmt
top::Stmt ::= v::Expr  s::Stmt
{
  propagate substituted;
}

aspect production defaultLabelStmt
top::Stmt ::= s::Stmt
{
  propagate substituted;
}

aspect production functionDeclStmt
top::Stmt ::= d::FunctionDecl
{
  propagate substituted;
}

aspect production forDeclStmt
top::Stmt ::= i::Decl  c::MaybeExpr  s::MaybeExpr  b::Stmt
{
  propagate substituted;
}

aspect production returnStmt
top::Stmt ::= e::MaybeExpr
{
  propagate substituted;
}

aspect production switchStmt
top::Stmt ::= e::Expr  b::Stmt
{
  propagate substituted;
}

aspect production caseLabelRangeStmt
top::Stmt ::= l::Expr  u::Expr  s::Stmt
{
  propagate substituted;
}

aspect production asmStmt
top::Stmt ::= asm::AsmStatement
{
  propagate substituted;
}
