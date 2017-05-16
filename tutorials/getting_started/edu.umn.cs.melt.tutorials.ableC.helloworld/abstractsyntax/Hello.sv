grammar edu:umn:cs:melt:tutorials:ableC:helloworld:abstractsyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax;

abstract production hello
s::Stmt ::=
{
  forwards to
    exprStmt(
      directCallExpr( 
        name("printf", location=builtin),
        consExpr(
          stringLiteral("\"Hello, world!\\n\"", location=builtin),
          nilExpr()),
        location=builtin));
}

global builtin::Location = builtinLoc("helloworld");