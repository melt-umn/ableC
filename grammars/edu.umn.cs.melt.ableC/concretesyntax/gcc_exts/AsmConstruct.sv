grammar edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

terminal Asm_t 'asm' lexer classes {Keyword, Reserved};
terminal CPP_Asm_t '__asm__' lexer classes {Keyword, Reserved};
terminal CPP_UUAsm_t '__asm' lexer classes {Keyword, Reserved};

-- Syntax used external to this file:

closed tracked nonterminal SimpleAsmStatement_c with ast<String>;
concrete productions top::SimpleAsmStatement_c
| Asm_Starter_c '(' s::StringConstant_c ')'
    { top.ast = s.ast; }

closed tracked nonterminal Asm_Statement_c with ast<ast:AsmStatement>;
concrete productions top::Asm_Statement_c
| Asm_Starter_c ds::TypeQualifier_c '(' arg::AsmArgument_c ')' ';'
    { top.ast = ast:asmStatementTypeQual( 
                  (case ds.typeQualifiers of
                     ast:nilQualifier() ->
                       error("Some TypeQualifier_c has empty typeQualifiers attribute.")
                   | ast:consQualifier(h, _) -> ^h
                   end),
                  arg.ast);    
    }
| Asm_Starter_c '(' arg::AsmArgument_c ')' ';'
    { top.ast = ast:asmStatement(arg.ast); }

-- Details:

closed tracked nonterminal Asm_Starter_c;
concrete productions top::Asm_Starter_c
| 'asm'
    {}
| '__asm__'
    {}
| '__asm'
    {}

closed tracked nonterminal AsmArgument_c with ast<ast:AsmArgument>;
concrete productions top::AsmArgument_c
| s::StringConstant_c
    { top.ast = ast:asmArgument( s.ast, 
                  ast:noneAsmOps(),
                  ast:noneAsmOps(), 
                  ast:noneAsmClobbers() ); }
| s::StringConstant_c ':' asmOps1::AsmOperands_c
    { top.ast = ast:asmArgument( s.ast, 
                  asmOps1.ast,
                  ast:noneAsmOps(), 
                  ast:noneAsmClobbers() ); }
| s::StringConstant_c ':' 
    { top.ast = ast:asmArgument( s.ast, 
                  ast:noneAsmOps(),
                  ast:noneAsmOps(), 
                  ast:noneAsmClobbers() ); }
| s::StringConstant_c ':' asmOps1::AsmOperands_c ':' asmOps2::AsmOperands_c
    { top.ast = ast:asmArgument( s.ast, 
                  asmOps1.ast,
                  asmOps2.ast,
                  ast:noneAsmClobbers() ); }
| s::StringConstant_c ':'  ':' asmOps2::AsmOperands_c
    { top.ast = ast:asmArgument( s.ast, 
                  ast:noneAsmOps(),
                  asmOps2.ast,
                  ast:noneAsmClobbers() ); }
| s::StringConstant_c ':' asmOps1::AsmOperands_c ':' 
    { top.ast = ast:asmArgument( s.ast, 
                  asmOps1.ast,
                  ast:noneAsmOps(), 
                  ast:noneAsmClobbers() ); }
| s::StringConstant_c ':'  ':' 
    { top.ast = ast:asmArgument( s.ast, 
                  ast:noneAsmOps(),
                  ast:noneAsmOps(), 
                  ast:noneAsmClobbers() ); }
| s::StringConstant_c ':' asmOps1::AsmOperands_c ':' asmOps2::AsmOperands_c ':' asmC::AsmClobbers_c
    { top.ast = ast:asmArgument( s.ast, 
                  asmOps1.ast,
                  asmOps2.ast,
                  asmC.ast ); }
| s::StringConstant_c ':'  ':' asmOps2::AsmOperands_c ':' asmC::AsmClobbers_c
    { top.ast = ast:asmArgument( s.ast, 
                  ast:noneAsmOps(),
                  asmOps2.ast,
                  asmC.ast ); }
| s::StringConstant_c ':' asmOps1::AsmOperands_c ':'  ':' asmC::AsmClobbers_c
    { top.ast = ast:asmArgument( s.ast, 
                  asmOps1.ast,
                  ast:noneAsmOps(), 
                  asmC.ast ); }
| s::StringConstant_c ':'  ':'  ':' asmC::AsmClobbers_c
    { top.ast = ast:asmArgument( s.ast, 
                  ast:noneAsmOps(),
                  ast:noneAsmOps(), 
                  asmC.ast ); }

closed tracked nonterminal AsmClobbers_c with ast<ast:AsmClobbers>;
concrete productions top::AsmClobbers_c
| s::StringConstant_t
    { top.ast = ast:oneAsmClobbers( s.lexeme ); }
| asmC::AsmClobbers_c ',' s::StringConstant_t
    { top.ast = ast:snocAsmClobbers( asmC.ast, s.lexeme ); }

closed tracked nonterminal AsmOperands_c with ast<ast:AsmOperands>;
concrete productions top::AsmOperands_c
| asmOp::AsmOperand_c
    { top.ast = ast:oneAsmOps ( asmOp.ast ); }
| asmOps::AsmOperands_c ',' asmOp::AsmOperand_c
    { top.ast = ast:snocAsmOps( asmOps.ast, asmOp.ast ); }

closed tracked nonterminal AsmOperand_c with ast<ast:AsmOperand> ;
concrete productions top::AsmOperand_c
| s::StringConstant_t '(' e::Expr_c ')'
    { top.ast = ast:asmOperand( s.lexeme, e.ast ); }
| '[' id::Identifier_c ']' s::StringConstant_t '(' e::Expr_c ')'
    { top.ast = ast:asmOperandId(id.ast, s.lexeme, e.ast); }

