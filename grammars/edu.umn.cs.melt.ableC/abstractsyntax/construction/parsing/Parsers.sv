grammar edu:umn:cs:melt:ableC:abstractsyntax:construction:parsing;

imports silver:langutil;

imports edu:umn:cs:melt:ableC:concretesyntax as cst;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:host;

{-- Parse wrapper functions for generating ASTs
 - These functions all take a string as input and return an AST, or raise an error on parse
 - failure.  The concrete syntax here is just the host syntax, with the addition of a special
 - construct to add additional type names to the lexer hack scope, as these will not be present by
 - default for code fragments.  
 - This mechanism is designed to work with the substitution mechanism, to perform substitutions of
 - names for ASTs within the generated AST.  As a convention, when performing this type of
 - substitution, we suggest that names to be substituted be prefixed and suffixed by double
 - underscores to make this more obvious.  
 - For performance reasons, it is best to call these from a global and save the result for reuse to
 - avoid calling the parser repeatedly.  
 -}

-- Parser declarations
parser declsParser :: cst:TranslationUnit_c {
  edu:umn:cs:melt:ableC:concretesyntax;
  edu:umn:cs:melt:ableC:concretesyntax:construction;
}

parser declParser :: cst:ExternalDeclaration_c {
  edu:umn:cs:melt:ableC:concretesyntax;
  edu:umn:cs:melt:ableC:concretesyntax:construction;
}

parser stmtParser :: cst:BlockItemList_c {
  edu:umn:cs:melt:ableC:concretesyntax;
  edu:umn:cs:melt:ableC:concretesyntax:construction;
}

parser exprParser :: cst:Expr_c {
  edu:umn:cs:melt:ableC:concretesyntax;
  edu:umn:cs:melt:ableC:concretesyntax:construction;
}

-- Wrapper functions to call parsers and return asts
global parseDecls::(Decls ::= String) = \ text::String -> foldDecl(parseInline("Decls", declsParser, text).ast);
global parseDecl::(Decl ::= String) = \ text::String -> parseInline("Decl", declParser, text).ast;
global parseStmt::(Stmt ::= String) = \ text::String -> foldStmt(parseInline("Stmt", stmtParser, text).ast);
global parseExpr::(Expr ::= String) = \ text::String -> parseInline("Expr", exprParser, text).ast;
