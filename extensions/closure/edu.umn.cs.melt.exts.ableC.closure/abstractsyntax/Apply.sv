grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

abstract production applyExpr
e::Expr ::= fn::Expr arg::Expr
{
  local localErrs :: [Message] =
    case fn.typerep of
      closureType(param, res, _) ->
        if compatibleTypes(param, arg.typerep, true) then []
        else [err(arg.location, s"Incompatible parameter type (expected ${showType(param)}, got ${showType(arg.typerep)})")]
    | errorType() -> []
    | _ -> [err(arg.location, s"Cannot apply non-closure (got ${showType(fn.typerep)})")]
    end ++
    fn.errors ++ arg.errors;
  
  e.typerep =
    case fn.typerep of
      closureType(param, res, _) -> res
    | _ -> errorType()
    end;
  
  forwards to
    if null(localErrs) then
      fwrd
    else
      errorExpr(localErrs, location=e.location);
  
  local fwrd::Expr =
    callExpr(
      explicitCastExpr(
        case fn.typerep of
          closureType(param, res, _) -> 
            typeName(
              directTypeExpr(res),
              pointerTypeExpr(
                [],
                functionTypeExprWithArgs(
                  baseTypeExpr(),
                  consParameters(
                    parameterDecl(
                      [],
                      directTypeExpr(param),
                      baseTypeExpr(),
                      nothingName(),
                      []),
                    consParameters(
                      parameterDecl(
                        [],
                        directTypeExpr(builtinType([], voidType())),
                        pointerTypeExpr([], baseTypeExpr()),
                        nothingName(),
                        []),
                      nilParameters())),
                false)))
        end,
        memberExpr(
          fn,
          false,
          name("fn", location=builtIn()),
          location=builtIn()),
        location=builtIn()),
      consExpr(
        arg,
        consExpr(
          memberExpr(
            fn,
            false,
            name("env", location=builtIn()),
            location=builtIn()),
          nilExpr())),
      location=builtIn());
}