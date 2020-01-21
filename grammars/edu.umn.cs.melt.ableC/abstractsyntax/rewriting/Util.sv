grammar edu:umn:cs:melt:ableC:abstractsyntax:rewriting;

imports core hiding all;
imports silver:rewrite;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;

-- Various generally-useful strategies for performing rewrites on ableC syntax trees

global normalizeDecProds::Strategy =
  rule on Decl of
  | decDecl(a) -> new(a)
  end <+
  rule on Stmt of
  | decStmt(a) -> new(a)
  end <+
  rule on Expr of
  | decExpr(a) -> new(a)
  end <+
  rule on Exprs of
  | decExprs(a) -> new(a)
  end <+
  rule on BaseTypeExpr of
  | decTypeExpr(a) -> new(a)
  end <+
  rule on TypeModifierExpr of
  | decTypeModifierExpr(a) -> new(a)
  end;

abstract production topDownSubs
top::Strategy ::= s::Strategy
{
  forwards to try(normalizeDecProds) <* try(s <+ all(topDownSubs(s)));
}
