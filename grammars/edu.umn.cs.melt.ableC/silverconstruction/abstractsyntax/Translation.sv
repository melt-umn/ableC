grammar edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax;

imports silver:reflect;
imports silver:compiler:metatranslation;

aspect production nonterminalAST
top::AST ::= prodName::String children::ASTs annotations::NamedASTs
{
  directAntiquoteProductions <-
    ["edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteStmt",
     "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteDecl",
     "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteInitializer",
     "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteExpr",
     "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteName",
     "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteTName",
     "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteTypeName",
     "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteBaseTypeExpr",
     "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteAttrib"];
  
  collectionAntiquoteProductions <-
    [("edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteDecls",
      "Decls",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:consDecl",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:nilDecl",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:appendDecls"),
     ("edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteExprs",
      "Exprs",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:consExpr",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:nilExpr",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:appendExprs"),
     ("edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteNames",
      "Names",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:consName",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:nilName",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:appendNames"),
     ("edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteTypeNames",
      "TypeNames",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:consTypeName",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:nilTypeName",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:appendTypeNames"),
     ("edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteStorageClasses",
      "StorageClasses",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:consStorageClass",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:nilStorageClass",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:appendStorageClasses"),
     ("edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteParameters",
      "Parameters",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:consParameters",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:nilParameters",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:appendParameters"),
     ("edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteStructItemList",
      "StructItemList",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:consStructItem",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:nilStructItem",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:appendStructItemList"),
     ("edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteEnumItemList",
      "EnumItemList",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:consEnumItem",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:nilEnumItem",
      "edu:umn:cs:melt:ableC:abstractsyntax:host:appendEnumItemList")];
  
  patternAntiquoteProductions <-
    ["edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquotePatternExpr",
     "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquotePatternName",
     "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquotePatternDecl",
     "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquotePatternStmt",
     "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquotePatternBaseTypeExpr"];
  
  -- "Indirect" antiquote productions
  antiquoteTranslation <-
    if
      -- These 2 are split out seperate to avoid duplicating code, because they
      -- are handled in the same way.
      contains(prodName,
        ["edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquote_name",
         "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquote_tname"])
    then
      case children of
      | consAST(a, nilAST()) ->
          case reify(^a) of
          | right(e) ->
            just(mkStrFunctionInvocation("edu:umn:cs:melt:ableC:abstractsyntax:host:name", [e]))
          | left(msg) -> error(s"Error in reifying child of production ${prodName}:\n${msg}")
          end
      | _ -> error(s"Unexpected antiquote production arguments: ${show(80, top.pp)}")
      end
    else case top of
    | AST {
       edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteIntLiteralExpr(a)
      } ->
      case reify(^a) of
      | right(e) ->
        just(mkStrFunctionInvocation("edu:umn:cs:melt:ableC:abstractsyntax:construction:mkIntConst", [e]))
      | left(msg) -> error(s"Error in reifying child of production ${prodName}:\n${msg}")
      end
    | AST {
        edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteStringLiteralExpr(a)
      } ->
      case reify(^a) of
      | right(e) ->
        just(mkStrFunctionInvocation("edu:umn:cs:melt:ableC:abstractsyntax:construction:mkStringConst", [e]))
      | left(msg) -> error(s"Error in reifying child of production ${prodName}:\n${msg}")
      end
    | AST {
        edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteDirectTypeExpr(qualifiersAST, a)
      } ->
      case reify(^a) of
      | right(e) ->
        just(
          mkStrFunctionInvocation(
            "edu:umn:cs:melt:ableC:abstractsyntax:host:directTypeExpr",
            [mkStrFunctionInvocation(
               "edu:umn:cs:melt:ableC:abstractsyntax:host:addQualifiers",
               [access(
                  qualifiersAST.translation, '.',
                  qNameAttrOccur(makeQName("qualifiers", givenLocation))),
                e])]))
      | left(msg) -> error(s"Error in reifying child of production ${prodName}:\n${msg}")
      end
    | _ ->
      if
        contains(prodName,
          ["edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteIntLiteralExpr",
           "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteStringLiteralExpr",
           "edu:umn:cs:melt:ableC:silverconstruction:abstractsyntax:antiquoteDirectTypeExpr"])
      then error(s"Unexpected antiquote production arguments: ${show(80, top.pp)}")
      else nothing()
    end;
}
