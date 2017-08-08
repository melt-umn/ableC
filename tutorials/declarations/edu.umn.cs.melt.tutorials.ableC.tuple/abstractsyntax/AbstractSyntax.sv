grammar edu:umn:cs:melt:tutorials:ableC:tuple:abstractsyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;

imports silver:langutil;
imports silver:langutil:pp;

global builtin::Location = builtinLoc("tuple");

abstract production tupleDecl
top::Decl ::= n::Name tns::TypeNames
{
  top.pp = pp"tuple ${n.pp} (${ppImplode(pp", ", tns.pps)})";

  tns.index = 0;

  forwards to
    typedefDecls(
      nilAttribute(),
      structTypeExpr(
        nilQualifier(),
        structDecl(
          nilAttribute(),
          nothingName(),
          tns.tupleStructItems,
          location=builtin)),
      consDeclarator(
        declarator(n, baseTypeExpr(), nilAttribute(), nothingInitializer()),
        nilDeclarator()));
}

synthesized attribute tupleStructItems :: StructItemList occurs on TypeNames;
inherited attribute index :: Integer occurs on TypeNames;

aspect production consTypeName
top::TypeNames ::= h::TypeName t::TypeNames
{
  local fieldName::String = "f" ++ toString(top.index);
  top.tupleStructItems =
    consStructItem(
      structItem(
        nilAttribute(),
        h.bty,
        consStructDeclarator(
          structField(name(fieldName, location=builtin), h.mty, nilAttribute()),
          nilStructDeclarator())),
      t.tupleStructItems);
  t.index = top.index + 1;
}

aspect production nilTypeName
top::TypeNames ::=
{
  top.tupleStructItems = nilStructItem();
}