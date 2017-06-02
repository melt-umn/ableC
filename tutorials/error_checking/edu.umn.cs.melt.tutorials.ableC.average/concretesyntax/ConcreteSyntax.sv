grammar edu:umn:cs:melt:tutorials:ableC:average:concretesyntax;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports silver:langutil only ast; 

imports edu:umn:cs:melt:tutorials:ableC:average:abstractsyntax;

marking terminal AverageOp_t '~~';

concrete production averageExpr_c
top::AddMulNoneOp_c ::= '~~'
{
  top.ast = averageExpr(top.leftExpr, top.rightExpr, location=top.location);
}