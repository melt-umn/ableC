grammar edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

-- Type of an instantiated template typedef
abstract production templatedType
top::Type ::= q::[Qualifier] n::String args::[Type] resolved::Type
{
  top.lpp = pp"${terminate(space(), map((.pp), q))}${text(n)}<${ppImplode(pp", ", map(\t::Type -> cat(t.lpp, t.rpp), args))}>";
  top.rpp = notext();
  
  forwards to resolved;
}

function mkTemplatedType
Type ::= q::[Qualifier] n::String args::[Type] env::Decorated Env
{
  local result::BaseTypeExpr =
    templateTypedefTypeExpr(
      q,
      name(n, location=builtin),
      foldr(consTypeName, nilTypeName(), map(\ t::Type -> typeName(directTypeExpr(t), baseTypeExpr()), args)));
  result.env = env;
  result.returnType = nothing();
  result.givenRefId = nothing();
  
  return result.typerep;
}