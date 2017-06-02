grammar edu:umn:cs:melt:exts:ableC:vector:abstractsyntax;

abstract production vectorTypeExpr 
top::BaseTypeExpr ::= q::Qualifiers sub::TypeName
{
  propagate substituted;
  top.pp = pp"${terminate(space(), q.pps)}vector<${sub.pp}>";
  
  sub.env = globalEnv(top.env);
  
  local localErrors::[Message] =
    sub.errors ++ checkVectorHeaderDef("_vector_s", builtin, top.env); -- TODO: location
  
  forwards to
    if !null(localErrors)
    then errorTypeExpr(localErrors)
    else
      injectGlobalDeclsTypeExpr(
        foldDecl([
          templateTypeExprInstDecl(
            q,
            name("_vector_s", location=builtin),
            consTypeName(sub, nilTypeName()))]),
        directTypeExpr(vectorType(q, sub.typerep)));
}

abstract production vectorType
top::Type ::= q::Qualifiers sub::Type
{
  top.lpp = pp"${terminate(space(), q.pps)}vector<${sub.lpp}${sub.rpp}>";
  top.rpp = pp"";
  
  top.withTypeQualifiers = vectorType(foldQualifier(top.addedTypeQualifiers ++ q.qualifiers), sub);
  
  top.showProd =
    case sub.showProd of
      just(_) -> just(showVector(_, location=_))
    | nothing() -> nothing()
    end;

  forwards to
    tagType(
      q,
      refIdTagType(
        structSEU(),
        templateMangledName("_vector_s", [sub]),
        templateMangledRefId("_vector_s", [sub])));
}

-- Check if a type is a vector type in a non-interfering way
function isVectorType
Boolean ::= t::Type env::Decorated Env
{
  local refId::String =
    case t of
      tagType(_, refIdTagType(_, _, refId)) -> refId
    | _ -> ""
    end;
  local refIds::[RefIdItem] = lookupRefId(refId, env);
  local valueItems::[ValueItem] = lookupValue("_contents", head(refIds).tagEnv);
  local ptrType::Type = head(valueItems).typerep;

  return
    case refIds, valueItems, ptrType of
      [], _, _ -> false
    | _, [], _ -> false
    | _, _, pointerType(_, pointerType(_, _)) -> true
    | _, _, _ -> false
    end;
}

-- Find the sub-type of a vector type in a non-interfering way
function vectorSubType
Type ::= t::Type env::Decorated Env
{
  local refId::String =
    case t of
      tagType(_, refIdTagType(_, _, refId)) -> refId
    | _ -> ""
    end;
  local refIds::[RefIdItem] = lookupRefId(refId, env);
  local valueItems::[ValueItem] = lookupValue("_contents", head(refIds).tagEnv);
  local ptrType::Type = head(valueItems).typerep;

  return
    case refIds, valueItems, ptrType of
      [], _, _ -> errorType()
    | _, [], _ -> errorType()
    | _, _, pointerType(_, pointerType(_, sub)) -> sub
    | _, _, _ -> errorType()
    end;
}
