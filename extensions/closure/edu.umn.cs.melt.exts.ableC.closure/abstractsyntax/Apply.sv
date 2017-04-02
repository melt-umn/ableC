grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

global applyExprFwrd::Expr = parseExpr(s"""
({proto_typedef __closure_type__;
  __closure_type__ _temp_closure = __fn__;
  _temp_closure._fn(_temp_closure._env, __args__);})""");

abstract production applyExpr
top::Expr ::= fn::Expr args::Exprs
{
  propagate substituted;

  top.pp = parens(concat([fn.pp, parens(ppImplode(cat(comma(), space()), args.pps))]));
  
  local localErrors :: [Message] =
    (if isClosureType(fn.typerep)
     then args.argumentErrors
     else [err(fn.location, s"Cannot apply non-closure (got ${showType(fn.typerep)})")]) ++
    fn.errors ++ args.errors;
  
  top.typerep = closureResultType(fn.typerep, top.env);
  
  args.argumentPosition = 1;
  args.callExpr = fn;
  args.callVariadic = false;
  args.expectedTypes = closureParamTypes(fn.typerep, top.env);
  
  local fwrd::Expr =
    subExpr(
      [typedefSubstitution("__closure_type__", fn.typerep),
       declRefSubstitution("__fn__", fn),
       exprsSubstitution("__args__", args)],
      applyExprFwrd);

  forwards to mkErrorCheck(localErrors, fwrd);
}
