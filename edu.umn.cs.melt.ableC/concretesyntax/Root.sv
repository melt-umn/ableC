grammar edu:umn:cs:melt:ableC:concretesyntax;

nonterminal Root with location, ast<ast:Root>;

concrete productions top::Root
| tu::TranslationUnit_c 
    { top.ast = ast:root(ast:foldGlobalDecl(tu.ast)); } -- Changed from foldDecl, this is used for handling extension global decls
|
    { top.ast = ast:root(ast:nilDecl()); }


closed nonterminal TranslationUnit_c with location, ast<[ast:Decl]>; 

concrete productions top::TranslationUnit_c
| h::ExternalDeclaration_c 
    { top.ast = [h.ast]; }
| h::TranslationUnit_c  t::ExternalDeclaration_c 
    { top.ast = h.ast ++ [t.ast]; }


closed nonterminal ExternalDeclaration_c with location, ast<ast:Decl>; 

concrete productions top::ExternalDeclaration_c
| d::Declaration_c 
    { top.ast = d.ast; }
| d::FunctionDefinition_c 
    { top.ast = ast:functionDeclaration(d.ast); }

