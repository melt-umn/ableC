grammar edu:umn:cs:melt:tutorials:ableC:intconst:concretesyntax;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast; 

imports edu:umn:cs:melt:tutorials:ableC:intconst:abstractsyntax;

exports edu:umn:cs:melt:tutorials:ableC:intconst:concretesyntax:decl;
exports edu:umn:cs:melt:tutorials:ableC:intconst:concretesyntax:ref;

-- Since the same marking terminal is used by both the decl and ref productions,
-- we declare it at the top level and put these in seperate sub-grammars
marking terminal IntConst_t 'intconst';
