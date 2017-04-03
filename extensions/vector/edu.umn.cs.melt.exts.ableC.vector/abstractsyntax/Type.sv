grammar edu:umn:cs:melt:exts:ableC:vector:abstractsyntax;

abstract production vectorTypeExpr 
top::BaseTypeExpr ::= q::[Qualifier] sub::TypeName
{
  propagate substituted;
  top.pp = pp"${terminate(space(), map((.pp), q))}vector<${sub.pp}>";
  
  sub.env = globalEnv(top.env);
  
  local localErrors::[Message] =
    sub.errors ++ checkVectorHeaderDef("_vector_s", builtin, top.env); -- TODO: location
  
  forwards to
    if !null(localErrors)
    then errorTypeExpr(localErrors)
    else
      injectGlobalDeclsTypeExpr(
        foldDecl([
          -- sub should be included literally in the forward tree exactly once
          -- Generate a phony typedef to avoid gcc warnings
          typedefDecls(
            [], sub.bty,
            consDeclarator(
              declarator(
                name(s"_vector_sub_unused_${toString(genInt())}", location=builtin),
                sub.mty,
                [],
                nothingInitializer()),
              nilDeclarator())),
          templateTypeExprInstDecl(
            q,
            name("_vector_s", location=builtin),
            consTypeName(sub, nilTypeName()))]),
        directTypeExpr(vectorType(q, sub.typerep)));
}

abstract production vectorType
top::Type ::= q::[Qualifier] sub::Type
{
  top.lpp = pp"${terminate(space(), map((.pp), q))}vector<${sub.lpp}${sub.rpp}>";
  top.rpp = pp"";
  
  top.withoutTypeQualifiers = vectorType([], sub);
  top.withTypeQualifiers = vectorType(top.addedTypeQualifiers ++ q, sub);

  top.ovrld:lBinaryPlusProd =
    case top.ovrld:otherType of
      vectorType(_, s) ->
        if compatibleTypes(sub, s, true)
        then just(appendVector(_, _, location=_))
        else nothing()
    | _ -> nothing()
    end;
    
  top.ovrld:lAssignPlusProd =
    case top.ovrld:otherType of
      vectorType(_, s) ->
        if compatibleTypes(sub, s, true)
        then just(appendAssignVector(_, _, location=_))
        else nothing()
    | _ -> nothing()
    end;
  
  top.ovrld:lBinaryEqProd =
    case top.ovrld:otherType of
      vectorType(_, s) ->
        if compatibleTypes(sub, s, true)
        then just(eqVector(_, _, location=_))
        else nothing()
    | _ -> nothing()
    end;
  
  top.ovrld:memberProd =
    case top.ovrld:otherName of
      "length"   -> just(lengthVector(_, location=_))
    | "size"     -> just(lengthVector(_, location=_))
    | "capacity" -> just(capacityVector(_, location=_))
    | "elem_size" -> just(elemSizeVector(_, location=_))
    | _ -> nothing()
    end;
  
  top.ovrld:subscriptProd =
    case top.ovrld:otherType of
      builtinType(_, signedType(_)) -> just(subscriptVector(_, _, location=_))
    | builtinType(_, unsignedType(_)) -> just(subscriptVector(_, _, location=_))
    | _ -> nothing()
    end;
  
  top.ovrld:subscriptAssignProd =
    case top.ovrld:otherType, top.ovrld:otherType2 of
      builtinType(_, signedType(_)), s ->
        if compatibleTypes(sub, s, true)
        then just(subscriptAssignVector(_, _, _, _, location=_))
        else nothing()
    | builtinType(_, unsignedType(_)), s ->
        if compatibleTypes(sub, s, true)
        then just(subscriptAssignVector(_, _, _, _, location=_))
        else nothing()
    | _, _ -> nothing()
    end;
  
  top.showProd =
    case sub.showProd of
      just(_) -> just(showVector(_, location=_))
    | nothing() -> nothing()
    end;

  forwards to
    pointerType(
      q,
      tagType(
        [],
        refIdTagType(
          structSEU(),
          templateMangledName("_vector_s", [sub]),
          templateMangledRefId("_vector_s", [sub]))));
}

-- Find the sub-type of a vector type in a non-interfering way
function vectorSubType
Type ::= t::Type env::Decorated Env
{
  local refId::String =
    case t of
      pointerType(_, tagType(_, refIdTagType(_, _, refId))) -> refId
    | _ -> ""
    end;
  local refIds::[RefIdItem] = lookupRefId(refId, env);
  local valueItems::[ValueItem] = lookupValue("_contents", head(refIds).tagEnv);
  local ptrType::Type = head(valueItems).typerep;

  return
    case refIds, valueItems, ptrType of
      [], _, _ -> errorType()
    | _, [], _ -> errorType()
    | _, _, pointerType(_, sub) -> sub
    | _, _, _ -> errorType()
    end;
}
