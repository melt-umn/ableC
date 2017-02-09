grammar edu:umn:cs:melt:exts:ableC:vector:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode;

imports edu:umn:cs:melt:ableC:abstractsyntax hiding vectorType;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
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
      vectorTypedefGlobalDecls(sub),
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
  forwards to
    stmtExpr(
      mkInitVectorStmt("_vec", sub.typerep, size),
      declRefExpr(name("_vec", location=builtin), location=builtin),
      location=top.location);
}

abstract production constructVector
top::Expr ::= sub::TypeName e::Exprs
{
  e.argumentPosition = 0;
  forwards to 
    stmtExpr(
      seqStmt(
        mkInitVectorStmt("_vec", sub.typerep, mkIntConst(e.count, builtin)),
        e.vectorInitTrans),
      declRefExpr(name("_vec", location=builtin), location=top.location),
      location=top.location);
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
  local subType::Type = 
    case e.typerep of
      vectorType(_, s) -> s
    | _ -> error("copyVector where lhs is non-vector")
    end;
  
  local subscriptFunName::String = "_copy_vector_" ++ subType.mangledName;

  local globalDecls::[Pair<String Decl>] = -- TODO: Template this instead, someday
    vectorTypedefGlobalDecls(subType) ++
    [pair(
      subscriptFunName,
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
                vectorTypeExpr(typeName(directTypeExpr(subType), baseTypeExpr())),
                baseTypeExpr(),
                justName(name("vec", location=builtin)),
                []),
              nilParameters()),
            false),
          name(subscriptFunName, location=builtin),
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
              justExpr(declRefExpr(name("vec", location=builtin), location=builtin)))]))))];

  forwards to
    injectGlobalDecls(
      globalDecls,
      directCallExpr(
        name(subscriptFunName, location=builtin),
        consExpr(e, nilExpr()),
        location=builtin),
      location=builtin);
}

-- Vector append
abstract production appendVector
top::Expr ::= e1::Expr e2::Expr
{
  top.typerep = e1.typerep;
  forwards to
    directCallExpr(
      name("_append_vectors", location=builtin),
      consExpr(
        e1,
        consExpr(
          e2,
          nilExpr())),
      location=top.location);
}

abstract production appendAssignVector
top::Expr ::= e1::Expr e2::Expr
{
  top.typerep = e1.typerep;
  forwards to
    directCallExpr(
      name("_append_update_vector", location=builtin),
      consExpr(
        e1,
        consExpr(
          e2,
          nilExpr())),
      location=top.location);
}

abstract production eqVector
top::Expr ::= e1::Expr e2::Expr
{
  local subType1::Type = 
    case e1.typerep of
      vectorType(_, t) -> t
    | _ -> error("eqVector on non-vector")
    end;

  local subType2::Type = 
    case e1.typerep of
      vectorType(_, t) -> t
    | _ -> error("eqVector on non-vector")
    end;

  local param1Name::Name = name("elem1", location=builtin);
  local param2Name::Name = name("elem2", location=builtin);
  local fnName::Name = name("eq_fn", location=builtin);

  local fnDecl::FunctionDecl =
    functionDecl(
      [],
      [],
      directTypeExpr(builtinType([], boolType())),
      functionTypeExprWithArgs(
        baseTypeExpr(),
        consParameters(
          parameterDecl(
            [],
            directTypeExpr(builtinType([], voidType())),
            pointerTypeExpr([], baseTypeExpr()),
            justName(param1Name),
            []),
          consParameters(
            parameterDecl(
              [],
              directTypeExpr(builtinType([], voidType())),
              pointerTypeExpr([], baseTypeExpr()),
              justName(param2Name),
              []),
            nilParameters())),
        false),
      fnName,
      [],
      nilDecl(),
      returnStmt(
        justExpr(
          binaryOpExpr(
            unaryOpExpr(
              dereferenceOp(location=builtin),
              explicitCastExpr(
                typeName(
                  directTypeExpr(subType1),
                  pointerTypeExpr([], baseTypeExpr())),
                declRefExpr(
                  param1Name,
                  location=builtin),
                location=builtin),
              location=builtin),
            compareOp(equalsOp(location=builtin), location=builtin),
            unaryOpExpr(
              dereferenceOp(location=builtin),
              explicitCastExpr(
                typeName(
                  directTypeExpr(subType2),
                  pointerTypeExpr([], baseTypeExpr())),
                declRefExpr(
                  param1Name,
                  location=builtin),
                location=builtin),
              location=builtin),
            location=builtin))));
  
  forwards to
    stmtExpr(
      declStmt(functionDeclaration(fnDecl)),
      directCallExpr(
        name("_equal_vectors", location=builtin),
        consExpr(
          e1,
          consExpr(
            e2,
            consExpr(
              declRefExpr(
                fnName,
                location=builtin),
            nilExpr()))),
        location=top.location),
      location=top.location);
}

abstract production lengthVector
top::Expr ::= e::Expr
{
  local subType::Type = 
    case e.typerep of
      vectorType(_, s) -> s
    | _ -> error("lengthVector where lhs is non-vector")
    end;
    
  forwards to 
    injectGlobalDecls(
      vectorTypedefGlobalDecls(subType),
      memberExpr(
        memberExpr(e, true, name("_info", location=builtin), location=builtin),
        false,
        name("length", location=builtin),
        location=builtin),
      location=top.location);
}

abstract production capacityVector
top::Expr ::= e::Expr
{
  local subType::Type = 
    case e.typerep of
      vectorType(_, s) -> s
    | _ -> error("capacityVector where lhs is non-vector")
    end;
    
  forwards to 
    injectGlobalDecls(
      vectorTypedefGlobalDecls(subType),
      memberExpr(
        memberExpr(e, true, name("_info", location=builtin), location=builtin),
        false,
        name("capacity", location=builtin),
        location=builtin),
      location=top.location);
}

abstract production elemSizeVector
top::Expr ::= e::Expr
{
  local subType::Type = 
    case e.typerep of
      vectorType(_, s) -> s
    | _ -> error("elemSizeVector where lhs is non-vector")
    end;
    
  forwards to 
    injectGlobalDecls(
      vectorTypedefGlobalDecls(subType),
      memberExpr(
        memberExpr(e, true, name("_info", location=builtin), location=builtin),
        false,
        name("elem_size", location=builtin),
        location=builtin),
      location=top.location);
}

abstract production subscriptVector
top::Expr ::= e1::Expr e2::Expr
{
  local subType::Type = 
    case e1.typerep of
      vectorType(_, s) -> s
    | _ -> error("subscriptVector where lhs is non-vector")
    end;

  forwards to
    injectGlobalDecls(
      vectorTypedefGlobalDecls(subType),
        stmtExpr(
          exprStmt(
            directCallExpr(
              name("_check_index_vector", location=builtin),
              consExpr(
                memberExpr(e1, true, name("_info", location=builtin), location=builtin),
                consExpr(
                  memberExpr(e1, true, name("_contents", location=builtin), location=builtin),
                  consExpr(e2, nilExpr()))),
              location=top.location)),
            arraySubscriptExpr(
              memberExpr(e1, true, name("_contents", location=builtin), location=builtin),
              e2,
              location=builtin),
          location=top.location),
        location=top.location);
}

abstract production subscriptAssignVector
top::Expr ::= lhs::Expr index::Expr op::AssignOp rhs::Expr
{
  local subType::Type = 
    case lhs.typerep of
      vectorType(_, s) -> s
    | _ -> error("subscriptAssignVector where lhs is non-vector")
    end;
  
  forwards to
    injectGlobalDecls(
      vectorTypedefGlobalDecls(subType),
        stmtExpr(
          exprStmt(
            directCallExpr(
              name("_maybe_grow_vector_by_one", location=builtin),
              consExpr(
                mkAddressOf(
                  memberExpr(lhs, true, name("_info", location=builtin), location=builtin),
                  builtin),
                consExpr(
                  explicitCastExpr(
                    typeName(
                      directTypeExpr(builtinType([], voidType())),
                      pointerTypeExpr([], pointerTypeExpr([], baseTypeExpr()))),
                    mkAddressOf(
                      memberExpr(lhs, true, name("_contents", location=builtin), location=builtin),
                      builtin),
                    location=builtin),
                  consExpr(index, nilExpr()))),
              location=top.location)),
            binaryOpExpr(
              arraySubscriptExpr(
                memberExpr(lhs, true, name("_contents", location=builtin), location=builtin),
                index,
                location=builtin),
              assignOp(op, location=builtin),
              rhs,
              location=builtin),
          location=top.location),
        location=top.location);
}

abstract production showVector
top::Expr ::= e::Expr
{
  local subType::Type = 
    case e.typerep of
      vectorType(_, t) -> t
    | _ -> error("showVector on non-vector")
    end;

  local paramName::Name = name("elem", location=builtin);
  local fnName::Name = name("to_string_fn", location=builtin);

  local fnDecl::FunctionDecl =
    functionDecl(
      [],
      [],
      stringTypeExpr(),
      functionTypeExprWithArgs(
        baseTypeExpr(),
        consParameters(
          parameterDecl(
            [],
            directTypeExpr(builtinType([], voidType())),
            pointerTypeExpr([], baseTypeExpr()),
            justName(paramName),
            []),
          nilParameters()),
        false),
      fnName,
      [],
      nilDecl(),
      returnStmt(
        justExpr(
          showExpr(
            unaryOpExpr(
              dereferenceOp(location=builtin),
              explicitCastExpr(
                typeName(
                  directTypeExpr(subType),
                  pointerTypeExpr([], baseTypeExpr())),
                declRefExpr(
                  paramName,
                  location=builtin),
                location=builtin),
              location=builtin),
            location=builtin))));
  
  forwards to
    stmtExpr(
      declStmt(functionDeclaration(fnDecl)),
      directCallExpr(
        name("_showVector", location=builtin),
        consExpr(
          e,
          consExpr(
            declRefExpr(
              fnName,
              location=builtin),
            nilExpr())),
        location=top.location),
      location=top.location);
}