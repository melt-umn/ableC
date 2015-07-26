grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

abstract production applyExpr
e::Expr ::= fn::Expr arg::Expr
{
  local localErrs :: [Message] =
    case fn.typerep of
      closureType(_, param, res, _) ->
        if compatibleTypes(param, arg.typerep, true) then []
        else [err(arg.location, s"Incompatible parameter type (expected ${showType(param)}, got ${showType(arg.typerep)})")]
    | errorType() -> []
    | _ -> [err(arg.location, s"Cannot apply non-closure (got ${showType(fn.typerep)})")]
    end ++
    fn.errors ++ arg.errors;
  
  e.typerep =
    case fn.typerep of
      closureType(_, param, res, _) -> res
    | _ -> errorType()
    end;
  
  forwards to
    if null(localErrs) then
      fwrd
    else
      errorExpr(localErrs, location=e.location);
  
  local fwrd::Expr =
    stmtExpr(
      declStmt(
        variableDecls([], [],
          typedefTypeExpr([], name("_closure", location=builtIn())),
          consDeclarator(
            declarator(
              name("_temp_closure", location=builtIn()),
              baseTypeExpr(),
              [],
              justInitializer(exprInitializer(fn))),
            nilDeclarator()))),
       call,
       location=builtIn());
  
  local call::Expr =
    callExpr(
      explicitCastExpr(
        case fn.typerep of
          closureType(_, param, res, _) -> 
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
        | _ -> typeName(errorTypeExpr(localErrs), baseTypeExpr())
        end,
        memberExpr(
          declRefExpr(
            name("_temp_closure", location=builtIn()),
            location=builtIn()),
          true,
          name("fn", location=builtIn()),
          location=builtIn()),
        location=builtIn()),
      consExpr(
        arg,
        consExpr(
          memberExpr(
            declRefExpr(
              name("_temp_closure", location=builtIn()),
              location=builtIn()),
            true,
            name("env", location=builtIn()),
            location=builtIn()),
          nilExpr())),
      location=builtIn());
}