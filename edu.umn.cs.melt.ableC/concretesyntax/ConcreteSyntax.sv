grammar edu:umn:cs:melt:ableC:concretesyntax;

-- Although these are separated out, here we are indicating they are part of
-- the "host language."
exports edu:umn:cs:melt:ableC:concretesyntax:cppTags;
exports edu:umn:cs:melt:ableC:concretesyntax:c11;
exports edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

-- Standard attributes for errors, abstract syntax.
-- C's concrete syntax is so permissive that we are unable to translate some
-- constructs to abstract syntax. This is the *only* use for errors on
-- concrete syntax, no further semantic analysis is made.
imports silver:langutil only ast, errors, err, wrn;

-- errors it prefixed with ast, to avoid any name clashes.
imports edu:umn:cs:melt:ableC:abstractsyntax as ast;

-- easier construction of ast nodes
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as ast;

