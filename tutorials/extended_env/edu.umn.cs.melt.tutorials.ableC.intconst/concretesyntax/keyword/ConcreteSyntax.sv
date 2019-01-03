grammar edu:umn:cs:melt:tutorials:ableC:intconst:concretesyntax:keyword;

imports edu:umn:cs:melt:ableC:concretesyntax;

-- Since the same marking terminal is used by both the decl and ref productions,
-- we declare it in a seperate sub-grammar that is exported by both.
marking terminal IntConst_t 'intconst' lexer classes {Ckeyword};
