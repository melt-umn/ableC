grammar edu:umn:cs:melt:exts:ableC:templating:concretesyntax:templateKeyword;

imports edu:umn:cs:melt:ableC:concretesyntax;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:templating:mda_test;

marking terminal Template_t /template[\ ]*</ lexer classes {Ckeyword};
