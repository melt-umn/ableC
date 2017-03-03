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
  local initVectorStmt::Stmt = parseStmt(s"""
proto_typedef __vec_type__, __sub_type__;
__vec_type__ ${n} = GC_malloc(sizeof(struct _vector_${subType.mangledName}_s));
_init_vector(&(${n}->_info), (void**)&(${n}->_contents), sizeof(__sub_type__), __size__);
""");

  return
    injectGlobalDeclsStmt(
      mkVectorTypedefGlobalDecls(subType),
      subStmt(
        [typedefSubstitution("__vec_type__", vectorType([], subType)),
         typedefSubstitution("__sub_type__", subType),
         declRefSubstitution("__size__", size)],
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

global copyVectorFunDecl::Decls = parseDecls(s"""
proto_typedef size_t, __vec_type__, __sub_type__;
static __vec_type__ __fun_name__(__vec_type__ vec) {
  __vec_type__ result = GC_malloc(sizeof(struct struct_name));
  _init_vector(&(result->_info), (void**)&(result->_contents), sizeof(__sub_type__), vec.length);
  
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
          [nameSubstitution("__fun_name__", name(funName, location=builtin)),
           nameSubstitution("struct_name", name(s"_vector_${subType.mangledName}_s", location=builtin)),
           typedefSubstitution("__vec_type__", vectorType([], subType)),
           typedefSubstitution("__sub_type__", subType)],
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

global appendAssignVectorFunDecl::Decls = parseDecls(s"""
proto_typedef size_t, __vec_type__;
static __vec_type__ __fun_name__(__vec_type__ vec1, __vec_type__ vec2) {
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
          [nameSubstitution("__fun_name__", name(funName, location=builtin)),
           typedefSubstitution("__vec_type__", vectorType([], subType))],
          decls(appendAssignVectorFunDecl)))],
      directCallExpr(
        name(funName, location=builtin),
        consExpr(e1, consExpr(e2, nilExpr())),
        location=builtin),
      location=builtin);
}

global eqVectorFunDecl::Decls = parseDecls(s"""
proto_typedef size_t, __vec_type__;
static _Bool __fun_name__(__vec_type__ vec1, __vec_type__ vec2) {
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
          [nameSubstitution("__fun_name__", name(funName, location=builtin)),
           typedefSubstitution("__vec_type__", vectorType([], subType))],
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

global subscriptVectorExpr::Expr = parseExpr(s"""
({proto_typedef size_t, __vec_type__;
  __vec_type__ __temp_vec__ = __vec__;
  size_t __temp_index__ = index;
  _check_index_vector(__temp_vec__->_info, (void*)__temp_vec__->_contents, __temp_index__);
  __temp_vec__->_contents[__temp_index__];})
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
        [typedefSubstitution("__vec_type__", vectorType([], subType)),
         nameSubstitution("__temp_vec__", name(vecTempName, location=builtin)),
         nameSubstitution("__temp_index__", name(indexTempName, location=builtin)),
         declRefSubstitution("__vec__", e1),
         declRefSubstitution("index", e2)],
        subscriptVectorExpr),
      location=top.location);
  
  forwards to mkErrorCheck(checkVectorHeaderDef("_check_index_vector", top.location, top.env), fwrd);
}

global subscriptAssignVectorExpr::Expr = parseExpr(s"""
({proto_typedef size_t, __vec_type__;
  __vec_type__ __temp_vec__ = __vec__;
  size_t __temp_index__ = __index__;
  _maybe_grow_vector_by_one(&__temp_vec__->_info, (void**)&__temp_vec__->_contents, __temp_index__);
  __subscript_assign_contents_index__;})
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
        [typedefSubstitution("__vec_type__", vectorType([], subType)),
         nameSubstitution("__temp_vec__", name(vecTempName, location=builtin)),
         nameSubstitution("__temp_index__", name(indexTempName, location=builtin)),
         declRefSubstitution("__vec__", lhs),
         declRefSubstitution("__index__", index),
         declRefSubstitution(
           "__subscript_assign_contents_index__",
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

global showVectorFunDecl::Decls = parseDecls(s"""
proto_typedef size_t, __vec_type__, __str_type__;
static __str_type__ __fun_name__(__vec_type__ vec) {
  if (vec.length == 0)
    return "[]";
    
  __str_type__ result = "[" + __show_vec_0__;
  
  for (size_t i = 1; i < vec.length; i++) {
    result += ", " + __show_vec_i__;
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
          [nameSubstitution("__fun_name__", name(funName, location=builtin)),
           typedefSubstitution("__vec_type__", vectorType([], subType)),
           typedefSubstitution("__str_type__", stringType()),
           declRefSubstitution(
             "__show_vec_0__",
             showExpr(
               subscriptVector(
                 declRefExpr(name("vec", location=builtin), location=builtin),
                 mkIntConst(0, builtin),
                 location=builtin),
               location=builtin)),
           declRefSubstitution(
             "__show_vec_i__",
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