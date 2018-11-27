grammar edu:umn:cs:melt:tutorials:ableC:tuple:abstractsyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax:host;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:substitution;

imports silver:langutil;
imports silver:langutil:pp;

global builtin::Location = builtinLoc("tuple");

abstract production tupleDecl
top::Decl ::= n::Name tns::TypeNames
{
  propagate substituted;
  top.pp = pp"tuple ${n.pp} (${ppImplode(pp", ", tns.pps)})";

  tns.index = 0;

  forwards to
    decls(
      foldDecl(
        -- declarations implicit in tns, such as forward-declaring structs
        tns.decls ++
        -- typedef struct ${n} ${n};
        [typedefDecls(
           nilAttribute(),
           tagReferenceTypeExpr(nilQualifier(), structSEU(), n),
           consDeclarator(
             declarator(n, baseTypeExpr(), nilAttribute(), nothingInitializer()),
             nilDeclarator())),
         -- Defer the struct definition until all members have been defined
         -- Construct a chain of deferredDecl productions for each member refId
         foldr(
           deferredDecl,
           -- struct ${n} { ${tns.tupleStructItems} };
           typeExprDecl(
             nilAttribute(),
             structTypeExpr(
               nilQualifier(),
               structDecl(
                 nilAttribute(),
                 justName(n),
                 tns.tupleStructItems,
                 location=builtin))),
           -- Compute the list of all member refIds
           catMaybes(map((.maybeRefId), tns.typereps)))]));
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