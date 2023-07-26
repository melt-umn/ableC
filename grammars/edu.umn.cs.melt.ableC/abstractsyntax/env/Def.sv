grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

abstract production tagDef
top::Def ::= s::String  l::TagItem
{
  top.tagContribs = [(s, l)];
}

abstract production valueDef
top::Def ::= s::String  l::ValueItem
{
  top.valueContribs = [(s, l)];
}

abstract production refIdDef
top::Def ::= s::String  l::RefIdItem
{
  top.refIdContribs = [(s, l)];
}

abstract production deferredDeclDef
top::Def ::= s::String  d::Decl
{
  top.deferredDeclContribs = [(s, d)];
}


abstract production miscDef
top::Def ::= s::String  l::MiscItem
{
  top.miscContribs = [(s, l)];
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
