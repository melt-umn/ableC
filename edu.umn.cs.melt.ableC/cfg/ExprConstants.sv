grammar edu:umn:cs:melt:ableC:cfg;

import edu:umn:cs:melt:ableC:abstractsyntax;
import silver:langutil;

aspect production realConstant
top::Expr ::= c::NumericConstant
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production imaginaryConstant
top::Expr ::= c::NumericConstant
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production characterConstant
top::Expr ::= num::String  c::CharPrefix
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

