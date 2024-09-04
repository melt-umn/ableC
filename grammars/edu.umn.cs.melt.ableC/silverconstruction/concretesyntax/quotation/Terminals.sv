grammar edu:umn:cs:melt:ableC:silverconstruction:concretesyntax:quotation;

marking terminal AbleCDecls_t        'ableC_Decls'        lexer classes {KEYWORD, RESERVED};
marking terminal AbleCDecl_t         'ableC_Decl'         lexer classes {KEYWORD, RESERVED};
marking terminal AbleCParameters_t   'ableC_Parameters'   lexer classes {KEYWORD, RESERVED};
marking terminal AbleCBaseTypeExpr_t 'ableC_BaseTypeExpr' lexer classes {KEYWORD, RESERVED};
marking terminal AbleCStmt_t         'ableC_Stmt'         lexer classes {KEYWORD, RESERVED};
marking terminal AbleCExpr_t         'ableC_Expr'         lexer classes {KEYWORD, RESERVED};

-- Expressions do not occur inside patterns, so we only need to track whether we
-- have seen the beginning (but not the end of) an concrete pattern literal.
parser attribute inPattern::Boolean
  action { inPattern = false; };

terminal BeginPattern_t '' action { inPattern = true; };