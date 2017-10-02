grammar edu:umn:cs:melt:ableC:cfg;

import edu:umn:cs:melt:ableC:abstractsyntax;
import edu:umn:cs:melt:ableC:abstractsyntax:env;
import silver:langutil;

attribute initBlock occurs on Decls;
attribute finalBlocks occurs on Decls;
attribute flowEdges occurs on Decls;

aspect production consDecl
top::Decls ::= h::Decl  t::Decls
{
  top.initBlock = h.initBlock;
  top.finalBlocks = t.finalBlocks;
  top.flowEdges = h.flowEdges ++ t.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, t.initBlock), h.finalBlocks);
}

aspect production nilDecl
top::Decls ::=
{
  top.initBlock = cfDeclsBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

attribute initBlock occurs on Decl;
attribute finalBlocks occurs on Decl;
attribute flowEdges occurs on Decl;

aspect production decls
top::Decl ::= d::Decls
{
  top.initBlock = d.initBlock;
  top.finalBlocks = d.finalBlocks;
  top.flowEdges = d.flowEdges;
}

aspect production defsDecl
top::Decl ::= d::[Def]
{
  top.initBlock = cfDeclBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production variableDecls
top::Decl ::= storage::[StorageClass]  attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  top.initBlock = dcls.initBlock;
  top.finalBlocks = dcls.finalBlocks;
  top.flowEdges = dcls.flowEdges;
}

aspect production typeExprDecl
top::Decl ::= attrs::Attributes ty::BaseTypeExpr
{
  top.initBlock = cfDeclBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production typedefDecls
top::Decl ::= attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  top.initBlock = dcls.initBlock;
  top.finalBlocks = dcls.finalBlocks;
  top.flowEdges = dcls.flowEdges;
}

aspect production functionDeclaration
top::Decl ::= f::FunctionDecl
{
  top.initBlock = cfDeclBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production warnDecl
top::Decl ::= msg::[Message]
{
  top.initBlock = cfDeclBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production staticAssertDecl
top::Decl ::= e::Expr  s::String
{
  top.initBlock = e.initBlock;
  top.finalBlocks = e.finalBlocks;
  top.flowEdges = e.flowEdges;
}

aspect production fileScopeAsm
top::Decl ::= s::String
{
  top.initBlock = cfDeclBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

attribute initBlock occurs on Declarators;
attribute finalBlocks occurs on Declarators;
attribute flowEdges occurs on Declarators;

aspect production consDeclarator
top::Declarators ::= h::Declarator  t::Declarators
{
  top.initBlock = h.initBlock;
  top.finalBlocks = t.finalBlocks;
  top.flowEdges = h.flowEdges ++ t.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, t.initBlock), h.finalBlocks);
}

aspect production nilDeclarator
top::Declarators ::=
{
  top.initBlock = cfDeclaratorsBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

attribute initBlock occurs on Declarator;
attribute finalBlocks occurs on Declarator;
attribute flowEdges occurs on Declarator;

aspect production declarator
top::Declarator ::= name::Name  ty::TypeModifierExpr  attrs::Attributes  initializer::MaybeInitializer
{
  top.initBlock = initializer.initBlock;
  top.finalBlocks = initializer.finalBlocks;
  top.flowEdges = initializer.flowEdges;
}

aspect production errorDeclarator
top::Declarator ::= msg::[Message]
{
  top.initBlock = cfDeclaratorBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production functionDecl
top::FunctionDecl ::= storage::[StorageClass]  fnquals::SpecialSpecifiers  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::Attributes  decls::Decls  body::Stmt
{
  local edges :: [ControlFlowEdge] = decls.flowEdges ++ body.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, body.initBlock), decls.finalBlocks);

  local cfg :: ControlFlowGraph =
    controlFlowGraph(foldr(consControlFlowEdge, nilControlFlowEdge(), edges));

  body.cfg = cfg;
}

aspect production nestedFunctionDecl
top::FunctionDecl ::= storage::[StorageClass]  fnquals::SpecialSpecifiers  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::Attributes  decls::Decls  body::Stmt
{
  local edges :: [ControlFlowEdge] = decls.flowEdges ++ body.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, body.initBlock), decls.finalBlocks);

  local cfg :: ControlFlowGraph =
    controlFlowGraph(foldr(consControlFlowEdge, nilControlFlowEdge(), edges));

  body.cfg = cfg;
}

aspect production structBitfield
top::StructDeclarator ::= name::MaybeName  ty::TypeModifierExpr  e::Expr  attrs::Attributes
{
--  e.cfg = controlFlowGraph(foldr(consControlFlowEdge, nilControlFlowEdge(), e.flowEdges));
}

aspect production txtDecl
d::Decl ::= txt::String
{
  d.initBlock = cfDeclBlock(d, genInt());
  d.finalBlocks = [d.initBlock];
  d.flowEdges = [];
}

