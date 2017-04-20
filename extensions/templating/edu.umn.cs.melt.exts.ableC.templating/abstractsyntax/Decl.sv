grammar edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode, concat as ppConcat;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:overload;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;

global builtin::Location = builtinLoc("templating");

abstract production templateTypeDecl
top::Decl ::= params::[Name] n::Name ty::TypeName
{
  top.pp = pp"using ${n.pp}<${ppImplode(text(", "), map((.pp), params))}> = ${ty.pp};";
  top.substituted =
    templateTypeDecl(
      map(\ n::Name -> decorate n with {substitutions = top.substitutions;}.substituted, params),
      n.substituted,
      ty.substituted);
  
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
  top.pp =
    ppConcat([pp"template<", ppImplode(text(", "), map((.pp), params)), pp">", line(),
              pp"struct ", ppAttributes(attrs), text(n.name), space(),
              braces(nestlines(2, terminate(cat(semi(),line()), dcls.pps))), semi()]);
  top.substituted =
    templateStructDecl(
      map(\ n::Name -> decorate n with {substitutions = top.substitutions;}.substituted, params),
      map(\ a::Attribute -> decorate a with {substitutions = top.substitutions;}.substituted, attrs),
      n.substituted,
      dcls.substituted);
  
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
          decls(
            foldDecl([
              -- typedef struct __name__ __name__;
              typedefDecls(
                [],
                tagReferenceTypeExpr([], structSEU(), n),
                consDeclarator(
                  declarator(n, baseTypeExpr(), [], nothingInitializer()),
                  nilDeclarator())),
              -- struct __name__ { ... };
              typeExprDecl(
                [],
                structTypeExpr(
                  [],
                  structDecl(attrs, justName(n), dcls, location=n.location)))]))))]);
  
  forwards to
    if !null(localErrors)
    then decls(consDecl(warnDecl(localErrors), consDecl(fwrd, nilDecl())))
    else fwrd;
}

abstract production templateFunctionDecl
top::Decl ::= params::[Name] d::FunctionDecl
{
  top.pp =
    ppConcat([pp"template<", ppImplode(text(", "), map((.pp), params)), pp">", line(), d.pp]);
  top.substituted =
    templateFunctionDecl(
      map(\ n::Name -> decorate n with {substitutions = top.substitutions;}.substituted, params),
      d.substituted);
  
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
      functionDecl(storage, fnquals, bty, mty, n, attrs, ds, body) -> 
        defsDecl([
          templateDef(
            n.name,
            templateItem(
              params,
              false,
              d.sourceLocation,
              functionDeclaration(
                functionDecl(
                  if !containsBy(storageClassEq, staticStorageClass(), storage)
                  then staticStorageClass() :: storage
                  else storage,
                  fnquals, bty, mty, n, attrs, ds, body))))])
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

function storageClassEq
Boolean ::= s1::StorageClass s2::StorageClass
{
  return
    case s1, s2 of
      externStorageClass(), externStorageClass() -> true
    | staticStorageClass(), staticStorageClass() -> true
    | autoStorageClass(), autoStorageClass() -> true
    | registerStorageClass(), registerStorageClass() -> true
    | threadLocalStorageClass(), threadLocalStorageClass() -> true
    | _, _ -> false
    end;
}