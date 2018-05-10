grammar edu:umn:cs:melt:exts:silver:ableC:concretesyntax;

imports silver:langutil;

imports silver:definition:core;
imports edu:umn:cs:melt:exts:silver:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;

exports edu:umn:cs:melt:ableC:concretesyntax;
exports edu:umn:cs:melt:ableC:concretesyntax:construction;

-- Silver-to-ableC bridge productions
concrete productions top::Expr
| 'ableC_Decls' InAbleC edu:umn:cs:melt:ableC:concretesyntax:LCurly_t cst::TranslationUnit_c edu:umn:cs:melt:ableC:concretesyntax:RCurly_t NotInAbleC
  { forwards to ableCDeclsLiteral(foldDecl(cst.ast), location=top.location); }
| 'ableC_Decl' InAbleC edu:umn:cs:melt:ableC:concretesyntax:LCurly_t cst::ExternalDeclaration_c edu:umn:cs:melt:ableC:concretesyntax:RCurly_t NotInAbleC
  { forwards to ableCDeclLiteral(cst.ast, location=top.location); }
| 'ableC_Stmt' InAbleC edu:umn:cs:melt:ableC:concretesyntax:LCurly_t cst::BlockItemList_c edu:umn:cs:melt:ableC:concretesyntax:RCurly_t NotInAbleC
  { forwards to ableCStmtLiteral(foldStmt(cst.ast), location=top.location); }
| 'ableC_Expr' InAbleC edu:umn:cs:melt:ableC:concretesyntax:LCurly_t cst::Expr_c edu:umn:cs:melt:ableC:concretesyntax:RCurly_t NotInAbleC
  { forwards to ableCExprLiteral(cst.ast, location=top.location); }

-- AbleC-to-Silver bridge productions
concrete production escapeStmt_c
top::BlockItem_c ::= '$Stmt' NotInAbleC silver:definition:core:LCurly_t e::Expr silver:definition:core:RCurly_t InAbleC
{ top.ast = [escapeStmt(e)]; }
concrete production escapeInitializer_c
top::Initializer_c ::= '$Initializer' NotInAbleC silver:definition:core:LCurly_t e::Expr silver:definition:core:RCurly_t InAbleC
{ top.ast = escapeInitializer(e); }
concrete production escapeExprs_c
top::AssignExpr_c ::= '$Exprs' NotInAbleC silver:definition:core:LCurly_t e::Expr silver:definition:core:RCurly_t InAbleC
  { top.ast = escapeExprs(e, location=top.location); }
concrete production escapeExpr_c
top::AssignExpr_c ::= '$Expr' NotInAbleC silver:definition:core:LCurly_t e::Expr silver:definition:core:RCurly_t InAbleC
  { top.ast = escapeExpr(e, location=top.location); }
{-concrete production escapeName_c
top::Name_c ::= '$Name' NotInAbleC silver:definition:core:LCurly_t e::Expr silver:definition:core:RCurly_t InAbleC
  { top.ast = escapeName(e, location=top.location); }-}
{-concrete production escapeParameters_c
top::ParameterList_c ::= '$Parameters' NotInAbleC silver:definition:core:LCurly_t e::Expr silver:definition:core:RCurly_t InAbleC
{ top.ast = escapeParameters(e, location=top.location); }-}
concrete production escapeBaseTypeExpr_c
top::TypeSpecifier_c ::= '$BaseTypeExpr' NotInAbleC silver:definition:core:LCurly_t e::Expr silver:definition:core:RCurly_t InAbleC
{
  top.realTypeSpecifiers = [escapeBaseTypeExpr(e)];
  top.preTypeSpecifiers = [];
}
concrete production escapeAttrib_c
top::Attrib_c ::= '$Attrib' NotInAbleC silver:definition:core:LCurly_t e::Expr silver:definition:core:RCurly_t InAbleC
{ top.ast = escapeAttrib(e); }
  