grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

nonterminal LabelItem;

-- TODO: Should consider whether we want to change the Stmt abstract syntax
-- to have a LabelStmt, so we can be more specific here

abstract production labelItem
top::LabelItem ::= s::Decorated Stmt
{
}

abstract production errorLabelItem
top::LabelItem ::=
{
}

