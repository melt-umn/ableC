grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

abstract production applyExpr
top::Expr ::= fn::Expr args::Exprs
{
  propagate substituted;
  top.pp = parens(concat([fn.pp, parens(ppImplode(cat(comma(), space()), args.pps))]));
  
  local localErrors :: [Message] =
    case fn.typerep of
      closureType(_, _, _) -> args.argumentErrors
    | errorType() -> []
    | _ -> [err(fn.location, s"Cannot apply non-closure (got ${showType(fn.typerep)})")]
    end ++
    fn.errors ++ args.errors;
  
  top.typerep =
    case fn.typerep of
      closureType(_, param, res) -> res
    | _ -> errorType()
    end;
    
  args.argumentPosition = 1;
  args.callExpr = fn;
  args.callVariadic = false;
  args.expectedTypes = 
    case fn.typerep of
      closureType(_, params, _) -> params
    | _ -> error("expectedTypes demanded by args when call expression has non-closure type")
    end;
  
  local fwrd::Expr =
    subExpr(
      [declRefSubstitution("__fn__", fn),
       typedefSubstitution("__return_type__", top.typerep),
       parametersSubstitution("__params__", argTypesToParameters(args.typereps)),
       exprsSubstitution("__args__", args)],
      parseExpr(s"""
({proto_typedef __return_type__, __params__;
  struct _closure_s _temp_closure = __fn__;
  ((__return_type__ (*)(void*, __params__))_temp_closure.fn)(_temp_closure.env, __args__);})"""));

  forwards to mkErrorCheck(localErrors, fwrd);
}