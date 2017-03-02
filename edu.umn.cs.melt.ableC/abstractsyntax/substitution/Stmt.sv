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

aspect production basicVarDeclStmt
top::Stmt ::= t::Type n::Name init::Expr
{
  propagate substituted;
}

aspect production exprStmt
top::Stmt ::= d::Expr
{
  propagate substituted;
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

aspect production hackUnusedStmt
top::Stmt ::=
{
  -- substituted doesn't depend on env
  top.substituted = error("hack");
}





