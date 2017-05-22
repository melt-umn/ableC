grammar edu:umn:cs:melt:exts:ableC:templating:concretesyntax:templateStructKeyword;

imports edu:umn:cs:melt:ableC:concretesyntax;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:templating:mda_test;

-- Template struct decl conflicts with function decl where the return type is a struct, which is an
-- unusual case.  To resolve this, we define our own 'struct' keyword, which causes a lexical
-- ambiguity with the host STRUCT keyword, which is then resolved for this case with a
-- disambiguation function.
terminal TemplateStruct_t 'struct' lexer classes {Ckeyword};

disambiguate STRUCT, TemplateStruct_t {
  pluck TemplateStruct_t;
}
