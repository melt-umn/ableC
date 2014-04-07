

-- Currently, this does nothing except spot vector __vector_size__(8) annotations
function animateAttributeOnType
Type ::= attr::[Attribute]  ty::Type
{
  return case attr of
  | [] -> ty
  | gccAttribute(l) :: t -> animateAttributeOnType(t, animateAttribOnType(l, ty))
  | _ :: t -> animateAttributeOnType(t, ty)
  end;
}


function animateAttribOnType
Type ::= attr::[Attrib]  ty::Type
{
  return case attr of
  | [] -> ty
  -- __vector_size__(num)
  | appliedAttrib(attribName(name("__vector_size__")), 
      consExpr(realConstant(integerConstant(num, _, _)), nilExpr())) :: t ->
        vectorType(ty, toInt(num))
  | _ :: t -> animateAttribOnType(t, ty)
  end;
}

