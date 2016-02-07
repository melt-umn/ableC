grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

abstract production applyExpr
e::Expr ::= fn::Expr args::Exprs
{
  local localErrs :: [Message] =
    case fn.typerep of
      closureType(_, _, _) -> args.argumentErrors
    | errorType() -> []
    | _ -> [err(fn.location, s"Cannot apply non-closure (got ${showType(fn.typerep)})")]
    end ++
    fn.errors ++ args.errors;
  
  e.typerep =
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
          closureType(_, params, res) -> 
            typeName(
              directTypeExpr(res),
              pointerTypeExpr(
                [],
                functionTypeExprWithArgs(
                  baseTypeExpr(),
                  consParameters(
                    parameterDecl(
                      [],
                      directTypeExpr(builtinType([], voidType())),
                      pointerTypeExpr([], baseTypeExpr()),
                      nothingName(),
                      []),
                    getParams(params)),
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
        memberExpr(
          declRefExpr(
            name("_temp_closure", location=builtIn()),
            location=builtIn()),
          true,
          name("env", location=builtIn()),
          location=builtIn()),
        args),
      location=builtIn());
}

function getParams
Parameters ::= ts::[Type]
{
  return
    case ts of
      h :: t ->
        consParameters(
          parameterDecl(
            [],
            directTypeExpr(h),
            baseTypeExpr(),
            nothingName(),
            []),
          getParams(t))
    | [] -> nilParameters()
    end;
}