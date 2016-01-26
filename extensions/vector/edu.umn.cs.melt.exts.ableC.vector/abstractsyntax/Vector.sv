grammar edu:umn:cs:melt:exts:ableC:vector:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode ;

imports edu:umn:cs:melt:ableC:abstractsyntax hiding vectorType;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
--imports edu:umn:cs:melt:ableC:abstractsyntax:debug;

imports edu:umn:cs:melt:exts:ableC:string;

abstract production constructVector
top::Expr ::= sub::TypeName e::Exprs
{
  top.typerep = vectorType([], sub.typerep);
  forwards to 
    stmtExpr(
      vectorInitStmt(e),
      directCallExpr(
        name("_new_vector", location=builtIn()),
        consExpr(
          realConstant(
            integerConstant(toString(e.count), false, noIntSuffix(), location=builtIn()),
            location=builtIn()),
          vectorInitExprs(e)),
        location=top.location),
      location=top.location);
}

function vectorInitStmt
Stmt ::= e::Exprs
{
  return
    case e of
      consExpr(h, t) ->
        seqStmt(
          basicVarDeclStmt(h.typerep, name("_item_" ++ toString(e.count), location=builtIn()), h),
          vectorInitStmt(t))
    | nilExpr() -> nullStmt()
    end;
}

function vectorInitExprs
Exprs ::= e::Exprs
{
  return
    case e of
      consExpr(h, t) ->
        consExpr(
          unaryOpExpr(
            addressOfOp(location=builtIn()),
            declRefExpr(
              name("_item_" ++ toString(e.count), location=builtIn()),
              location=builtIn()),
            location=builtIn()),
          consExpr(
            unaryExprOrTypeTraitExpr(
              sizeofOp(location=builtIn()),
              typeNameExpr(typeName(directTypeExpr(h.typerep), baseTypeExpr())),
              location=builtIn()),
            vectorInitExprs(t)))
    | nilExpr() -> nilExpr()
    end;
}

abstract production appendVector
top::Expr ::= e1::Expr e2::Expr
{
  top.typerep = e1.typerep;
  forwards to
    directCallExpr(
      name("_append_vectors", location=builtIn()),
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
      name("_append_update_vector", location=builtIn()),
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

  local param1Name::Name = name("elem1", location=builtIn());
  local param2Name::Name = name("elem2", location=builtIn());
  local fnName::Name = name("eq_fn", location=builtIn());

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
              dereferenceOp(location=builtIn()),
              explicitCastExpr(
                typeName(
                  directTypeExpr(subType1),
                  pointerTypeExpr([], baseTypeExpr())),
                declRefExpr(
                  param1Name,
                  location=builtIn()),
                location=builtIn()),
              location=builtIn()),
            compareOp(equalsOp(location=builtIn()), location=builtIn()),
            unaryOpExpr(
              dereferenceOp(location=builtIn()),
              explicitCastExpr(
                typeName(
                  directTypeExpr(subType2),
                  pointerTypeExpr([], baseTypeExpr())),
                declRefExpr(
                  param1Name,
                  location=builtIn()),
                location=builtIn()),
              location=builtIn()),
            location=builtIn()))));
  
  forwards to
    stmtExpr(
      declStmt(functionDeclaration(fnDecl)),
      directCallExpr(
        name("_equal_vectors", location=builtIn()),
        consExpr(
          e1,
          consExpr(
            e2,
            consExpr(
              declRefExpr(
                fnName,
                location=builtIn()),
            nilExpr()))),
        location=top.location),
      location=top.location);
}

abstract production subscriptVector
top::Expr ::= e1::Expr e2::Expr
{
  forwards to
    unaryOpExpr(
      dereferenceOp(location=builtIn()),
        explicitCastExpr(
          case e1.typerep of
            vectorType(_, s) -> typeName(directTypeExpr(s), pointerTypeExpr([], baseTypeExpr()))
          | _ -> error("subscriptAssignVector where lhs is non-vector")
          end,
          directCallExpr(
            name("_index_vector", location=builtIn()),
            consExpr(e1, consExpr(e2, nilExpr())),
            location=top.location),
          location=top.location),
      location=top.location);
}

abstract production subscriptAssignVector
top::Expr ::= lhs::Expr index::Expr op::AssignOp rhs::Expr
{
  forwards to
    case op of
      eqOp() -> 
        directCallExpr(
          name("_update_index_vector", location=builtIn()),
          consExpr(
            lhs,
            consExpr(
              index,
              consExpr(
                stmtExpr(
                  basicVarDeclStmt(rhs.typerep, name("_item", location=builtIn()), rhs),
                  unaryOpExpr(
                    addressOfOp(location=builtIn()),
                    declRefExpr(
                      name("_item", location=builtIn()),
                      location=builtIn()),
                    location=builtIn()),
                  location=builtIn()),
                consExpr(
                  unaryExprOrTypeTraitExpr(
                    sizeofOp(location=builtIn()),
                    typeNameExpr(typeName(directTypeExpr(rhs.typerep), baseTypeExpr())),
                    location=builtIn()),
                  nilExpr())))),
          location=top.location)
    | _ ->
        stmtExpr(
          exprStmt(
            directCallExpr(
              name("_check_index_vector", location=builtIn()),
              consExpr(lhs, consExpr(index, nilExpr())),
              location=top.location)),
            binaryOpExpr(
              unaryOpExpr(
                dereferenceOp(location=builtIn()),
                explicitCastExpr(
                  case lhs.typerep of
                    vectorType(_, s) -> typeName(directTypeExpr(s), pointerTypeExpr([], baseTypeExpr()))
                  | _ -> error("subscriptAssignVector where lhs is non-vector")
                  end,
                  arraySubscriptExpr(
                    memberExpr(lhs, true, name("contents", location=builtIn()), location=builtIn()),
                    index,
                    location=builtIn()),
                  location=builtIn()),
                location=builtIn()),
              assignOp(op, location=builtIn()),
              rhs,
              location=builtIn()),
          location=top.location)
    end;
}

abstract production vectorToString
top::Expr ::= e::Expr
{
  local subType::Type = 
    case e.typerep of
      vectorType(_, t) -> t
    | _ -> error("vectorToString on non-vector")
    end;

  local paramName::Name = name("elem", location=builtIn());
  local fnName::Name = name("to_string_fn", location=builtIn());

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
          constructString(
            unaryOpExpr(
              dereferenceOp(location=builtIn()),
              explicitCastExpr(
                typeName(
                  directTypeExpr(subType),
                  pointerTypeExpr([], baseTypeExpr())),
                declRefExpr(
                  paramName,
                  location=builtIn()),
                location=builtIn()),
              location=builtIn()),
            location=builtIn()))));
  
  forwards to
    stmtExpr(
      declStmt(functionDeclaration(fnDecl)),
      directCallExpr(
        name("_to_str_vector", location=builtIn()),
        consExpr(
          e,
          consExpr(
            declRefExpr(
              fnName,
              location=builtIn()),
            nilExpr())),
        location=top.location),
      location=top.location);
}