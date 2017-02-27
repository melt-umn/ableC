grammar edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

abstract production templateDeclRefExpr
top::Expr ::= n::Name ts::TypeNames
{
  -- Don't substitute n
  top.substituted = templateDeclRefExpr(n, ts.substituted, location=top.location);
  
  local templateItem::Decorated TemplateItem = n.templateItem;

  local localErrors::[Message] =
    n.templateLookupCheck ++ ts.errors ++
    (if ts.count != length(templateItem.templateParams)
     then [err(
       top.location,
       s"Wrong number of template parameters for ${n.name}, " ++
       s"expected ${toString(length(templateItem.templateParams))} but got ${toString(ts.count)}")]
     else []) ++
    (if templateItem.isItemTypedef
     then [err(top.location, s"${n.name} is a type, not an expression")]
     else []);
    
  local mangledName::String = s"_template_${n.name}_${implode("_", map((.mangledName), ts.typereps))}";
    
  local globalDecls::[Pair<String Decl>] =
    [pair(
       mangledName,
       subDecl(
         nameSubstitution(n.name, name(mangledName, location=builtin)) ::
           zipWith(typedefSubstitution, map((.name), templateItem.templateParams), ts.typereps),
         templateItem.decl))];

  forwards to
    mkErrorCheck(
      localErrors,
      injectGlobalDecls(
        globalDecls,
        declRefExpr(
          name(mangledName, location=builtin),
          location=builtin),
        location=top.location));
}

