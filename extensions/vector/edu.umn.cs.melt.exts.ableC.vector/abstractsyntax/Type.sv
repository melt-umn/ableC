grammar edu:umn:cs:melt:exts:ableC:vector:abstractsyntax;

abstract production vectorTypeExpr 
top::BaseTypeExpr ::= sub::TypeName
{
  top.typerep = vectorType([], sub.typerep);
  forwards to typedefTypeExpr([], name("_vector", location=builtIn()));
}

-- Passing the refId is kind of a hack, because it is always the same.  However, the env isn't available to look it up
abstract production vectorType
top::Type ::= qs::[Qualifier] sub::Type
{
  top.lBinaryPlusProd =
    case top.otherType of
      vectorType(_, s) ->
        if compatibleTypes(sub, s, true)
        then just(appendVector(_, _, location=_))
        else nothing()
    | _ -> nothing()
    end;
    
  top.lAssignPlusProd =
    case top.otherType of
      vectorType(_, s) ->
        if compatibleTypes(sub, s, true)
        then just(appendAssignVector(_, _, location=_))
        else nothing()
    | _ -> nothing()
    end;
  
  top.lBinaryEqProd =
    case top.otherType of
      vectorType(_, s) ->
        if compatibleTypes(sub, s, true)
        then just(eqVector(_, _, location=_))
        else nothing()
    | _ -> nothing()
    end;
    
  top.subscriptProd =
    case top.otherType of
      builtinType(_, signedType(_)) -> just(subscriptVector(_, _, location=_))
    | builtinType(_, unsignedType(_)) -> just(subscriptVector(_, _, location=_))
    | _ -> nothing()
    end;
    
  top.subscriptAssignProd =
    case top.otherType, top.otherType2 of
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
  
  top.toStringProd =
    case sub.toStringProd of
      just(_) -> just(vectorToString(_, location=_))
    | nothing() -> nothing()
    end;

  forwards to
    noncanonicalType(
      typedefType(
        qs,
        "_vector",
        pointerType(
          [],
          tagType(
            [],
            refIdTagType(
              structSEU(),
              "_vector",
              "edu:umn:cs:melt:exts:ableC:vector:_vector_s")))));
}