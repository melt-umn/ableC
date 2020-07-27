grammar edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

import edu:umn:cs:melt:ableC:concretesyntax:cppTags;

ignore terminal PragmaMark /#pragma\ mark.*([\n\r]+)/ lexer classes {Comment};

terminal Hash_t '#';
terminal Pragma_t 'pragma';
terminal RedefExtname_t 'redefine_extname';
terminal Pack_t /pack\([^\)]*\)([\n\r]+)/;
terminal OMP_t /omp\ .*/;
terminal OMPFor_t /omp\ .*[\r\n\ \t]+for\ *\(.*\)/; -- TODO: HACK

-- TODO why is this needed? seems like it should be covered by maximal munch, oh well.
disambiguate OMP_t, OMPFor_t {
  pluck OMPFor_t;
}

concrete productions top::ExternalDeclaration_c
| '#' 'pragma' Pack_t
    layout { Spaces_t }
    { top.ast = ast:warnDecl([wrnFromOrigin(top, "Ignored pack pragma")]); }
| '#' 'pragma' 'redefine_extname' Identifier_c Identifier_c
    layout { Spaces_t }
    { top.ast = ast:warnDecl([wrnFromOrigin(top, "Ignored redefine_extname pragma")]); }

concrete productions top::Stmt_c
| '#' 'pragma' omp::OMP_t
    layout { Spaces_t }
    { top.ast = ast:txtStmt("#pragma " ++ omp.lexeme); }
| '#' 'pragma' omp::OMPFor_t
    layout { Spaces_t }
    { top.ast = ast:txtStmt("#pragma " ++ omp.lexeme); }