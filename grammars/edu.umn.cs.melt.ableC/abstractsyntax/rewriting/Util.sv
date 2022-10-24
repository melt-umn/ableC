grammar edu:umn:cs:melt:ableC:abstractsyntax:rewriting;

imports silver:core hiding all;
imports silver:rewrite;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;

-- Various generally-useful strategies for performing rewrites on ableC syntax trees

global normalizeDecProds::Strategy =
  rule on Decl of
  | decDecl(a) -> a
  end <+
  rule on Stmt of
  | decStmt(a) -> a
  end <+
  rule on Expr of
  | decExpr(a) -> a
  end <+
  rule on Exprs of
  | decExprs(a) -> a
  end <+
  rule on BaseTypeExpr of
  | decTypeExpr(a) -> a
  end <+
  rule on TypeModifierExpr of
  | decTypeModifierExpr(a) -> a
  end;

-- Based on allTopDown strategy, but also looks through decorated wrapper productions 
abstract production topDownSubs
top::Strategy ::= s::Strategy
{
  forwards to try(normalizeDecProds) <* (s <+ all(topDownSubs(s)));
}
