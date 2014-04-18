grammar edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

import edu:umn:cs:melt:ableC:concretesyntax:cppTags;

ignore terminal PragmaMark /#pragma\ mark.*\n/ lexer classes {Ccomment};

terminal Pragma_t 'pragma';
terminal RedefExtname_t 'redefine_extname';
terminal Pack_t /pack\([^\)]*\)\n/;

concrete productions top::ExternalDeclaration_c
| '#' 'pragma' Pack_t
    layout { Space_t }
    { top.ast = ast:warnDecl([wrn(top.location, "Ignored pack pragma")]); }
| '#' 'pragma' 'redefine_extname' Identifier_t Identifier_t
    layout { Space_t }
    { top.ast = ast:warnDecl([wrn(top.location, "Ignored redefine_extname pragma")]); }

