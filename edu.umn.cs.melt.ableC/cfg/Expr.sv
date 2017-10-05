grammar edu:umn:cs:melt:ableC:cfg;

import edu:umn:cs:melt:ableC:abstractsyntax;
import edu:umn:cs:melt:ableC:abstractsyntax:env;
import silver:langutil;

attribute initBlock occurs on Expr;
attribute finalBlocks occurs on Expr;
attribute flowEdges occurs on Expr;

aspect production seedingForwardsToEquationDependencies
top::Expr ::=
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production errorExpr
top::Expr ::= msg::[Message]
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production warnExpr
top::Expr ::= msg::[Message] e::Expr
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production declRefExpr
top::Expr ::= id::Name
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production stringLiteral
top::Expr ::= l::String
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production parenExpr
top::Expr ::= e::Expr
{
  top.initBlock = e.initBlock;
  top.finalBlocks = e.finalBlocks;
  top.flowEdges = e.flowEdges;
}

aspect production qualifiedUnaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr  collectedTypeQualifiers::Qualifiers
{
  top.initBlock = e.initBlock;
  top.finalBlocks = e.finalBlocks;
  top.flowEdges = e.flowEdges;
}

aspect production unaryExprOrTypeTraitExpr
top::Expr ::= op::UnaryTypeOp  e::ExprOrTypeName
{
  top.initBlock = e.initBlock;
  top.finalBlocks = e.finalBlocks;
  top.flowEdges = e.flowEdges;
}

aspect production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  top.initBlock = lhs.initBlock;
  top.finalBlocks = rhs.finalBlocks;
  top.flowEdges = lhs.flowEdges ++ rhs.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, rhs.initBlock), lhs.finalBlocks);
}

aspect production directCallExpr
top::Expr ::= f::Name  a::Exprs
{
  top.initBlock = a.initBlock;
  top.finalBlocks = a.finalBlocks;
  top.flowEdges = a.flowEdges;
}

aspect production callExpr
top::Expr ::= f::Expr  a::Exprs
{
  top.initBlock = f.initBlock;
  top.finalBlocks = a.finalBlocks;
  top.flowEdges = f.flowEdges ++ a.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, a.initBlock), f.finalBlocks);
}

aspect production memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  top.initBlock = lhs.initBlock;
  top.finalBlocks = lhs.finalBlocks;
  top.flowEdges = lhs.flowEdges;
}

aspect production qualifiedBinaryOpExpr
top::Expr ::= lhs::Expr  op::BinOp  rhs::Expr  collectedTypeQualifiers::Qualifiers
{
  top.initBlock = lhs.initBlock;
  top.finalBlocks = rhs.finalBlocks;
  top.flowEdges = lhs.flowEdges ++ rhs.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, rhs.initBlock), lhs.finalBlocks);
}

aspect production conditionalExpr
top::Expr ::= cond::Expr  t::Expr  e::Expr
{
  top.initBlock = cond.initBlock;
  top.finalBlocks = t.finalBlocks ++ e.finalBlocks;
  top.flowEdges = cond.flowEdges ++ t.flowEdges ++ e.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, t.initBlock), cond.finalBlocks) ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, e.initBlock), cond.finalBlocks);
}

aspect production binaryConditionalExpr
top::Expr ::= cond::Expr  e::Expr
{
  top.initBlock = cond.initBlock;
  top.finalBlocks = cond.finalBlocks ++ e.finalBlocks;
  top.flowEdges = cond.flowEdges ++ e.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, e.initBlock), cond.finalBlocks);
}

aspect production explicitCastExpr
top::Expr ::= ty::TypeName  e::Expr
{
  top.initBlock = e.initBlock;
  top.finalBlocks = e.finalBlocks;
  top.flowEdges = e.flowEdges;
}

aspect production compoundLiteralExpr
top::Expr ::= ty::TypeName  init::InitList
{
  top.initBlock = init.initBlock;
  top.finalBlocks = init.finalBlocks;
  top.flowEdges = init.flowEdges;
}

aspect production predefinedFuncExpr
top::Expr ::= 
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production genericSelectionExpr
top::Expr ::= e::Expr  gl::GenericAssocs  def::MaybeExpr
{
  top.initBlock = e.initBlock;
  top.finalBlocks = gl.finalBlocks ++ def.finalBlocks;
  top.flowEdges = e.flowEdges ++ gl.flowEdges ++ def.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, gl.initBlock), e.finalBlocks) ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, def.initBlock), e.finalBlocks);
}

attribute initBlock occurs on GenericAssocs;
attribute finalBlocks occurs on GenericAssocs;
attribute flowEdges occurs on GenericAssocs;

aspect production consGenericAssoc
top::GenericAssocs ::= h::GenericAssoc  t::GenericAssocs
{
  top.initBlock = cfGenericAssocsBlock(top, genInt());
  top.finalBlocks = h.finalBlocks ++ t.finalBlocks;
  top.flowEdges = [
    controlFlowEdge(top.initBlock, h.initBlock),
    controlFlowEdge(top.initBlock, t.initBlock)
  ];
}

aspect production nilGenericAssoc
top::GenericAssocs ::=
{
  top.initBlock = cfGenericAssocsBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

attribute initBlock occurs on GenericAssoc;
attribute finalBlocks occurs on GenericAssoc;
attribute flowEdges occurs on GenericAssoc;

aspect production genericAssoc
top::GenericAssoc ::= ty::TypeName  fun::Expr
{
  top.initBlock = fun.initBlock;
  top.finalBlocks = fun.finalBlocks;
  top.flowEdges = fun.flowEdges;
}

aspect production stmtExpr
top::Expr ::= body::Stmt result::Expr
{
  top.initBlock = body.initBlock;
  top.finalBlocks = result.finalBlocks;
  top.flowEdges = body.flowEdges ++ result.flowEdges ++
    map(\x :: ControlFlowBlock -> controlFlowEdge(x, result.initBlock), body.finalBlocks);
}

aspect production comment
top::Expr ::= s::String
{
  top.initBlock = cfExprBlock(top, genInt());
  top.finalBlocks = [top.initBlock];
  top.flowEdges = [];
}

aspect production txtExpr
e::Expr ::= txt::String
{
  e.initBlock = cfExprBlock(e, genInt());
  e.finalBlocks = [e.initBlock];
  e.flowEdges = [];
}

aspect production injectGlobalDeclsExpr
top::Expr ::= decls::Decls lifted::Expr
{
  -- TODO: how to handle injectGlobalDeclsExpr?
  top.initBlock = lifted.initBlock;
  top.finalBlocks = lifted.finalBlocks;
  top.flowEdges = lifted.flowEdges;
}

