grammar edu:umn:cs:melt:ableC:abstractsyntax;

{-- Type qualifiers (cv or cvr qualifiers) -}
nonterminal Qualifier with pp, host<Qualifier>, lifted<Qualifier>, qualname, qualIsPositive, qualIsNegative, qualAppliesWithinRef, qualCompat;

synthesized attribute qualname :: String;
synthesized attribute qualIsPositive :: Boolean;
synthesized attribute qualIsNegative :: Boolean;
-- Variables refer to memory locations and thus there is an implicit ref
--   wrapping stated types (given `int x;', the type of x is ref(int)) which is
--   implicitly dereferenced when used as an r-value. This attribute specifies
--   where the qualifier applies, e.g. `const int' should be `const ref(int)'
--   but `nonzero int' should be `ref(nonzero int)'.
synthesized attribute qualAppliesWithinRef :: Boolean;

synthesized attribute qualCompat :: (Boolean ::= Qualifier);

abstract production constQualifier
top::Qualifier ::=
{
  propagate host, lifted;
  top.pp = text(top.qualname);
  top.qualname = "const";
  top.qualIsPositive = true;
  top.qualIsNegative = false;
  top.qualAppliesWithinRef = false;
  top.qualCompat = \qualToCompare::Qualifier ->
    case qualToCompare of constQualifier() -> true | _ -> false end;
}

abstract production volatileQualifier
top::Qualifier ::=
{
  propagate host, lifted;
  top.pp = text(top.qualname);
  top.qualname = "volatile";
  top.qualIsPositive = true;
  top.qualIsNegative = false;
  top.qualAppliesWithinRef = true;
  top.qualCompat = \qualToCompare::Qualifier ->
    case qualToCompare of volatileQualifier() -> true | _ -> false end;
}

abstract production restrictQualifier
top::Qualifier ::=
{
  propagate host, lifted;
  top.pp = text(top.qualname);
  top.qualname = "restrict";
  top.qualIsPositive = false;
  top.qualIsNegative = false;
  top.qualAppliesWithinRef = true;
  top.qualCompat = \qualToCompare::Qualifier ->
    case qualToCompare of restrictQualifier() -> true | _ -> false end;
}

abstract production uuRestrictQualifier
top::Qualifier ::=
{
  propagate host, lifted;
  top.pp = text(top.qualname);
  top.qualname = "__restrict";
  top.qualIsPositive = false;
  top.qualIsNegative = false;
  top.qualAppliesWithinRef = true;
  top.qualCompat = \qualToCompare::Qualifier ->
    case qualToCompare of uuRestrictQualifier() -> true | _ -> false end;
}

abstract production pluggableQualifier
top::Qualifier ::= isPositive::Boolean appliesWithinRef::Boolean
                   compat::(Boolean ::= Qualifier)
{
  propagate host, lifted;
  top.pp = text(top.qualname); -- TODO: print qualifier name in error messages but not in generated code
  top.qualname = "";
  top.qualIsPositive = isPositive;
  top.qualIsNegative = !isPositive;
  top.qualAppliesWithinRef = appliesWithinRef;
  top.qualCompat = compat;
}

{-- Specifiers that apply to specific types.
 - e.g. Function specifiers (inline, _Noreturn)
 -      Alignment specifiers (_Alignas)
 -}
nonterminal SpecialSpecifier with pp, host<SpecialSpecifier>, lifted<SpecialSpecifier>, env, returnType;

abstract production inlineQualifier
top::SpecialSpecifier ::=
{
  propagate host, lifted;
  top.pp = text("inline");
}

-- C11
abstract production noreturnQualifier
top::SpecialSpecifier ::=
{
  propagate host, lifted;
  top.pp = text("_Noreturn");
}

-- C11
abstract production alignasSpecifier
top::SpecialSpecifier ::= e::Expr
{
  propagate host, lifted;
  top.pp = ppConcat([text("_Alignas"), parens(e.pp)]);
--  top.errors := e.errors;
}

function containsQualifier
Boolean ::= q::Qualifier t::Type
{
  return containsBy(qualifierCompat, q, getQualifiers(t));
}

function getQualifiers
[Qualifier] ::= t::Type
{
  return
    case t of
    | errorType()           -> []
    | builtinType(q, _)     -> q
    | tagType(q, _)         -> q
    | atomicType(q, _)      -> q
    | pointerType(q, _)     -> q
    | arrayType(_, q, _, _) -> q
    | noncanonicalType(s)   -> getQualifiers(s.canonicalType)
    | _ -> []
    end;
}

