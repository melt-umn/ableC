grammar edu:umn:cs:melt:exts:silver:ableC:abstractsyntax;

imports silver:reflect;

synthesized attribute translation<a>::a;

attribute translation<Expr> occurs on AST;

aspect production nonterminalAST
top::AST ::= prodName::String children::ASTs annotations::NamedASTs
{
  top.translation =
    if
      containsBy(
        stringEq, prodName,
        ["edu:umn:cs:melt:exts:silver:ableC:abstractsyntax:escapeExpr"])
    then
      case children, annotations of
      | consAST(a, nilAST()), nilNamedAST() ->
          case reify(a) of
          | right(e) -> e
          | left(msg) -> error(s"Error in reifying child of production ${prodName}:\n${msg}")
          end
      | _, _ -> error(s"Unexpected escape production call: ${show(80, top.pp)}")
      end
    else
      application(
        baseExpr(makeQName(prodName), location=builtin),
        '(',
        foldAppExprs(builtin, reverse(children.translation)),
        ',',
        foldl(
          snocAnnoAppExprs(_, ',', _, location=builtin),
          emptyAnnoAppExprs(location=builtin),
          reverse(annotations.translation)),
        ')', location=builtin);
}

aspect production listAST
top::AST ::= vals::ASTs
{
  top.translation =
    fullList(
      '[',
      foldr(exprsCons(_, ',', _, location=builtin), exprsEmpty(location=builtin), vals.translation),
      ']', location=builtin);
}

aspect production stringAST
top::AST ::= s::String
{
  top.translation =
    stringConst(terminal(String_t, s"\"${escapeString(s)}\"", builtin), location=builtin);
}

aspect production integerAST
top::AST ::= i::Integer
{
  top.translation =
    intConst(terminal(Int_t, toString(i), builtin), location=builtin);
}

aspect production floatAST
top::AST ::= f::Float
{
  top.translation =
    floatConst(terminal(Float_t, toString(f), builtin), location=builtin);
}

aspect production booleanAST
top::AST ::= b::Boolean
{
  top.translation =
    if b
    then trueConst('true', location=builtin)
    else falseConst('false', location=builtin);
}

aspect production anyAST
top::AST ::= x::a
{
  top.translation =
    case reflectTypeName(x) of
      just(n) -> error(s"Can't translate anyAST (type ${n})")
    | nothing() -> error("Can't translate anyAST")
    end;
}

attribute translation<[Expr]> occurs on ASTs;

aspect production consAST
top::ASTs ::= h::AST t::ASTs
{
  top.translation = h.translation :: t.translation;
}

aspect production nilAST
top::ASTs ::=
{
  top.translation = [];
}

attribute translation<[AnnoExpr]> occurs on NamedASTs;

aspect production consNamedAST
top::NamedASTs ::= h::NamedAST t::NamedASTs
{
  top.translation = h.translation :: t.translation;
}

aspect production nilNamedAST
top::NamedASTs ::=
{
  top.translation = [];
}

attribute translation<AnnoExpr> occurs on NamedAST;

aspect production namedAST
top::NamedAST ::= n::String v::AST
{
  top.translation =
    annoExpr(
      makeQName(n), 
      '=',
      presentAppExpr(v.translation, location=builtin),
      location=builtin);
}

function makeQName
QName ::= n::String
{
  local ns::[Name] =
    map(
      \ n::String ->
        if isUpper(head(explode("", n)))
        then nameIdUpper(terminal(IdUpper_t, n, builtin), location=builtin)
        else nameIdLower(terminal(IdLower_t, n, builtin), location=builtin),
      explode(":", n));
  return
    foldr(
      qNameCons(_, ':', _, location=builtin),
      qNameId(last(ns), location=builtin),
      init(ns));
}
