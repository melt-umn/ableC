grammar edu:umn:cs:melt:exts:ableC:adt:concretesyntax:matchConstruct ;

imports silver:langutil only ast, pp, errors; --, err, wrn;
imports silver:langutil:pp with implode as ppImplode ;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;

imports edu:umn:cs:melt:exts:ableC:adt:abstractsyntax as abs ;

-- trigger the test
import edu:umn:cs:melt:exts:ableC:adt:mda_test;

marking terminal Match_t 'match' lexer classes {Ckeyword};

-- Match expression --
concrete production match_c
e::PrimaryExpr_c ::= 'match' m::Match
{
  e.ast = m.ast ;
}


nonterminal Match with ast<Expr>, location;

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
| p::Pattern ':' s::Stmt_c 
  { c.ast = abs:stmtClause( p.ast, s.ast, location=c.location ); }


-- Patterns --
--------------
nonterminal PatternList with location, ast<abs:PatternList> ;
concrete productions ps::PatternList
 | p::Pattern ',' rest::PatternList
   { ps.ast = abs:consPattern( p.ast, rest.ast, location=ps.location ); }
 | p::Pattern
   { ps.ast = abs:consPattern( p.ast, abs:nilPattern(location=ps.location), location=p.location); }

nonterminal Pattern with location, ast<abs:Pattern> ;
concrete productions p::Pattern
| id::Identifier_t '(' ps::PatternList ')'
    { p.ast = abs:constructorPattern( id.lexeme, ps.ast, location=p.location );
    }
| id::Identifier_t '(' ')'
    { p.ast = abs:constructorPattern( id.lexeme, abs:nilPattern(location=p.location), location=p.location );
    }
| id::Identifier_t
    { p.ast = if id.lexeme == "_"
              then abs:patternWildcard( location=p.location )
              else abs:patternVariable( id.lexeme, location=p.location );
    }

{- ToDo: Provide patterns for constants of the built in type.

| c::Constant_c 
    { } --top.ast = c.ast; }
| sl::StringConstant_c
    { } --top.ast = ast:stringLiteral(sl.ast, location=top.location); }

-}


{- ToDo: provide an Expr version of match
   
concrete production matchExpr_c
m::Match ::= '(' scrutinee::Expr_c ')' '(' '{'  '}' ')'
{
--  e.ast = abs:matchExpr( scrutinee.ast, location = scrutinee.location );
}

-}

 
