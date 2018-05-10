grammar edu:umn:cs:melt:exts:silver:ableC:abstractsyntax;

imports silver:reflect;

synthesized attribute translation<a>::a;

attribute translation<Expr> occurs on AST;

aspect production nonterminalAST
top::AST ::= prodName::String children::ASTs annotations::NamedASTs
{
  top.translation =
    -- "Direct" escape productions
    if
      containsBy(
        stringEq, prodName,
        ["edu:umn:cs:melt:exts:silver:ableC:abstractsyntax:escapeStmt",
         "edu:umn:cs:melt:exts:silver:ableC:abstractsyntax:escapeInitializer",
         "edu:umn:cs:melt:exts:silver:ableC:abstractsyntax:escapeExpr",
         "edu:umn:cs:melt:exts:silver:ableC:abstractsyntax:escapeBaseTypeExpr",
         "edu:umn:cs:melt:exts:silver:ableC:abstractsyntax:escapeAttrib"])
    then
      case children of
      | consAST(a, nilAST()) ->
          case reify(a) of
          | right(e) -> e
          | left(msg) -> error(s"Error in reifying child of production ${prodName}:\n${msg}")
          end
      | _ -> error(s"Unexpected escape production arguments: ${show(80, top.pp)}")
      end
    else case prodName, children of
    -- "Indirect" escape productions
    | "edu:umn:cs:melt:ableC:abstractsyntax:host:consExpr",
      consAST(
        nonterminalAST(
          "edu:umn:cs:melt:exts:silver:ableC:abstractsyntax:escapeExprs", consAST(a, nilAST()), _),
        consAST(rest, nilAST())) ->
        case reify(a) of
        | right(e) ->
            mkStrFunctionInvocation(
              builtin,
              "edu:umn:cs:melt:ableC:abstractsyntax:host:appendExprs",
              [e, rest.translation])
        | left(msg) -> error(s"Error in reifying child of production ${prodName}:\n${msg}")
        end
    | "edu:umn:cs:melt:exts:silver:ableC:abstractsyntax:escapeExprs", _ ->
      error(s"Unexpected escape production: ${show(80, top.pp)}")
    -- Default
    | _, _ ->
      application(
        baseExpr(makeQName(prodName), location=builtin),
        '(',
        foldAppExprs(builtin, reverse(children.translation)),
        ',',
        foldl(
          snocAnnoAppExprs(_, ',', _, location=builtin),
          emptyAnnoAppExprs(location=builtin),
          reverse(annotations.translation)),
        ')', location=builtin)
     end;
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
      qNameId(makeName(last(explode(":", n))), location=builtin), 
      '=',
      presentAppExpr(v.translation, location=builtin),
      location=builtin);
}

function makeName
Name ::= n::String
{
  return
    if isUpper(head(explode("", n)))
    then nameIdUpper(terminal(IdUpper_t, n, builtin), location=builtin)
    else nameIdLower(terminal(IdLower_t, n, builtin), location=builtin);
}

function makeQName
QName ::= n::String
{
  local ns::[Name] = map(makeName, explode(":", n));
  return
    foldr(
      qNameCons(_, ':', _, location=builtin),
      qNameId(last(ns), location=builtin),
      init(ns));
}
