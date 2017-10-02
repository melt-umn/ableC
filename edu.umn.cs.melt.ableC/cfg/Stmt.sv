grammar edu:umn:cs:melt:ableC:cfg;

import edu:umn:cs:melt:ableC:abstractsyntax;
import silver:langutil;

attribute initBlock occurs on Stmt;
attribute finalBlocks occurs on Stmt;
attribute flowEdges occurs on Stmt;
attribute cfg occurs on Stmt;

aspect production nullStmt
top::Stmt ::=
{
  top.initBlock = cfStmtBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production seqStmt
top::Stmt ::= h::Stmt  t::Stmt
{
  top.initBlock = h.initBlock;
  top.finalBlocks = t.finalBlocks;
  top.flowEdges = h.flowEdges ++ t.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, t.initBlock), h.finalBlocks);
}

aspect production compoundStmt
top::Stmt ::= s::Stmt
{
  top.initBlock = s.initBlock;
  top.finalBlocks = s.finalBlocks;
  top.flowEdges = s.flowEdges;
}

aspect production warnStmt
top::Stmt ::= msg::[Message]
{
  top.initBlock = cfStmtBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production declStmt
top::Stmt ::= d::Decl
{
  top.initBlock = d.initBlock;
  top.finalBlocks = d.finalBlocks;
  top.flowEdges = d.flowEdges;
}

aspect production exprStmt
top::Stmt ::= d::Expr
{
  top.initBlock = d.initBlock;
  top.finalBlocks = d.finalBlocks;
  top.flowEdges = d.flowEdges;
}

aspect production ifStmt
top::Stmt ::= c::Expr  t::Stmt  e::Stmt
{
  top.initBlock = c.initBlock;
  top.finalBlocks = t.finalBlocks ++ e.finalBlocks;
  top.flowEdges = c.flowEdges ++ t.flowEdges ++ e.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, t.initBlock), c.finalBlocks) ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, e.initBlock), c.finalBlocks);
}

aspect production whileStmt
top::Stmt ::= e::Expr  b::Stmt
{
  top.initBlock = e.initBlock;
  top.finalBlocks = e.finalBlocks; -- assuming no breaks?
  top.flowEdges = e.flowEdges ++ b.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, b.initBlock), e.finalBlocks) ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, e.initBlock), b.finalBlocks);
}

aspect production doStmt
top::Stmt ::= b::Stmt  e::Expr
{
  top.initBlock = b.initBlock;
  top.finalBlocks = e.finalBlocks; -- assuming no breaks?
  top.flowEdges = b.flowEdges ++ e.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, e.initBlock), b.finalBlocks) ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, b.initBlock), e.finalBlocks);
}

aspect production forStmt
top::Stmt ::= i::MaybeExpr  c::MaybeExpr  s::MaybeExpr  b::Stmt
{
  top.initBlock = i.initBlock;
  top.finalBlocks = c.finalBlocks; -- assuming no breaks?
  top.flowEdges = i.flowEdges ++ c.flowEdges ++ s.flowEdges ++ b.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, c.initBlock), i.finalBlocks) ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, s.initBlock), b.finalBlocks) ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, c.initBlock), s.finalBlocks);
}

aspect production forDeclStmt
top::Stmt ::= i::Decl  c::MaybeExpr  s::MaybeExpr  b::Stmt
{
  top.initBlock = i.initBlock;
  top.finalBlocks = c.finalBlocks; -- assuming no breaks?
  top.flowEdges = i.flowEdges ++ c.flowEdges ++ s.flowEdges ++ b.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, c.initBlock), i.finalBlocks) ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, s.initBlock), b.finalBlocks) ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, c.initBlock), s.finalBlocks);
}

aspect production returnStmt
top::Stmt ::= e::MaybeExpr
{
  top.initBlock = e.initBlock;
  top.finalBlocks = e.finalBlocks;
  top.flowEdges = e.flowEdges;
}

aspect production switchStmt
top::Stmt ::= e::Expr  b::Stmt
{
  top.initBlock = e.initBlock;
  top.finalBlocks = b.finalBlocks;
  top.flowEdges = e.flowEdges ++ b.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, b.initBlock), e.finalBlocks);
}

aspect production gotoStmt
top::Stmt ::= l::Name
{
  -- TODO: how to handle goto?
  top.initBlock = cfStmtBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production continueStmt
top::Stmt ::=
{
  -- TODO: how to handle continue?
  top.initBlock = cfStmtBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production breakStmt
top::Stmt ::=
{
  -- TODO: how to handle break?
  top.initBlock = cfStmtBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production labelStmt
top::Stmt ::= l::Name  s::Stmt
{
  top.initBlock = s.initBlock;
  top.finalBlocks = s.finalBlocks;
  top.flowEdges = s.flowEdges;
}

aspect production caseLabelStmt
top::Stmt ::= v::Expr  s::Stmt
{
  top.initBlock = v.initBlock;
  top.finalBlocks = v.finalBlocks ++ s.finalBlocks;
  top.flowEdges = v.flowEdges ++ s.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, s.initBlock), v.finalBlocks);
}

aspect production defaultLabelStmt
top::Stmt ::= s::Stmt
{
  top.initBlock = s.initBlock;
  top.finalBlocks = s.finalBlocks;
  top.flowEdges = s.flowEdges;
}

aspect production functionDeclStmt
top::Stmt ::= d::FunctionDecl
{
  -- TODO: how to handle functionDeclStmt?
  top.initBlock = cfStmtBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production caseLabelRangeStmt
top::Stmt ::= l::Expr  u::Expr  s::Stmt
{
  top.initBlock = l.initBlock;
  top.finalBlocks = u.finalBlocks ++ s.finalBlocks;
  top.flowEdges = l.flowEdges ++ u.flowEdges ++ s.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, u.initBlock), l.finalBlocks) ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, s.initBlock), u.finalBlocks);
}

aspect production asmStmt
top::Stmt ::= asm::AsmStatement
{
  top.initBlock = cfStmtBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production txtStmt
s::Stmt ::= txt::String
{
  s.initBlock = cfStmtBlock(s, genInt());
  s.finalBlocks = [s.initBlock];
  s.flowEdges = [];
}

aspect production injectGlobalDeclsStmt
top::Stmt ::= decls::Decls lifted::Stmt
{
  -- TODO: how to handle injectGlobalDeclsStmt?
  top.initBlock = lifted.initBlock;
  top.finalBlocks = lifted.finalBlocks;
  top.flowEdges = lifted.flowEdges;
}

