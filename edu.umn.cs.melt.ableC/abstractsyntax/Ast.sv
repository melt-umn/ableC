grammar edu:umn:cs:melt:ableC:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;

-- Treat the substitution module like an export for modular analyses,
-- but make the user import it explicitly 
option edu:umn:cs:melt:ableC:abstractsyntax:substitution;