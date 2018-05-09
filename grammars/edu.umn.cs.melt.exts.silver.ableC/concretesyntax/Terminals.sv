grammar edu:umn:cs:melt:exts:silver:ableC:concretesyntax;

imports silver:definition:regex;

marking terminal AbleCDecls_t 'ableC_Decls' lexer classes {KEYWORD, RESERVED};
marking terminal AbleCDecl_t  'ableC_Decl'  lexer classes {KEYWORD, RESERVED};
marking terminal AbleCStmt_t  'ableC_Stmt'  lexer classes {KEYWORD, RESERVED};
marking terminal AbleCExpr_t  'ableC_Expr'  lexer classes {KEYWORD, RESERVED};

terminal EscapeStmt_t         '$Stmt'         lexer classes {Ckeyword};
terminal EscapeInitializer_t  '$Initializer'  lexer classes {Ckeyword};
terminal EscapeExprs_t        '$Exprs'        lexer classes {Ckeyword};
terminal EscapeExpr_t         '$Expr'         lexer classes {Ckeyword};
terminal EscapeName_t         '$Name'         lexer classes {Ckeyword};
terminal EscapeParameters_t   '$Parameters'   lexer classes {Ckeyword};
terminal EscapeBaseTypeExpr_t '$BaseTypeExpr' lexer classes {Ckeyword};
terminal EscapeRefId_t        '$RefId'        lexer classes {Ckeyword};

-- Workarounds for weirdness with ignore terminals
{-disambiguate NewLine_t, RegexChar_t, WhiteSpace
{
  pluck NewLine_t;
}
disambiguate Spaces_t, RegexChar_t, WhiteSpace
{
  pluck Spaces_t;
}-}
disambiguate edu:umn:cs:melt:ableC:concretesyntax:WhiteSpace, silver:definition:core:WhiteSpace, RegexChar_t
{
  pluck silver:definition:core:WhiteSpace;
}
disambiguate DEC_OP, Comments
{
  pluck DEC_OP;
}

-- TODO: Needed because of copper bugs?
{-disambiguate NewLine_t, WhiteSpace
{
  pluck NewLine_t;
}
disambiguate Spaces_t, WhiteSpace
{
  pluck Spaces_t;
}-}
disambiguate edu:umn:cs:melt:ableC:concretesyntax:WhiteSpace, silver:definition:core:WhiteSpace
{
  pluck silver:definition:core:WhiteSpace;
}
