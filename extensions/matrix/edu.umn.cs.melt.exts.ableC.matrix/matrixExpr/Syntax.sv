grammar edu:umn:cs:melt:exts:ableC:matrix:matrixExpr;

imports edu:umn:cs:melt:ableC:concretesyntax as cnc;
imports edu:umn:cs:melt:ableC:abstractsyntax as abs;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as abs;
imports edu:umn:cs:melt:exts:ableC:matrix as abs;

imports silver:langutil;

import edu:umn:cs:melt:exts:ableC:matrix:matrixSyntax;

-- trigger the test
import edu:umn:cs:melt:exts:ableC:matrix:mda_test;

concrete production matrixExpr
top::cnc:PostfixExpr_c ::= 'matrix' id::MatrixID '(' indexes::cnc:ArgumentExprList_c ')'
{
  top.ast = abs:matrixIndex(fromMId(id), abs:foldExpr(indexes.ast), location=top.location);
}

