grammar edu:umn:cs:melt:exts:silver:ableC:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp;

imports silver:definition:core;
imports silver:definition:env;
imports silver:extension:list;

abstract production ableCStmtLiteral
top::Expr ::= ast::ableC:Stmt
{
  top.pp = s"ableC Stmt {${show(80, ast.pp)}}";

  forwards to reflect(ast).translation;
}


global builtin::Location = txtLoc("silver-ableC");
