grammar edu:umn:cs:melt:exts:silver:ableC:concretesyntax;

imports silver:langutil;

imports silver:definition:core;
imports edu:umn:cs:melt:exts:silver:ableC:abstractsyntax;

exports edu:umn:cs:melt:ableC:concretesyntax;

concrete productions top::Expr
| 'ableC_Stmt' edu:umn:cs:melt:ableC:concretesyntax:LCurly_t cst::Stmt_c edu:umn:cs:melt:ableC:concretesyntax:RCurly_t
  layout {LineComment, BlockComment, Spaces_t, NewLine_t}
  { forwards to ableCStmtLiteral(cst.ast, location=top.location); }


concrete productions top::Expr_c
| '$Expr' silver:definition:core:LCurly_t e::Expr silver:definition:core:RCurly_t
  { top.ast = escapeExpr(e, location=top.location); }
