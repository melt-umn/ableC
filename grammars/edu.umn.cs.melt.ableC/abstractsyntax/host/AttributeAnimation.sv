grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

function animateAttributeOnType
Type ::= attr::Decorated Attributes  ty::Type
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
Type ::= attr::Decorated Attribs  ty::Type
{
  return case attr of
  -- Attribs that specify new types (i.e. not type-compatible with what is wrapped)
  -- __vector_size__(num)
  | consAttrib(
      appliedAttrib(
        attribName(name("__vector_size__")), 
        consExpr(realConstant(integerConstant(num, _, _)), nilExpr())),
      t) -> animateAttribOnType(t, vectorType(ty, toInteger(num)))
  
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

synthesized attribute maybeRefId::Maybe<String> occurs on Attributes, Attribute, Attribs, Attrib;
flowtype maybeRefId {} on Attributes, Attribute, Attribs, Attrib;

aspect production consAttribute
top::Attributes ::= h::Attribute t::Attributes
{
  top.maybeRefId = orElse(h.maybeRefId, t.maybeRefId);
}

aspect production nilAttribute
top::Attributes ::= 
{
  top.maybeRefId = nothing();
}

aspect production gccAttribute
top::Attribute ::= l::Attribs
{
  top.maybeRefId = l.maybeRefId;
}

aspect production simpleAsm
top::Attribute ::= s::String
{
  top.maybeRefId = nothing();
}

aspect production consAttrib
top::Attribs ::= h::Attrib t::Attribs
{
  top.maybeRefId = orElse(h.maybeRefId, t.maybeRefId);
}

aspect production nilAttrib
top::Attribs ::= 
{
  top.maybeRefId = nothing();
}

synthesized attribute isHostAttrib::Boolean occurs on Attrib;
flowtype isHostAttrib {} on Attrib;

aspect default production
top::Attrib ::=
{
  top.isHostAttrib = true;
  top.maybeRefId = nothing();
}

-- e.g. __attribute__(())
aspect production emptyAttrib
top::Attrib ::=
{
}
-- e.g. __attribute__((deprecated))
aspect production wordAttrib
top::Attrib ::= n::AttribName
{
}
-- e.g. __attribute__((deprecated("don't use this duh")))
aspect production appliedAttrib
top::Attrib ::= n::AttribName  e::Exprs
{
  top.isHostAttrib =
    case n of
      attribName(name("refId")) -> false
    | _ -> true
    end;
  top.maybeRefId =
    case n, e of
      attribName(name("refId")), consExpr(stringLiteral(s), nilExpr()) ->
        just(substring(1, length(s) - 1, s))
    | _, _ -> nothing()
    end;
  
  -- Needed since we are matching on Expr
  -- Not a big deal since these are pretty much just constants
  e.env = emptyEnv();
  e.returnType = nothing();
}
-- e.g. __attribute__((something(foo, "well whatever")))
-- OR __attribute__((something(foo)))
aspect production idAppliedAttrib
top::Attrib ::= n::AttribName  id::Name  e::Exprs
{
}
