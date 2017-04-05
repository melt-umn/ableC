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

imports edu:umn:cs:melt:exts:ableC:templating;
imports edu:umn:cs:melt:exts:ableC:string;

global builtin::Location = builtinLoc("vector");

aspect production addOp
top::NumOp ::=
{
  overloads <-
    [pair(
       pair(
         "edu:umn:cs:melt:exts:ableC:vector:vector",
         "edu:umn:cs:melt:exts:ableC:vector:vector"),
       appendVector(_, _, location=_))];
}

aspect production addEqOp
top::AssignOp ::=
{
  overloads <-
    [pair(
       pair(
         "edu:umn:cs:melt:exts:ableC:vector:vector",
         "edu:umn:cs:melt:exts:ableC:vector:vector"),
       appendAssignVector(_, _, location=_))];
}

aspect production equalsOp
top::CompareOp ::=
{
  overloads <-
    [pair(
       pair(
         "edu:umn:cs:melt:exts:ableC:vector:vector",
         "edu:umn:cs:melt:exts:ableC:vector:vector"),
       eqVector(_, _, location=_))];
}

aspect production ovrld:memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  overloads <-
    [pair("edu:umn:cs:melt:exts:ableC:vector:vector", memberVector(_, _, _, location=_))];
}

aspect production ovrld:callExpr
top::Expr ::= f::Expr  a::Exprs
{
  memberOverloads <-
    [pair("edu:umn:cs:melt:exts:ableC:vector:vector", memberCallVector(_, _, _, _, location=_))];
}

aspect production showExpr
top::Expr ::= e::Expr
{
  overloads <- [pair("edu:umn:cs:melt:exts:ableC:vector:vector", showVector(_, location=_))];
}

-- Vector initialization
abstract production newVector
top::Expr ::= sub::TypeName size::Expr
{
  propagate substituted;
  top.pp = pp"vec<${sub.pp}>(${size.pp})";
  
  local localErrors::[Message] =
    sub.errors ++ checkVectorHeaderDef("_new_vector", top.location, top.env);
  
  sub.env = globalEnv(top.env);
  
  local fwrd::Expr =
    callExpr(
      templateDeclRefExpr(
        name("_new_vector", location=builtin),
        consTypeName(sub, nilTypeName()),
        location=builtin),
      consExpr(size, nilExpr()),
      location=builtin);
  
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production constructVector
top::Expr ::= sub::TypeName e::Exprs
{
  propagate substituted;
  top.pp = pp"vec<${sub.pp}> [${ppImplode(pp", ", e.pps)}]";
  
  local localErrors::[Message] =
    sub.errors ++ e.vectorInitErrors ++
    checkVectorHeaderDef("_new_vector", top.location, top.env);
  
  sub.env = globalEnv(top.env);
  
  e.argumentPosition = 0;
  e.vectorInitType = sub.typerep;
  
  local fwrd::Expr =
    stmtExpr(
      seqStmt(
        mkDecl(
          "_vec",
          vectorType([], sub.typerep),
          newVector(sub, mkIntConst(e.count, builtin), location=builtin),
          builtin),
        e.vectorInitTrans),
      declRefExpr(name("_vec", location=builtin), location=builtin),
      location=top.location);
  
  forwards to mkErrorCheck(localErrors, fwrd);
}

autocopy attribute vectorInitType::Type occurs on Exprs;

synthesized attribute vectorInitErrors::[Message] occurs on Exprs;
synthesized attribute vectorInitTrans::Stmt occurs on Exprs;

aspect production consExpr
top::Exprs ::= h::Expr t::Exprs
{
  top.vectorInitErrors =
    (if !typeAssignableTo(h.typerep, top.vectorInitType)
     then [err(h.location, s"Invalid type to vector initializer: Expected ${showType(top.vectorInitType)}, got ${showType(h.typerep)}")]
     else []) ++ t.vectorInitErrors;
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
  top.vectorInitErrors = [];
  top.vectorInitTrans = nullStmt();
}

abstract production copyVector
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"copy_vector(${e.pp})";
  
  local subType::Type = vectorSubType(e.typerep, top.env);
  
  local localErrors::[Message] =
    checkVectorHeaderDef("_copy_vector", top.location, top.env) ++
    if !isVectorType(e.typerep, top.env)
    then [err(e.location, s"Vector copy expected vector type, got ${showType(e.typerep)}")]
    else [];
  local fwrd::Expr =
    callExpr(
      templateDeclRefExpr(
        name("_copy_vector", location=builtin),
        consTypeName(typeName(directTypeExpr(subType), baseTypeExpr()), nilTypeName()),
        location=builtin),
      consExpr(e, nilExpr()),
      location=builtin);
  
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production appendVector
top::Expr ::= e1::Expr e2::Expr
{
  propagate substituted;
  top.pp = pp"${e1.pp} + ${e2.pp}";
  
  local subType::Type = vectorSubType(e1.typerep, top.env);
  local vecTempName::String = "_vec_" ++ toString(genInt());
  
  forwards to 
    stmtExpr(
      mkDecl(vecTempName, vectorType([], subType), copyVector(e1, location=builtin), builtin),
      appendAssignVector(
        declRefExpr(name(vecTempName, location=builtin), location=builtin),
        e2,
        location=builtin),
      location=builtin);
}

abstract production appendAssignVector
top::Expr ::= e1::Expr e2::Expr
{
  propagate substituted;
  top.pp = pp"${e1.pp} += ${e2.pp}";
  
  local subType::Type = vectorSubType(e1.typerep, top.env);
  
  local localErrors::[Message] =
    checkVectorHeaderDef("_append_to_vector", top.location, top.env) ++
    if !compatibleTypes(subType, vectorSubType(e2.typerep, top.env), false)
    then [err(top.location, s"Vector append sub-types must be the same, got ${showType(e1.typerep)} and ${showType(e2.typerep)}")]
    else [];

  local fwrd::Expr =
    callExpr(
      templateDeclRefExpr(
        name("_append_to_vector", location=builtin),
        consTypeName(typeName(directTypeExpr(subType), baseTypeExpr()), nilTypeName()),
        location=builtin),
      consExpr(e1, consExpr(e2, nilExpr())),
      location=builtin);
  
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production eqVector
top::Expr ::= e1::Expr e2::Expr
{
  propagate substituted;
  top.pp = pp"${e1.pp} == ${e2.pp}";
  
  local subType::Type = vectorSubType(e1.typerep, top.env);
  local funName::String = "_eq_vector_" ++ subType.mangledName;
  
  local localErrors::[Message] =
    checkVectorHeaderDef("_eq_vector", top.location, top.env) ++
    if !compatibleTypes(subType, vectorSubType(e2.typerep, top.env), false)
    then [err(top.location, s"Vector equality sub-types must be the same, got ${showType(e1.typerep)} and ${showType(e2.typerep)}")]
    else [];
  local fwrd::Expr =
    callExpr(
      templateDeclRefExpr(
        name("_eq_vector", location=builtin),
        consTypeName(typeName(directTypeExpr(subType), baseTypeExpr()), nilTypeName()),
        location=builtin),
      consExpr(e1, consExpr(e2, nilExpr())),
      location=builtin);
  
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production lengthVector
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"${e.pp}.length";
  
  local subType::Type = vectorSubType(e.typerep, top.env);
  local fwrd::Expr =
    memberExpr(
      memberExpr(e, true, name("_info", location=builtin), location=builtin),
      false,
      name("length", location=builtin),
      location=builtin);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_vector_s", top.location, top.env), fwrd);
}

abstract production capacityVector
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"${e.pp}.capacity";

  local subType::Type = vectorSubType(e.typerep, top.env);
  local fwrd::Expr =
    memberExpr(
      memberExpr(e, true, name("_info", location=builtin), location=builtin),
      false,
      name("capacity", location=builtin),
      location=builtin);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_vector_s", top.location, top.env), fwrd);
}

abstract production elemSizeVector
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"${e.pp}.elem_size";
  
  local subType::Type = vectorSubType(e.typerep, top.env);
  local fwrd::Expr =
    memberExpr(
      memberExpr(e, true, name("_info", location=builtin), location=builtin),
      false,
      name("elem_size", location=builtin),
      location=builtin);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_vector_s", top.location, top.env), fwrd);
}

abstract production subscriptVector
top::Expr ::= e1::Expr e2::Expr
{
  propagate substituted;
  top.pp = pp"${e1.pp}[${e2.pp}]";
  
  local subType::Type = vectorSubType(e1.typerep, top.env);
  local vecTempName::String = "_vec_" ++ toString(genInt());
  local indexTempName::String = "_index_" ++ toString(genInt());

  local localErrors::[Message] =
    checkStringHeaderDef("_check_index_vector", top.location, top.env) ++
    if e2.typerep.isIntegerType
    then []
    else [err(e2.location, s"Vector index must have integer type, but got ${showType(e2.typerep)}")];
  local fwrd::Expr =
    stmtExpr(
      foldStmt([
        mkDecl(vecTempName, e1.typerep, e1, builtin),
        mkDecl(indexTempName, e2.typerep, e2, builtin),
        exprStmt(
          callExpr(
            templateDeclRefExpr(
              name("_check_index_vector", location=builtin),
              consTypeName(typeName(directTypeExpr(subType), baseTypeExpr()), nilTypeName()),
              location=builtin),
            consExpr(
              declRefExpr(name(vecTempName, location=builtin), location=builtin),
              consExpr(
                declRefExpr(name(indexTempName, location=builtin), location=builtin),
                nilExpr())),
            location=builtin))]),
        arraySubscriptExpr(
          memberExpr(
            declRefExpr(name(vecTempName, location=builtin), location=builtin),
            true,
            name("_contents", location=builtin),
            location=builtin),
          declRefExpr(name(indexTempName, location=builtin), location=builtin), location=builtin),
        location=builtin);
  
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production subscriptAssignVector
top::Expr ::= lhs::Expr index::Expr op::AssignOp rhs::Expr
{
  propagate substituted;
  top.pp = pp"${lhs.pp}[${index.pp}] ${op.pp} ${rhs.pp}";
  
  local subType::Type = vectorSubType(lhs.typerep, top.env);
  local vecTempName::String = "_vec_" ++ toString(genInt());
  local indexTempName::String = "_index_" ++ toString(genInt());

  local localErrors::[Message] =
    checkStringHeaderDef("_maybe_grow_vector_by_one", top.location, top.env) ++
    (if index.typerep.isIntegerType
     then []
     else [err(index.location, s"Vector index must have integer type, but got ${showType(index.typerep)}")]) ++
    (if !compatibleTypes(subType, vectorSubType(rhs.typerep, top.env), false)
     then [err(top.location, s"Vector index assign sub-type and rhs type must be the same, got ${showType(subType)} and ${showType(rhs.typerep)}")]
     else []);
  local fwrd::Expr =
    stmtExpr(
      foldStmt([
        mkDecl(vecTempName, lhs.typerep, lhs, builtin),
        mkDecl(indexTempName, index.typerep, index, builtin),
        exprStmt(
          callExpr(
            templateDeclRefExpr(
              name("_maybe_grow_vector_by_one", location=builtin),
              consTypeName(typeName(directTypeExpr(subType), baseTypeExpr()), nilTypeName()),
              location=builtin),
            consExpr(
              declRefExpr(name(vecTempName, location=builtin), location=builtin),
              consExpr(
                declRefExpr(name(indexTempName, location=builtin), location=builtin),
                nilExpr())),
            location=builtin))]),
        binaryOpExpr(
          arraySubscriptExpr(
            memberExpr(
              declRefExpr(name(vecTempName, location=builtin), location=builtin),
              true,
              name("_contents", location=builtin),
              location=builtin),
            declRefExpr(name(indexTempName, location=builtin), location=builtin), location=builtin),
          assignOp(op, location=builtin),
          rhs,
          location=builtin),
        location=builtin);
  
  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production memberVector
top::Expr ::= lhs::Expr deref::Boolean rhs::Name
{
  propagate substituted;
  
  forwards to
    case rhs.name of
      "length"    -> lengthVector(lhs, location=top.location)
    | "size"      -> lengthVector(lhs, location=top.location)
    | "capacity"  -> capacityVector(lhs, location=top.location)
    | "elem_size" -> elemSizeVector(lhs, location=top.location)
    | n -> errorExpr([err(rhs.location, s"Vector does not have field ${n}")], location=top.location)
    end;
}

abstract production memberCallVector
top::Expr ::= lhs::Expr deref::Boolean rhs::Name a::Exprs
{
  propagate substituted;
  
  forwards to
    case rhs.name of
    -- TODO
    --  "append" -> appendElemVector(lhs, a, location=top.location)
    --| "insert" -> insertElemVector(lhs, a, location=top.location)
    | n -> errorExpr([err(rhs.location, s"Vector does not have field ${n}")], location=top.location)
    end;
}

abstract production showVector
top::Expr ::= e::Expr
{
  propagate substituted;
  top.pp = pp"show(${e.pp})";
  
  local subType::Type = vectorSubType(e.typerep, top.env);

  local localErrors::[Message] =
    checkStringHeaderDef("_show_vector", top.location, top.env) ++
    -- TODO: Make this check less aweful somehow
    decorate
      showExpr(
        unaryOpExpr(
          dereferenceOp(location=builtin),
          memberExpr(
            e, true,
            name("_contents", location=builtin),
            location=builtin),
          location=builtin),
        location=top.location)
    with { env = top.env; returnType = top.returnType; }.errors;
  local fwrd::Expr =
    callExpr(
      templateDeclRefExpr(
        name("_show_vector", location=builtin),
        consTypeName(typeName(directTypeExpr(subType), baseTypeExpr()), nilTypeName()),
        location=builtin),
      consExpr(e, nilExpr()),
      location=builtin);
  
  forwards to mkErrorCheck(localErrors, fwrd);
}

-- Check the given env for the given function name
function checkVectorHeaderDef
[Message] ::= n::String loc::Location env::Decorated Env
{
  return
    if !null(lookupTemplate(n, env))
    then []
    else [err(loc, "Missing include of vector.xh")];
}