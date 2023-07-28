grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

synthesized attribute returnType :: Maybe<Type>;
synthesized attribute breakValid :: Boolean;
synthesized attribute continueValid :: Boolean;
synthesized attribute labels :: tm:Map<String LabelItem>;

nonterminal ControlStmtContext with returnType, breakValid, continueValid, labels;

inherited attribute controlStmtContext :: ControlStmtContext;

abstract production controlStmtContext
top::ControlStmtContext ::= returnType::Maybe<Type> breakValid::Boolean
                    continueValid::Boolean labels::tm:Map<String LabelItem>
{
  top.returnType = returnType;
  top.breakValid = breakValid;
  top.continueValid = continueValid;
  top.labels = labels;
}

global initialControlStmtContext :: ControlStmtContext
  = controlStmtContext(nothing(), false, false, tm:empty());

function controlEnterLoop
ControlStmtContext ::= cur::ControlStmtContext
{
  return controlStmtContext(cur.returnType, true, true, cur.labels);
}

function controlEnterSwitch
ControlStmtContext ::= cur::ControlStmtContext
{
  return controlStmtContext(cur.returnType, true, cur.continueValid, cur.labels);
}

function controlAddLabels
ControlStmtContext ::= cur::ControlStmtContext labs::[(String, LabelItem)]
{
  return controlStmtContext(cur.returnType, cur.breakValid, cur.continueValid,
                          tm:add(labs, cur.labels));
}

nonterminal LabelItem;
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

function lookupLabel
[LabelItem] ::= n::String ctx::ControlStmtContext
{
  return tm:lookup(n, ctx.labels);
}
