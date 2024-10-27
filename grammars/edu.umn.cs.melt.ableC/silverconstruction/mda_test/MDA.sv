grammar edu:umn:cs:melt:ableC:silverconstruction:mda_test;

imports silver:compiler:composed:Default;
imports edu:umn:cs:melt:ableC:host;

copper_mda testQuote(svParse) {
  edu:umn:cs:melt:ableC:silverconstruction:concretesyntax:quotation;
  edu:umn:cs:melt:ableC:concretesyntax;
  edu:umn:cs:melt:ableC:concretesyntax:construction;
}

copper_mda testAntiquote(ablecParser) {
  edu:umn:cs:melt:ableC:silverconstruction:concretesyntax:antiquotation;
  silver:compiler:host:core;
  silver:compiler:extension:patternmatching;
  silver:compiler:modification:list;
  silver:compiler:modification:let_fix;
}
