grammar edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

import edu:umn:cs:melt:ableC:concretesyntax:cppTags;

ignore terminal PragmaMark /#pragma\ mark.*([\n\r]+)/ lexer classes {Ccomment};

terminal Hash_t '#';
terminal Pragma_t 'pragma';
terminal RedefExtname_t 'redefine_extname';
terminal Pack_t /pack\([^\)]*\)([\n\r]+)/;
terminal OMP_t /omp .*/;

concrete productions top::ExternalDeclaration_c
| '#' 'pragma' Pack_t
    layout { Spaces_t }
    { top.ast = ast:warnDecl([wrn(top.location, "Ignored pack pragma")]); }
| '#' 'pragma' 'redefine_extname' Identifier_c Identifier_c
    layout { Spaces_t }
    { top.ast = ast:warnDecl([wrn(top.location, "Ignored redefine_extname pragma")]); }

concrete productions top::Stmt_c
| '#' 'pragma' omp::OMP_t
    layout { Spaces_t }
    { top.ast = ast:txtStmt("#pragma " ++ omp.lexeme); }