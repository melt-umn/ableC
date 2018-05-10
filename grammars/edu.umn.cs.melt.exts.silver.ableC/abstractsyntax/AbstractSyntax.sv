grammar edu:umn:cs:melt:exts:silver:ableC:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp;

imports silver:definition:core;
imports silver:definition:env;
imports silver:extension:list;

imports edu:umn:cs:melt:ableC:abstractsyntax:host as ableC;

-- Silver-to-ableC bridge productions
abstract production ableCDeclsLiteral
top::Expr ::= ast::ableC:Decls
{
  top.pp = s"ableC Decls {${sconcat(explode("\n", show(80, ppImplode(line(), ast.pps))))}}";
  forwards to reflect(new(ast)).translation;
}

abstract production ableCDeclLiteral
top::Expr ::= ast::ableC:Decl
{
  top.pp = s"ableC Decl {${sconcat(explode("\n", show(80, ast.pp)))}}";
  forwards to reflect(new(ast)).translation;
}

abstract production ableCStmtLiteral
top::Expr ::= ast::ableC:Stmt
{
  top.pp = s"ableC Stmt {${sconcat(explode("\n", show(80, ast.pp)))}}";
  forwards to reflect(new(ast)).translation;
}

abstract production ableCExprLiteral
top::Expr ::= ast::ableC:Expr
{
  top.pp = s"ableC Expr {${sconcat(explode("\n", show(80, ast.pp)))}}";
  forwards to reflect(new(ast)).translation;
}

-- AbleC-to-Silver bridge productions
abstract production escapeStmt
top::ableC:Stmt ::= e::Expr
{
  top.pp = pp"$$Stmt{${text(e.pp)}}";
  forwards to ableC:warnStmt([]);
}

abstract production escapeInitializer
top::ableC:Initializer ::= e::Expr
{
  top.pp = pp"$$Initializer{${text(e.pp)}}";
  forwards to ableC:objectInitializer(ableC:nilInit());
}

abstract production escapeExprs
top::ableC:Expr ::= e::Expr
{
  top.pp = pp"$$Exprs{${text(e.pp)}}";
  forwards to ableC:errorExpr([], location=builtin);
}

abstract production escapeExpr
top::ableC:Expr ::= e::Expr
{
  top.pp = pp"$$Expr{${text(e.pp)}}";
  forwards to ableC:errorExpr([], location=builtin);
}

abstract production escapeName
top::ableC:Name ::= e::Expr
{
  top.pp = pp"$$Name{${text(e.pp)}}";
  forwards to ableC:name("<unknown>", location=builtin);
}

abstract production escapeParameters
top::ableC:Parameters ::= e::Expr
{
  -- TODO
  top.pps = [pp"$$Parameters{${text(e.pp)}}"];
  forwards to ableC:nilParameters();
}

abstract production escapeBaseTypeExpr
top::ableC:BaseTypeExpr ::= e::Expr
{
  top.pp = pp"$$BaseTypeExpr{${text(e.pp)}}";
  forwards to ableC:errorTypeExpr([]);
}

abstract production escapeAttrib
top::ableC:Attrib ::= e::Expr
{
  top.pp = pp"$$Attrib{${text(e.pp)}}";
  forwards to ableC:emptyAttrib();
}

global builtin::Location = txtLoc("silver-ableC");
