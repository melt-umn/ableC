grammar edu:umn:cs:melt:exts:ableC:vector:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode;

imports edu:umn:cs:melt:ableC:abstractsyntax hiding vectorType;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction:parsing;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;
imports edu:umn:cs:melt:ableC:abstractsyntax:overload as ovrld;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

imports edu:umn:cs:melt:exts:ableC:string;

global builtin::Location = builtinLoc("vector");

-- Vector initialization
function mkInitVectorStmt
Stmt ::= n::String sub::Type size::Expr
{
  return
    injectGlobalDeclsStmt(
      mkVectorTypedefGlobalDecls(sub),
      seqStmt(
        mkDecl(
          n,
          vectorType([], sub),
          directCallExpr(
            name("GC_malloc", location=builtin),
            consExpr(
              unaryExprOrTypeTraitExpr(
                sizeofOp(location=builtin),
                typeNameExpr(
                  typeName(
                    directTypeExpr(
                      tagType(
                        [],
                        refIdTagType(
                          structSEU(),
                          "_vector_" ++ sub.mangledName ++ "_s",
                          "edu:umn:cs:melt:exts:ableC:vector:_vector_" ++ sub.mangledName ++ "_s"))),
                    baseTypeExpr())),
                location=builtin),
              nilExpr()),
            location=builtin),
          builtin),
        exprStmt(
          directCallExpr(
            name("_init_vector", location=builtin),
            consExpr(
              mkAddressOf(
                memberExpr(
                  declRefExpr(name(n, location=builtin), location=builtin),
                  true,
                  name("_info", location=builtin),
                  location=builtin),
                builtin),
              consExpr(
                explicitCastExpr(
                  typeName(
                    directTypeExpr(builtinType([], voidType())),
                    pointerTypeExpr([], pointerTypeExpr([], baseTypeExpr()))),
                  mkAddressOf(
                    memberExpr(
                      declRefExpr(name(n, location=builtin), location=builtin),
                      true,
                      name("_contents", location=builtin),
                      location=builtin),
                    builtin),
                  location=builtin),
                consExpr(
                  unaryExprOrTypeTraitExpr(
                    sizeofOp(location=builtin),
                    typeNameExpr(typeName(directTypeExpr(sub), baseTypeExpr())),
                    location=builtin),
                  consExpr(size, nilExpr())))),
          location=builtin))));
}

abstract production initVector
top::Expr ::= sub::TypeName size::Expr
{
  propagate substituted;
  
  local fwrd::Expr =
    stmtExpr(
      mkInitVectorStmt("_vec", sub.typerep, size),
      declRefExpr(name("_vec", location=builtin), location=builtin),
      location=top.location);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_init_vector", top.location, top.env), fwrd);
}

abstract production constructVector
top::Expr ::= sub::TypeName e::Exprs
{
  propagate substituted;
  
  e.argumentPosition = 0;
  local fwrd::Expr =
    stmtExpr(
      seqStmt(
        mkInitVectorStmt("_vec", sub.typerep, mkIntConst(e.count, builtin)),
        e.vectorInitTrans),
      declRefExpr(name("_vec", location=builtin), location=top.location),
      location=top.location);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_init_vector", top.location, top.env), fwrd);
}

synthesized attribute vectorInitTrans::Stmt occurs on Exprs;

aspect production consExpr
top::Exprs ::= h::Expr t::Exprs
{
  top.vectorInitTrans =
    seqStmt(
      exprStmt(
        subscriptAssignVector(
          declRefExpr(name("_vec", location=builtin), location=builtin),
          mkIntConst(top.argumentPosition, builtin),
          eqOp(location=builtin),
          h,
          location=builtin)),
      t.vectorInitTrans);
}

aspect production nilExpr
top::Exprs ::= 
{
  top.vectorInitTrans = nullStmt();
}

abstract production copyVector
top::Expr ::= e::Expr
{
  propagate substituted;
  
  local subType::Type = 
    case e.typerep of
      vectorType(_, s) -> s
    | _ -> error("copyVector where lhs is non-vector")
    end;
  
  local funName::String = "_copy_vector_" ++ subType.mangledName;

  local globalDecls::[Pair<String Decl>] = -- TODO: Template this instead, someday
    [pair(
      funName,
      functionDeclaration(
        functionDecl(
          [staticStorageClass()],
          [],
          directTypeExpr(vectorType([], subType)),
          functionTypeExprWithArgs(
            baseTypeExpr(),
            consParameters(
              parameterDecl(
                [],
                directTypeExpr(e.typerep),
                baseTypeExpr(),
                justName(name("vec", location=builtin)),
                []),
              nilParameters()),
            false),
          name(funName, location=builtin),
          [],
          nilDecl(),
          foldStmt([
            mkInitVectorStmt(
              "result",
              subType,
              lengthVector(
                declRefExpr(name("vec", location=builtin), location=builtin),
                location=builtin)),
            seqStmt(
              declStmt( 
                variableDecls(
                  [], [],
                  typedefTypeExpr([], name("size_t", location=builtin)),
                  consDeclarator( 
                    declarator(
                      name("i", location=builtin),
                      baseTypeExpr(),
                      [], 
                      nothingInitializer()) , 
                    nilDeclarator()))),
              forStmt(
                justExpr(
                  binaryOpExpr(
                    declRefExpr(name("i", location=builtin), location=builtin),
                    assignOp(eqOp(location=builtin), location=builtin),
                    mkIntConst(0, builtin),
                    location=builtin)),
                justExpr(
                  binaryOpExpr(
                    declRefExpr(name("i", location=builtin), location=builtin),
                    compareOp(ltOp(location=builtin), location=builtin),
                    lengthVector(
                      declRefExpr(name("vec", location=builtin), location=builtin),
                      location=builtin),
                    location=builtin)),
                justExpr(
                  unaryOpExpr(
                    postIncOp(location=builtin),
                    declRefExpr(name("i", location=builtin), location=builtin),
                    location=builtin)),
                exprStmt(
                  subscriptAssignVector(
                    declRefExpr(name("result", location=builtin), location=builtin),
                    declRefExpr(name("i", location=builtin), location=builtin),
                    eqOp(location=builtin),
                    subscriptVector(
                      declRefExpr(name("vec", location=builtin), location=builtin),
                      declRefExpr(name("i", location=builtin), location=builtin),
                      location=builtin),
                    location=builtin)))),
            returnStmt(
              justExpr(declRefExpr(name("result", location=builtin), location=builtin)))]))))];

  local fwrd::Expr =
    injectGlobalDecls(
      globalDecls,
      directCallExpr(
        name(funName, location=builtin),
        consExpr(e, nilExpr()),
        location=builtin),
      location=builtin);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_init_vector", top.location, top.env), fwrd);
}

-- Vector append
abstract production appendVector
top::Expr ::= e1::Expr e2::Expr
{
  propagate substituted;
  
  local subType::Type = 
    case e1.typerep of
      vectorType(_, s) -> s
    | _ -> error("appendVector where lhs is non-vector")
    end;
    
  local vecTempName::String = "_vec_" ++ toString(genInt());
  
  local fwrd::Expr =
    stmtExpr(
      mkDecl(vecTempName, vectorType([], subType), copyVector(e1, location=builtin), builtin),
      appendAssignVector(
        declRefExpr(name(vecTempName, location=builtin), location=builtin),
        e2,
        location=builtin),
      location=builtin);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_init_vector", top.location, top.env), fwrd);
}

abstract production appendAssignVector
top::Expr ::= e1::Expr e2::Expr
{
  propagate substituted;
  
  local subType::Type = 
    case e1.typerep of
      vectorType(_, s) -> s
    | _ -> error("appendAssignVector where lhs is non-vector")
    end;
  
  local funName::String = "_append_to_vector_" ++ subType.mangledName;

  local globalDecls::[Pair<String Decl>] = -- TODO: Template this instead, someday
    [pair(
      funName,
      functionDeclaration(
        functionDecl(
          [staticStorageClass()],
          [],
          directTypeExpr(vectorType([], subType)),
          functionTypeExprWithArgs(
            baseTypeExpr(),
            consParameters(
              parameterDecl(
                [],
                directTypeExpr(e1.typerep),
                baseTypeExpr(),
                justName(name("vec1", location=builtin)),
                []),
              consParameters(
                parameterDecl(
                  [],
                  directTypeExpr(e2.typerep),
                  baseTypeExpr(),
                  justName(name("vec2", location=builtin)),
                  []),
                nilParameters())),
            false),
          name(funName, location=builtin),
          [],
          nilDecl(),
          foldStmt([
            declStmt( 
              variableDecls(
                [], [],
                typedefTypeExpr([], name("size_t", location=builtin)),
                consDeclarator( 
                  declarator(
                    name("vec1_length", location=builtin),
                    baseTypeExpr(),
                    [], 
                    justInitializer(
                      exprInitializer(
                        lengthVector(
                        declRefExpr(name("vec1", location=builtin), location=builtin),
                        location=builtin)))), 
                  nilDeclarator()))),
            declStmt( 
              variableDecls(
                [], [],
                typedefTypeExpr([], name("size_t", location=builtin)),
                consDeclarator( 
                  declarator(
                    name("i", location=builtin),
                    baseTypeExpr(),
                    [], 
                    nothingInitializer()) , 
                  nilDeclarator()))),
            forStmt(
              justExpr(
                binaryOpExpr(
                  declRefExpr(name("i", location=builtin), location=builtin),
                  assignOp(eqOp(location=builtin), location=builtin),
                  mkIntConst(0, builtin),
                  location=builtin)),
              justExpr(
                binaryOpExpr(
                  declRefExpr(name("i", location=builtin), location=builtin),
                  compareOp(ltOp(location=builtin), location=builtin),
                  lengthVector(
                    declRefExpr(name("vec2", location=builtin), location=builtin),
                    location=builtin),
                  location=builtin)),
              justExpr(
                unaryOpExpr(
                  postIncOp(location=builtin),
                  declRefExpr(name("i", location=builtin), location=builtin),
                  location=builtin)),
              exprStmt(
                subscriptAssignVector(
                  declRefExpr(name("vec1", location=builtin), location=builtin),
                  mkAdd(
                    declRefExpr(name("i", location=builtin), location=builtin),
                    declRefExpr(name("vec1_length", location=builtin), location=builtin),
                    builtin),
                  eqOp(location=builtin),
                  subscriptVector(
                    declRefExpr(name("vec2", location=builtin), location=builtin),
                    declRefExpr(name("i", location=builtin), location=builtin),
                    location=builtin),
                  location=builtin))),
            returnStmt(
              justExpr(declRefExpr(name("vec1", location=builtin), location=builtin)))]))))];

  local fwrd::Expr =
    injectGlobalDecls(
      globalDecls,
      directCallExpr(
        name(funName, location=builtin),
        consExpr(e1, consExpr(e2, nilExpr())),
        location=builtin),
      location=builtin);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_init_vector", top.location, top.env), fwrd);
}

abstract production eqVector
top::Expr ::= e1::Expr e2::Expr
{
  propagate substituted;
  
  local subType::Type = 
    case e1.typerep of
      vectorType(_, s) -> s
    | _ -> error("eqVector where lhs is non-vector")
    end;
  
  local funName::String = "_eq_vector_" ++ subType.mangledName;

  local globalDecls::[Pair<String Decl>] = -- TODO: Template this instead, someday
    [pair(
      funName,
      functionDeclaration(
        functionDecl(
          [staticStorageClass()],
          [],
          directTypeExpr(builtinType([], boolType())),
          functionTypeExprWithArgs(
            baseTypeExpr(),
            consParameters(
              parameterDecl(
                [],
                directTypeExpr(e1.typerep),
                baseTypeExpr(),
                justName(name("vec1", location=builtin)),
                []),
              consParameters(
                parameterDecl(
                  [],
                  directTypeExpr(e2.typerep),
                  baseTypeExpr(),
                  justName(name("vec2", location=builtin)),
                  []),
                nilParameters())),
            false),
          name(funName, location=builtin),
          [],
          nilDecl(),
          foldStmt([
            ifStmtNoElse(
              binaryOpExpr(
                lengthVector(
                  declRefExpr(name("vec1", location=builtin), location=builtin),
                  location=builtin),
                compareOp(notEqualsOp(location=builtin), location=builtin),
                lengthVector(
                  declRefExpr(name("vec2", location=builtin), location=builtin),
                  location=builtin),
                location=builtin),
              returnStmt(justExpr(mkIntConst(0, builtin)))),
            declStmt(
              variableDecls(
                [], [],
                typedefTypeExpr([], name("size_t", location=builtin)),
                consDeclarator( 
                  declarator(
                    name("i", location=builtin),
                    baseTypeExpr(),
                    [], 
                    nothingInitializer()) , 
                  nilDeclarator()))),
            forStmt(
              justExpr(
                binaryOpExpr(
                  declRefExpr(name("i", location=builtin), location=builtin),
                  assignOp(eqOp(location=builtin), location=builtin),
                  mkIntConst(0, builtin),
                  location=builtin)),
              justExpr(
                binaryOpExpr(
                  declRefExpr(name("i", location=builtin), location=builtin),
                  compareOp(ltOp(location=builtin), location=builtin),
                  lengthVector(
                    declRefExpr(name("vec1", location=builtin), location=builtin),
                    location=builtin),
                  location=builtin)),
              justExpr(
                unaryOpExpr(
                  postIncOp(location=builtin),
                  declRefExpr(name("i", location=builtin), location=builtin),
                  location=builtin)),
              ifStmtNoElse(
                binaryOpExpr(
                  subscriptVector(
                    declRefExpr(name("vec1", location=builtin), location=builtin),
                    declRefExpr(name("i", location=builtin), location=builtin),
                    location=builtin),
                  compareOp(notEqualsOp(location=builtin), location=builtin),
                  subscriptVector(
                    declRefExpr(name("vec2", location=builtin), location=builtin),
                    declRefExpr(name("i", location=builtin), location=builtin),
                    location=builtin),
                  location=builtin),
                returnStmt(justExpr(mkIntConst(0, builtin))))),
            returnStmt(justExpr(mkIntConst(1, builtin)))]))))];

  local fwrd::Expr =
    injectGlobalDecls(
      globalDecls,
      directCallExpr(
        name(funName, location=builtin),
        consExpr(e1, consExpr(e2, nilExpr())),
        location=builtin),
      location=builtin);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_init_vector", top.location, top.env), fwrd);
}

abstract production lengthVector
top::Expr ::= e::Expr
{
  propagate substituted;
  
  local subType::Type = 
    case e.typerep of
      vectorType(_, s) -> s
    | _ -> error("lengthVector where lhs is non-vector")
    end;
    
  local fwrd::Expr =
    injectGlobalDecls(
      mkVectorTypedefGlobalDecls(subType),
      memberExpr(
        memberExpr(e, true, name("_info", location=builtin), location=builtin),
        false,
        name("length", location=builtin),
        location=builtin),
      location=top.location);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_init_vector", top.location, top.env), fwrd);
}

abstract production capacityVector
top::Expr ::= e::Expr
{
  propagate substituted;
  
  local subType::Type = 
    case e.typerep of
      vectorType(_, s) -> s
    | _ -> error("capacityVector where lhs is non-vector")
    end;
    
  local fwrd::Expr =
    injectGlobalDecls(
      mkVectorTypedefGlobalDecls(subType),
      memberExpr(
        memberExpr(e, true, name("_info", location=builtin), location=builtin),
        false,
        name("capacity", location=builtin),
        location=builtin),
      location=top.location);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_init_vector", top.location, top.env), fwrd);
}

abstract production elemSizeVector
top::Expr ::= e::Expr
{
  propagate substituted;
  
  local subType::Type = 
    case e.typerep of
      vectorType(_, s) -> s
    | _ -> error("elemSizeVector where lhs is non-vector")
    end;
    
  local fwrd::Expr =
    injectGlobalDecls(
      mkVectorTypedefGlobalDecls(subType),
      memberExpr(
        memberExpr(e, true, name("_info", location=builtin), location=builtin),
        false,
        name("elem_size", location=builtin),
        location=builtin),
      location=top.location);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_init_vector", top.location, top.env), fwrd);
}

abstract production subscriptVector
top::Expr ::= e1::Expr e2::Expr
{
  propagate substituted;
  
  local subType::Type = 
    case e1.typerep of
      vectorType(_, s) -> s
    | _ -> error("subscriptVector where lhs is non-vector")
    end;
    
  local vecTempName::String = "_vec_" ++ toString(genInt());
  local indexTempName::String = "_index_" ++ toString(genInt());

  local fwrd::Expr =
    injectGlobalDecls(
      mkVectorTypedefGlobalDecls(subType),
        stmtExpr(
          foldStmt([
            mkDecl(vecTempName, e1.typerep, e1, builtin),
            mkDecl("_index_", e2.typerep, e2, builtin),
            exprStmt(
              directCallExpr(
                name("_check_index_vector", location=builtin),
                consExpr(
                  memberExpr(
                    declRefExpr(name(vecTempName, location=builtin), location=builtin),
                    true,
                    name("_info", location=builtin),
                    location=builtin),
                  consExpr(
                    memberExpr(
                      declRefExpr(name(vecTempName, location=builtin), location=builtin),
                      true,
                      name("_contents", location=builtin),
                      location=builtin),
                    consExpr(
                      declRefExpr(name("_index_", location=builtin), location=builtin),
                      nilExpr()))),
                location=top.location))]),
          arraySubscriptExpr(
            memberExpr(
              declRefExpr(name(vecTempName, location=builtin), location=builtin),
              true,
              name("_contents", location=builtin),
              location=builtin),
            declRefExpr(name("_index_", location=builtin), location=builtin),
            location=builtin),
          location=top.location),
        location=top.location);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_check_index_vector", top.location, top.env), fwrd);
}

abstract production subscriptAssignVector
top::Expr ::= lhs::Expr index::Expr op::AssignOp rhs::Expr
{
  propagate substituted;
  
  local subType::Type = 
    case lhs.typerep of
      vectorType(_, s) -> s
    | _ -> error("subscriptAssignVector where lhs is non-vector")
    end;
    
  local vecTempName::String = "_vec_" ++ toString(genInt());
  local indexTempName::String = "_index_" ++ toString(genInt());
  
  local fwrd::Expr =
    injectGlobalDecls(
      mkVectorTypedefGlobalDecls(subType),
        stmtExpr(
          foldStmt([
            mkDecl(vecTempName, lhs.typerep, lhs, builtin),
            mkDecl(indexTempName, index.typerep, index, builtin),
            exprStmt(
              directCallExpr(
                name("_maybe_grow_vector_by_one", location=builtin),
                consExpr(
                  mkAddressOf(
                    memberExpr(
                      declRefExpr(name(vecTempName, location=builtin), location=builtin),
                      true,
                      name("_info", location=builtin),
                      location=builtin),
                    builtin),
                  consExpr(
                    explicitCastExpr(
                      typeName(
                        directTypeExpr(builtinType([], voidType())),
                        pointerTypeExpr([], pointerTypeExpr([], baseTypeExpr()))),
                      mkAddressOf(
                        memberExpr(
                          declRefExpr(name(vecTempName, location=builtin), location=builtin),
                          true,
                          name("_contents", location=builtin),
                        location=builtin),
                        builtin),
                      location=builtin),
                    consExpr(
                      declRefExpr(name(indexTempName, location=builtin), location=builtin),
                      nilExpr()))),
                location=top.location))]),
            binaryOpExpr(
              arraySubscriptExpr(
                memberExpr(
                  declRefExpr(name(vecTempName, location=builtin), location=builtin),
                  true,
                  name("_contents", location=builtin),
                  location=builtin),
                declRefExpr(name(indexTempName, location=builtin), location=builtin),
                location=builtin),
              assignOp(op, location=builtin),
              rhs,
              location=builtin),
          location=top.location),
        location=top.location);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_maybe_grow_vector_by_one", top.location, top.env), fwrd);
}

abstract production showVector
top::Expr ::= e::Expr
{
  propagate substituted;
  
  local subType::Type = 
    case e.typerep of
      vectorType(_, s) -> s
    | _ -> error("showVector where lhs is non-vector")
    end;
  
  local funName::String = "_show_vector_" ++ subType.mangledName;

  local globalDecls::[Pair<String Decl>] = -- TODO: Template this instead, someday
    [pair(
      funName,
      functionDeclaration(
        functionDecl(
          [staticStorageClass()],
          [],
          directTypeExpr(stringType()),
          functionTypeExprWithArgs(
            baseTypeExpr(),
            consParameters(
              parameterDecl(
                [],
                directTypeExpr(e.typerep),
                baseTypeExpr(),
                justName(name("vec", location=builtin)),
                []),
              nilParameters()),
            false),
          name(funName, location=builtin),
          [],
          nilDecl(),
          foldStmt([
            ifStmtNoElse(
              binaryOpExpr(
                lengthVector(
                  declRefExpr(name("vec", location=builtin), location=builtin),
                  location=builtin),
                compareOp(equalsOp(location=builtin), location=builtin),
                mkIntConst(0, builtin),
                location=builtin),
              returnStmt(justExpr(stringLiteral("\"[]\"", location=builtin)))),
            mkDecl(
              "result",
              stringType(),
              appendString(
                stringLiteral("\"[\"", location=builtin),
                showExpr(
                  subscriptVector(
                    declRefExpr(name("vec", location=builtin), location=builtin),
                    mkIntConst(0, builtin),
                    location=builtin),
                  location=builtin),
                location=builtin),
              builtin),
            seqStmt(
              declStmt( 
                variableDecls(
                  [], [],
                  typedefTypeExpr([], name("size_t", location=builtin)),
                  consDeclarator( 
                    declarator(
                      name("i", location=builtin),
                      baseTypeExpr(),
                      [],
                      nothingInitializer()), 
                    nilDeclarator()))),
              forStmt(
                justExpr(
                  binaryOpExpr(
                    declRefExpr(name("i", location=builtin), location=builtin),
                    assignOp(eqOp(location=builtin), location=builtin),
                    mkIntConst(1, builtin),
                    location=builtin)),
                justExpr(
                  binaryOpExpr(
                    declRefExpr(name("i", location=builtin), location=builtin),
                    compareOp(ltOp(location=builtin), location=builtin),
                    lengthVector(
                      declRefExpr(name("vec", location=builtin), location=builtin),
                      location=builtin),
                    location=builtin)),
                justExpr(
                  unaryOpExpr(
                    postIncOp(location=builtin),
                    declRefExpr(name("i", location=builtin), location=builtin),
                    location=builtin)),
                exprStmt(
                  binaryOpExpr(
                    declRefExpr(name("result", location=builtin), location=builtin),
                    assignOp(eqOp(location=builtin), location=builtin),
                    appendString(
                      declRefExpr(name("result", location=builtin), location=builtin),
                      appendString(
                        stringLiteral("\", \"", location=builtin),
                        showExpr(
                          subscriptVector(
                            declRefExpr(name("vec", location=builtin), location=builtin),
                            declRefExpr(name("i", location=builtin), location=builtin),
                            location=builtin),
                          location=builtin),
                        location=builtin),
                      location=builtin),
                    location=builtin)))),
            returnStmt(
              justExpr(
                appendString(
                  declRefExpr(name("result", location=builtin), location=builtin),
                  stringLiteral("\"]\"", location=builtin),
                  location=builtin)))]))))];
  
  local fwrd::Expr =
    injectGlobalDecls(
      globalDecls,
      directCallExpr(
        name(funName, location=builtin),
        consExpr(e, nilExpr()),
        location=builtin),
      location=builtin);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_init_vector", top.location, top.env), fwrd);
}

-- Check the given env for the given function name
function checkVectorHeaderDef
[Message] ::= n::String loc::Location env::Decorated Env
{
  return
    if !null(lookupValue(n, env))
    then []
    else [err(loc, "Missing include of vector.xh")];
}