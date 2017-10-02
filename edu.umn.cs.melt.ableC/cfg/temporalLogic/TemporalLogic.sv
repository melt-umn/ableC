grammar edu:umn:cs:melt:ableC:cfg:temporalLogic;

import edu:umn:cs:melt:ableC:abstractsyntax;
import edu:umn:cs:melt:ableC:cfg;

synthesized attribute satisfied :: Boolean occurs on ControlFlowGraph;
autocopy attribute p :: (Boolean ::= ControlFlowBlock) occurs on ControlFlowGraph;
autocopy attribute until :: (Boolean ::= ControlFlowBlock) occurs on ControlFlowGraph;
autocopy attribute blockToAnalyze :: ControlFlowBlock occurs on ControlFlowGraph;
autocopy attribute isForwardAnalysis :: Boolean occurs on ControlFlowGraph;
autocopy attribute analysisPath :: [ControlFlowBlock] occurs on ControlFlowGraph;

aspect production controlFlowGraph
top::ControlFlowGraph ::= edges::ControlFlowEdges
{
  local succs :: ControlFlowBlocks = edges.immediateSuccessors;
  succs.p = top.p;
  succs.until = top.until;
  succs.cfg = top;
  succs.isForwardAnalysis = top.isForwardAnalysis;
  succs.analysisPath = top.analysisPath;

  top.satisfied = succs.satisfied;
}

synthesized attribute immediateSuccessors :: ControlFlowBlocks occurs on ControlFlowEdges;
attribute blockToAnalyze occurs on ControlFlowEdges;
attribute isForwardAnalysis occurs on ControlFlowEdges;
attribute analysisPath occurs on ControlFlowEdges;

aspect production consControlFlowEdge
top::ControlFlowEdges ::= h::ControlFlowEdge  t::ControlFlowEdges
{
  top.immediateSuccessors =
    if (h.edgeFrom.blockLabel == top.blockToAnalyze.blockLabel) &&
          !containsBy(\a::ControlFlowBlock b::ControlFlowBlock ->
                        a.blockLabel == b.blockLabel, h.edgeTo, top.analysisPath)
    then consControlFlowBlock(h.edgeTo, t.immediateSuccessors)
    else t.immediateSuccessors;
}

aspect production nilControlFlowEdge
top::ControlFlowEdges ::=
{
  top.immediateSuccessors = nilControlFlowBlock();
}

synthesized attribute edgeFrom :: ControlFlowBlock occurs on ControlFlowEdge;
synthesized attribute edgeTo :: ControlFlowBlock occurs on ControlFlowEdge;
attribute isForwardAnalysis occurs on ControlFlowEdge;

aspect production controlFlowEdge
top::ControlFlowEdge ::= b1::ControlFlowBlock  b2::ControlFlowBlock
{
  top.edgeFrom = if top.isForwardAnalysis then b1 else b2;
  top.edgeTo   = if top.isForwardAnalysis then b2 else b1;
}

attribute satisfied occurs on ControlFlowBlocks;
attribute p occurs on ControlFlowBlocks;
attribute until occurs on ControlFlowBlocks;
attribute isForwardAnalysis occurs on ControlFlowBlocks;
attribute analysisPath occurs on ControlFlowBlocks;
autocopy attribute cfg :: ControlFlowGraph occurs on ControlFlowBlocks;

aspect production consControlFlowBlock
top::ControlFlowBlocks ::= h::ControlFlowBlock  t::ControlFlowBlocks
{
  -- analyze successors of h
  local cfg :: ControlFlowGraph = top.cfg;
  cfg.blockToAnalyze = h;
  cfg.isForwardAnalysis = top.isForwardAnalysis;
  cfg.p = top.p;
  cfg.until = top.until;
  cfg.analysisPath = cons(h, top.analysisPath);

  top.satisfied = (top.until(h) || (top.p(h) && cfg.satisfied)) && t.satisfied;
}

aspect production nilControlFlowBlock
top::ControlFlowBlocks ::=
{
  top.satisfied = true;
}

function allSuccessorsUntil
Boolean ::= p::(Boolean ::= ControlFlowBlock)  until::(Boolean ::= ControlFlowBlock)
            x::ControlFlowBlock cfg::ControlFlowGraph  isForwardAnalysis::Boolean
{
  cfg.blockToAnalyze = x;
  cfg.isForwardAnalysis = isForwardAnalysis;
  cfg.p = p;
  cfg.until = until;
  cfg.analysisPath = [];

  return cfg.satisfied;
}

function allSuccessors
Boolean ::= p::(Boolean ::= ControlFlowBlock)  x::ControlFlowBlock
            cfg::ControlFlowGraph  isForwardAnalysis::Boolean
{
  return allSuccessorsUntil(p, (\x::ControlFlowBlock -> false), x, cfg, isForwardAnalysis);
}

function existsSuccessor
Boolean ::= p::(Boolean ::= ControlFlowBlock)  x::ControlFlowBlock
            cfg::ControlFlowGraph  isForwardAnalysis::Boolean
{
  return !allSuccessors((\x::ControlFlowBlock -> !p(x)), x, cfg, isForwardAnalysis);
}

