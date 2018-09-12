grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

nonterminal LabelItem with sourceLocation;

-- Note that we unfortunately can't include a reference to the labeled statement here, since these
-- are function-scope defs, which need to be computed without the use of env to avoid a circular
-- dependancy.
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

