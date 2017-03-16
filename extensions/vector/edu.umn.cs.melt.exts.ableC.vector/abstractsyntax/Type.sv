grammar edu:umn:cs:melt:exts:ableC:vector:abstractsyntax;

abstract production vectorTypeExpr 
top::BaseTypeExpr ::= q::[Qualifier] sub::TypeName
{
  propagate substituted;
  sub.env = globalEnv(top.env);
  
  local localErrors::[Message] =
    sub.errors ++ checkVectorHeaderDef("_vector_s", builtin, top.env); -- TODO: location
  
  forwards to
    if !null(localErrors)
    then errorTypeExpr(localErrors)
    else directTypeExpr(vectorType(q, sub.typerep));
}

abstract production vectorType
top::Type ::= q::[Qualifier] sub::Type
{
  top.lpp = pp"${ppImplode(space(), map((.pp), q))}vector<${sub.lpp}${sub.rpp}>";
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
    
  local mangledName::String = templateMangledName("_vector_s", [sub]);

  forwards to
    injectGlobalDeclsType(
      consDecl(
        -- Perform a template instantiation of _vector_s to generate a global decl of the
        -- instantiated struct.  
        -- Useless typedef instead of typeExprDecl to avoid triggering "useless type name in empty
        -- declaration" warnings in the generated code
        typedefDecls(
          [],
          templateTypedefTypeExpr(
            q,
            name("_vector_s", location=builtin),
            consTypeName(typeName(directTypeExpr(sub), baseTypeExpr()), nilTypeName())),
          consDeclarator(
            declarator(
              name("_vector_s_" ++ toString(genInt()), location=builtin),
              baseTypeExpr(),
              [],
              nothingInitializer()),
            nilDeclarator())),
        nilDecl()),
          pointerType(
            q,
            tagType(
              [],
              refIdTagType(
                structSEU(),
                mangledName,
                s"edu:umn:cs:melt:exts:ableC:templating:${mangledName}"))));
}

function mkVectorType
Type ::= q::[Qualifier] sub::Type env::Decorated Env
{
  local result::BaseTypeExpr = vectorTypeExpr(q, typeName(directTypeExpr(sub), baseTypeExpr()));
  result.env = env;
  result.returnType = nothing();
  
  return result.typerep;
}