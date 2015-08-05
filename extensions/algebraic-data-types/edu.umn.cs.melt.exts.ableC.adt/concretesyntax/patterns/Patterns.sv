grammar edu:umn:cs:melt:exts:ableC:adt:concretesyntax:patterns ;

imports silver:langutil only ast; --, pp, errors; --, err, wrn;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax;
--imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
--imports edu:umn:cs:melt:ableC:abstractsyntax:env;

imports edu:umn:cs:melt:exts:ableC:adt:abstractsyntax as abs ;

terminal PatternName_t /[A-Za-z_\$][A-Za-z_0-9\$]*/ lexer classes {Cidentifier}; -- Same as Identifier_t
terminal NamedPatternOp_t '@' lexer classes {Csymbol};
terminal AntipatternOp_t '!' lexer classes {Csymbol};

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
| id::PatternName_t '(' ps::PatternList ')'
  { p.ast = abs:constructorPattern( id.lexeme, ps.ast, location=p.location );
  }

| id::PatternName_t '(' ')'
  { p.ast = 
      abs:constructorPattern( id.lexeme, abs:nilPattern(location=p.location),
        location=p.location );
  }

| id::PatternName_t '@' p1::Pattern
  { p.ast = 
      abs:patternNamed( id.lexeme, p1.ast,
        location=p.location );
  }

| AntipatternOp_t p1::Pattern
  { p.ast = 
      abs:patternNot( p1.ast,
        location=p.location );
  }

| id::PatternName_t
  { p.ast = if id.lexeme == "_"
            then abs:patternWildcard( location=p.location )
            else abs:patternVariable( id.lexeme, location=p.location );
  }

| c::Constant_c 
    { p.ast = abs:patternConst(c.ast, location=p.location); }

| sl::StringConstant_c
    { p.ast = abs:patternStringLiteral(sl.ast, location=p.location); }
