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
      [err(size.location, "size expression does not have integer type (got " ++ abs:showType(size.abs:typerep) ++ ")")]);
  
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