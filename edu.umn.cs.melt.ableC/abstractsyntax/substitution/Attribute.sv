
aspect production consAttribute
top::Attributes ::= h::Attribute t::Attributes
{
  propagate substituted;
}

aspect production nilAttribute
top::Attributes ::= 
{
  propagate substituted;
}

aspect production gccAttribute
top::Attribute ::= l::Attribs
{
  propagate substituted;
}

aspect production simpleAsm
top::Attribute ::= s::String
{
  propagate substituted;
}


aspect production consAttrib
top::Attribs ::= h::Attrib t::Attribs
{
  propagate substituted;
}

aspect production nilAttrib
top::Attribs ::= 
{
  propagate substituted;
}


aspect production emptyAttrib
top::Attrib ::=
{
  propagate substituted;
}
aspect production wordAttrib
top::Attrib ::= n::AttribName
{
  propagate substituted;
}
aspect production appliedAttrib
top::Attrib ::= n::AttribName  e::Exprs
{
  -- Since we pattern match on e, we need to supply its forward dependancies
  -- We don't really care about these, since all we want to know is whether e is a stringLiteral.
  local e1 :: Exprs = e;
  e1.env = emptyEnv();
  e1.labelEnv = [];
  e1.returnType = nothing();
  
  local substitutions::Substitutions = top.substitutions;
  substitutions.nameIn =
    case n, e1 of
      attribName(n), consExpr(stringLiteral(s), nilExpr()) ->
        if n.name == "refId" then substring(1, length(s) - 1, s) else ""
    | _, _ -> ""
    end;
  top.substituted =
    case substitutions.refIdSub of
      just(sub) ->
        appliedAttrib(
          n,
          consExpr(stringLiteral(s"\"${sub}\"", location=builtinLoc("substituted")), nilExpr()))
    | nothing() -> appliedAttrib(n.substituted, e.substituted)
    end;
}
aspect production idAppliedAttrib
top::Attrib ::= n::AttribName  id::Name  e::Exprs
{
  propagate substituted;
}



aspect production attribName
top::AttribName ::= n::Name
{
  propagate substituted;
}

