grammar edu:umn:cs:melt:ableC:concretesyntax:debug;

imports edu:umn:cs:melt:ableC:concretesyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax:host as ast;

imports silver:langutil only ast; --, errors, errFromOrigin, wrnFromOrigin;

terminal PrintEnv_t 'printEnv' lexer classes {Ckeyword};

concrete production printEnv_c
e::PrimaryExpr_c ::= 'printEnv'
{ e.ast = ast:printEnv(); }
