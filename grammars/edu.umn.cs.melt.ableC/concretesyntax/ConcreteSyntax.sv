grammar edu:umn:cs:melt:ableC:concretesyntax;

-- Although these are separated out, here we are indicating they are part of
-- the "host language."
exports edu:umn:cs:melt:ableC:concretesyntax:cppTags;
exports edu:umn:cs:melt:ableC:concretesyntax:c11;
exports edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

-- Uncomment to enable printEnv expression
--exports edu:umn:cs:melt:ableC:concretesyntax:debug;

-- Standard attributes for errors, abstract syntax.
-- C's concrete syntax is so permissive that we are unable to translate some
-- constructs to abstract syntax. This is the *only* use for errors on
-- concrete syntax, no further semantic analysis is made.
imports silver:langutil only ast, errors, errFromOrigin, wrnFromOrigin;

-- Lexer classes for semantic token highlighting
imports silver:langutil:lsp as lsp;

-- errors it prefixed with ast, to avoid any name clashes.
imports edu:umn:cs:melt:ableC:abstractsyntax:host as ast;

-- Needs to be supplied when decorating some terms during AST construction.
imports edu:umn:cs:melt:ableC:abstractsyntax:env as ast;

-- easier construction of ast nodes
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as ast;

-- Not exported, but ensure this is included in the artifact
import edu:umn:cs:melt:ableC:concretesyntax:construction only;
