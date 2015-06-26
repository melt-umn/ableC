grammar edu:umn:cs:melt:exts:ableC:gcadt:abstractsyntax;

imports silver:langutil only ast, pp, errors, err; --, err, wrn;
imports silver:langutil:pp with implode as ppImplode;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

imports edu:umn:cs:melt:exts:ableC:adt;
imports edu:umn:cs:melt:exts:ableC:gc;

abstract production gcConstructor
top::Constructor ::= n::String tms::TypeNameList
{
  top.pp = concat( [ text(n ++ " ( "), ppImplode (text(", "), tms.pps),
                     text(" );") ] );
  tms.position = 0;  
  tms.name_i = n;

  top.constructors = [ pair(n, tms.typereps) ];

  top.enumItem =
    enumItem(
      name( top.topTypeName ++ "_" ++ n, location=builtIn() ),
      nothingExpr());

  top.structItem =
    structItem([],
      structTypeExpr(
        [],
        structDecl([],
          justName(
            name(top.topTypeName ++ "_" ++ n ++ "_s", location=builtIn())),
          tms.asStructItemList, location=builtIn())),
      consStructDeclarator(
        structField(
          name(n, location=builtIn()),
          baseTypeExpr(), []),
        nilStructDeclarator()));

  top.funDecl =
    functionDeclaration(
      functionDecl(
        [staticStorageClass()],
        [inlineQualifier()],
        typedefTypeExpr(
          [],
          name(top.topTypeName, location=builtIn())),
        functionTypeExprWithArgs(
          pointerTypeExpr([], baseTypeExpr()),
          tms.asParameters,
          false),
        name(n, location=builtIn()),
        [],
        nilDecl(),
        foldStmt([
          declStmt(
            variableDecls(
              [], [],
              typedefTypeExpr(
                [], 
                name(top.topTypeName, location=builtIn())), 
              consDeclarator(
                declarator(
                  name("temp", location=builtIn()), 
                  pointerTypeExpr([], baseTypeExpr()),
                  [],
                  nothingInitializer()),
                nilDeclarator()))),
          --txtStmt("temp = (" ++ top.topTypeName ++ " *) gcMalloc (sizeof(" ++ top.topTypeName ++ "));"),
          exprStmt(
            binaryOpExpr(
              declRefExpr(name("temp",location=builtIn()),location=builtIn()),
              assignOp(eqOp(location=builtIn()),location=builtIn()),
              gcNewExpr(name(top.topTypeName, location=builtIn()), location=builtIn()),
              location=builtIn())),
          exprStmt(
            binaryOpExpr(
              memberExpr(
                declRefExpr(
                  name("temp",location=builtIn()),location=builtIn()),
                true,
                name("tag",location=builtIn()),location=builtIn()),
              assignOp(
                eqOp(location=builtIn()),location=builtIn()), 
              declRefExpr(
                name(top.topTypeName++"_"++n,location=builtIn()),location=builtIn()),location=builtIn())),
          tms.asAssignments,
          returnStmt(justExpr(declRefExpr(name("temp",location=builtIn()),location=builtIn())))
        ])));
}
