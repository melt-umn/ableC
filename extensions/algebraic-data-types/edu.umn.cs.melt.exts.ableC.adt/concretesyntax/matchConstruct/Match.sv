grammar edu:umn:cs:melt:exts:ableC:adt:concretesyntax:matchConstruct ;

imports silver:langutil only ast; --, pp, errors; --, err, wrn;
imports silver:langutil:pp with implode as ppImplode ;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
--imports edu:umn:cs:melt:ableC:abstractsyntax:env;

imports edu:umn:cs:melt:exts:ableC:adt:abstractsyntax as abs ;

exports edu:umn:cs:melt:exts:ableC:adt:concretesyntax:matchKeyword;
exports edu:umn:cs:melt:exts:ableC:adt:concretesyntax:patterns;

-- trigger the test
import edu:umn:cs:melt:exts:ableC:adt:mda_test;


-- Match statment --

concrete production match_c
e::Stmt_c ::= 'match' m::Match
{
  e.ast = exprStmt(m.ast);
}

nonterminal Match with ast<Expr>, location;
-- ast<Expr> should probably be ast<Stmt>, but clauses wrap up the statements
-- using a C stmtExpr so it is OK as an Expr

concrete production matchStmt_c
m::Match ::= '(' scrutinee::Expr_c ')' '{' cs::StmtClauses '}'
{
 m.ast = abs:matchStmt( scrutinee.ast, cs.ast, location=m.location );
}

nonterminal StmtClauses with location, ast<abs:StmtClauses> ;
concrete productions cs::StmtClauses
| c::StmtClause rest::StmtClauses
  { cs.ast = abs:consStmtClause( c.ast, rest.ast, location=cs.location ); }
| {-empty-}
  { cs.ast = abs:nilStmtClause( location=cs.location ); }
  
nonterminal StmtClause with location, ast<abs:StmtClause> ;
concrete productions c::StmtClause
| p::Pattern ':' '{' l::BlockItemList_c '}'
  { c.ast = abs:stmtClause( p.ast, foldStmt(l.ast), location=c.location ); }
| p::Pattern ':' '{' '}'
  { c.ast = abs:stmtClause( p.ast, nullStmt(), location=c.location ); }


