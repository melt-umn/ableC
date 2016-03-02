
-- TODO: need 'Attributes' 'Attribs' nonterminals so this sucks less.


-- Currently, this does nothing except spot vector __vector_size__(8) annotations
function animateAttributeOnType
Type ::= attr::[Attribute]  ty::Type
{
  return if null(attr) then ty
  else case head(attr) of
  | gccAttribute(l) -> animateAttributeOnType(tail(attr), animateAttribOnType(l, ty))
  | _ -> animateAttributeOnType(tail(attr), ty)
  end;
}


function animateAttribOnType
Type ::= attr::Attribs  ty::Type
{
  return case attr of
    nilAttrib() -> ty
  -- __vector_size__(num)
  | consAttrib(
      appliedAttrib(attribName(name("__vector_size__")), 
        consExpr(realConstant(integerConstant(num, _, _)), nilExpr())),
      _) -> vectorType(ty, toInt(num))
  | consAttrib(_, t) -> animateAttribOnType(t, ty)
  end;
}

