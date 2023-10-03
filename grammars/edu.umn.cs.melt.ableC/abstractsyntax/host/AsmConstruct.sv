grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

propagate host on AsmStatement, AsmArgument, AsmClobbers, AsmOperands, AsmOperand;
propagate env, controlStmtContext on AsmStatement, AsmArgument, AsmOperands, AsmOperand;

tracked nonterminal AsmStatement with pp, host, env, controlStmtContext, freeVariables;
flowtype AsmStatement = decorate {env, controlStmtContext};

abstract production asmStatement
a::AsmStatement ::= arg::AsmArgument
{
  a.pp = ppConcat( [ text("asm ("), arg.pp, text(")"), text(";") ] );
  a.freeVariables := arg.freeVariables;
}

abstract production asmStatementTypeQual
a::AsmStatement ::= tq::Qualifier arg::AsmArgument
{
  a.pp = ppConcat( [ text("asm "), tq.pp, text(" ("), arg.pp, text(")"), text(";") ] );
  a.freeVariables := arg.freeVariables;
}

tracked nonterminal AsmArgument with pp, host, env, controlStmtContext, freeVariables;
flowtype AsmArgument = decorate {env, controlStmtContext};

abstract production asmArgument
top::AsmArgument ::= s::String asmOps1::AsmOperands asmOps2::AsmOperands asmC::AsmClobbers
{
  top.pp = ppConcat( [ text(s) ]
             ++ (if asmOps1.exists || asmOps2.exists || asmC.exists then [text(": ")] else [ ])
             ++ [asmOps1.pp]
             ++ (if asmOps2.exists || asmC.exists then [text(": ")] else [ ])
             ++ [asmOps2.pp]
             ++ (if asmC.exists then [text(": ")] else [ ])
             ++ [asmC.pp]
             ) ;
  top.freeVariables := asmOps1.freeVariables ++ asmOps2.freeVariables;
}

synthesized attribute exists::Boolean;

tracked nonterminal AsmClobbers with pp, exists, host;
flowtype AsmClobbers = decorate {}, exists {};

abstract production noneAsmClobbers
top::AsmClobbers ::=
{
  top.exists = false;
  top.pp = notext();
}
abstract production oneAsmClobbers
top::AsmClobbers ::= s::String
{
  top.exists = true;
  top.pp = text(s);
}
abstract production snocAsmClobbers
top::AsmClobbers ::= asmC::AsmClobbers s::String
{
  top.exists = true;
  top.pp = ppConcat( [asmC.pp, text(", "), text(s) ] );
}

tracked nonterminal AsmOperands with pp, exists, host, env, controlStmtContext, freeVariables;
flowtype AsmOperands = decorate {env, controlStmtContext}, exists {};

abstract production noneAsmOps
top::AsmOperands ::=
{
  top.pp = notext();
  top.exists = false;
  top.freeVariables := [];
}
abstract production oneAsmOps
top::AsmOperands ::= asmOp::AsmOperand
{
  top.pp = asmOp.pp;
  top.exists = true;
  top.freeVariables := asmOp.freeVariables;
}
abstract production snocAsmOps
top::AsmOperands ::= asmOps::AsmOperands asmOp::AsmOperand
{
  top.pp = ppConcat ( [asmOps.pp, text(", "), asmOp.pp] );
  top.exists = true;
  top.freeVariables := asmOp.freeVariables ++ asmOps.freeVariables;
}

tracked nonterminal AsmOperand with pp, host, env, controlStmtContext, freeVariables;
flowtype AsmOperand = decorate {env, controlStmtContext};

abstract production asmOperand
top::AsmOperand ::= s::String e::Expr
{
  top.pp = ppConcat( [ text(s), text(" ("), e.pp, text(")") ] );
  top.freeVariables := e.freeVariables;
}

abstract production asmOperandId
top::AsmOperand ::= id::Name  s::String e::Expr
{
  top.pp = ppConcat( [ text("["), id.pp, text("] "), text(s), text(" ("), e.pp, text(")") ] );
  top.freeVariables := e.freeVariables;
}