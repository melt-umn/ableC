grammar edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

abstract production templateDeclRefExpr
top::Expr ::= n::Name ts::TypeNames
{
  top.pp = pp"${n.pp}<${ppImplode(pp", ", ts.pps)}>";
  -- Don't substitute n
  top.substituted = templateDeclRefExpr(n, ts.substituted, location=top.location);
  
  local templateItem::Decorated TemplateItem = n.templateItem;

  local localErrors::[Message] =
    ts.errors ++
    if !null(n.templateLookupCheck)
    then n.templateLookupCheck
    else if !templateItem.isItemValue
    then [err(n.location, s"${n.name} is not a value")]
    else if ts.count != length(templateItem.templateParams)
    then [err(
            top.location,
            s"Wrong number of template parameters for ${n.name}, " ++
            s"expected ${toString(length(templateItem.templateParams))} but got ${toString(ts.count)}")]
    else if !null(fwrd.errors)
    then wrn(n.templateItem.sourceLocation, s"In instantiation of ${n.name} at ${top.location.unparse}") :: fwrd.errors
    else [];
    
  local mangledName::String = templateMangledName(n.name, ts.typereps);
    
  local globalDecls::[Pair<String Decl>] =
    [pair(
       mangledName,
       subDecl(
         nameSubstitution(n.name, name(mangledName, location=builtin)) ::
           zipWith(typedefSubstitution, map((.name), templateItem.templateParams), ts.typereps),
         templateItem.decl))];
         
  local fwrd::Expr =
    injectGlobalDeclsExpr(
      globalDecls,
      declRefExpr(
        name(mangledName, location=builtin),
        location=builtin),
      location=top.location);
  fwrd.env = top.env;
  fwrd.returnType = top.returnType;

  forwards to mkErrorCheck(localErrors, fwrd);
}

abstract production templateTypedefTypeExpr
top::BaseTypeExpr ::= q::[Qualifier]  n::Name ts::TypeNames
{
  top.pp = pp"${terminate(space(), map((.pp), q))}${n.pp}<${ppImplode(pp", ", ts.pps)}>";
  -- Don't substitute n
  top.substituted = templateTypedefTypeExpr(q, n, ts.substituted);
  
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
    else if !null(result.errors)
    then wrn(n.templateItem.sourceLocation, s"In instantiation of ${n.name} at ${n.location.unparse}") :: result.errors
    else [];
  
  local mangledName::String = templateMangledName(n.name, ts.typereps);
    
  local globalDecls::[Pair<String Decl>] =
    [pair(
       mangledName,
       subDecl(
         refIdSubstitution(
           s"edu:umn:cs:melt:exts:ableC:templating:${n.name}",
           s"edu:umn:cs:melt:exts:ableC:templating:${mangledName}") ::
         nameSubstitution(n.name, name(mangledName, location=builtin)) ::
           zipWith(typedefSubstitution, map((.name), templateItem.templateParams), ts.typereps),
         templateItem.decl))];
  
  -- To avoid needing an explicit equation for typerep, decorate what would otherwise be the
  -- forward, and wrap that up in a directTypeExpr
  local result::BaseTypeExpr =
    injectGlobalDeclsTypeExpr(
      globalDecls,
      typedefTypeExpr(q, name(mangledName, location=builtin)));
  result.env = top.env;
  result.returnType = top.returnType;

  forwards to
    if !null(localErrors)
    then errorTypeExpr(localErrors)
    else directTypeExpr(noncanonicalType(templatedType(q, n.name, ts.typereps, result.typerep)));
}

-- Type of an instantiated template
abstract production templatedType
top::NoncanonicalType ::= q::[Qualifier]  n::String  args::[Type]  resolved::Type
{
  top.lpp = pp"${terminate(space(), map((.pp), q))}${text(n)}<${ppImplode(pp", ", map(\t::Type -> cat(t.lpp, t.rpp), args))}>";
  top.rpp = notext();
  
  forwards to resolvedType(resolved);
}

function templateMangledName
String ::= n::String params::[Type]
{
  return s"_template_${n}_${implode("_", map((.mangledName), params))}";
}