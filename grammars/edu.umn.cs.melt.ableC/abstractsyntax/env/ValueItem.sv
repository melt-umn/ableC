grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

closed nonterminal ValueItem with typerep, sourceLocation, directRefHandler, directCallHandler, isItemValue, isItemType;

synthesized attribute sourceLocation :: Location;
synthesized attribute directRefHandler :: (Expr ::= Name Location);
synthesized attribute directCallHandler :: (Expr ::= Name Exprs Location);
synthesized attribute isItemValue :: Boolean;
synthesized attribute isItemType :: Boolean;

aspect default production
top::ValueItem ::=
{
  top.directRefHandler = ordinaryVariableHandler;
  top.directCallHandler = ordinaryFunctionHandler;
  top.isItemValue = false;
  top.isItemType = false;
}

-- TODO: we might consider splitting this into values and typedef names.
-- but, perhaps that is unnecessary. defer to later.
abstract production declaratorValueItem
top::ValueItem ::= s::Decorated Declarator
{
  top.typerep = s.typerep;
  top.sourceLocation = s.sourceLocation;
  top.isItemValue = !s.isTypedef;
  top.isItemType = s.isTypedef;
}
-- Btw, although it seems like typedef names should be in a different namespace
-- than values, they are not. And this is important for getting C semantics
-- right w.r.t. name shadowing, etc.

abstract production functionValueItem
top::ValueItem ::= s::Decorated FunctionDecl
{
  top.typerep = s.typerep;
  top.sourceLocation = s.sourceLocation;
  top.isItemValue = true;
}

abstract production builtinValueItem
top::ValueItem ::= t::Type
{
  top.typerep = t;
  top.sourceLocation = loc("<builtin>", 1, 0, 1, 0, 0, 1);
  top.isItemValue = true;
}

abstract production builtinFunctionValueItem
top::ValueItem ::= t::Type  handler::(Expr ::= Name Exprs Location)
{
  top.typerep = t;
  top.sourceLocation = loc("<builtin>", 1, 0, 1, 0, 0, 1);
  top.directCallHandler = handler;
  top.isItemValue = true; -- TODO: Workaround to let us use ordinaryFunctionHandler here
}

abstract production fieldValueItem
top::ValueItem ::= s::Decorated StructDeclarator
{
  top.typerep = s.typerep;
  top.sourceLocation = s.sourceLocation;
  top.isItemValue = true;
}

abstract production enumValueItem
top::ValueItem ::= s::Decorated EnumItem
{
  top.typerep = s.typerep;
  top.sourceLocation = s.sourceLocation;
  top.isItemValue = true;
}

abstract production parameterValueItem
top::ValueItem ::= s::Decorated ParameterDecl
{
  top.typerep = s.typerep;
  top.sourceLocation = s.sourceLocation;
  top.isItemValue = true;
}

abstract production errorValueItem
top::ValueItem ::=
{
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1);
  top.isItemValue = true;
  top.isItemType = true;
}


