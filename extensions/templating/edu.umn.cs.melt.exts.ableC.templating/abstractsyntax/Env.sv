grammar edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

imports silver:util:raw:treemap as tm;

synthesized attribute templateParams::[Name];
synthesized attribute decl::Decl;
synthesized attribute isItemValue::Boolean;
synthesized attribute isItemForwardDecl::Boolean;

nonterminal TemplateItem with templateParams, decl, sourceLocation, isItemValue, isItemTypedef, isItemForwardDecl;

abstract production templateItem
top::TemplateItem ::= isItemTypedef::Boolean isItemForwardDecl::Boolean sourceLocation::Location params::[Name] decl::Decl
{
  top.templateParams = params;
  top.decl = decl;
  top.sourceLocation = sourceLocation;
  top.isItemValue = !isItemTypedef;
  top.isItemTypedef = isItemTypedef;
  top.isItemForwardDecl = isItemForwardDecl;
}

abstract production errorTemplateItem
top::TemplateItem ::= 
{
  top.templateParams = [];
  top.decl = decls(nilDecl());
  top.sourceLocation = builtin;
  top.isItemValue = false;
  top.isItemTypedef = false;
  top.isItemForwardDecl = false;
}

synthesized attribute templates::Scope<TemplateItem> occurs on Env;
synthesized attribute templateContribs::Contribs<TemplateItem> occurs on Defs, Def;

aspect production emptyEnv_i
top::Env ::=
{
  top.templates = [tm:empty(compareString)];
}
aspect production addEnv_i
top::Env ::= d::Defs  e::Decorated Env
{
  top.templates = augmentGlobalScope_i(gd.templateContribs, augmentScope_i(d.templateContribs, e.templates));
}
aspect production openScope_i
top::Env ::= e::Decorated Env
{
  top.templates = tm:empty(compareString) :: e.templates;
}
aspect production globalEnv_i
top::Env ::= e::Decorated Env
{
  top.templates = [last(e.templates)];
}

aspect production nilDefs
top::Defs ::=
{
  top.templateContribs = [];
}
aspect production consDefs
top::Defs ::= h::Def  t::Defs
{
  top.templateContribs = h.templateContribs ++ t.templateContribs;
}

aspect default production
top::Def ::=
{
  top.templateContribs = [];
}

abstract production templateDef
top::Def ::= s::String  t::TemplateItem
{
  top.templateContribs = [pair(s, t)];
}

function lookupTemplate
[TemplateItem] ::= n::String  e::Decorated Env
{
  return readScope_i(n, e.templates);
}

synthesized attribute templateItem::Decorated TemplateItem occurs on Name;
synthesized attribute templateLookupCheck::[Message] occurs on Name;
synthesized attribute templateRedeclarationCheck::[Message] occurs on Name;

aspect production name
top::Name ::= n::String
{
  local templates::[TemplateItem] = lookupTemplate(n, top.env);
  top.templateLookupCheck =
    case templates of
    | [] -> [err(top.location, "Undeclared templated name " ++ n)]
    | _ :: _ -> []
    end;
    
  top.templateRedeclarationCheck =
    case templates of
    | [] -> []
    | v :: _ ->
      if v.isItemForwardDecl
      then []
      else
        [err(top.location, 
          "Redeclaration of " ++ n ++ ". Original (from line " ++
          toString(v.sourceLocation.line) ++ ")")]
    end;
  
  local template::TemplateItem = if null(templates) then errorTemplateItem() else head(templates);
  top.templateItem = template;
}