grammar edu:umn:cs:melt:exts:ableC:closure:abstractsyntax;

abstract production closureTypeExpr 
b::BaseTypeExpr ::= param::TypeName res::TypeName
{
  local transName::Decorated Name =
    decorate name("_closure", location=builtIn()) with {env = b.env;};

  b.typerep =
    closureType(
      param.typerep,
      res.typerep,
      case transName.tagItem of
        enumTagItem(_) -> error("Expected _closure to be a struct")
      | refIdTagItem(_, refId) -> refId
      | _ -> "undefined _closure"
      end);
  
  forwards to typedefTypeExpr([], name("_closure", location=builtIn())) -- TODO: Fix this, env is somehow getting passed incorrectly
    {-case transName.tagItem of
      refIdTagItem(_, _) -> typedefTypeExpr([], name("_closure", location=builtIn()))
    | _ -> directTypeExpr(errorType())
    end-};
}

-- Passing the refId is kind of a hack, because it is always the same.  However, the env isn't available to look it up
abstract production closureType
t::Type ::= param::Type res::Type refId::String
{
  t.lpp = text("_closure");
  t.rpp = notext();
  
  forwards to
    if refId == "undefined _closure" then errorType()
    else
      noncanonicalType(
        typedefType(
          [],
          "_closure",
          tagType(
            [],
            refIdTagType(
              structSEU(),
              "_closure",
              refId))));
}