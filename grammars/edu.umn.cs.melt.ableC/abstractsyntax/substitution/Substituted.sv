grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

imports silver:langutil;
imports silver:langutil:pp;
imports silver:reflect;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:overloadable as ovrld;

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
function nameSub
Maybe<AST> ::= n::String sub::Name a::AST
{
  local res::Either<String Name> = reify(a);
  local n1::Name = res.fromRight;
  n1.env = emptyEnv();
  return
    if res.isRight
    then if n == n1.name then just(reflect(new(sub))) else nothing()
    else nothing();
}

global nameSubstitution::(Substitution ::= String Name) =
  \ n::String sub::Name -> nameSub(n, sub, _);

-- Substitutes a typedef name for a type
function typeExprSub
Maybe<AST> ::= n::String sub::BaseTypeExpr a::AST
{
  local res::Either<String BaseTypeExpr> = reify(a);
  local te::BaseTypeExpr = res.fromRight;
  te.env = emptyEnv();
  te.returnType = nothing();
  te.givenRefId = nothing();
  return
    if res.isRight
    then
      case te of
      | typedefTypeExpr(_, name(n1)) ->
        if n == n1 then just(reflect(new(sub))) else nothing()
      | _ -> nothing()
      end
    else nothing();
}

global typeExprSubstitution::(Substitution ::= String BaseTypeExpr) =
  \ n::String sub::BaseTypeExpr -> typeExprSub(n, sub, _);

-- Substitutes a value name for an expression
function exprSub
Maybe<AST> ::= n::String sub::(Expr ::= Location) a::AST
{
  local res::Either<String Expr> = reify(a);
  local e::Expr = res.fromRight;
  e.env = emptyEnv();
  e.returnType = nothing();
  return
    if res.isRight
    then
      case e of
      | declRefExpr(name(n1)) ->
        if n == n1 then just(reflect(sub(e.location))) else nothing()
      | directCallExpr(name(n1), args) ->
        if n == n1
        then just(reflect(ovrld:callExpr(sub(e.location), args, location=e.location)))
        else nothing()
      | _ -> nothing()
      end
    else nothing();
}

global exprSubstitution::(Substitution ::= String (Expr ::= Location)) =
  \ n::String sub::(Expr ::= Location) -> exprSub(n, sub, _);

-- Substitutes an exprStmt that is a declRefExpr for another statement
function stmtSub
Maybe<AST> ::= n::String sub::Stmt a::AST
{
  local res::Either<String Stmt> = reify(a);
  local s::Stmt = res.fromRight;
  s.env = emptyEnv();
  s.returnType = nothing();
  return
    if res.isRight
    then
      case s of
      | exprStmt(declRefExpr(name(n1))) ->
        if n == n1 then just(reflect(new(sub))) else nothing()
      | _ -> nothing()
      end
    else nothing();
}

global stmtSubstitution::(Substitution ::= String Stmt) =
  \ n::String sub::Stmt -> stmtSub(n, sub, _);

-- Substitutes the 'refId' attribute on a struct (ableC host extension) for a new refId
function refIdSub
Maybe<AST> ::= refId::String sub::String a::AST
{
  local res::Either<String Attrib> = reify(a);
  local at::Attrib = res.fromRight;
  at.env = emptyEnv();
  at.returnType = nothing();
  return
    if res.isRight
    then
      case at of
      | appliedAttrib(attribName(n), consExpr(stringLiteral(s), nilExpr())) ->
        if n.name == "refId" && substring(1, length(s) - 1, s) == refId
        then
          just(
            reflect(
              appliedAttrib(
                attribName(n),
                consExpr(
                  stringLiteral(s"\"${sub}\"", location=builtinLoc("substituted")),
                  nilExpr()))))
        else nothing()
      | _ -> nothing()
      end
    else nothing();
}

global refIdSubstitution::(Substitution ::= String String) =
  \ n::String sub::String -> refIdSub(n, sub, _);
