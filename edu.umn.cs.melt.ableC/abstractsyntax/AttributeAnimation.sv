
-- TODO: need 'Attributes' nonterminal so this sucks less.

function animateAttributeOnType
Type ::= attr::[Attribute]  ty::Type
{
  return
    case attr of
    | gccAttribute(l) :: t -> animateAttribOnType(l, animateAttributeOnType(t, ty))
    | h :: t ->
      case animateAttributeOnType(t, ty) of
      | attributedType(attr, t) -> attributedType(h :: attr, t) 
      | t -> attributedType([h], t) 
      end
    | [] -> ty
    end;
}


function animateAttribOnType
Type ::= attr::Attribs  ty::Type
{
  return case attr of
  | nilAttrib() -> ty
  -- __vector_size__(num)
  | consAttrib(
      appliedAttrib(
        attribName(name("__vector_size__")), 
        consExpr(realConstant(integerConstant(num, _, _)), nilExpr())),
      t) -> animateAttribOnType(t, vectorType(ty, toInt(num)))
  | consAttrib(h, t) ->
    case animateAttribOnType(t, ty) of
    | attributedType(gccAttribute(l) :: attr, ty) ->
        attributedType(gccAttribute(consAttrib(h, l)) :: attr, ty)
    | attributedType(attr, ty) ->
        attributedType(gccAttribute(consAttrib(h, nilAttrib())) :: attr, ty)
    | ty -> attributedType([gccAttribute(consAttrib(h, nilAttrib()))], ty)
    end
  end;
}


function getRefIdFromAttributes
Maybe<String> ::= attrs::[Attribute]
{
  return
    case attrs of
      gccAttribute(ats) :: rest -> orElse(getRefIdFromAttribs(ats), getRefIdFromAttributes(rest))
    | _ :: rest -> getRefIdFromAttributes(rest)
    | [] -> nothing()
    end;
}

function getRefIdFromAttribs
Maybe<String> ::= attrs::Attribs
{
  return
    case attrs of
      consAttrib(appliedAttrib(attribName(name("refId")), consExpr(stringLiteral(s), nilExpr())), _) ->
        just(substring(1, length(s) - 1, s))
    | consAttrib(_, rest) -> getRefIdFromAttribs(rest)
    | nilAttrib() -> nothing()
    end;
}

function getModuleNameFromAttributes
Maybe<String> ::= attrs::[Attribute]
{
  return
    case attrs of
      gccAttribute(ats) :: rest -> orElse(getModuleNameFromAttribs(ats), getModuleNameFromAttributes(rest))
    | _ :: rest -> getModuleNameFromAttributes(rest)
    | [] -> nothing()
    end;
}

function getModuleNameFromAttribs
Maybe<String> ::= attrs::Attribs
{
  return
    case attrs of
      consAttrib(appliedAttrib(attribName(name("module")), consExpr(stringLiteral(s), nilExpr())), _) ->
        just(substring(1, length(s) - 1, s))
    | consAttrib(_, rest) -> getModuleNameFromAttribs(rest)
    | nilAttrib() -> nothing()
    end;
}