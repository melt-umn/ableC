
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
  local substitutions::Substitutions = top.substitutions;
  substitutions.nameIn =
    case n, e of
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

