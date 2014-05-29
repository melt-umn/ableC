
-- TODO: need 'Attributes' 'Attribs' nonterminals so this sucks less.


-- Currently, this does nothing except spot vector __vector_size__(8) annotations
function animateAttributeOnType
Type ::= attr::[Attribute]  ty::Type  env::Decorated Env
{
  return if null(attr) then ty
  else case decorate head(attr) with {env = env;} of
  | gccAttribute(l) -> animateAttributeOnType(tail(attr), animateAttribOnType(l, ty, env), env)
  | _ -> animateAttributeOnType(tail(attr), ty, env)
  end;
}


function animateAttribOnType
Type ::= attr::[Attrib]  ty::Type  env::Decorated Env
{
  return if null(attr) then ty
  else case decorate head(attr) with {env = env;} of
  -- __vector_size__(num)
  | appliedAttrib(attribName(name("__vector_size__")), 
      consExpr(realConstant(integerConstant(num, _, _)), nilExpr())) ->
        vectorType(ty, toInt(num))
  | _ -> animateAttribOnType(tail(attr), ty, env)
  end;
}

