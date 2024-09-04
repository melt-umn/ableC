grammar edu:umn:cs:melt:ableC:silverconstruction:concretesyntax:quotation;

imports silver:compiler:definition:core
  hiding LCurly_t, RCurly_t; -- We only use the ones from ableC, makes '{' terminal syntax unambigous
imports silver:compiler:extension:patternmatching;
imports edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:concretesyntax:construction;

-- Silver-to-ableC bridge productions
concrete productions top::Expr
| 'ableC_Decls' '{' cst::TranslationUnit_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteDecls(foldDecl(cst.ast)); }
| 'ableC_Decl' '{' cst::ExternalDeclaration_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteDecl(cst.ast); }
| 'ableC_Decl' '{' ProtoTypedef_c cst::ExternalDeclaration_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteDecl(cst.ast); }
| 'ableC_Parameters' '{' cst::ParameterList_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteParameters(foldParameterDecl(cst.ast)); }
| 'ableC_BaseTypeExpr' '{' cst::DeclarationSpecifiers_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  {
    cst.givenQualifiers = cst.typeQualifiers;
    forwards to quoteBaseTypeExpr(figureOutTypeFromSpecifiers(cst.typeQualifiers, cst.preTypeSpecifiers, cst.realTypeSpecifiers, cst.mutateTypeSpecifiers));
  }
| 'ableC_Stmt' '{' cst::BlockItemList_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteStmt(foldStmt(cst.ast)); }
| 'ableC_Expr' '{' cst::Expr_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteExpr(cst.ast); }
| 'ableC_Expr' '{' ProtoTypedef_c cst::Expr_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteExpr(cst.ast); }

concrete productions top::Pattern
| 'ableC_Decls' BeginPattern_t '{' cst::TranslationUnit_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteDeclsPattern(foldDecl(cst.ast)); }
  action { inPattern = false; }
| 'ableC_Decl' BeginPattern_t '{' cst::ExternalDeclaration_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteDeclPattern(cst.ast); }
  action { inPattern = false; }
| 'ableC_Decl' BeginPattern_t '{' ProtoTypedef_c cst::ExternalDeclaration_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteDeclPattern(cst.ast); }
  action { inPattern = false; }
| 'ableC_Parameters' BeginPattern_t '{' cst::ParameterList_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteParametersPattern(foldParameterDecl(cst.ast)); }
  action { inPattern = false; }
| 'ableC_BaseTypeExpr' BeginPattern_t '{' cst::DeclarationSpecifiers_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  {
    cst.givenQualifiers = cst.typeQualifiers;
    forwards to quoteBaseTypeExprPattern(figureOutTypeFromSpecifiers(cst.typeQualifiers, cst.preTypeSpecifiers, cst.realTypeSpecifiers, cst.mutateTypeSpecifiers));
  }
  action { inPattern = false; }
| 'ableC_Stmt' BeginPattern_t '{' cst::BlockItemList_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteStmtPattern(foldStmt(cst.ast)); }
  action { inPattern = false; }
| 'ableC_Expr' BeginPattern_t '{' cst::Expr_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteExprPattern(cst.ast); }
  action { inPattern = false; }
| 'ableC_Expr' BeginPattern_t '{' ProtoTypedef_c cst::Expr_c '}'
  layout {LineComment_t, BlockComment_t, Spaces_t, NewLine_t}
  { forwards to quoteExprPattern(cst.ast); }
  action { inPattern = false; }
