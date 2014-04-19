grammar edu:umn:cs:melt:exts:ableC:matrix:matrixStmt;

imports edu:umn:cs:melt:ableC:concretesyntax as cnc;
imports edu:umn:cs:melt:ableC:abstractsyntax as abs;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as abs;
imports edu:umn:cs:melt:exts:ableC:matrix as abs;

imports silver:langutil;

import edu:umn:cs:melt:exts:ableC:matrix:matrixSyntax;

-- trigger the test
import edu:umn:cs:melt:exts:ableC:matrix:mda_test;

concrete production matrixStmt
top::cnc:Stmt_c ::= 'matrix' ma::MatrixAssign ';'
{
  top.ast = ma.ast;
}

terminal Let 'let' dominates { MatrixID };
terminal LLParen '((';

terminal MatrixMult '*' association = left, precedence = 10;
terminal MatrixElementMult '.*' association = left, precedence = 10;
terminal MatrixAdd  '+' association = left, precedence = 5;


closed nonterminal MatrixAssign with location, ast<abs:Stmt>;

concrete productions top::MatrixAssign
| id::MatrixID '=' me::MatrixExpr
    { top.ast = abs:matrixAssign(fromMId(id), me.ast, true); }
| 'let' id::MatrixID '=' me::MatrixExpr
    { top.ast = abs:matrixDeclare(fromMId(id), me.ast); }


closed nonterminal MatrixExpr with location, ast<abs:MatrixExpr>;

concrete productions top::MatrixExpr
-- C Identifier
| id::cnc:Identifier_t
    { top.ast = abs:matrixRef(abs:fromId(id), location=top.location); }
-- C Function call 
| id::cnc:Identifier_t '(' indexes::cnc:ArgumentExprList_c ')'
    { top.ast = abs:matrixCall(abs:fromId(id), abs:foldExpr(indexes.ast), location=top.location); }
-- Element-wise addition
| l::MatrixExpr  '+'  r::MatrixExpr
    { top.ast = abs:matrixAdd(l.ast, r.ast, location=top.location); }
-- Element-wise multiplication
| l::MatrixExpr  '.*'  r::MatrixExpr
    { top.ast = abs:matrixElementwiseMultiply(l.ast, r.ast, location=top.location); }
-- Matrix multiplication
| l::MatrixExpr  '*'  r::MatrixExpr
    { top.ast = abs:matrixMultiply(l.ast, r.ast, location=top.location); }
-- Parentheses
| '(' e::MatrixExpr ')'
    { top.ast = e.ast; }
-- Escape hatch to ordinary C expressions
| '((' e::cnc:Expr_c ')' ')'
    { top.ast = abs:matrixCExpr(e.ast, location=top.location); }
-- Matrix comprehension
| '{' '(' ids::cnc:IdentifierList_c ')' '<' '(' bounds::cnc:ArgumentExprList_c ')' ',' val::cnc:AssignExpr_c '}'
    { top.ast = abs:matrixComprehension(ids.cnc:declaredIdents, abs:foldExpr(bounds.ast), val.ast, location=top.location); }

