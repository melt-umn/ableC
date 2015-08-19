
nonterminal AsmStatement with location, pp, env, returnType, freeVariables;

abstract production asmStatement
a::AsmStatement ::= arg::AsmArgument
{
  a.pp = concat( [ text("asm ("), arg.pp, text(")"), text(";") ] );
  a.freeVariables = arg.freeVariables;
}

abstract production asmStatementTypeQual
a::AsmStatement ::= tq::Qualifier arg::AsmArgument
{
  a.pp = concat( [ text("asm "), tq.pp, text(" ("), arg.pp, text(")"), text(";") ] );
  a.freeVariables = arg.freeVariables;
}

nonterminal AsmArgument with location, pp, env, returnType, freeVariables;
abstract production asmArgument
top::AsmArgument ::= s::String asmOps1::AsmOperands asmOps2::AsmOperands asmC::AsmClobbers
{
  top.pp = concat( [ text(s) ]
             ++ (if asmOps1Exists || asmOps2Exists || asmClobExists then [text(": ")] else [ ])  
             ++ [asmOps1.pp]
             ++ (if asmOps2Exists || asmClobExists then [text(": ")] else [ ])
             ++ [asmOps2.pp] 
             ++ (if asmClobExists then [text(": ")] else [ ])
             ++ [asmC.pp] 
             ) ;  
  top.freeVariables = asmOps1.freeVariables ++ asmOps2.freeVariables;

  local attribute asmOps1Exists :: Boolean =
    case asmOps1 of noneAsmOps() -> false | _ -> true end ;
  local attribute asmOps2Exists :: Boolean =
    case asmOps2 of noneAsmOps() -> false | _ -> true end ;
  local attribute asmClobExists :: Boolean =
    case asmC of noneAsmClobbers() -> false | _ -> true end ;
}

nonterminal AsmClobbers with location, pp;
abstract production noneAsmClobbers 
top::AsmClobbers ::=
{
  top.pp = notext();
}
abstract production oneAsmClobbers 
top::AsmClobbers ::= s::String
{
  top.pp = text(s);
}
abstract production snocAsmClobbers 
top::AsmClobbers ::= asmC::AsmClobbers s::String
{
  top.pp = concat( [asmC.pp, text(", "), text(s) ] );
}

nonterminal AsmOperands with location, pp, env, returnType, freeVariables;
abstract production noneAsmOps
top::AsmOperands ::= 
{
  top.pp = notext();
  top.freeVariables = [];
}
abstract production oneAsmOps
top::AsmOperands ::= asmOp::AsmOperand
{
  top.pp = asmOp.pp;
  top.freeVariables = asmOp.freeVariables;
}
abstract production snocAsmOps
top::AsmOperands ::= asmOps::AsmOperands asmOp::AsmOperand
{
  top.pp = concat ( [asmOps.pp, text(", "), asmOp.pp] );
  top.freeVariables = asmOp.freeVariables ++ asmOps.freeVariables;
}

nonterminal AsmOperand with location, pp, env, returnType, freeVariables;
abstract production asmOperand
top::AsmOperand ::= s::String e::Expr
{ 
  top.pp = concat( [ text(s), text(" ("), e.pp, text(")") ] );
  top.freeVariables = e.freeVariables;
}

abstract production asmOperandId
top::AsmOperand ::= id::Name  s::String e::Expr
{
  top.pp = concat( [ text("["), id.pp, text("] "), text(s), text(" ("), e.pp, text(")") ] ); 
  top.freeVariables = e.freeVariables;
}
