
nonterminal AsmStatement with location, pp, env, returnType;

abstract production asmStatement
a::AsmStatement ::= arg::AsmArgument
{
 a.pp = concat( [ text("asm ("), arg.pp, text(")") ] );
}

abstract production asmStatementTypeQual
a::AsmStatement ::= tq::Qualifier arg::AsmArgument
{
 a.pp = concat( [ text("asm "), tq.pp, text(" ("), arg.pp, text(")") ] );
}

nonterminal AsmArgument with location, pp, env, returnType;
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

nonterminal AsmOperands with location, pp, env, returnType;
abstract production noneAsmOps
top::AsmOperands ::= 
{
 top.pp = notext();
}
abstract production oneAsmOps
top::AsmOperands ::= asmOp::AsmOperand
{
 top.pp = asmOp.pp;
}
abstract production snocAsmOps
top::AsmOperands ::= asmOps::AsmOperands asmOp::AsmOperand
{
 top.pp = concat ( [asmOps.pp, text(", "), asmOp.pp] );
}

nonterminal AsmOperand with location, pp, env, returnType;
abstract production asmOperand
top::AsmOperand ::= s::String e::Expr
{ 
 top.pp = concat( [ text(s), text(" ("), e.pp, text(")") ] );
}

abstract production asmOperandId
top::AsmOperand ::= id::Name  s::String e::Expr
{
 top.pp = concat( [ text("["), id.pp, text("] "), text(s), text(" ("), e.pp, text(")") ] ); 
}
