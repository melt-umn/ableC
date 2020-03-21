grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

-- This file's typing is buggy. We're just reporting the smallest type a constants could represent
-- It should be the smallest type according to a list that CAN REPRESENT THE CONSTANT VALUE GIVEN.
-- i.e. 4,000,000,000 would be unsigned long, not int as we do here because int can't represent it.

abstract production realConstant
top::Expr ::= c::NumericConstant
{
  propagate host, errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = c.pp;
  top.typerep = builtinType(nilQualifier(), c.constanttyperep);
  top.isLValue = false;
  top.isSimple = true;
  top.integerConstantValue = c.integerConstantValue;
}
abstract production imaginaryConstant
top::Expr ::= c::NumericConstant
{
  propagate host, errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = c.pp;
  top.typerep = builtinType(nilQualifier(), case c.constanttyperep of
    | realType(rt) -> complexType(rt)
    | signedType(it) -> complexIntegerType(it)
    | unsignedType(it) -> complexIntegerType(it) -- probably not possible, but buggy!
    end);
  top.isLValue = false;
  top.isSimple = true;
}
abstract production characterConstant
top::Expr ::= num::String  c::CharPrefix
{
  propagate host, errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = text(num);
  top.typerep = builtinType(nilQualifier(), signedType(charType())); -- TODO: no idea
  top.isLValue = false;
  top.isSimple = true;
}

nonterminal NumericConstant with location, pp, mangledName, host, errors, env, constanttyperep, integerConstantValue;
flowtype NumericConstant = decorate {env}, constanttyperep {decorate}, integerConstantValue {decorate};

synthesized attribute constanttyperep :: BuiltinType;

propagate host, errors on NumericConstant;

abstract production integerConstant
top::NumericConstant ::= num::String  unsigned::Boolean  suffix::IntSuffix
{
  top.pp = text(num);
  top.mangledName = substitute(".", "_", num);
  top.constanttyperep = if unsigned then unsignedType(suffix.constinttyperep) else signedType(suffix.constinttyperep);
  top.integerConstantValue = just(toInteger(num));
}
abstract production hexIntegerConstant
top::NumericConstant ::= num::String  unsigned::Boolean  suffix::IntSuffix
{
  top.pp = text(num);
  top.mangledName = substitute(".", "_", num);
  top.constanttyperep = if unsigned then unsignedType(suffix.constinttyperep) else signedType(suffix.constinttyperep);
  top.integerConstantValue = nothing(); -- TODO
}
abstract production octIntegerConstant
top::NumericConstant ::= num::String  unsigned::Boolean  suffix::IntSuffix
{
  top.pp = text(num);
  top.mangledName = substitute(".", "_", num);
  top.constanttyperep = if unsigned then unsignedType(suffix.constinttyperep) else signedType(suffix.constinttyperep);
  top.integerConstantValue = nothing(); -- TODO
}

abstract production floatConstant
top::NumericConstant ::= num::String  suffix::FloatSuffix
{
  top.pp = text(num);
  top.mangledName = substitute(".", "_", num);
  top.constanttyperep = realType(suffix.constfloattyperep);
  top.integerConstantValue = nothing();
}
abstract production hexFloatConstant
top::NumericConstant ::= num::String  suffix::FloatSuffix
{
  top.pp = text(num);
  top.mangledName = substitute(".", "_", num);
  top.constanttyperep = realType(suffix.constfloattyperep);
  top.integerConstantValue = nothing();
}

nonterminal IntSuffix with constinttyperep; -- nothing, L, LL
synthesized attribute constinttyperep :: IntegerType;
abstract production noIntSuffix        top::IntSuffix ::= { top.constinttyperep = intType(); }
abstract production longIntSuffix      top::IntSuffix ::= { top.constinttyperep = longType(); }
abstract production longLongIntSuffix  top::IntSuffix ::= { top.constinttyperep = longlongType(); }

nonterminal FloatSuffix with constfloattyperep; -- nothing, F, L
synthesized attribute constfloattyperep :: RealType;
abstract production doubleFloatSuffix      top::FloatSuffix ::= { top.constfloattyperep = doubleType(); }
abstract production floatFloatSuffix       top::FloatSuffix ::= { top.constfloattyperep = floatType(); }
abstract production longDoubleFloatSuffix  top::FloatSuffix ::= { top.constfloattyperep = longdoubleType(); }

nonterminal CharPrefix; -- nothing, L, u, U
abstract production noCharPrefix  top::CharPrefix ::= { }
abstract production wcharCharPrefix  top::CharPrefix ::= { }
abstract production char16CharPrefix  top::CharPrefix ::= { }
abstract production char32CharPrefix  top::CharPrefix ::= { }
