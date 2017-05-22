grammar edu:umn:cs:melt:exts:ableC:templating:concretesyntax:instantiationTypeExpr;

imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:concretesyntax;

imports edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:templating:mda_test;

marking terminal TemplateTypeName_t /[A-Za-z_\$][A-Za-z_0-9\$]*</ lexer classes {Cidentifier};

function fromTemplateTypeName
Name ::= n::TemplateTypeName_t
{
  return name(substring(0, length(n.lexeme) - 1, n.lexeme), location=n.location);
}

concrete production templateTypedef_c
top::TypeSpecifier_c ::= id::TemplateTypeName_t params::TypeNames_c '>'
{
  top.realTypeSpecifiers = [templateTypedefTypeExpr(top.givenQualifiers, fromTemplateTypeName(id), params.ast)];
  top.preTypeSpecifiers = []; 
}