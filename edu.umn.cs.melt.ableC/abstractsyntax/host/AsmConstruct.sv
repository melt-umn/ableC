grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production asmStatement
a::AsmStatement ::= arg::AsmArgument
{
  propagate host, lifted;
  a.pp = ppConcat( [ text("asm ("), arg.pp, text(")"), text(";") ] );
  a.freeVariables = arg.freeVariables;
}

abstract production asmStatementTypeQual
a::AsmStatement ::= tq::Qualifier arg::AsmArgument
{
  propagate host, lifted;
  a.pp = ppConcat( [ text("asm "), tq.pp, text(" ("), arg.pp, text(")"), text(";") ] );
  a.freeVariables = arg.freeVariables;
}

abstract production asmArgument
top::AsmArgument ::= s::String asmOps1::AsmOperands asmOps2::AsmOperands asmC::AsmClobbers
{
  propagate host, lifted;
  top.pp = ppConcat( [ text(s) ]
             ++ (if asmOps1.exists || asmOps2.exists || asmC.exists then [text(": ")] else [ ])  
             ++ [asmOps1.pp]
             ++ (if asmOps2.exists || asmC.exists then [text(": ")] else [ ])
             ++ [asmOps2.pp] 
             ++ (if asmC.exists then [text(": ")] else [ ])
             ++ [asmC.pp] 
             ) ;  
  top.freeVariables = asmOps1.freeVariables ++ asmOps2.freeVariables;
}

abstract production noneAsmClobbers 
top::AsmClobbers ::=
{
  propagate host, lifted;
  top.exists = false;
  top.pp = notext();
}
abstract production oneAsmClobbers 
top::AsmClobbers ::= s::String
{
  propagate host, lifted;
  top.exists = true;
  top.pp = text(s);
}
abstract production snocAsmClobbers 
top::AsmClobbers ::= asmC::AsmClobbers s::String
{
  propagate host, lifted;
  top.exists = true;
  top.pp = ppConcat( [asmC.pp, text(", "), text(s) ] );
}

abstract production noneAsmOps
top::AsmOperands ::= 
{
  propagate host, lifted;
  top.pp = notext();
  top.exists = false;
  top.freeVariables = [];
}
abstract production oneAsmOps
top::AsmOperands ::= asmOp::AsmOperand
{
  propagate host, lifted;
  top.pp = asmOp.pp;
  top.exists = true;
  top.freeVariables = asmOp.freeVariables;
}
abstract production snocAsmOps
top::AsmOperands ::= asmOps::AsmOperands asmOp::AsmOperand
{
  propagate host, lifted;
  top.pp = ppConcat ( [asmOps.pp, text(", "), asmOp.pp] );
  top.exists = true;
  top.freeVariables = asmOp.freeVariables ++ asmOps.freeVariables;
}

abstract production asmOperand
top::AsmOperand ::= s::String e::Expr
{ 
  propagate host, lifted;
  top.pp = ppConcat( [ text(s), text(" ("), e.pp, text(")") ] );
  top.freeVariables = e.freeVariables;
}

abstract production asmOperandId
top::AsmOperand ::= id::Name  s::String e::Expr
{
  propagate host, lifted;
  top.pp = ppConcat( [ text("["), id.pp, text("] "), text(s), text(" ("), e.pp, text(")") ] ); 
  top.freeVariables = e.freeVariables;
}
