grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

abstract production labelDef
top::Def ::= s::String  l::LabelItem
{
  top.labelContribs = [pair(s, l)];
}

abstract production tagDef
top::Def ::= s::String  l::TagItem
{
  top.tagContribs = [pair(s, l)];
}

abstract production valueDef
top::Def ::= s::String  l::ValueItem
{
  top.valueContribs = [pair(s, l)];
}

abstract production refIdDef
top::Def ::= s::String  l::RefIdItem
{
  top.refIdContribs = [pair(s, l)];
}

abstract production deferredDeclDef
top::Def ::= s::String  d::Decl
{
  top.deferredDeclContribs = [pair(s, d)];
}


abstract production miscDef
top::Def ::= s::String  l::MiscItem
{
  top.miscContribs = [pair(s, l)];
}

abstract production globalDefsDef
top::Def ::= d::[Def]
{
  top.globalDefs = d ++ foldr(consDefs, nilDefs(), d).globalDefs;
}

abstract production functionDefsDef
top::Def ::= d::[Def]
{
  top.functionScopeDefs = d ++ foldr(consDefs, nilDefs(), d).functionScopeDefs;
}
