grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

synthesized attribute returnType :: Maybe<Type>;
synthesized attribute breakValid :: Boolean;
synthesized attribute continueValid :: Boolean;

nonterminal ControlStmtContext with returnType, breakValid, continueValid;

autocopy attribute controlStmtContext :: ControlStmtContext;

abstract production controlStmtContext
top::ControlStmtContext ::= returnType::Maybe<Type> breakValid::Boolean continueValid::Boolean
{
  top.returnType = returnType;
  top.breakValid = breakValid;
  top.continueValid = continueValid;
}

global initialControlStmtContext :: ControlStmtContext
  = controlStmtContext(nothing(), false, false);

function controlEnterLoop
ControlStmtContext ::= cur::ControlStmtContext
{
  return controlStmtContext(cur.returnType, true, true);
}

function controlEnterSwitch
ControlStmtContext ::= cur::ControlStmtContext
{
  return controlStmtContext(cur.returnType, true, cur.continueValid);
}
