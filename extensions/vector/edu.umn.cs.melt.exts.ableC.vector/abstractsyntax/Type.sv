grammar edu:umn:cs:melt:exts:ableC:vector:abstractsyntax;

 -- TODO: Template this instead, someday
function vectorTypedefGlobalDecls
[Pair<String Decl>] ::= sub::Type
{
  return
    [pair(
      "_vector_" ++ sub.mangledName,
      typedefDecls(
        [],
        structTypeExpr(
          [],
          structDecl(
            [gccAttribute(
               consAttrib(
                 appliedAttrib(
                   attribName(name("refId", location=builtin)),
                   consExpr(
                     stringLiteral(
                       s"\"edu:umn:cs:melt:exts:ableC:vector:_vector_${sub.mangledName}_s\"",
                       location=builtin),
                     nilExpr())),
                 nilAttrib()))],
            justName(name("_vector_" ++ sub.mangledName ++ "_s", location=builtin)),
            consStructItem(
              structItem(
                [],
                tagReferenceTypeExpr([], structSEU(), name("_vector_info", location=builtin)),
                consStructDeclarator(
                  structField(name("_info", location=builtin), baseTypeExpr(), []),
                  nilStructDeclarator())),
              consStructItem(
                structItem(
                  [], directTypeExpr(sub),
                  consStructDeclarator(
                    structField(name("_contents", location=builtin), pointerTypeExpr([], baseTypeExpr()), []),
                    nilStructDeclarator())),
                nilStructItem())),
            location=builtin)),
        consDeclarator(
          declarator(
            name("_vector_" ++ sub.mangledName, location=builtin),
            pointerTypeExpr([], baseTypeExpr()),
            [],
            nothingInitializer()),
          nilDeclarator())))];
}

abstract production vectorTypeExpr 
top::BaseTypeExpr ::= sub::TypeName
{
  forwards to directTypeExpr(vectorType([], sub.typerep));
}

abstract production vectorType
top::Type ::= qs::[Qualifier] sub::Type
{
  top.lpp = pp"${ppImplode(space(), map((.pp), qs))} vector(${sub.lpp}${sub.rpp})";
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
  
  -- TODO
  top.showProd =
    case sub.showProd of
      just(_) -> just(showVector(_, location=_))
    | nothing() -> nothing()
    end;

  forwards to
    noncanonicalType(
      injectGlobalDeclsType(
        vectorTypedefGlobalDecls(sub),
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