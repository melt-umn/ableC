grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

abstract production closureTypeExpr
top::BaseTypeExpr ::= q::[Qualifier] params::Parameters res::TypeName
{
  propagate substituted;
  top.pp = pp"${terminate(space(), map((.pp), q))}closure<(${
    if null(params.pps) then pp"void" else ppImplode(pp", ", params.pps)}) -> ${res.pp}>";
  
  res.env = addEnv(params.defs, top.env);
  
  forwards to 
    if !null(params.errors) || !null(res.errors)
    then errorTypeExpr(params.errors ++ res.errors)
    else directTypeExpr(closureType(q, params.typereps, res.typerep));
}

abstract production closureType
top::Type ::= q::[Qualifier] params::[Type] res::Type
{
  propagate substituted;
  
  top.lpp = pp"${terminate(space(), map((.pp), q))}closure<(${
    if null(params)then pp"void" else
      ppImplode(
        pp", ",
        zipWith(cat,
          map((.lpp), params),
          map((.rpp), params)))}) -> ${res.lpp}${res.rpp}>";
  top.rpp = notext();
  
  top.withoutTypeQualifiers = closureType([], params, res);
  top.withTypeQualifiers = closureType(top.addedTypeQualifiers ++ q, params, res);
  
  top.callProd = just(applyExpr(_, _, location=_));
  
  local structName::String = s"_closure_${implode("_", map((.mangledName), params))}_${res.mangledName}_s";
  local closureStructDecl::Decl = parseDecl(s"""
struct __attribute__((refId("edu:umn:cs:melt:exts:ableC:closure:${structName}"))) ${structName} {
  const char *_fn_name; // For debugging
  void *_env; // Pointer to generated struct containing env
  __res_type__ (*_fn)(void *env, __params__); // First param is above env struct pointer
};
""");
  
  forwards to
    injectGlobalDeclsType(
      consDecl(
        maybeTagDecl(
          structName,
          subDecl(
            [parametersSubstitution("__params__", argTypesToParameters(params)),
             typedefSubstitution("__res_type__", res)],
            closureStructDecl)),
        nilDecl()),
      tagType(
        q,
        refIdTagType(
          structSEU(),
          structName,
          s"edu:umn:cs:melt:exts:ableC:closure:${structName}")));
}

-- Check if a type is a closure in a non-interfering way
function isClosureType
Boolean ::= t::Type
{
  return
    case t of
      tagType(_, refIdTagType(_, _, refId)) ->
        startsWith("edu:umn:cs:melt:exts:ableC:closure:", refId)
    | _ -> false
    end;
}

-- Find the parameter types of a closure type in a non-interfering way
function closureParamTypes
[Type] ::= t::Type env::Decorated Env
{
  local refId::String =
    case t of
      tagType(_, refIdTagType(_, _, refId)) -> refId
    | _ -> ""
    end;
  local refIds::[RefIdItem] = lookupRefId(refId, env);
  local valueItems::[ValueItem] = lookupValue("_fn", head(refIds).tagEnv);
  local fnPtrType::Type = head(valueItems).typerep;

  return
    case refIds, valueItems, fnPtrType of
      [], _, _ -> []
    | _, [], _ -> []
    | _, _, pointerType(_, functionType(_, protoFunctionType(params, _))) -> tail(params)
    | _, _, _ -> []
    end;
}

-- Find the result type of a vector type in a non-interfering way
function closureResultType
Type ::= t::Type env::Decorated Env
{
  local refId::String =
    case t of
      tagType(_, refIdTagType(_, _, refId)) -> refId
    | _ -> ""
    end;
  local refIds::[RefIdItem] = lookupRefId(refId, env);
  local valueItems::[ValueItem] = lookupValue("_fn", head(refIds).tagEnv);
  local fnPtrType::Type = head(valueItems).typerep;

  return
    case refIds, valueItems, fnPtrType of
      [], _, _ -> errorType()
    | _, [], _ -> errorType()
    | _, _, pointerType(_, functionType(res, _)) -> res
    | _, _, _ -> errorType()
    end;
}
