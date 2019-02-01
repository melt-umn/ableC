grammar edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

terminal Asm_t 'asm' lexer classes {Ckeyword};
terminal CPP_Asm_t '__asm__' lexer classes {Ckeyword};
terminal CPP_UUAsm_t '__asm' lexer classes {Ckeyword};

-- Syntax used external to this file:

closed nonterminal SimpleAsmStatement_c with location, ast<String>;
concrete productions top::SimpleAsmStatement_c
| Asm_Starter_c '(' s::StringConstant_c ')'
    { top.ast = s.ast; }

closed nonterminal Asm_Statement_c with location, ast<ast:AsmStatement>;
concrete productions top::Asm_Statement_c
| Asm_Starter_c ds::TypeQualifier_c '(' arg::AsmArgument_c ')' ';'
    { top.ast = ast:asmStatementTypeQual( 
                  (case ds.typeQualifiers of
                     ast:nilQualifier() ->
                       error("Some TypeQualifier_c has empty typeQualifiers attribute.")
                   | ast:consQualifier(h, _) -> h
                   end),
                  arg.ast, location=top.location);    
    }
| Asm_Starter_c '(' arg::AsmArgument_c ')' ';'
    { top.ast = ast:asmStatement(arg.ast, location=top.location); }

-- Details:

closed nonterminal Asm_Starter_c with location;
concrete productions top::Asm_Starter_c
| 'asm'
    {}
| '__asm__'
    {}
| '__asm'
    {}

closed nonterminal AsmArgument_c with location, ast<ast:AsmArgument>;
concrete productions top::AsmArgument_c
| s::StringConstant_c
    { top.ast = ast:asmArgument( s.ast, 
                  ast:noneAsmOps(location=top.location),
                  ast:noneAsmOps(location=top.location), 
                  ast:noneAsmClobbers(location=top.location),
                  location=top.location ); }
| s::StringConstant_c ':' asmOps1::AsmOperands_c
    { top.ast = ast:asmArgument( s.ast, 
                  asmOps1.ast,
                  ast:noneAsmOps(location=top.location), 
                  ast:noneAsmClobbers(location=top.location),
                  location=top.location ); }
| s::StringConstant_c ':' 
    { top.ast = ast:asmArgument( s.ast, 
                  ast:noneAsmOps(location=top.location),
                  ast:noneAsmOps(location=top.location), 
                  ast:noneAsmClobbers(location=top.location),
                  location=top.location ); }
| s::StringConstant_c ':' asmOps1::AsmOperands_c ':' asmOps2::AsmOperands_c
    { top.ast = ast:asmArgument( s.ast, 
                  asmOps1.ast,
                  asmOps2.ast,
                  ast:noneAsmClobbers(location=top.location),
                  location=top.location ); }
| s::StringConstant_c ':'  ':' asmOps2::AsmOperands_c
    { top.ast = ast:asmArgument( s.ast, 
                  ast:noneAsmOps(location=top.location),
                  asmOps2.ast,
                  ast:noneAsmClobbers(location=top.location),
                  location=top.location ); }
| s::StringConstant_c ':' asmOps1::AsmOperands_c ':' 
    { top.ast = ast:asmArgument( s.ast, 
                  asmOps1.ast,
                  ast:noneAsmOps(location=top.location), 
                  ast:noneAsmClobbers(location=top.location),
                  location=top.location ); }
| s::StringConstant_c ':'  ':' 
    { top.ast = ast:asmArgument( s.ast, 
                  ast:noneAsmOps(location=top.location),
                  ast:noneAsmOps(location=top.location), 
                  ast:noneAsmClobbers(location=top.location),
                  location=top.location ); }
| s::StringConstant_c ':' asmOps1::AsmOperands_c ':' asmOps2::AsmOperands_c ':' asmC::AsmClobbers_c
    { top.ast = ast:asmArgument( s.ast, 
                  asmOps1.ast,
                  asmOps2.ast,
                  asmC.ast,
                  location=top.location ); }
| s::StringConstant_c ':'  ':' asmOps2::AsmOperands_c ':' asmC::AsmClobbers_c
    { top.ast = ast:asmArgument( s.ast, 
                  ast:noneAsmOps(location=top.location),
                  asmOps2.ast,
                  asmC.ast,
                  location=top.location ); }
| s::StringConstant_c ':' asmOps1::AsmOperands_c ':'  ':' asmC::AsmClobbers_c
    { top.ast = ast:asmArgument( s.ast, 
                  asmOps1.ast,
                  ast:noneAsmOps(location=top.location), 
                  asmC.ast,
                  location=top.location ); }
| s::StringConstant_c ':'  ':'  ':' asmC::AsmClobbers_c
    { top.ast = ast:asmArgument( s.ast, 
                  ast:noneAsmOps(location=top.location),
                  ast:noneAsmOps(location=top.location), 
                  asmC.ast,
                  location=top.location ); }

closed nonterminal AsmClobbers_c with location, ast<ast:AsmClobbers>;
concrete productions top::AsmClobbers_c
| s::StringConstant_t
    { top.ast = ast:oneAsmClobbers( s.lexeme, location=top.location ); }
| asmC::AsmClobbers_c ',' s::StringConstant_t
    { top.ast = ast:snocAsmClobbers( asmC.ast, s.lexeme, location=top.location ); }

closed nonterminal AsmOperands_c with location, ast<ast:AsmOperands>;
concrete productions top::AsmOperands_c
| asmOp::AsmOperand_c
    { top.ast = ast:oneAsmOps ( asmOp.ast, location=top.location ); }
| asmOps::AsmOperands_c ',' asmOp::AsmOperand_c
    { top.ast = ast:snocAsmOps( asmOps.ast, asmOp.ast, location=top.location ); }

closed nonterminal AsmOperand_c with location, ast<ast:AsmOperand> ;
concrete productions top::AsmOperand_c
| s::StringConstant_t '(' e::Expr_c ')'
    { top.ast = ast:asmOperand( s.lexeme, e.ast, location=top.location ); }
| '[' id::Identifier_c ']' s::StringConstant_t '(' e::Expr_c ')'
    { top.ast = ast:asmOperandId(id.ast, s.lexeme, e.ast, location=top.location); }

