grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

nonterminal LabelItem with sourceLocation;

abstract production labelItem
top::LabelItem ::= sourceLocation::Location
{
  top.sourceLocation = sourceLocation;
}

abstract production errorLabelItem
top::LabelItem ::=
{
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1);
}

