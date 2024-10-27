grammar edu:umn:cs:melt:ableC:silverconstruction:concretesyntax:antiquotation;

imports silver:langutil:lsp as lsp;
imports edu:umn:cs:melt:ableC:silverconstruction:concretesyntax:quotation;

lexer class Antiquote
  disambiguate {
    -- Ambiguities between antiquote terminals should consist of 1 expression
    -- and 1 pattern antiquote terminal.
    if (inPattern)
      -- Pick the pattern antiquote terminal
      pluck head(intersect(shiftable, PatternAntiquote));
    else
      -- Pick the expression antiquote terminal
      pluck head(intersect(shiftable, ExprAntiquote));
  },
  extends {lsp:Macro}; -- Why not?

lexer class ExprAntiquote extends Antiquote;
lexer class PatternAntiquote extends Antiquote;

marking terminal AntiquoteDecls_t             '$Decls'             lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteDecl_t              '$Decl'              lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteStmt_t              '$Stmt'              lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteInitializer_t       '$Initializer'       lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteExprs_t             '$Exprs'             lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteExpr_t              '$Expr'              lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteIntLiteralExpr_t    '$intLiteralExpr'    lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteStringLiteralExpr_t '$stringLiteralExpr' lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteNames_t             '$Names'             lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteName_t              '$Name'              lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteTName_t             '$TName'             lexer classes {ExprAntiquote, Reserved};
marking terminal Antiquote_name_t             '$name'              lexer classes {ExprAntiquote, Reserved};
marking terminal Antiquote_tname_t            '$tname'             lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteStorageClasses      '$StorageClasses'    lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteParameters_t        '$Parameters'        lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteStructItemList_t    '$StructItemList'    lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteEnumItemList_t      '$EnumItemList'      lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteTypeNames_t         '$TypeNames'         lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteTypeName_t          '$TypeName'          lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteBaseTypeExpr_t      '$BaseTypeExpr'      lexer classes {ExprAntiquote, Reserved};
--marking terminal AntiquoteTypeModifierExpr_t  '$TypeModifierExpr'  lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteType_t              '$directTypeExpr'    lexer classes {ExprAntiquote, Reserved};
marking terminal AntiquoteAttrib_t            '$Attrib'            lexer classes {ExprAntiquote, Reserved}, dominates {AttributeNameUnfetterdByKeywords_t};

marking terminal AntiquoteDeclPattern_t         '$Decl'            lexer classes {PatternAntiquote, Reserved};
marking terminal AntiquoteStmtPattern_t         '$Stmt'            lexer classes {PatternAntiquote, Reserved};
marking terminal AntiquoteExprPattern_t         '$Expr'            lexer classes {PatternAntiquote, Reserved};
marking terminal AntiquoteNamePattern_t         '$Name'            lexer classes {PatternAntiquote, Reserved};
marking terminal AntiquoteBaseTypeExprPattern_t '$BaseTypeExpr'    lexer classes {PatternAntiquote, Reserved};
