grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

function substDecls
Decls ::= subs::[Substitution] base::Decls
{
  local a::AST = reflect(new(base));
  a.substitutions = subs;
  return
    case reify(a.substituted) of
    | right(d) -> d
    | left(msg) -> error("Error reifying result of substitution: " ++ msg)
    end;
}

function substDecl
Decl ::= subs::[Substitution] base::Decl
{
  local a::AST = reflect(new(base));
  a.substitutions = subs;
  return
    case reify(a.substituted) of
    | right(d) -> d
    | left(msg) -> error("Error reifying result of substitution: " ++ msg)
    end;
}

function substTypeName
TypeName ::= subs::[Substitution] base::TypeName
{
  local a::AST = reflect(new(base));
  a.substitutions = subs;
  return
    case reify(a.substituted) of
    | right(d) -> d
    | left(msg) -> error("Error reifying result of substitution: " ++ msg)
    end;
}

function substParameters
Parameters ::= subs::[Substitution] base::Parameters
{
  local a::AST = reflect(new(base));
  a.substitutions = subs;
  return
    case reify(a.substituted) of
    | right(d) -> d
    | left(msg) -> error("Error reifying result of substitution: " ++ msg)
    end;
}

function substStmt
Stmt ::= subs::[Substitution] base::Stmt
{
  local a::AST = reflect(new(base));
  a.substitutions = subs;
  return
    case reify(a.substituted) of
    | right(d) -> d
    | left(msg) -> error("Error reifying result of substitution: " ++ msg)
    end;
}

function substExpr
Expr ::= subs::[Substitution] base::Expr
{
  local a::AST = reflect(new(base));
  a.substitutions = subs;
  return
    case reify(a.substituted) of
    | right(d) -> d
    | left(msg) -> error("Error reifying result of substitution: " ++ msg)
    end;
}

function substName
Name ::= subs::[Substitution] base::Name
{
  local a::AST = reflect(new(base));
  a.substitutions = subs;
  return
    case reify(a.substituted) of
    | right(d) -> d
    | left(msg) -> error("Error reifying result of substitution: " ++ msg)
    end;
}
