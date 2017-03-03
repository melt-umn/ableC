grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

aspect production asmStatement
a::AsmStatement ::= arg::AsmArgument
{
  propagate substituted;
}

aspect production asmStatementTypeQual
a::AsmStatement ::= tq::Qualifier arg::AsmArgument
{
  propagate substituted;
}

aspect production asmArgument
top::AsmArgument ::= s::String asmOps1::AsmOperands asmOps2::AsmOperands asmC::AsmClobbers
{
  propagate substituted;
}

aspect production noneAsmClobbers 
top::AsmClobbers ::=
{
  propagate substituted;
}
aspect production oneAsmClobbers 
top::AsmClobbers ::= s::String
{
  propagate substituted;
}
aspect production snocAsmClobbers 
top::AsmClobbers ::= asmC::AsmClobbers s::String
{
  propagate substituted;
}

aspect production noneAsmOps
top::AsmOperands ::= 
{
  propagate substituted;
}
aspect production oneAsmOps
top::AsmOperands ::= asmOp::AsmOperand
{
  propagate substituted;
}
aspect production snocAsmOps
top::AsmOperands ::= asmOps::AsmOperands asmOp::AsmOperand
{
  propagate substituted;
}

aspect production asmOperand
top::AsmOperand ::= s::String e::Expr
{
  propagate substituted;
}

aspect production asmOperandId
top::AsmOperand ::= id::Name  s::String e::Expr
{
  propagate substituted;
}
