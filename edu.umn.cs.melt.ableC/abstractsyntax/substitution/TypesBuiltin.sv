grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;





aspect production voidType
top::BuiltinType ::=
{
  propagate substituted;
}


aspect production boolType
top::BuiltinType ::=
{
  propagate substituted;
}


aspect production realType
top::BuiltinType ::= rt::RealType
{
  propagate substituted;
}


aspect production complexType
top::BuiltinType ::= rt::RealType
{
  propagate substituted;
}


aspect production imaginaryType
top::BuiltinType ::= rt::RealType
{
  propagate substituted;
}


aspect production signedType
top::BuiltinType ::= it::IntegerType
{
  propagate substituted;
}


aspect production unsignedType
top::BuiltinType ::= it::IntegerType
{
  propagate substituted;
}


aspect production complexIntegerType
top::BuiltinType ::= it::IntegerType
{
  propagate substituted;
}




aspect production floatType
top::RealType ::=
{
  propagate substituted;
}

aspect production doubleType
top::RealType ::=
{
  propagate substituted;
}

aspect production longdoubleType
top::RealType ::=
{
  propagate substituted;
}





aspect production charType
top::IntegerType ::=
{
  propagate substituted;
}

aspect production shortType
top::IntegerType ::=
{
  propagate substituted;
}

aspect production intType
top::IntegerType ::=
{
  propagate substituted;
}

aspect production longType
top::IntegerType ::=
{
  propagate substituted;
}

aspect production longlongType
top::IntegerType ::=
{
  propagate substituted;
}

aspect production int128Type
top::IntegerType ::=
{
  propagate substituted;
}

