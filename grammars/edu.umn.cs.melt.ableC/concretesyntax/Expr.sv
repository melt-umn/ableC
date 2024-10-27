grammar edu:umn:cs:melt:ableC:concretesyntax;

import edu:umn:cs:melt:ableC:abstractsyntax:env only env;
-- "Exported" nonterminals

closed tracked nonterminal Expr_c with ast<ast:Expr>; 
concrete productions top::Expr_c
| e::AssignExpr_c
    { top.ast = e.ast; }
| l::AssignExpr_c ',' r::Expr_c
    { top.ast = ast:commaExpr(l.ast, r.ast); }


closed tracked nonterminal AssignExpr_c with ast<ast:Expr>, directName; 
aspect default production
top::AssignExpr_c ::=
{
  top.directName = nothing();
}
concrete productions top::AssignExpr_c
| e::ConditionalExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::UnaryExpr_c op::AssignOp_c  r::AssignExpr_c
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }


closed tracked nonterminal ConstantExpr_c with ast<ast:Expr>;
concrete productions top::ConstantExpr_c
| e::ConditionalExpr_c
    { top.ast = e.ast; }


closed tracked nonterminal Initializer_c with ast<ast:Initializer>; 
concrete productions top::Initializer_c
| e::AssignExpr_c
    { top.ast = ast:exprInitializer(e.ast); }
| '{' il::InitializerList_c '}'
    { top.ast = ast:objectInitializer(ast:foldInit(il.ast)); }
| '{' il::InitializerList_c ',' '}' 
    { top.ast = ast:objectInitializer(ast:foldInit(il.ast)); }


-- "Non-exported" nonterminals


closed tracked nonterminal AssignOp_c with ast<ast:Expr>, leftExpr, rightExpr;
concrete productions top::AssignOp_c
| '='   { top.ast = ast:eqExpr(top.leftExpr, top.rightExpr); }
| '*='  { top.ast = ast:mulEqExpr(top.leftExpr, top.rightExpr); }
| '/='  { top.ast = ast:divEqExpr(top.leftExpr, top.rightExpr); }
| '%='  { top.ast = ast:modEqExpr(top.leftExpr, top.rightExpr); }
| '+='  { top.ast = ast:addEqExpr(top.leftExpr, top.rightExpr); }
| '-='  { top.ast = ast:subEqExpr(top.leftExpr, top.rightExpr); }
| '<<=' { top.ast = ast:lshEqExpr(top.leftExpr, top.rightExpr); }
| '>>=' { top.ast = ast:rshEqExpr(top.leftExpr, top.rightExpr); }
| '&='  { top.ast = ast:andEqExpr(top.leftExpr, top.rightExpr); }
| '^='  { top.ast = ast:xorEqExpr(top.leftExpr, top.rightExpr); }
| '|='  { top.ast = ast:orEqExpr(top.leftExpr, top.rightExpr); }


closed tracked nonterminal ConditionalExpr_c with ast<ast:Expr>, directName;
aspect default production
top::ConditionalExpr_c ::=
{
  top.directName = nothing();
}
concrete productions top::ConditionalExpr_c
| ce::LogicalOrExpr_c  '?' te::Expr_c  ':'  ee::ConditionalExpr_c
    { top.ast = ast:conditionalExpr(ce.ast, te.ast, ee.ast); }
| e::LogicalOrExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }


closed tracked nonterminal LogicalOrExpr_c with ast<ast:Expr>, directName;
aspect default production
top::LogicalOrExpr_c ::=
{
  top.directName = nothing();
}
concrete productions top::LogicalOrExpr_c
| e::LogicalAndExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::LogicalOrExpr_c op::LogicalOrOp_c r::LogicalAndExpr_c
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }

closed tracked nonterminal LogicalOrOp_c with ast<ast:Expr>, leftExpr, rightExpr;
concrete productions top::LogicalOrOp_c
| '||'   { top.ast = ast:orExpr(top.leftExpr, top.rightExpr); }


closed tracked nonterminal LogicalAndExpr_c with ast<ast:Expr>, directName;
aspect default production
top::LogicalAndExpr_c ::=
{
  top.directName = nothing();
}
concrete productions top::LogicalAndExpr_c
| e::InclusiveOrExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::LogicalAndExpr_c op::LogicalAndOp_c r::InclusiveOrExpr_c
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }

closed tracked nonterminal LogicalAndOp_c with ast<ast:Expr>, leftExpr, rightExpr;
concrete productions top::LogicalAndOp_c
| '&&'   { top.ast = ast:andExpr(top.leftExpr, top.rightExpr); }


closed tracked nonterminal InclusiveOrExpr_c with ast<ast:Expr>, directName;
aspect default production
top::InclusiveOrExpr_c ::=
{
  top.directName = nothing();
}
concrete productions top::InclusiveOrExpr_c
| e::ExclusiveOrExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::InclusiveOrExpr_c op::InclusiveOrOp_c r::ExclusiveOrExpr_c
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }

closed tracked nonterminal InclusiveOrOp_c with ast<ast:Expr>, leftExpr, rightExpr;
concrete productions top::InclusiveOrOp_c
| '|'   { top.ast = ast:orBitExpr(top.leftExpr, top.rightExpr); }


closed tracked nonterminal ExclusiveOrExpr_c with ast<ast:Expr>, directName;
aspect default production
top::ExclusiveOrExpr_c ::=
{
  top.directName = nothing();
}
concrete productions top::ExclusiveOrExpr_c
| e::AndExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::ExclusiveOrExpr_c op::ExclusiveOrOp_c r::AndExpr_c
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }

closed tracked nonterminal ExclusiveOrOp_c with ast<ast:Expr>, leftExpr, rightExpr;
concrete productions top::ExclusiveOrOp_c
| '^'   { top.ast = ast:xorExpr(top.leftExpr, top.rightExpr); }


closed tracked nonterminal AndExpr_c with ast<ast:Expr>, directName;
aspect default production
top::AndExpr_c ::=
{
  top.directName = nothing();
}
concrete productions top::AndExpr_c
| e::EqualityExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::AndExpr_c op::AndOp_c r::EqualityExpr_c
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }

closed tracked nonterminal AndOp_c with ast<ast:Expr>, leftExpr, rightExpr;
concrete productions top::AndOp_c
| '&'   { top.ast = ast:andBitExpr(top.leftExpr, top.rightExpr); }


closed tracked nonterminal EqualityExpr_c with ast<ast:Expr>, directName;
aspect default production
top::EqualityExpr_c ::=
{
  top.directName = nothing();
}
concrete productions top::EqualityExpr_c
| e::RelationalExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::EqualityExpr_c op::EqualityOp_c r::RelationalExpr_c
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }

closed tracked nonterminal EqualityOp_c with ast<ast:Expr>, leftExpr, rightExpr;
concrete productions top::EqualityOp_c
| '=='   { top.ast = ast:equalsExpr(top.leftExpr, top.rightExpr); }
| '!='   { top.ast = ast:notEqualsExpr(top.leftExpr, top.rightExpr); }


closed tracked nonterminal RelationalExpr_c with ast<ast:Expr>, directName;
aspect default production
top::RelationalExpr_c ::=
{
  top.directName = nothing();
}
concrete productions top::RelationalExpr_c
| e::ShiftExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::RelationalExpr_c op::RelationalOp_c r::ShiftExpr_c
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }

closed tracked nonterminal RelationalOp_c with ast<ast:Expr>, leftExpr, rightExpr;
concrete productions top::RelationalOp_c
| '<'   { top.ast = ast:ltExpr(top.leftExpr, top.rightExpr); }
| '>'   { top.ast = ast:gtExpr(top.leftExpr, top.rightExpr); }
| '<='   { top.ast = ast:lteExpr(top.leftExpr, top.rightExpr); }
| '>='   { top.ast = ast:gteExpr(top.leftExpr, top.rightExpr); }


closed tracked nonterminal ShiftExpr_c with ast<ast:Expr>, directName;
aspect default production
top::ShiftExpr_c ::=
{
  top.directName = nothing();
}
concrete productions top::ShiftExpr_c
| e::AdditiveExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::ShiftExpr_c op::ShiftOp_c r::AdditiveExpr_c
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }

closed tracked nonterminal ShiftOp_c with ast<ast:Expr>, leftExpr, rightExpr;
concrete productions top::ShiftOp_c
| '<<'   { top.ast = ast:lshExpr(top.leftExpr, top.rightExpr); }
| '>>'   { top.ast = ast:rshExpr(top.leftExpr, top.rightExpr); }


-- Additive Expressions --
--------------------------
closed tracked nonterminal AdditiveExpr_c with ast<ast:Expr>, directName;
aspect default production
top::AdditiveExpr_c ::=
{
  top.directName = nothing();
}
{- Below is the previous implementation of AdditiveExpr_c.  
concrete productions top::AdditiveExpr_c
| e::MultiplicativeExpr_c
    { top.ast = e.ast; }
| l::AdditiveExpr_c  '+'  r::MultiplicativeExpr_c
    { top.ast = ast:binaryOpExpr(l.ast, ast:numOp(ast:addOp()), r.ast); }
| l::AdditiveExpr_c  '-'  r::MultiplicativeExpr_c
    { top.ast = ast:binaryOpExpr(l.ast, ast:numOp(ast:subOp()), r.ast); }           -}
concrete productions top::AdditiveExpr_c
| e::AddMulLeft_c 
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::AdditiveExpr_c  op::AdditiveOp_c  r::AddMulLeft_c 
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }

inherited attribute leftExpr :: ast:Expr;
inherited attribute rightExpr :: ast:Expr;

closed tracked nonterminal AdditiveOp_c 
  with ast<ast:Expr>, leftExpr, rightExpr ;

-- Additive Operators
concrete productions top::AdditiveOp_c
| '+'
    { top.ast = ast:addExpr(top.leftExpr, top.rightExpr); }
| '-'
    { top.ast = ast:subExpr(top.leftExpr, top.rightExpr); }

-- Operators with precedence between Additive and Multiplicitive opererators

-- Left Associative
closed tracked nonterminal AddMulLeft_c with ast<ast:Expr>, directName;
aspect default production
top::AddMulLeft_c ::=
{
  top.directName = nothing();
}
concrete productions top::AddMulLeft_c
| e::AddMulRight_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::AddMulLeft_c  op::AddMulLeftOp_c r::AddMulRight_c
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }

closed tracked nonterminal AddMulLeftOp_c
  with ast<ast:Expr>, leftExpr, rightExpr ;
flowtype AddMulLeftOp_c = ast {leftExpr, rightExpr};

terminal AddMulLeft_NEVER_t 'AddMulLeft_Never!!!nevernever1234567890' ;
concrete productions top::AddMulLeftOp_c
| AddMulLeft_NEVER_t
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for AddMulLeftOp_c should not appear in the tree.") ] ) ; }

-- Right Associative
closed tracked nonterminal AddMulRight_c with ast<ast:Expr>, directName;
aspect default production
top::AddMulRight_c ::=
{
  top.directName = nothing();
}
concrete productions top::AddMulRight_c
| e::AddMulNone_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::AddMulNone_c  op::AddMulRightOp_c r::AddMulRight_c 
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }

closed tracked nonterminal AddMulRightOp_c
  with ast<ast:Expr>, leftExpr, rightExpr ;
flowtype AddMulRightOp_c = ast {leftExpr, rightExpr};

terminal AddMulRight_NEVER_t 'AddMulRight_Never!!!nevernever1234567890' ;
concrete productions top::AddMulRightOp_c
| AddMulRight_NEVER_t
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for AddMulRightOp_c should not appear in the tree." ) ] ) ; }

-- Non-associative
closed tracked nonterminal AddMulNone_c with ast<ast:Expr>, directName;
aspect default production
top::AddMulNone_c ::=
{
  top.directName = nothing();
}
concrete productions top::AddMulNone_c
| e::MultiplicativeExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::MultiplicativeExpr_c  op::AddMulNoneOp_c r::MultiplicativeExpr_c 
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }

closed tracked nonterminal AddMulNoneOp_c
  with ast<ast:Expr>, leftExpr, rightExpr ;
flowtype AddMulNoneOp_c = ast {leftExpr, rightExpr};

terminal AddMulNone_NEVER_t 'AddMulNone_Never!!!nevernever1234567890' ;
concrete productions top::AddMulNoneOp_c
| AddMulNone_NEVER_t
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for AddMulNoneOp_c should not appear in the tree." ) ] ) ; }


-- Multiplicative Expressions --
--------------------------------
closed tracked nonterminal MultiplicativeExpr_c with ast<ast:Expr>, directName;
aspect default production
top::MultiplicativeExpr_c ::=
{
  top.directName = nothing();
}
concrete productions top::MultiplicativeExpr_c
| e::CastExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| l::MultiplicativeExpr_c op::MultiplicativeOp_c r::CastExpr_c
    { top.ast = op.ast; 
      op.leftExpr=l.ast; op.rightExpr=r.ast; }

closed tracked nonterminal MultiplicativeOp_c with ast<ast:Expr>, leftExpr, rightExpr;
concrete productions top::MultiplicativeOp_c
| '*'   { top.ast = ast:mulExpr(top.leftExpr, top.rightExpr); }
| '/'   { top.ast = ast:divExpr(top.leftExpr, top.rightExpr); }
| '%'   { top.ast = ast:modExpr(top.leftExpr, top.rightExpr); }


closed tracked nonterminal CastExpr_c with ast<ast:Expr>, directName;
aspect default production
top::CastExpr_c ::=
{
  top.directName = nothing();
}
concrete productions top::CastExpr_c
| e::UnaryExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| '(' tn::TypeName_c ')' e::CastExpr_c
    { top.ast = ast:explicitCastExpr(tn.ast, e.ast); }


closed tracked nonterminal UnaryExpr_c with ast<ast:Expr>, directName;
aspect default production
top::UnaryExpr_c ::=
{
  top.directName = nothing();
}
concrete productions top::UnaryExpr_c
| e::PostfixExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| '++' e::UnaryExpr_c
    { top.ast = ast:preIncExpr(e.ast); }
| '--' e::UnaryExpr_c
    { top.ast = ast:preDecExpr(e.ast); }
| op::UnaryOp_c e::CastExpr_c
    { top.ast = op.ast;
      op.expr = e.ast; }
| 'sizeof' e::UnaryExpr_c
    { top.ast = ast:sizeofExpr(ast:exprExpr(e.ast)); }
| 'sizeof' '(' ty::TypeName_c ')'
    { top.ast = ast:sizeofExpr(ast:typeNameExpr(ty.ast)); }


inherited attribute expr :: ast:Expr;
closed tracked nonterminal UnaryOp_c with ast<ast:Expr>, expr;
concrete productions top::UnaryOp_c
| '&'  { top.ast = ast:addressOfExpr(top.expr); }
| '*'  { top.ast = ast:dereferenceExpr(top.expr); }
| '+'  { top.ast = ast:positiveExpr(top.expr); }
| '-'  { top.ast = ast:negativeExpr(top.expr); }
| '~'  { top.ast = ast:bitNegateExpr(top.expr); }
| '!'  { top.ast = ast:notExpr(top.expr); }

-- Needed for constructing calls correctly
synthesized attribute callAst::(ast:Expr ::= ast:Exprs);
synthesized attribute directName::Maybe<Identifier_c>;

closed tracked nonterminal PostfixExpr_c with ast<ast:Expr>, callAst, directName;
aspect default production
top::PostfixExpr_c ::=
{
  top.callAst =
    case top.directName of
    | just(id) -> ast:directCallExpr(id.ast, _)
    | nothing() -> ast:callExpr(top.ast, _)
    end;
  top.directName = nothing();
}

concrete productions top::PostfixExpr_c
| e::PrimaryExpr_c
    { top.ast = e.ast;
      top.directName = e.directName; }
| e::PostfixExpr_c '[' index::Expr_c ']'
    { top.ast = ast:arraySubscriptExpr(e.ast, index.ast); }
| e::PostfixExpr_c '(' args::ArgumentExprList_c ')'
    { top.ast = e.callAst(ast:foldExpr(args.ast)); }
| e::PostfixExpr_c '(' args::ArgumentExprList_c ',' ')'
    { top.ast = e.callAst(ast:foldExpr(args.ast)); }
| e::PostfixExpr_c '(' ')'
    { top.ast = e.callAst(ast:nilExpr()); }
| e::PostfixExpr_c op::PostfixOp_c
    { top.ast = op.ast;
      top.callAst = op.callAst;
      op.expr = e.ast; }
| '(' ty::TypeName_c ')' '{' il::InitializerList_c '}'
    { top.ast = ast:compoundLiteralExpr(ty.ast, ast:foldInit(il.ast)); }
| '(' ty::TypeName_c ')' '{' il::InitializerList_c ',' '}'
    { top.ast = ast:compoundLiteralExpr(ty.ast, ast:foldInit(il.ast)); }

closed tracked nonterminal PostfixOp_c with ast<ast:Expr>, callAst, expr;
aspect default production
top::PostfixOp_c ::=
{
  top.callAst = ast:callExpr(top.ast, _);
}

concrete productions top::PostfixOp_c
| '.' id::Identifier_c
    { top.ast = ast:memberExpr(top.expr, false, id.ast);
      top.callAst = ast:memberCallExpr(top.expr, false, id.ast, _); }
| '->' id::Identifier_c
    { top.ast = ast:memberExpr(top.expr, true, id.ast);
      top.callAst = ast:memberCallExpr(top.expr, true, id.ast, _); }
| '++'   { top.ast = ast:postIncExpr(top.expr); }
| '--'   { top.ast = ast:postDecExpr(top.expr); }


closed tracked nonterminal ArgumentExprList_c with ast<[ast:Expr]>, directName;
aspect default production
top::ArgumentExprList_c ::=
{
  top.directName = nothing();
}

concrete productions top::ArgumentExprList_c
| e::AssignExpr_c
    { top.ast = [e.ast];
      top.directName = e.directName; }
| h::ArgumentExprList_c ',' t::AssignExpr_c
    { top.ast = h.ast ++ [t.ast];
      top.directName = h.directName;  }

closed tracked nonterminal PrimaryExpr_c with ast<ast:Expr>, directName;
aspect default production
top::PrimaryExpr_c ::=
{
  top.directName = nothing();
}

concrete productions top::PrimaryExpr_c
| id::Identifier_c
    { top.ast = ast:directRefExpr(id.ast);
      top.directName = just(^id); }
| c::Constant_c
    { top.ast = c.ast; }
| sl::StringConstant_c
    { top.ast = ast:stringLiteral(sl.ast); }
| '(' e::Expr_c  ')'
    { top.ast = ast:parenExpr(e.ast); }


closed tracked nonterminal InitializerList_c with ast<[ast:Init]>;
concrete productions top::InitializerList_c
| i::Initializer_c 
    { top.ast = [ast:positionalInit(i.ast)]; }
| d::Designation_c  i::Initializer_c 
    { top.ast = [ast:designatedInit(d.ast, i.ast)]; }
| il::InitializerList_c ',' i::Initializer_c
    { top.ast = il.ast ++ [ast:positionalInit(i.ast)]; }
| il::InitializerList_c ',' d::Designation_c  i::Initializer_c
    { top.ast = il.ast ++ [ast:designatedInit(d.ast, i.ast)]; }


closed tracked nonterminal Designation_c with ast<ast:Designator>;
concrete productions top::Designation_c
| d::DesignatorList_c '='
    { top.ast = d.ast;
      d.givenDesignator = ast:initialDesignator(); }


closed tracked nonterminal DesignatorList_c with ast<ast:Designator>, givenDesignator;
concrete productions top::DesignatorList_c
| h::DesignatorList_c  t::Designator_c
    { top.ast = t.ast; }
| d::Designator_c
    { top.ast = d.ast; }

-- The previous designator to operate upon.
inherited attribute givenDesignator :: ast:Designator;

propagate givenDesignator on 
  DesignatorList_c,
  Designator_c,
  ArrayDesignator_c;

closed tracked nonterminal Designator_c with ast<ast:Designator>, givenDesignator;
concrete productions top::Designator_c
| d::ArrayDesignator_c
    { top.ast = d.ast; }
| '.' id::Identifier_c
    { top.ast = ast:fieldDesignator(top.givenDesignator, id.ast); }


-- This Nt not strictly part of C99. Exists for ease of extensions.
closed tracked nonterminal ArrayDesignator_c with ast<ast:Designator>, givenDesignator;
concrete productions top::ArrayDesignator_c
| '[' e::ConstantExpr_c ']'
    { top.ast = ast:arrayDesignator(top.givenDesignator, e.ast); }


closed tracked nonterminal StringConstant_c with ast<String>; -- TODO: THIS should expand to ast nodes!
concrete productions top::StringConstant_c
| sl::StringLiteral_c
    { top.ast = sl.ast; }
| h::StringLiteral_c  t::StringConstant_c
    { top.ast = h.ast ++ " " ++ t.ast; }


closed tracked nonterminal StringLiteral_c with ast<String>;
concrete productions top::StringLiteral_c
| s::StringConstant_t       -- ""
    { top.ast = s.lexeme; }
| s::StringConstantU8_t     -- u8""
    { top.ast = s.lexeme; }
| s::StringConstantL_t      -- L""
    { top.ast = s.lexeme; }
| s::StringConstantU_t      -- u""
    { top.ast = s.lexeme; }
| s::StringConstantUBig_t   -- U""
    { top.ast = s.lexeme; }
    

closed tracked nonterminal Constant_c with ast<ast:Expr>;
concrete productions top::Constant_c
-- dec
| c::DecConstant_t
    { top.ast = ast:realConstant(ast:integerConstant(c.lexeme, false, ast:noIntSuffix())); }
| c::DecConstantU_t
    { top.ast = ast:realConstant(ast:integerConstant(c.lexeme, true, ast:noIntSuffix())); }
| c::DecConstantL_t
    { top.ast = ast:realConstant(ast:integerConstant(c.lexeme, false, ast:longIntSuffix())); }
| c::DecConstantUL_t
    { top.ast = ast:realConstant(ast:integerConstant(c.lexeme, true, ast:longIntSuffix())); }
| c::DecConstantLL_t
    { top.ast = ast:realConstant(ast:integerConstant(c.lexeme, false, ast:longLongIntSuffix())); }
| c::DecConstantULL_t
    { top.ast = ast:realConstant(ast:integerConstant(c.lexeme, true, ast:longLongIntSuffix())); }
-- oct
| c::OctConstant_t
    { top.ast = ast:realConstant(ast:octIntegerConstant(c.lexeme, false, ast:noIntSuffix())); }
| c::OctConstantU_t
    { top.ast = ast:realConstant(ast:integerConstant(c.lexeme, true, ast:noIntSuffix())); }
| c::OctConstantL_t
    { top.ast = ast:realConstant(ast:integerConstant(c.lexeme, false, ast:longIntSuffix())); }
| c::OctConstantUL_t
    { top.ast = ast:realConstant(ast:integerConstant(c.lexeme, true, ast:longIntSuffix())); }
| c::OctConstantLL_t
    { top.ast = ast:realConstant(ast:integerConstant(c.lexeme, false, ast:longLongIntSuffix())); }
| c::OctConstantULL_t
    { top.ast = ast:realConstant(ast:integerConstant(c.lexeme, true, ast:longLongIntSuffix())); }
| c::OctConstantError_t
    { top.ast = ast:errorExpr([errFromOrigin(top, "Erroneous octal constant: " ++ c.lexeme)]); }
-- hex
| c::HexConstant_t
    { top.ast = ast:realConstant(ast:hexIntegerConstant(c.lexeme, false, ast:noIntSuffix())); }
| c::HexConstantU_t
    { top.ast = ast:realConstant(ast:hexIntegerConstant(c.lexeme, true, ast:noIntSuffix())); }
| c::HexConstantL_t
    { top.ast = ast:realConstant(ast:hexIntegerConstant(c.lexeme, false, ast:longIntSuffix())); }
| c::HexConstantUL_t
    { top.ast = ast:realConstant(ast:hexIntegerConstant(c.lexeme, true, ast:longIntSuffix())); }
| c::HexConstantLL_t
    { top.ast = ast:realConstant(ast:hexIntegerConstant(c.lexeme, false, ast:longLongIntSuffix())); }
| c::HexConstantULL_t
    { top.ast = ast:realConstant(ast:hexIntegerConstant(c.lexeme, true, ast:longLongIntSuffix())); }
-- floats
| c::FloatConstant_t
    { top.ast = ast:realConstant(ast:floatConstant(c.lexeme, ast:doubleFloatSuffix())); }
| c::FloatConstantFloat_t
    { top.ast = ast:realConstant(ast:floatConstant(c.lexeme, ast:floatFloatSuffix())); }
| c::FloatConstantLongDouble_t
    { top.ast = ast:realConstant(ast:floatConstant(c.lexeme, ast:longDoubleFloatSuffix())); }
-- hex floats
| c::HexFloatConstant_t
    { top.ast = ast:realConstant(ast:hexFloatConstant(c.lexeme, ast:doubleFloatSuffix())); }
| c::HexFloatConstantFloat_t
    { top.ast = ast:realConstant(ast:hexFloatConstant(c.lexeme, ast:floatFloatSuffix())); }
| c::HexFloatConstantLongDouble_t
    { top.ast = ast:realConstant(ast:hexFloatConstant(c.lexeme, ast:longDoubleFloatSuffix())); }
-- characters
| c::CharConstant_t
    { top.ast = ast:characterConstant(c.lexeme, ast:noCharPrefix()); }
| c::CharConstantL_t
    { top.ast = ast:characterConstant(c.lexeme, ast:wcharCharPrefix()); }
| c::CharConstantU_t
    { top.ast = ast:characterConstant(c.lexeme, ast:char16CharPrefix()); }
| c::CharConstantUBig_t
    { top.ast = ast:characterConstant(c.lexeme, ast:char32CharPrefix()); }

-- Ugly hack to add things to the follow set Expr_c
terminal Expr_NEVER_t 'Expr_NEVER_t!!!nevernever1234567890';
concrete productions top::Expr_c
| 'Expr_NEVER_t!!!nevernever1234567890' Expr_c  AllowSEUDecl_t
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for Expr_c should not appear in the tree.") ] ) ; }
