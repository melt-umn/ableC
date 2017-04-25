grammar edu:umn:cs:melt:exts:ableC:adt:concretesyntax:matchConstructExpr ;

imports silver:langutil only ast, pp, errors; --, err, wrn;
imports silver:langutil:pp;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;

imports edu:umn:cs:melt:exts:ableC:adt:abstractsyntax as abs ;

exports edu:umn:cs:melt:exts:ableC:adt:concretesyntax:matchKeyword;
exports edu:umn:cs:melt:exts:ableC:adt:concretesyntax:patterns;

-- trigger the test
import edu:umn:cs:melt:exts:ableC:adt:mda_test;


-- Match expression --

concrete production match_c
e::PrimaryExpr_c ::= 'match' m::Match
{
  e.ast = m.ast ;
}


nonterminal Match with ast<Expr>, location;

concrete production matchExpr_c
m::Match ::= '(' scrutinee::Expr_c ')' '(' cs::ExprClauses ')'
{
  m.ast = abs:matchExpr( scrutinee.ast, cs.ast, location=m.location );
--  cs.defaultClauseAST = 
--    abs:defaultClause(
--      stmtExpr( txtStmt("printf(\"BOOM!\\n\"); exit(1);"), scrutinee.ast, location=m.location), 
--      location=m.location
--     );
}


nonterminal ExprClauses with location, ast<abs:ExprClauses>; --, defaultClauseAST ;

-- inherited attribute defaultClauseAST :: abs:ExprClause ;

concrete productions cs::ExprClauses
| c::ExprClause rest::ExprClauses
  {
    cs.ast = abs:consExprClause( c.ast, rest.ast, location=cs.location ); 
--    rest.defaultClauseAST = cs.defaultClauseAST;
  }
| {- empty -}
  {
    cs.ast = abs:failureClause (location=cs.location);
  }


nonterminal ExprClause with location, ast<abs:ExprClause> ;

concrete productions c::ExprClause
| p::Pattern '->' e::Expr_c ';'
  { c.ast = 
      abs:exprClause( p.ast, e.ast, location=c.location ); 
  }



{-
concrete production matchExprWithDefault_c
m::Match ::= '(' scrutinee::Expr_c ')' '(' cs::ExprClauses def::DefaultClause ')'
{
  m.ast = abs:matchExpr( scrutinee.ast, cs.ast, location=m.location );
  cs.defaultClauseAST = def.ast;
}

nonterminal DefaultClause with location, ast<abs:ExprClause> ;

terminal Defualt_t 'default' lexer classes {Ckeyword};

concrete productions c::DefaultClause
| 'default' ':' e::Expr_c ';'
  { c.ast = 
      abs:defaultClause( e.ast, location=c.location ); 
  }
-}

