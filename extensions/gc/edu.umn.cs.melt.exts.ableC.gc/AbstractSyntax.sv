grammar edu:umn:cs:melt:exts:ableC:gc;

imports edu:umn:cs:melt:ableC:abstractsyntax as abs;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as abs;
imports edu:umn:cs:melt:ableC:abstractsyntax:env as abs;

imports silver:langutil;
imports silver:langutil:pp;

abstract production gcMallocExpr
top::abs:Expr ::= size::abs:Expr
{
  -- We check to make sure GC_malloc is in the environment. 
  local localErrs :: [Message] =
    (if !null(abs:lookupValue("GC_malloc", top.abs:env)) then [] else
      [err(top.location, "Garbage collection requires <gc.h> to be included.")]) ++

    (if size.abs:typerep.abs:isIntegerType then [] else
      [err(size.location, "size expression does not have integer type (got " ++ 
        abs:showType(size.abs:typerep) ++ ")")]);
 
  forwards to
    if null(localErrs) then
      gcMalloc
    else
      abs:errorExpr(localErrs, location=top.location);
  
  local gcMalloc :: abs:Expr =
    abs:directCallExpr(abs:name("GC_malloc", location=top.location),
                       abs:consExpr(size, abs:nilExpr()),
                       location=top.location);
}

abstract production gcReallocExpr
top::abs:Expr ::= ptr::abs:Expr size::abs:Expr
{
  -- We check to make sure GC_realloc is in the environment. 
  local localErrs :: [Message] =
    (if !null(abs:lookupValue("GC_realloc", top.abs:env)) then [] else
      [err(top.location, "Garbage collection requires <gc.h> to be included.")]) ++
    case ptr.abs:typerep of
    abs:pointerType(_, _) -> []
    | _ -> [err(size.location, "reallocated pointer does not have pointer type (got " ++ abs:showType(ptr.abs:typerep) ++ ")")]
    end ++
    (if size.abs:typerep.abs:isIntegerType then [] else
      [err(size.location, "size expression does not have integer type (got " ++ abs:showType(size.abs:typerep) ++ ")")]);
  
  top.abs:typerep = ptr.abs:typerep; -- TODO: It may be better to do an actual cast in the generated code
  
  forwards to
    if null(localErrs) then
      gcRealloc
    else
      abs:errorExpr(localErrs, location=top.location);
  
  local gcRealloc :: abs:Expr =
    abs:directCallExpr(abs:name("GC_realloc", location=top.location),
                       abs:consExpr(ptr, abs:consExpr(size, abs:nilExpr())),
                       location=top.location);
}

abstract production gcNewExpr
top::abs:Expr ::= ty::abs:TypeName
{
  -- We check to make sure GC_realloc is in the environment. 
  local localErrs :: [Message] =
    (if !null(abs:lookupValue("GC_malloc", top.abs:env)) then [] else
      [err(top.location, "Garbage collection requires <gc.h> to be included.")]);
  
  --top.abs:typerep = resType.abs:typerep;
  
  forwards to
    if null(localErrs) then
      gcNew
    else
      abs:errorExpr(localErrs, location=top.location);
  
  local resType :: abs:TypeName = abs:typeName(ty.abs:bty,
                                               abs:pointerTypeExpr([], ty.abs:mty));
  
  local gcNew :: abs:Expr =
    abs:explicitCastExpr(resType,
                         gcMallocExpr(abs:unaryExprOrTypeTraitExpr(abs:sizeofOp(location=top.location),
                                                                   abs:typeNameExpr(ty),
                                                                   location=top.location),
                                      location=top.location),
                         location=top.location);
}
