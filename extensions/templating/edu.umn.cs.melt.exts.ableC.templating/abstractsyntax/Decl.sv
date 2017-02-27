grammar edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:overload;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;

global builtin::Location = builtinLoc("templating");

abstract production templateFunctionDecl
top::Decl ::= params::[Name] d::FunctionDecl
{
  -- TODO: Do we substitute the template parameters, or remove them from the substitutions? Right now
  -- we are doing neither
  propagate substituted;
  top.pp = concat([pp"template<", ppImplode(text(", "), map((.pp), params)), pp">", line(), d.pp]);
  top.errors := -- TODO: check for duplicate parameters
    if top.isTopLevel
    then []
    else [err(d.sourceLocation, "Template declarations must be global")];
  
  forwards to
    case d of
      functionDecl(_, _, _, _, n, _, _, _) -> 
        defsDecl([
          templateDef(
            n.name,
            templateItem(params, false, d.sourceLocation, functionDeclaration(d)))])
    | badFunctionDecl(msg) -> decls(nilDecl())
    end;
}

abstract production templateVariableDecl
top::Decl ::= params::[Name]  storage::[StorageClass]  attrs::[Attribute]  ty::BaseTypeExpr  dcl::Declarator
{
  -- TODO: Do we substitute the template parameters, or remove them from the substitutions? Right now
  -- we are doing neither
  propagate substituted;
  top.pp = concat([pp"template<", ppImplode(text(", "), map((.pp), params)), pp">", line(),
                   ppAttributes(attrs), ty.pp, space(), ppImplode(text(", "), dcl.pps), semi()]);
  top.errors := -- TODO: check for duplicate parameters
    if top.isTopLevel
    then []
    else [err(dcl.sourceLocation, "Template declarations must be global")];
  
  forwards to
    case dcl of
      declarator(n, _, _, _) -> 
        defsDecl([
          templateDef(
            n.name,
            templateItem(
              params, false,
              dcl.sourceLocation,
              typedefDecls(attrs, ty, consDeclarator(dcl, nilDeclarator()))))])
    | errorDeclarator(msg) -> decls(nilDecl())
    end;
}

abstract production templateTypedefDecl
top::Decl ::= params::[Name]  attrs::[Attribute]  ty::BaseTypeExpr  dcl::Declarator
{
  -- TODO: Do we substitute the template parameters, or remove them from the substitutions? Right now
  -- we are doing neither
  propagate substituted;
  top.pp = concat([pp"template<", ppImplode(text(", "), map((.pp), params)), pp">", line(),
                   pp"typedef ", ppAttributes(attrs), ty.pp, space(), ppImplode(text(", "), dcl.pps), semi()]);
  top.errors := -- TODO: check for duplicate parameters
    if top.isTopLevel
    then []
    else [err(dcl.sourceLocation, "Template declarations must be global")];
  
  forwards to
    case dcl of
      declarator(n, _, _, _) -> 
        defsDecl([
          templateDef(
            n.name,
            templateItem(
              params, true,
              dcl.sourceLocation,
              typedefDecls(attrs, ty, consDeclarator(dcl, nilDeclarator()))))])
    | errorDeclarator(msg) -> decls(nilDecl())
    end;
}

{-
aspect production variableDecls
top::Decl ::= storage::[StorageClass]  attrs::[Attribute]  ty::BaseTypeExpr  dcls::Declarators
{
  top.templateErrors =
    case dcls of
      nilDeclarator() -> []
    | consDeclarator(errorDeclarator(msg), nilDeclarator()) -> msg
    | consDeclarator(dcl, nilDeclarator()) -> []
    | consDeclarator(dcl, consDeclarator(dcl1, _)) ->
        [err(dcl1.sourceLocation, "Template declarations can define no more than one name")]
    end;
  
  top.templateDefs =
    ty.defs ++
    case dcls of
      nilDeclarator() -> []
    | consDeclarator(dcl, _) ->
      case dcl of
        declarator(n, _, _, _) ->
          [templateDef(n.name, templateItem(top.templateParamsIn, false, dcl.sourceLocation, top))]
      | errorDeclarator(_) -> []
      end
    end;
}

aspect production typedefDecls
top::Decl ::= attrs::[Attribute]  ty::BaseTypeExpr  dcls::Declarators
{
  top.templateErrors =
    case dcls of
      nilDeclarator() -> []
    | consDeclarator(errorDeclarator(msg), nilDeclarator()) -> msg
    | consDeclarator(dcl, nilDeclarator()) -> []
    | consDeclarator(dcl, consDeclarator(dcl1, _)) ->
        [err(dcl1.sourceLocation, "Template declarations can define no more than one name")]
    end;
  
  top.templateDefs =
    ty.defs ++
    case dcls of
      nilDeclarator() -> []
    | consDeclarator(dcl, _) ->
      case dcl of
        declarator(n, _, _, _) ->
          [templateDef(n.name, templateItem(top.templateParamsIn, true, dcl.sourceLocation, top))]
      | errorDeclarator(_) -> []
      end
    end;
}
-}