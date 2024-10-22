grammar edu:umn:cs:melt:ableC:concretesyntax;

-- "Exported" nonterminals

closed tracked nonterminal CompoundStatement_c with ast<ast:Stmt>; 
concrete productions top::CompoundStatement_c
| '{' l::BlockItemList_c '}'
    { top.ast = ast:compoundStmt(ast:foldStmt(l.ast)); }
| '{'  '}'
    { top.ast = ast:nullStmt(); }


-- "Non-exported" nonterminals
closed tracked nonterminal BlockItemList_c with ast<[ast:Stmt]>, firstBlockItemList_c, lastBlockItem_c ;

-- Following used to extract last element for gcc stmtExpr production.
synthesized attribute lastBlockItem_c :: BlockItem_c ;
synthesized attribute firstBlockItemList_c :: BlockItemList_c ;

concrete productions top::BlockItemList_c
(oneBlockItem_c) | h::BlockItem_c
    { top.ast = h.ast; 
      top.firstBlockItemList_c = oneBlockItem_c( blockStmt_c( exprStmt_c( emptyExprStmt_c ( terminal(Semi_t,";"))))) ;
      top.lastBlockItem_c = h;
        }
| h::BlockItemList_c  t::BlockItem_c
    { top.ast = h.ast ++ t.ast;
      top.firstBlockItemList_c = h ;
      top.lastBlockItem_c = t; }



closed tracked nonterminal BlockItem_c with ast<[ast:Stmt]>;
concrete productions top::BlockItem_c
| d::Declaration_c
    { top.ast = [ast:declStmt(d.ast)]; }
(blockStmt_c) | s::Stmt_c
    { top.ast = [s.ast]; }


closed tracked nonterminal Stmt_c with ast<ast:Stmt>;
concrete productions top::Stmt_c
| ls::LabeledStmt_c
    { top.ast = ls.ast; }
| cs::CompoundStatement_c
    { top.ast = cs.ast; }
(exprStmt_c) |  es::ExprStmt_c
    { top.ast = es.ast; }
| ss::SelectionStmt_c
    { top.ast = ss.ast; }
| is::IterationStmt_c
    { top.ast = is.ast; }
| js::JumpStmt_c
    { top.ast = js.ast; }


closed tracked nonterminal LabeledStmt_c with ast<ast:Stmt>;
concrete productions top::LabeledStmt_c
| id::Identifier_c ':' s::Stmt_c
    { top.ast = ast:labelStmt(id.ast, s.ast); }
| 'case' ce::ConstantExpr_c ':' s::Stmt_c
    { top.ast = ast:caseLabelStmt(ce.ast, s.ast); }
| 'default' ':' s::Stmt_c
    { top.ast = ast:defaultLabelStmt(s.ast); }


synthesized attribute asMaybeExpr :: ast:MaybeExpr;

closed tracked nonterminal ExprStmt_c with ast<ast:Stmt>, asMaybeExpr;
concrete productions top::ExprStmt_c
(emptyExprStmt_c) 
| ';'
    { top.ast = ast:nullStmt();
      top.asMaybeExpr = ast:nothingExpr(); }
(nonEmptyExprStmt_c)
| e::Expr_c ';'
    { top.ast = ast:exprStmt(e.ast);
      top.asMaybeExpr = ast:justExpr(e.ast); }


closed tracked nonterminal SelectionStmt_c with ast<ast:Stmt>;
concrete productions top::SelectionStmt_c
| 'if' '(' cond::Expr_c ')' tc::Stmt_c
    { top.ast = ast:ifStmtNoElse(cond.ast, tc.ast); }
| 'if' '(' cond::Expr_c ')' tc::Stmt_c 'else' ec::Stmt_c 
    { top.ast = ast:ifStmt(cond.ast, tc.ast, ec.ast); }
| 'switch' '(' cond::Expr_c ')' body::Stmt_c
    { top.ast = ast:switchStmt(cond.ast, body.ast); }


closed tracked nonterminal IterationStmt_c with ast<ast:Stmt>;
concrete productions top::IterationStmt_c
| 'while' '(' cond::Expr_c ')' body::Stmt_c
    { top.ast = ast:whileStmt(cond.ast, body.ast); }
| 'do' body::Stmt_c 'while' '(' cond::Expr_c ')' ';'
    { top.ast = ast:doStmt(body.ast, cond.ast); }
-- Slightly odd syntactic construction: ExprStmt is "Expr;" or ";"
| 'for' '(' init::ExprStmt_c cond::ExprStmt_c iter::Expr_c ')' body::Stmt_c
    { top.ast = ast:forStmt(init.asMaybeExpr, cond.asMaybeExpr, ast:justExpr(iter.ast), body.ast); }
| 'for' '(' init::ExprStmt_c cond::ExprStmt_c ')' body::Stmt_c
    { top.ast = ast:forStmt(init.asMaybeExpr, cond.asMaybeExpr, ast:nothingExpr(), body.ast); }
-- Note that Declaration ends with ;
| 'for' '(' init::Declaration_c cond::ExprStmt_c iter::Expr_c ')' body::Stmt_c
    { top.ast = ast:forDeclStmt(init.ast, cond.asMaybeExpr, ast:justExpr(iter.ast), body.ast); }
| 'for' '(' init::Declaration_c cond::ExprStmt_c ')' body::Stmt_c
    { top.ast = ast:forDeclStmt(init.ast, cond.asMaybeExpr, ast:nothingExpr(), body.ast); }

-- TODO: BUG: FIXME: The scoping w.r.t. the lexer hack isn't done right here!
-- We should open a scope after 'for', unfortunately.


closed tracked nonterminal JumpStmt_c with ast<ast:Stmt>;
concrete productions top::JumpStmt_c
| 'goto' id::Identifier_c ';'
    { top.ast = ast:gotoStmt(id.ast); }
| 'continue' ';'
    { top.ast = ast:continueStmt(); }
| 'break' ';'
    { top.ast = ast:breakStmt(); }
| 'return' ';'
    { top.ast = ast:returnStmt(ast:nothingExpr()); }
| 'return' rv::Expr_c ';'
    { top.ast = ast:returnStmt(ast:justExpr(rv.ast)); }

