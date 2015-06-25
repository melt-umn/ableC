grammar edu:umn:cs:melt:exts:ableC:adt:concretesyntax:patterns ;

imports silver:langutil only ast; --, pp, errors; --, err, wrn;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax;
--imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
--imports edu:umn:cs:melt:ableC:abstractsyntax:env;

imports edu:umn:cs:melt:exts:ableC:adt:abstractsyntax as abs ;


-- Patterns --
--------------
nonterminal PatternList with location, ast<abs:PatternList> ;

concrete productions ps::PatternList
| p::Pattern ',' rest::PatternList
  { ps.ast = abs:consPattern( p.ast, rest.ast, location=ps.location ); }

| p::Pattern
  { ps.ast = 
      abs:consPattern( p.ast, abs:nilPattern(location=ps.location),
        location=p.location ); 
  }

nonterminal Pattern with location, ast<abs:Pattern> ;

concrete productions p::Pattern
| id::Identifier_t '(' ps::PatternList ')'
  { p.ast = abs:constructorPattern( id.lexeme, ps.ast, location=p.location );
  }

| id::Identifier_t '(' ')'
  { p.ast = 
      abs:constructorPattern( id.lexeme, abs:nilPattern(location=p.location),
        location=p.location );
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
