grammar edu:umn:cs:melt:exts:ableC:templating:concretesyntax;

imports edu:umn:cs:melt:ableC:concretesyntax;
imports edu:umn:cs:melt:ableC:concretesyntax:lexerHack as lh;

exports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:templateDecl;
exports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:usingDecl;
exports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:instantiationTypeExpr;
exports edu:umn:cs:melt:exts:ableC:templating:concretesyntax:instantiationExpr;

disambiguate TemplateIdentifier_t, TemplateTypeName_t
{
  pluck
    case lookupBy(stringEq, substring(0, length(lexeme) - 1, lexeme), head(context)) of
    | just(lh:typenameType_c()) -> TemplateTypeName_t
    | _ -> TemplateIdentifier_t
    end;
}