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
Stmt ::= n::String subType::Type size::Expr
{
  -- TODO: Making this global and substituting for n and the struct name would be more efficient
  -- but less readable.  
  local initVectorStmt::Stmt = parseStmt(["vec_type", "sub_type"], s"""
vec_type ${n} = GC_malloc(sizeof(struct _vector_${subType.mangledName}_s));
_init_vector(&(${n}->_info), (void**)&(${n}->_contents), sizeof(sub_type), size);
""");

  return
    injectGlobalDeclsStmt(
      mkVectorTypedefGlobalDecls(subType),
      subStmt(
        [typedefSubstitution("vec_type", vectorType([], subType)),
         typedefSubstitution("sub_type", subType),
         declRefSubstitution("size", size)],
        initVectorStmt));
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

global copyVectorFunDecl::Decls = parseDecls(["size_t", "vec_type", "sub_type"], s"""
static vec_type fun_name(vec_type vec) {
  vec_type result = GC_malloc(sizeof(struct struct_name));
  _init_vector(&(result->_info), (void**)&(result->_contents), sizeof(sub_type), vec.length);
  
  for (size_t i = 0; i < vec.length; i++) {
    result[i] = vec[i];
  }
  
  return result;
}
""");

abstract production copyVector
top::Expr ::= e::Expr
{
  propagate substituted;
  
  local subType::Type = 
    case e.typerep of
      vectorType(_, s) -> s
    | _ -> error("copyVector where lhs is non-vector")
    end;
  
  -- TODO: Use a templated function in the header file to do this instead
  local funName::String = "_copy_vector_" ++ subType.mangledName;

  local fwrd::Expr =
    injectGlobalDecls(
      [pair(
        funName,
        subDecl(
          [nameSubstitution("fun_name", name(funName, location=builtin)),
           nameSubstitution("struct_name", name(s"_vector_${subType.mangledName}_s", location=builtin)),
           typedefSubstitution("vec_type", vectorType([], subType)),
           typedefSubstitution("sub_type", subType)],
          decls(copyVectorFunDecl)))],
      directCallExpr(
        name(funName, location=builtin),
        consExpr(e, nilExpr()),
        location=builtin),
      location=builtin);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_init_vector", top.location, top.env), fwrd);
}

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
  
  forwards to 
    stmtExpr(
      mkDecl(vecTempName, vectorType([], subType), copyVector(e1, location=builtin), builtin),
      appendAssignVector(
        declRefExpr(name(vecTempName, location=builtin), location=builtin),
        e2,
        location=builtin),
      location=builtin);
}

global appendAssignVectorFunDecl::Decls = parseDecls(["size_t", "vec_type"], s"""
static vec_type fun_name(vec_type vec1, vec_type vec2) {
  size_t vec1_length = vec1.length;

  for (size_t i = 0; i < vec2.length; i++) {
    vec1[i + vec1_length] = vec2[i];
  }
  
  return vec1;
}
""");

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

  forwards to
    injectGlobalDecls(
      [pair(
        funName,
        subDecl(
          [nameSubstitution("fun_name", name(funName, location=builtin)),
           typedefSubstitution("vec_type", vectorType([], subType))],
          decls(appendAssignVectorFunDecl)))],
      directCallExpr(
        name(funName, location=builtin),
        consExpr(e1, consExpr(e2, nilExpr())),
        location=builtin),
      location=builtin);
}

global eqVectorFunDecl::Decls = parseDecls(["size_t", "vec_type"], s"""
static _Bool fun_name(vec_type vec1, vec_type vec2) {
  if (vec1.length != vec2.length)
    return 0;

  for (size_t i = 0; i < vec1.length; i++) {
    if (vec1[i] != vec2[i])
      return 0;
  }
  
  return 1;
}
""");

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
  
  forwards to
    injectGlobalDecls(
      [pair(
        funName,
        subDecl(
          [nameSubstitution("fun_name", name(funName, location=builtin)),
           typedefSubstitution("vec_type", vectorType([], subType))],
          decls(eqVectorFunDecl)))],
      directCallExpr(
        name(funName, location=builtin),
        consExpr(e1, consExpr(e2, nilExpr())),
        location=builtin),
      location=builtin);
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

global subscriptVectorExpr::Expr = parseExpr(["size_t", "vec_type"], s"""
({vec_type temp_vec = vec;
  size_t temp_index = index;
  _check_index_vector(temp_vec->_info, (void*)temp_vec->_contents, temp_index);
  temp_vec->_contents[temp_index];})
""");

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
      subExpr(
        [typedefSubstitution("vec_type", vectorType([], subType)),
         nameSubstitution("temp_vec", name(vecTempName, location=builtin)),
         nameSubstitution("temp_index", name(indexTempName, location=builtin)),
         declRefSubstitution("vec", e1),
         declRefSubstitution("index", e2)],
        subscriptVectorExpr),
      location=top.location);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_check_index_vector", top.location, top.env), fwrd);
}

global subscriptAssignVectorExpr::Expr = parseExpr(["size_t", "vec_type"], s"""
({vec_type temp_vec = vec;
  size_t temp_index = index;
  _maybe_grow_vector_by_one(&temp_vec->_info, (void**)&temp_vec->_contents, temp_index);
  subscript_assign_contents_index;})
""");

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
      subExpr(
        [typedefSubstitution("vec_type", vectorType([], subType)),
         nameSubstitution("temp_vec", name(vecTempName, location=builtin)),
         nameSubstitution("temp_index", name(indexTempName, location=builtin)),
         declRefSubstitution("vec", lhs),
         declRefSubstitution("index", index),
         declRefSubstitution(
           "subscript_assign_contents_index",
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
             location=builtin))],
        subscriptAssignVectorExpr),
      location=top.location);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_maybe_grow_vector_by_one", top.location, top.env), fwrd);
}

global showVectorFunDecl::Decls = parseDecls(["size_t", "vec_type", "str_type"], s"""
proto_typedef size_t;
proto_typedef vec_type;
proto_typedef str_type;
static str_type fun_name(vec_type vec) {
  if (vec.length == 0)
    return "[]";
    
  str_type result = "[" + show_vec_0;
  
  for (size_t i = 1; i < vec.length; i++) {
    result += ", " + show_vec_i;
  }
  
  return result + "]";
}
""");

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
  
  forwards to 
    injectGlobalDecls(
      [pair(
        funName,
        subDecl(
          [nameSubstitution("fun_name", name(funName, location=builtin)),
           typedefSubstitution("vec_type", vectorType([], subType)),
           typedefSubstitution("str_type", stringType()),
           declRefSubstitution(
             "show_vec_0",
             showExpr(
               subscriptVector(
                 declRefExpr(name("vec", location=builtin), location=builtin),
                 mkIntConst(0, builtin),
                 location=builtin),
               location=builtin)),
           declRefSubstitution(
             "show_vec_i",
             showExpr(
               subscriptVector(
                 declRefExpr(name("vec", location=builtin), location=builtin),
                 declRefExpr(name("i", location=builtin), location=builtin),
                 location=builtin),
               location=builtin))],
          decls(showVectorFunDecl)))],
      directCallExpr(
        name(funName, location=builtin),
        consExpr(e, nilExpr()),
        location=builtin),
      location=builtin);
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