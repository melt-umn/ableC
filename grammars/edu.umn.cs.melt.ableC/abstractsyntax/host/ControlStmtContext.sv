grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

annotation returnType :: Maybe<Type>;
annotation breakValid :: Boolean;
annotation continueValid :: Boolean;
annotation labels :: tm:Map<String LabelItem>;

data ControlStmtContext = controlStmtContext
  with returnType, breakValid, continueValid, labels;

inherited attribute controlStmtContext :: ControlStmtContext;

global initialControlStmtContext :: ControlStmtContext = controlStmtContext(
  returnType=nothing(),
  breakValid=false,
  continueValid=false,
  labels=tm:empty()
);

fun controlEnterLoop ControlStmtContext ::= cur::ControlStmtContext = cur(
  breakValid=true,
  continueValid=true
);

fun controlEnterSwitch ControlStmtContext ::= cur::ControlStmtContext = cur(
  breakValid=true
);

fun controlAddLabels ControlStmtContext ::= cur::ControlStmtContext labs::[(String, LabelItem)] = cur(
  labels=tm:add(labs, cur.labels)
);

tracked data nonterminal LabelItem;
monoid attribute labelDefs :: [(String, LabelItem)];

-- Note that we unfortunately can't include a reference to the labeled statement here, since these
-- are function-scope defs, which need to be computed without the use of env to avoid a circular
-- dependancy.
abstract production labelItem
top::LabelItem ::=
{
}

abstract production errorLabelItem
top::LabelItem ::=
{
}

fun lookupLabel [LabelItem] ::= n::String ctx::ControlStmtContext = tm:lookup(n, ctx.labels);
