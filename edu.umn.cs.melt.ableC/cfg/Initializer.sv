grammar edu:umn:cs:melt:ableC:cfg;

import edu:umn:cs:melt:ableC:abstractsyntax;
import silver:langutil;

attribute initBlock occurs on MaybeInitializer;
attribute finalBlocks occurs on MaybeInitializer;
attribute flowEdges occurs on MaybeInitializer;

aspect production nothingInitializer
top::MaybeInitializer ::=
{
  top.initBlock = cfMaybeInitializerBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production justInitializer
top::MaybeInitializer ::= i::Initializer
{
  top.initBlock = i.initBlock;
  top.finalBlocks = i.finalBlocks;
  top.flowEdges = i.flowEdges;
}

attribute initBlock occurs on Initializer;
attribute finalBlocks occurs on Initializer;
attribute flowEdges occurs on Initializer;

aspect production exprInitializer
top::Initializer ::= e::Expr
{
  top.initBlock = e.initBlock;
  top.finalBlocks = e.finalBlocks;
  top.flowEdges = e.flowEdges;
}

aspect production objectInitializer
top::Initializer ::= l::InitList
{
  top.initBlock = l.initBlock;
  top.finalBlocks = l.finalBlocks;
  top.flowEdges = l.flowEdges;
}

attribute initBlock occurs on InitList;
attribute finalBlocks occurs on InitList;
attribute flowEdges occurs on InitList;

aspect production consInit
top::InitList ::= h::Init  t::InitList
{
  top.initBlock = h.initBlock;
  top.finalBlocks = t.finalBlocks;
  top.flowEdges = h.flowEdges ++ t.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, t.initBlock), h.finalBlocks);
}

aspect production nilInit
top::InitList ::=
{
  top.initBlock = cfInitListBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

attribute initBlock occurs on Init;
attribute finalBlocks occurs on Init;
attribute flowEdges occurs on Init;

aspect production init
top::Init ::= i::Initializer
{
  top.initBlock = i.initBlock;
  top.finalBlocks = i.finalBlocks;
  top.flowEdges = i.flowEdges;
}

aspect production designatedInit
top::Init ::= d::Designator  i::Initializer
{
  top.initBlock = i.initBlock;
  top.finalBlocks = i.finalBlocks;
  top.flowEdges = i.flowEdges;
}

