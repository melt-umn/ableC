grammar edu:umn:cs:melt:ableC:cfg;

import edu:umn:cs:melt:ableC:abstractsyntax;
import edu:umn:cs:melt:ableC:abstractsyntax:env;
import silver:langutil;

attribute initBlock occurs on MaybeExpr;
attribute finalBlocks occurs on MaybeExpr;
attribute flowEdges occurs on MaybeExpr;

aspect production justExpr
top::MaybeExpr ::= e::Expr
{
  top.initBlock = e.initBlock;
  top.finalBlocks = e.finalBlocks;
  top.flowEdges = e.flowEdges;
}

aspect production nothingExpr
top::MaybeExpr ::=
{
  top.initBlock = cfMaybeExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

attribute initBlock occurs on ExprOrTypeName;
attribute finalBlocks occurs on ExprOrTypeName;
attribute flowEdges occurs on ExprOrTypeName;

aspect production exprExpr
top::ExprOrTypeName ::= e::Expr
{
  top.initBlock = e.initBlock;
  top.finalBlocks = e.finalBlocks;
  top.flowEdges = e.flowEdges;
}

aspect production typeNameExpr
top::ExprOrTypeName ::= ty::TypeName
{
  top.initBlock = cfExprOrTypeNameBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

attribute initBlock occurs on Exprs;
attribute finalBlocks occurs on Exprs;
attribute flowEdges occurs on Exprs;

aspect production consExpr
top::Exprs ::= h::Expr  t::Exprs
{
  top.initBlock = h.initBlock;
  top.finalBlocks = t.finalBlocks;
  top.flowEdges = h.flowEdges ++ t.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, h.initBlock), t.finalBlocks);
}

aspect production nilExpr
top::Exprs ::=
{
  top.initBlock = cfExprsBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

