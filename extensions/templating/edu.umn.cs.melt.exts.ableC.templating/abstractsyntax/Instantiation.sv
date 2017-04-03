grammar edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

abstract production templateDeclRefExpr
top::Expr ::= n::Name ts::TypeNames
{
  top.pp = pp"${n.pp}<${ppImplode(pp", ", ts.pps)}>";
  top.substituted = templateDeclRefExpr(n, ts.substituted, location=top.location); -- Don't substitute n
  
  ts.env = globalEnv(top.env);

  forwards to
    injectGlobalDeclsExpr(
      consDecl(templateExprInstDecl(n, ts), nilDecl()),
      declRefExpr(name(templateMangledName(n.name, ts.typereps), location=builtin), location=builtin),
      location=top.location);
}

abstract production templateTypedefTypeExpr
top::BaseTypeExpr ::= q::[Qualifier] n::Name ts::TypeNames
{
  top.pp = pp"${terminate(space(), map((.pp), q))}${n.pp}<${ppImplode(pp", ", ts.pps)}>";
  top.substituted = templateTypedefTypeExpr(q, n, ts.substituted); -- Don't substitute n
  
  -- We could decorate fwrd and forward to directTypeExpr(templatedType(..., fwrd.typerep)), but
  -- that would be less efficient since we would decorate fwrd twice, and would be effectively the
  -- same since directTypeExpr overrides typerep when forwarding.
  -- templatedType forwards to resolved (forward.typerep here), so no interference
  top.typerep = templatedType(q, n.name, ts.typereps, forward.typerep);
  
  ts.env = globalEnv(top.env);

  forwards to
    injectGlobalDeclsTypeExpr(
      consDecl(templateTypeExprInstDecl(q, n, ts), nilDecl()),
      typedefTypeExpr(q, name(templateMangledName(n.name, ts.typereps), location=builtin)));
}

abstract production templateExprInstDecl
top::Decl ::= n::Name ts::TypeNames
{
  top.pp = pp"${n.pp}<${ppImplode(pp", ", ts.pps)}>;";
  top.substituted = templateExprInstDecl(n, ts.substituted); -- Don't substitute n
  
  local templateItem::Decorated TemplateItem = n.templateItem;

  local localErrors::[Message] =
    ts.errors ++
    if !null(n.templateLookupCheck)
    then n.templateLookupCheck
    else if !templateItem.isItemValue
    then [err(n.location, s"${n.name} is not a value")]
    else if ts.count != length(templateItem.templateParams)
    then [err(
            n.location,
            s"Wrong number of template parameters for ${n.name}, " ++
            s"expected ${toString(length(templateItem.templateParams))} but got ${toString(ts.count)}")]
    else if !null(fwrd.errors)
    then
      [nested(
         n.location,
         s"In instantiation ${n.name}<${show(80, ppImplode(pp", ", ts.pps))}>",
         fwrd.errors)]
    else [];
  
  local mangledName::String = templateMangledName(n.name, ts.typereps);
  
  local fwrd::Decl =
    subDecl(
      nameSubstitution(n.name, name(mangledName, location=builtin)) ::
        zipWith(typedefSubstitution, map((.name), templateItem.templateParams), unfoldBaseTypeExpr(ts)),
      templateItem.decl);
  fwrd.isTopLevel = true;
  fwrd.env = top.env;
  fwrd.returnType = nothing();

  forwards to
    if !null(lookupValue(mangledName, top.env))
    then decls(nilDecl())
    else if !null(localErrors)
    then decls(consDecl(warnDecl(localErrors), consDecl(fwrd, nilDecl())))
    else fwrd;
}

abstract production templateTypeExprInstDecl
top::Decl ::= q::[Qualifier] n::Name ts::TypeNames
{
  top.pp = pp"${terminate(space(), map((.pp), q))}${n.pp}<${ppImplode(pp", ", ts.pps)}>;";
  top.substituted = templateTypeExprInstDecl(q, n, ts.substituted); -- Don't substitute n
  
  local templateItem::Decorated TemplateItem = n.templateItem;

  local localErrors::[Message] =
    ts.errors ++
    if !null(n.templateLookupCheck)
    then n.templateLookupCheck
    else if !templateItem.isItemTypedef
    then [err(n.location, s"${n.name} is not a type")]
    else if ts.count != length(templateItem.templateParams)
    then [err(
            n.location,
            s"Wrong number of template parameters for ${n.name}, " ++
            s"expected ${toString(length(templateItem.templateParams))} but got ${toString(ts.count)}")]
    else if !null(fwrd.errors)
    then
      [nested(
         n.location,
         s"In instantiation ${n.name}<${show(80, ppImplode(pp", ", ts.pps))}>",
         fwrd.errors)]
    else [];
  
  local mangledName::String = templateMangledName(n.name, ts.typereps);
  local mangledRefId::String = templateMangledRefId(n.name, ts.typereps);
  
  local fwrd::Decls =
    foldDecl([
      -- This is effectively the same as writting `struct __name__;`, but with a given refId 
      defsDecl([tagDef(mangledName, refIdTagItem(structSEU(), mangledRefId))]),
      subDecl(
        nameSubstitution(n.name, name(mangledName, location=builtin)) ::
          zipWith(typedefSubstitution, map((.name), templateItem.templateParams), unfoldBaseTypeExpr(ts)),
        templateItem.decl)]);
  fwrd.isTopLevel = true;
  fwrd.env = top.env;
  fwrd.returnType = nothing();

  forwards to
    if !null(lookupValue(mangledName, top.env))
    then decls(nilDecl())
    else if !null(localErrors)
    then decls(consDecl(warnDecl(localErrors), fwrd))
    else decls(fwrd);
}

function templateMangledName
String ::= n::String params::[Type]
{
  return s"_template_${n}_${implode("_", map((.mangledName), params))}";
}

function templateMangledRefId
String ::= n::String params::[Type]
{
  return s"edu:umn:cs:melt:exts:ableC:templating:${templateMangledName(n, params)}";
}

function unfoldBaseTypeExpr
[BaseTypeExpr] ::= ts::TypeNames
{
  return
    case ts of
      nilTypeName() -> []
    | consTypeName(h, t) -> typeModifierTypeExpr(h.bty, h.mty) :: unfoldBaseTypeExpr(t)
    end;
}