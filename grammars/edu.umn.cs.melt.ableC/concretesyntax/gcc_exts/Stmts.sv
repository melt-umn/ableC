grammar edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

terminal GNU_UULabel_t '__label__' lexer classes {Keyword, Reserved};

concrete production localLabelsCompoundBlock_c
top::CompoundStatement_c ::= '{' ll::LabelDeclarations_c dcls::BlockItemList_c '}'
{
  top.ast = ast:compoundStmt(ast:foldStmt(
    [ast:warnStmt([wrn(ll.location, "Ignoring label declarations")])] ++
    dcls.ast));
}

closed nonterminal LabelDeclarations_c with location;
concrete productions top::LabelDeclarations_c
| LabelDeclaration_c {}
| LabelDeclarations_c  LabelDeclaration_c {}

closed nonterminal LabelDeclaration_c with location;
concrete productions top::LabelDeclaration_c
| '__label__' IdentifierList_c ';' {}


concrete productions top::BlockItem_c
| '__extension__' d::Declaration_c -- NestedDeclaration_c
    { top.ast = [ast:declStmt(d.ast)]; } -- Discard and ignore these annotations
| d::NestedFunctionDefinition_c
    { top.ast = [ast:functionDeclStmt(d.ast)]; }

concrete productions top::JumpStmt_c
| 'goto' '*' Expr_c ';'
    { top.ast = ast:warnStmt([err(top.location, "Unable to handle computed goto, yet.")]); } -- TODO
-- I have no idea. This one isn't in clang, nor cil. Shows up in gcc tests though. TODO ???
| Asm_Starter_c 'goto' '(' StringConstant_c ':' ':' ':' ':' IdentifierList_c ')'
    { top.ast = ast:warnStmt([err(top.location, "Unable to handle computed goto, yet.")]); } -- TODO

concrete productions top::LabeledStmt_c
| id::Identifier_c ':' aa::Attributes_c s::Stmt_c
    { top.ast = ast:seqStmt(
        ast:warnStmt([wrn(aa.location, "Ignoring attributes")]),
        ast:labelStmt(id.ast, s.ast)); }
| 'case' l::ConstantExpr_c '...' u::ConstantExpr_c ':' s::Stmt_c
    { top.ast = ast:caseLabelRangeStmt(l.ast, u.ast, s.ast); }

concrete productions top::Stmt_c
| asm::Asm_Statement_c
    { top.ast = ast:asmStmt( asm.ast ); }
