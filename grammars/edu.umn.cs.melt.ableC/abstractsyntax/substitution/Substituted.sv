grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

imports silver:langutil;
imports silver:langutil:pp;
imports silver:reflect;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;

type Substitution = (Maybe<AST> ::= AST); 

autocopy attribute substitutions::[Substitution] occurs on AST, ASTs, NamedASTs, NamedAST;
synthesized attribute substituted<a>::a;

attribute substituted<AST> occurs on AST;

aspect production nonterminalAST
top::AST ::= prodName::String children::ASTs annotations::NamedASTs
{
  top.substituted =
    foldl(
      fromMaybe,
      nonterminalAST(prodName, children.substituted, annotations.substituted),
      map(\ s::Substitution -> s(top), top.substitutions));
}

aspect production terminalAST
top::AST ::= terminalName::String lexeme::String location::Location
{
  propagate substituted;
}

aspect production listAST
top::AST ::= vals::ASTs
{
  propagate substituted;
}

aspect production stringAST
top::AST ::= s::String
{
  propagate substituted;
}

aspect production integerAST
top::AST ::= i::Integer
{
  propagate substituted;
}

aspect production floatAST
top::AST ::= f::Float
{
  propagate substituted;
}

aspect production booleanAST
top::AST ::= b::Boolean
{
  propagate substituted;
}

aspect production anyAST
top::AST ::= x::a
{
  propagate substituted;
}

attribute substituted<ASTs> occurs on ASTs;

aspect production consAST
top::ASTs ::= h::AST t::ASTs
{
  propagate substituted;
}

aspect production nilAST
top::ASTs ::=
{
  propagate substituted;
}

attribute substituted<NamedASTs> occurs on NamedASTs;

aspect production consNamedAST
top::NamedASTs ::= h::NamedAST t::NamedASTs
{
  propagate substituted;
}

aspect production nilNamedAST
top::NamedASTs ::=
{
  propagate substituted;
}

attribute substituted<NamedAST> occurs on NamedAST;

aspect production namedAST
top::NamedAST ::= n::String v::AST
{
  propagate substituted;
}


-- Substitutes a name for another name in all places
function nameSubstitution
Substitution ::= name::String sub::Name
{
  return
    \ a::AST ->
      case a of
      | AST { edu:umn:cs:melt:ableC:abstractsyntax:host:name(n :: String, location=_) } ->
        if n == name then just(reflect(sub)) else nothing()
      | _ -> nothing()
      end; 
}

-- Substitutes a typedef name for a type
function typeExprSubstitution
Substitution ::= name::String sub::BaseTypeExpr
{
  return
    \ a::AST ->
      case a of
      | AST {
        edu:umn:cs:melt:ableC:abstractsyntax:host:typedefTypeExpr(
          _,
          edu:umn:cs:melt:ableC:abstractsyntax:host:name(n :: String, location=_))
        } -> if n == name then just(reflect(sub)) else nothing()
      | _ -> nothing()
      end; 
}

-- Substitutes a value name for an expression
function exprSubstitution
Substitution ::= name::String sub::(Expr ::= Location)
{
  return
    \ a::AST ->
      case a of
      | AST {
        edu:umn:cs:melt:ableC:abstractsyntax:host:declRefExpr(
          edu:umn:cs:melt:ableC:abstractsyntax:host:name(n :: String, location=_),
          location=l)
        } -> if n == name then just(reflect(sub(reify(l).fromRight))) else nothing()
      | _ -> nothing()
      end; 
}

-- Substitutes an exprStmt that is a declRefExpr for another statement
function stmtSubstitution
Substitution ::= name::String sub::Stmt
{
  return
    \ a::AST ->
      case a of
      | AST {
        edu:umn:cs:melt:ableC:abstractsyntax:host:exprStmt(
          edu:umn:cs:melt:ableC:abstractsyntax:host:declRefExpr(
            edu:umn:cs:melt:ableC:abstractsyntax:host:name(n :: String, location=_),
            location=_))
        } -> if n == name then just(reflect(sub)) else nothing()
      | _ -> nothing()
      end;
}

-- Substitutes an exprInitializer that is a declRefExpr for another initializer
function initializerSubstitution
Substitution ::= name::String sub::Initializer
{
  return
    \ a::AST ->
      case a of
      | AST {
        edu:umn:cs:melt:ableC:abstractsyntax:host:exprInitializer(
          edu:umn:cs:melt:ableC:abstractsyntax:host:declRefExpr(
            edu:umn:cs:melt:ableC:abstractsyntax:host:name(n :: String, location=_),
            location=_))
        } -> if n == name then just(reflect(sub)) else nothing()
      | _ -> nothing()
      end;
}

-- Substitutes the 'refId' attribute on a struct (ableC host extension) for a new refId
{-function refIdSubstitution
Substitution ::= refId::String sub::String
{
  return
    \ a::AST ->
      case a of
      | AST {
        edu:umn:cs:melt:ableC:abstractsyntax:host:appliedAttrib(
          edu:umn:cs:melt:ableC:abstractsyntax:host:declRefExpr(
            edu:umn:cs:melt:ableC:abstractsyntax:host:name(n :: String, location=_),
            location=_))
        } -> if n == name then just(reflect(sub)) else nothing()
      | _ -> nothing()
      end;
}
-}