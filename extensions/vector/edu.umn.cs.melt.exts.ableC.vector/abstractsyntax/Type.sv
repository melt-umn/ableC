grammar edu:umn:cs:melt:exts:ableC:vector:abstractsyntax;

function mkVectorTypedefGlobalDecls
[Pair<String Decl>] ::= sub::Type
{
  local vectorTypedefDecl::Decl = parseDecl(s"""
typedef struct __attribute__((refId("edu:umn:cs:melt:exts:ableC:vector:_vector_${sub.mangledName}_s"))) _vector_${sub.mangledName}_s {
  struct _vector_info _info;
  __sub_type__ *_contents;
} *_vector_${sub.mangledName};
""");

  return
    [pair(
      "_vector_" ++ sub.mangledName,
      subDecl([typedefSubstitution("__sub_type__", sub)], vectorTypedefDecl))];
}

abstract production vectorTypeExpr 
top::BaseTypeExpr ::= sub::TypeName
{
  propagate substituted;
  sub.env = globalEnv(top.env);
  
  forwards to
    if !null(sub.errors)
    then errorTypeExpr(sub.errors)
    else directTypeExpr(vectorType([], sub.typerep));
}

abstract production vectorType
top::Type ::= qs::[Qualifier] sub::Type
{
  top.lpp = pp"${ppImplode(space(), map((.pp), qs))}vector<${sub.lpp}${sub.rpp}>";
  top.rpp = pp"";

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
    noncanonicalType(
      injectGlobalDeclsType(
        mkVectorTypedefGlobalDecls(sub),
        noncanonicalType(
          typedefType(
            qs,
            "_vector_" ++ sub.mangledName,
            pointerType(
              [],
              tagType(
                [],
                refIdTagType(
                  structSEU(),
                  "_vector_" ++ sub.mangledName ++ "_s",
                  "edu:umn:cs:melt:exts:ableC:vector:_vector_" ++ sub.mangledName ++ "_s")))))));
}