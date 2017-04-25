
function animateAttributeOnType
Type ::= attr::Attributes  ty::Type
{
  return
    case attr of
    | consAttribute(gccAttribute(l), t) -> animateAttribOnType(l, animateAttributeOnType(t, ty))
    | consAttribute(h, t) ->
      case animateAttributeOnType(t, ty) of
      | attributedType(attr, t) -> attributedType(consAttribute(h, attr), t) 
      | t -> attributedType(consAttribute(h, nilAttribute()), t) 
      end
    | nilAttribute() -> ty
    end;
}


function animateAttribOnType
Type ::= attr::Attribs  ty::Type
{
  return case attr of
  -- Attribs that specify new types (i.e. not type-compatible with what is wrapped)
  -- __vector_size__(num)
  | consAttrib(
      appliedAttrib(
        attribName(name("__vector_size__")), 
        consExpr(realConstant(integerConstant(num, _, _)), nilExpr())),
      t) -> animateAttribOnType(t, vectorType(ty, toInt(num)))
  
  -- Attribs that should not be attatched
  -- refId(name)
  | consAttrib( appliedAttrib(attribName(name("refId")), _), t) -> animateAttribOnType(t, ty)
  
  -- TODO: There are probably more that should be discarded here, figure out the semantics of this
  
  -- Attatch all other attribs via attributedType
  | consAttrib(h, t) ->
    case animateAttribOnType(t, ty) of
    | attributedType(consAttribute(gccAttribute(l), attr), ty) ->
        attributedType(consAttribute(gccAttribute(l), attr), ty)
    | attributedType(attr, ty) ->
        attributedType(consAttribute(gccAttribute(consAttrib(h, nilAttrib())), attr), ty)
    | ty ->
        attributedType(consAttribute(gccAttribute(consAttrib(h, nilAttrib())), nilAttribute()), ty)
    end
  | nilAttrib() -> ty
  end;
}


function getRefIdFromAttributes
Maybe<String> ::= attrs::Attributes
{
  return
    case attrs of
      consAttribute(gccAttribute(l), t) ->
        orElse(getRefIdFromAttribs(l), getRefIdFromAttributes(t))
    | consAttribute(_, t) -> getRefIdFromAttributes(t)
    | nilAttribute() -> nothing()
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
Maybe<String> ::= attrs::Attributes
{
  return
    case attrs of
      consAttribute(gccAttribute(l), t) ->
        orElse(getModuleNameFromAttribs(l), getModuleNameFromAttributes(t))
    | consAttribute(_, t) -> getModuleNameFromAttributes(t)
    | nilAttribute() -> nothing()
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