grammar edu:umn:cs:melt:exts:ableC:templating:concretesyntax:instantiationExpr;

imports silver:langutil only ast;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:concretesyntax;

imports edu:umn:cs:melt:exts:ableC:templating:abstractsyntax;

-- Spurious import, to trigger the tests on build.
import edu:umn:cs:melt:exts:ableC:templating:mda_test;

marking terminal TemplateIdentifier_t /[A-Za-z_\$][A-Za-z_0-9\$]*</ lexer classes {Cidentifier};

function fromTemplateId
Name ::= n::TemplateIdentifier_t
{
  return name(substring(0, length(n.lexeme) - 1, n.lexeme), location=n.location);
}

concrete production templateDeclRefExpr_c
top::PrimaryExpr_c ::= id::TemplateIdentifier_t params::TypeNames_c '>'
{
  top.ast = templateDeclRefExpr(fromTemplateId(id), params.ast, location=top.location);
}