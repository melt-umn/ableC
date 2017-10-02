grammar edu:umn:cs:melt:ableC:cfg;

import edu:umn:cs:melt:ableC:abstractsyntax;
import silver:langutil;

aspect production typesCompatibleExpr
top::Expr ::= l::TypeName  r::TypeName
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production vaArgExpr
top::Expr ::= e::Expr  ty::TypeName
{
  top.initBlock = e.initBlock;
  top.finalBlocks = e.finalBlocks;
  top.flowEdges = e.flowEdges;
}

aspect production offsetofExpr
top::Expr ::= ty::TypeName  e::MemberDesignator
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production isConstantExpr
top::Expr ::= e::Expr
{
  top.initBlock = e.initBlock;
  top.finalBlocks = e.finalBlocks;
  top.flowEdges = e.flowEdges;
}

aspect production vaArgPackExpr
top::Expr ::= 
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production expectExpr
top::Expr ::= eval::Expr  expected::Expr
{
  top.initBlock = eval.initBlock;
  top.finalBlocks = expected.finalBlocks;
  top.flowEdges = eval.flowEdges ++ expected.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, expected.initBlock), eval.finalBlocks);
}

aspect production vaStartExpr
top::Expr ::= lastParam::Name  valist::Name
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production vaEndExpr
top::Expr ::= valist::Name
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

