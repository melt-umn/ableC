grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

abstract production applyExpr
top::Expr ::= fn::Expr args::Exprs
{
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

  forwards to mkErrorCheck(localErrors, fwrd);
  
  local fwrd::Expr =
    stmtExpr(
      declStmt(
        variableDecls([], [],
          typedefTypeExpr([], name("_closure", location=builtin)),
          consDeclarator(
            declarator(
              name("_temp_closure", location=builtin),
              baseTypeExpr(),
              [],
              justInitializer(exprInitializer(fn))),
            nilDeclarator()))),
       call,
       location=builtin);
  
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
        | _ -> typeName(errorTypeExpr(localErrors), baseTypeExpr())
        end,
        memberExpr(
          declRefExpr(
            name("_temp_closure", location=builtin),
            location=builtin),
          true,
          name("fn", location=builtin),
          location=builtin),
        location=builtin),
      consExpr(
        memberExpr(
          declRefExpr(
            name("_temp_closure", location=builtin),
            location=builtin),
          true,
          name("env", location=builtin),
          location=builtin),
        args),
      location=builtin);
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