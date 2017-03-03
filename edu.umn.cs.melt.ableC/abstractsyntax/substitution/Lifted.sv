grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

aspect production injectGlobalDecls
top::Expr ::= globalDecls::[Pair<String Decl>] lifted::Expr
{
  local allDecls::Decls = foldDecl(map(snd, globalDecls));
  local allNames::[String] = map(fst, globalDecls);
  
  allDecls.substitutions = top.substitutions;
  top.substituted =
    injectGlobalDecls(
      zipWith(pair, allNames, unfoldDecl(allDecls.substituted)),
      lifted.substituted,
      location=top.location);
}

aspect production injectGlobalDeclsStmt
top::Stmt ::= globalDecls::[Pair<String Decl>] lifted::Stmt
{
  local allDecls::Decls = foldDecl(map(snd, globalDecls));
  local allNames::[String] = map(fst, globalDecls);
  
  allDecls.substitutions = top.substitutions;
  top.substituted =
    injectGlobalDeclsStmt(
      zipWith(pair, allNames, unfoldDecl(allDecls.substituted)),
      lifted.substituted);
}

aspect production injectGlobalDeclsTypeExpr
top::BaseTypeExpr ::= globalDecls::[Pair<String Decl>] lifted::BaseTypeExpr
{
  local allDecls::Decls = foldDecl(map(snd, globalDecls));
  local allNames::[String] = map(fst, globalDecls);
  
  allDecls.substitutions = top.substitutions;
  top.substituted =
    injectGlobalDeclsTypeExpr(
      zipWith(pair, allNames, unfoldDecl(allDecls.substituted)),
      lifted.substituted);
}

aspect production injectGlobalDeclsType
top::NoncanonicalType ::= globalDecls::[Pair<String Decl>] lifted::Type
{
  local allDecls::Decls = foldDecl(map(snd, globalDecls));
  local allNames::[String] = map(fst, globalDecls);
  
  allDecls.substitutions = top.substitutions;
  top.substituted =
    injectGlobalDeclsType(
      zipWith(pair, allNames, unfoldDecl(allDecls.substituted)),
      lifted.substituted);
}
