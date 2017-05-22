grammar edu:umn:cs:melt:exts:ableC:templating:concretesyntax;

imports silver:langutil;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:concretesyntax:lexerHack as lh;

imports edu:umn:cs:melt:ableC:abstractsyntax as ast;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as ast;

exports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:templateStructForwardDecl;
exports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:templateStructDecl;
exports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:templateFunctionDecl;
exports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:usingDecl;
exports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:instantiationTypeExpr;
exports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:instantiationExpr;

-- Doesn't really belong in any spesific subgrammar, only conflicts when composing
-- instantiationExpr and instantiationTypeExpr
disambiguate TemplateIdentifier_t, TemplateTypeName_t
{
  pluck
    case lookupBy(stringEq, substring(0, length(lexeme) - 1, lexeme), head(context)) of
    | just(lh:typenameType_c()) -> TemplateTypeName_t
    | _ -> TemplateIdentifier_t
    end;
}