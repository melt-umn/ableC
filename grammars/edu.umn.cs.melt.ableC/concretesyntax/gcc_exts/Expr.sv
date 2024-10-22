grammar edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

terminal GNU_AlignOf_T '__alignof' lexer classes {Keyword, Reserved};
terminal GNU_AlignOfUU_T '__alignof__' lexer classes {Keyword, Reserved};

terminal GNU_Builtin_VaArg_t '__builtin_va_arg' lexer classes {Keyword, Reserved};
terminal GNU_Builtin_Offsetof_t '__builtin_offsetof' lexer classes {Keyword, Reserved};
terminal GNU_Builtin_TypesCompatible_t '__builtin_types_compatible_p' lexer classes {Keyword, Reserved};
terminal GNU_Builtin_ConstantP_t '__builtin_constant_p' lexer classes {Keyword, Reserved};
terminal GNU_Builtin_VaArgPack_t '__builtin_va_arg_pack' lexer classes {Keyword, Reserved};
terminal GNU_Builtin_Expect_t '__builtin_expect' lexer classes {Keyword, Reserved};
terminal GNU_Builtin_VaStart_t '__builtin_va_start' lexer classes {Keyword, Reserved};
terminal GNU_Builtin_VaEnd_t '__builtin_va_end' lexer classes {Keyword, Reserved};


-- If not null, otherwise
concrete productions top::ConditionalExpr_c
| c::LogicalOrExpr_c '?' ':' e::ConditionalExpr_c
    { top.ast = ast:binaryConditionalExpr(c.ast, e.ast); }

concrete productions top::UnaryExpr_c
| '__alignof' e::UnaryExpr_c
    { top.ast = ast:alignofExpr(ast:exprExpr(e.ast)); }
| '__alignof' '(' t::TypeName_c ')'
    { top.ast = ast:alignofExpr(ast:typeNameExpr(t.ast)); }
| '__alignof__' e::UnaryExpr_c
    { top.ast = ast:alignofExpr(ast:exprExpr(e.ast)); }
| '__alignof__' '(' t::TypeName_c ')'
    { top.ast = ast:alignofExpr(ast:typeNameExpr(t.ast)); }
| '&&' Identifier_c
    { top.ast = ast:errorExpr([errFromOrigin(top, "Address of labels not yet supported")]); }

concrete productions top::UnaryOp_c
| '__extension__'
    { top.ast = top.expr; } -- Discard and ignore these annotations

concrete productions top::PostfixExpr_c
| '(' ty::TypeName_c ')' '{' '}'
    { top.ast = ast:compoundLiteralExpr(ty.ast, ast:nilInit()); }

concrete productions top::PrimaryExpr_c
| '(' '{' bis::BlockItemList_c '}' ')'
    { --local attribute rev:: [ast:Stmt] = reverse( bis.ast );
      nondecorated local attribute lastExpr::ast:Expr =
        case bis.lastBlockItem_c of
        | blockStmt_c( exprStmt_c( nonEmptyExprStmt_c (e,_))) -> e.ast
        {-
        | _ -> ast:errorExpr( [ errFromOrigin( top, 
                                      "GCC-style statement expressions require " ++ 
                                      "at least one expression" ) ] )
        -}
        | _ ->
          ast:explicitCastExpr(
            ast:typeName(ast:builtinTypeExpr(ast:nilQualifier(), ast:voidType()), ast:baseTypeExpr()),
            ast:mkIntConst(0))
        end;
      top.ast =
        case bis.lastBlockItem_c of
        | blockStmt_c(exprStmt_c(nonEmptyExprStmt_c(_,_))) -> 
          ast:stmtExpr( ast:foldStmt(bis.firstBlockItemList_c.ast), lastExpr)
        -- TODO: Apparently GCC now supports void statement expressions with no value?
        -- Should have an actual production for this, probably
        | _ -> 
          ast:stmtExpr(
            ast:foldStmt(bis.ast), 
            ast:explicitCastExpr(
              ast:typeName(ast:builtinTypeExpr(ast:nilQualifier(), ast:voidType()), ast:baseTypeExpr()),
              ast:mkIntConst(0)))
        end;
      }
| '__builtin_va_arg' '(' e::AssignExpr_c ',' ty::TypeName_c ')'
    { top.ast = ast:vaArgExpr(e.ast, ty.ast); }
| '__builtin_offsetof' '(' ts::TypeName_c ',' e::MemberDesignator_c ')'
    { top.ast = ast:offsetofExpr(ts.ast, e.ast); }
| '__builtin_types_compatible_p' '(' t1::TypeName_c ',' t2::TypeName_c ')'
    { top.ast = ast:typesCompatibleExpr(t1.ast, t2.ast); }
| '__builtin_constant_p'  '(' e::AssignExpr_c ')'
    { top.ast = ast:isConstantExpr(e.ast); }
| '__builtin_va_arg_pack'  '(' ')'
    { top.ast = ast:vaArgPackExpr(); }
| '__builtin_expect'  '(' e::AssignExpr_c ',' v::ConstantExpr_c ')'
    { top.ast = ast:expectExpr(e.ast, v.ast); }
| '__builtin_va_start'  '(' id::Identifier_c ',' id2::Identifier_c ')'
    { top.ast = ast:vaStartExpr(id.ast, id2.ast); }
| '__builtin_va_end'  '(' id::Identifier_c ')'
    { top.ast = ast:vaEndExpr(id.ast); }


closed tracked nonterminal MemberDesignator_c with ast<ast:MemberDesignator>;
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


