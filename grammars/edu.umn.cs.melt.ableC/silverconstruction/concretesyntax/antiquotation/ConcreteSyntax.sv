grammar edu:umn:cs:melt:ableC:silverconstruction:concretesyntax:antiquotation;

imports silver:compiler:definition:core;
imports silver:compiler:extension:patternmatching;
imports edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax;
imports edu:umn:cs:melt:ableC:concretesyntax
  hiding LCurly_t, RCurly_t; -- We only use the ones from Silver, makes '{' terminal syntax unambigous

-- AbleC-to-Silver bridge productions
concrete productions top::Declaration_c
| '$Decls' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteDecls(^e); }
| AntiquoteDecl_t '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteDecl(^e); }
| AntiquoteDeclPattern_t '{' p::Pattern '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquotePatternDecl(^p); }
concrete productions top::Stmt_c
| AntiquoteStmt_t '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteStmt(^e); }
| AntiquoteStmtPattern_t '{' p::Pattern '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquotePatternStmt(^p); }
concrete productions top::Initializer_c
| '$Initializer' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteInitializer(^e); }
concrete productions top::PrimaryExpr_c
| '$Exprs' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteExprs(^e); }
| AntiquoteExpr_t '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteExpr(^e); }
| AntiquoteExprPattern_t '{' p::Pattern '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquotePatternExpr(^p); }
| '$intLiteralExpr' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteIntLiteralExpr(^e); }
| '$stringLiteralExpr' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteStringLiteralExpr(^e); }
concrete productions top::Identifier_c
| '$Names' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteNames(^e); }
| AntiquoteName_t '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteName(^e); }
| AntiquoteNamePattern_t '{' p::Pattern '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquotePatternName(^p); }
| '$name' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquote_name(^e); }
concrete productions top::TypeIdName_c
| '$TName' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteTName(^e); }
| '$tname' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquote_tname(^e); }
concrete productions top::StorageClassSpecifier_c
| '$StorageClasses' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  {
    top.isTypedef = false;
    top.storageClass = [antiquoteStorageClasses(^e)];
  }
concrete productions top::ParameterDeclaration_c
| '$Parameters' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  {
    top.declaredIdents = [];
    top.ast = antiquoteParameters(^e);
  }
concrete productions top::StructDeclaration_c
| '$StructItemList' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = [antiquoteStructItemList(^e)]; }
concrete productions top::Enumerator_c
| '$EnumItemList' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = [antiquoteEnumItemList(^e)]; }
concrete productions top::TypeName_c
| '$TypeNames' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteTypeNames(^e); }
| '$TypeName' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteTypeName(^e); }
concrete productions top::TypeSpecifier_c
| AntiquoteBaseTypeExpr_t '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  {
    -- TODO: Discarding qualifiers here!
    top.realTypeSpecifiers = [antiquoteBaseTypeExpr(^e)];
    top.preTypeSpecifiers = [];
  }
| AntiquoteBaseTypeExprPattern_t '{' p::Pattern '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { -- TODO: Discarding qualifiers here!
    top.realTypeSpecifiers = [antiquotePatternBaseTypeExpr(^p)];
    top.preTypeSpecifiers = [];
  }
concrete productions top::TypeSpecifier_c
| '$directTypeExpr' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  {
    top.realTypeSpecifiers = [antiquoteDirectTypeExpr(top.givenQualifiers, ^e)];
    top.preTypeSpecifiers = [];
  }
concrete productions top::Attrib_c
| '$Attrib' '{' e::Expr '}'
  layout {silver:compiler:definition:core:WhiteSpace, BlockComments, Comments}
  { top.ast = antiquoteAttrib(^e); }
