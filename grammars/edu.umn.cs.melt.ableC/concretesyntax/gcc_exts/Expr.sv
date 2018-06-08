grammar edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

import edu:umn:cs:melt:ableC:abstractsyntax:overloadable as ovrld;

terminal GNU_AlignOf_T '__alignof' lexer classes {Ckeyword};
terminal GNU_AlignOfUU_T '__alignof__' lexer classes {Ckeyword};

terminal GNU_Builtin_VaArg_t '__builtin_va_arg' lexer classes {Ckeyword};
terminal GNU_Builtin_Offsetof_t '__builtin_offsetof' lexer classes {Ckeyword};
terminal GNU_Builtin_TypesCompatible_t '__builtin_types_compatible_p' lexer classes {Ckeyword};
terminal GNU_Builtin_ConstantP_t '__builtin_constant_p' lexer classes {Ckeyword};
terminal GNU_Builtin_VaArgPack_t '__builtin_va_arg_pack' lexer classes {Ckeyword};
terminal GNU_Builtin_Expect_t '__builtin_expect' lexer classes {Ckeyword};
terminal GNU_Builtin_VaStart_t '__builtin_va_start' lexer classes {Ckeyword};
terminal GNU_Builtin_VaEnd_t '__builtin_va_end' lexer classes {Ckeyword};


-- If not null, otherwise
concrete productions top::ConditionalExpr_c
| c::LogicalOrExpr_c '?' ':' e::ConditionalExpr_c
    { top.ast = ast:binaryConditionalExpr(c.ast, e.ast, location=top.location); }

concrete productions top::UnaryExpr_c
| '__alignof' e::UnaryExpr_c
    { top.ast = ast:alignofExpr(ast:exprExpr(e.ast), location=top.location); }
| '__alignof' '(' t::TypeName_c ')'
    { top.ast = ast:alignofExpr(ast:typeNameExpr(t.ast), location=top.location); }
| '__alignof__' e::UnaryExpr_c
    { top.ast = ast:alignofExpr(ast:exprExpr(e.ast), location=top.location); }
| '__alignof__' '(' t::TypeName_c ')'
    { top.ast = ast:alignofExpr(ast:typeNameExpr(t.ast), location=top.location); }
| '&&' Identifier_c
    { top.ast = ast:errorExpr([err(top.location, "Address of labels not yet supported")], location=top.location); }

concrete productions top::UnaryOp_c
| '__extension__'
    { top.ast = top.expr; } -- Discard and ignore these annotations

concrete productions top::PrimaryExpr_c
| '(' '{' bis::BlockItemList_c '}' ')'
    { --local attribute rev:: [ast:Stmt] = reverse( bis.ast );
      local attribute lastExpr :: ast:Expr
        = case bis.lastBlockItem_c of
          | blockStmt_c( exprStmt_c( nonEmptyExprStmt_c (e,_))) -> e.ast
          | _ -> ast:errorExpr( [ err ( top.location, 
                                        "GCC-style statement expressions require " ++ 
                                        "at least one expression" ) ], 
                                  location=top.location )
          end ;
      top.ast = ast:stmtExpr( ast:foldStmt(bis.firstBlockItemList_c.ast), lastExpr, location=top.location);
      }
| '__builtin_va_arg' '(' e::AssignExpr_c ',' ty::TypeName_c ')'
    { top.ast = ast:vaArgExpr(e.ast, ty.ast, location=top.location); }
| '__builtin_offsetof' '(' ts::TypeName_c ',' e::MemberDesignator_c ')'
    { top.ast = ast:offsetofExpr(ts.ast, e.ast, location=top.location); }
| '__builtin_types_compatible_p' '(' t1::TypeName_c ',' t2::TypeName_c ')'
    { top.ast = ast:typesCompatibleExpr(t1.ast, t2.ast, location=top.location); }
| '__builtin_constant_p'  '(' e::AssignExpr_c ')'
    { top.ast = ast:isConstantExpr(e.ast, location=top.location); }
| '__builtin_va_arg_pack'  '(' ')'
    { top.ast = ast:vaArgPackExpr(location=top.location); }
| '__builtin_expect'  '(' e::AssignExpr_c ',' v::ConstantExpr_c ')'
    { top.ast = ast:expectExpr(e.ast, v.ast, location=top.location); }
| '__builtin_va_start'  '(' id::Identifier_c ',' id2::Identifier_c ')'
    { top.ast = ast:vaStartExpr(id.ast, id2.ast, location=top.location); }
| '__builtin_va_end'  '(' id::Identifier_c ')'
    { top.ast = ast:vaEndExpr(id.ast, location=top.location); }


closed nonterminal MemberDesignator_c with location, ast<ast:MemberDesignator>;
concrete productions top::MemberDesignator_c
| id::Identifier_c
    { top.ast = ast:initialMemberDesignator(id.ast); }
| d::MemberDesignator_c '.' id::Identifier_c
    { top.ast = ast:fieldMemberDesignator(d.ast, id.ast); }
| d::MemberDesignator_c '->' id::Identifier_c
    { top.ast = ast:derefMemberDesignator(d.ast, id.ast); }
| d::MemberDesignator_c '[' e::ConstantExpr_c ']'
    { top.ast = ast:arrayMemberDesignator(d.ast, e.ast); }

concrete productions top::Initializer_c
| '{' '}'
    { top.ast = ast:objectInitializer(ast:nilInit()); }

concrete productions top::Designation_c
| d::ArrayDesignator_c
    { top.ast = d.ast;
      d.givenDesignator = ast:initialDesignator(); }
| id::Identifier_c ':'
    { top.ast = ast:fieldDesignator(ast:initialDesignator(), id.ast); }

concrete productions top::ArrayDesignator_c
| '[' e1::ConstantExpr_c '...' e2::ConstantExpr_c ']'
    { top.ast = ast:arrayRangeDesignator(top.givenDesignator, e1.ast, e2.ast); }


