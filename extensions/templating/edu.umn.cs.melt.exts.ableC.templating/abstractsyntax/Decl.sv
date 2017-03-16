grammar edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:overload;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;

global builtin::Location = builtinLoc("templating");

abstract production templateTypeDecl
top::Decl ::= params::[Name] n::Name ty::TypeName
{
  -- TODO: Do we substitute the template parameters, or remove them from the substitutions? Right now
  -- we are doing neither
  propagate substituted;
  top.pp = pp"using ${n.pp}<${ppImplode(text(", "), map((.pp), params))}> = ${ty.pp};";
  
  local localErrors::[Message] =
    if !top.isTopLevel
    then [err(n.location, "Template declarations must be global")]
    else n.templateRedeclarationCheck ++ duplicateParameterCheck(params, []);
  
  local fwrd::Decl =
    defsDecl([
      templateDef(
        n.name,
        templateItem(
          params, true, n.location,
          typedefDecls(
            [],
            ty.bty,
            consDeclarator(
              declarator(n, ty.mty, [], nothingInitializer()),
              nilDeclarator()))))]);
  
  forwards to
    if !null(localErrors)
    then decls(consDecl(warnDecl(localErrors), consDecl(fwrd, nilDecl())))
    else fwrd;
}

abstract production templateStructDecl
top::Decl ::= params::[Name] attrs::[Attribute] n::Name dcls::StructItemList
{
  -- TODO: Do we substitute the template parameters, or remove them from the substitutions? Right now
  -- we are doing neither
  propagate substituted;
  top.pp = concat([pp"template<", ppImplode(text(", "), map((.pp), params)), pp">", line(),
                   pp"struct ", ppAttributes(attrs), text(n.name), space(),
                   braces(nestlines(2, terminate(cat(semi(),line()), dcls.pps))), semi()]);
  
  local localErrors::[Message] =
    if !top.isTopLevel
    then [err(n.location, "Template declarations must be global")]
    else n.templateRedeclarationCheck ++ duplicateParameterCheck(params, []);
  
  local fwrd::Decl =
    defsDecl([
      templateDef(
        n.name,
        templateItem(
          params, true, n.location,
          typedefDecls(
            [],
            structTypeExpr(
              [],
              structDecl(
                gccAttribute(
                  consAttrib(
                    appliedAttrib(
                      attribName(name("refId", location=builtin)),
                      consExpr(
                        stringLiteral(s"\"edu:umn:cs:melt:exts:ableC:templating:${n.name}\"", location=builtin),
                        nilExpr())),
                    nilAttrib())) :: attrs,
                justName(n),
                dcls,
                location=n.location)),
            consDeclarator(
              declarator(n, baseTypeExpr(), [], nothingInitializer()),
              nilDeclarator()))))]);
  
  forwards to
    if !null(localErrors)
    then decls(consDecl(warnDecl(localErrors), consDecl(fwrd, nilDecl())))
    else fwrd;
}

abstract production templateFunctionDecl
top::Decl ::= params::[Name] d::FunctionDecl
{
  -- TODO: Do we substitute the template parameters, or remove them from the substitutions? Right now
  -- we are doing neither
  propagate substituted;
  top.pp = concat([pp"template<", ppImplode(text(", "), map((.pp), params)), pp">", line(), d.pp]);
  
  local localErrors::[Message] =
    case d of
      functionDecl(_, _, _, _, n, _, _, _) -> 
        if !top.isTopLevel
        then [err(n.location, "Template declarations must be global")]
        else n.templateRedeclarationCheck ++ duplicateParameterCheck(params, [])
      | badFunctionDecl(msg) -> msg
      end;
      
  local fwrd::Decl =
    case d of
      functionDecl(_, _, _, _, n, _, _, _) -> 
        defsDecl([
          templateDef(
            n.name,
            templateItem(params, false, d.sourceLocation, functionDeclaration(d)))])
    | badFunctionDecl(msg) -> decls(nilDecl())
    end;
  
  forwards to
    if !null(localErrors)
    then decls(consDecl(warnDecl(localErrors), consDecl(fwrd, nilDecl())))
    else fwrd;
}

function duplicateParameterCheck
[Message] ::= params::[Name] seenNames::[String]
{
  return
    case params of
      [] -> []
    | h :: t ->
      if containsBy(stringEq, h.name, seenNames)
      then
        err(h.location, "Duplicate template parameter " ++ h.name) ::
          duplicateParameterCheck(t, seenNames)
      else duplicateParameterCheck(t, h.name :: seenNames)
    end;
}