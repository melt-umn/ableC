grammar edu:umn:cs:melt:ableC:abstractsyntax:construction:parsing;

imports silver:langutil;

imports edu:umn:cs:melt:ableC:concretesyntax as cst;
imports edu:umn:cs:melt:ableC:concretesyntax:lexerHack as lh;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax;

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
function parseDecls
Decls ::= text::String
{
  local result::ParseResult<cst:TranslationUnit_c> =
    declsParser(text, s"parseDecls(\"\"\"\n${foldLineNums(text)}\n\"\"\")");
  return
    if result.parseSuccess
    then foldDecl(result.parseTree.ast)
    else error("Syntax errors in parseDecls string:\n" ++ result.parseErrors);
}

function parseDecl
Decl ::= text::String
{
  local result::ParseResult<cst:ExternalDeclaration_c> =
 declParser(text, s"parseDecl(\"\"\"\n${foldLineNums(text)}\n\"\"\")");
  return
    if result.parseSuccess
    then result.parseTree.ast
    else error("Syntax errors in parseDecl string:\n" ++ result.parseErrors);
}

function parseStmt
Stmt ::= text::String
{
  local result::ParseResult<cst:BlockItemList_c> =
    stmtParser(text, s"parseStmt(\"\"\"\n${foldLineNums(text)}\n\"\"\")");
  return
    if result.parseSuccess
    then foldStmt(result.parseTree.ast)
    else error("Syntax errors in parseStmt string:\n" ++ result.parseErrors);
}

function parseExpr
Expr ::= text::String
{
  local result::ParseResult<cst:Expr_c> =
    exprParser(text, s"parseExpr(\"\"\"\n${foldLineNums(text)}\n\"\"\")");
  return
    if result.parseSuccess
    then result.parseTree.ast
    else error("Syntax errors in parseExpr string:\n" ++ result.parseErrors);
}