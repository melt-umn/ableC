grammar edu:umn:cs:melt:ableC:cfg;

import edu:umn:cs:melt:ableC:abstractsyntax;
import edu:umn:cs:melt:ableC:abstractsyntax:env;

autocopy attribute cfg :: ControlFlowGraph;

synthesized attribute initBlock :: ControlFlowBlock;
synthesized attribute finalBlocks :: [ControlFlowBlock];
synthesized attribute flowEdges :: [ControlFlowEdge];

nonterminal ControlFlowGraph;

abstract production controlFlowGraph
top::ControlFlowGraph ::= edges::ControlFlowEdges
{
}

nonterminal ControlFlowEdges;

abstract production consControlFlowEdge
top::ControlFlowEdges ::= h::ControlFlowEdge  t::ControlFlowEdges
{
}

abstract production nilControlFlowEdge
top::ControlFlowEdges ::=
{
}

nonterminal ControlFlowEdge;

abstract production controlFlowEdge
top::ControlFlowEdge ::= b1::ControlFlowBlock  b2::ControlFlowBlock
{
}

nonterminal ControlFlowBlocks;

abstract production consControlFlowBlock
top::ControlFlowBlocks ::= h::ControlFlowBlock  t::ControlFlowBlocks
{
}

abstract production nilControlFlowBlock
top::ControlFlowBlocks ::=
{
}

nonterminal ControlFlowBlock with blockLabel, defs;
synthesized attribute blockLabel :: Integer;

abstract production cfStmtBlock
top::ControlFlowBlock ::= s::Decorated Stmt  l::Integer
{
  top.blockLabel = l;
  top.defs := s.defs;
}

abstract production cfExprBlock
top::ControlFlowBlock ::= e::Decorated Expr  l::Integer
{
  top.blockLabel = l;
  top.defs := e.defs;
}

abstract production cfMaybeExprBlock
top::ControlFlowBlock ::= e::Decorated MaybeExpr  l::Integer
{
  top.blockLabel = l;
  top.defs := e.defs;
}

abstract production cfExprOrTypeNameBlock
top::ControlFlowBlock ::= e::Decorated ExprOrTypeName  l::Integer
{
  top.blockLabel = l;
  top.defs := e.defs;
}

abstract production cfExprsBlock
top::ControlFlowBlock ::= e::Decorated Exprs  l::Integer
{
  top.blockLabel = l;
  top.defs := e.defs;
}

abstract production cfDeclsBlock
top::ControlFlowBlock ::= d::Decorated Decls  l::Integer
{
  top.blockLabel = l;
  top.defs := d.defs;
}

abstract production cfDeclBlock
top::ControlFlowBlock ::= d::Decorated Decl  l::Integer
{
  top.blockLabel = l;
  top.defs := d.defs;
}

abstract production cfDeclaratorsBlock
top::ControlFlowBlock ::= d::Decorated Declarators  l::Integer
{
  top.blockLabel = l;
  top.defs := d.defs;
}

abstract production cfDeclaratorBlock
top::ControlFlowBlock ::= d::Decorated Declarator  l::Integer
{
  top.blockLabel = l;
  top.defs := d.defs;
}

abstract production cfInitListBlock
top::ControlFlowBlock ::= i::Decorated InitList  l::Integer
{
  top.blockLabel = l;
  top.defs := i.defs;
}

abstract production cfGenericAssocsBlock
top::ControlFlowBlock ::= g::Decorated GenericAssocs  l::Integer
{
  top.blockLabel = l;
  top.defs := g.defs;
}

abstract production cfMaybeInitializerBlock
top::ControlFlowBlock ::= i::Decorated MaybeInitializer  l::Integer
{
  top.blockLabel = l;
  top.defs := i.defs;
}


