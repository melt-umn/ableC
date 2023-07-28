grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

tracked nonterminal Qualifiers with mangledName, qualifiers, pps, host, typeToQualify, errors;
flowtype Qualifiers = decorate {}, qualifiers {}, errors {typeToQualify};

inherited attribute typeToQualify :: Type;

synthesized attribute qualifiers :: [Qualifier];

propagate errors, typeToQualify, controlStmtContext on Qualifiers;

abstract production consQualifier
top::Qualifiers ::= h::Qualifier  t::Qualifiers
{
  top.host = if h.qualIsHost then consQualifier(h, t.host) else t.host;
  top.mangledName = h.mangledName ++ "_" ++ t.mangledName;
  top.qualifiers = cons(h, t.qualifiers);
  top.pps = cons(h.pp, t.pps);
}

abstract production nilQualifier
top::Qualifiers ::=
{
  propagate host;
  top.mangledName = "";
  top.qualifiers = [];
  top.pps = [];
}

function unionQualifiers
Qualifiers ::= q1::[Qualifier]  q2::[Qualifier]
{
  return
    foldQualifier(
      filter(
        -- remove qualifiers in q1 that are also in q2
        \q::Qualifier -> !containsBy(qualifierCompat, q, q2),
        -- remove duplicates from within q1
        nubBy(qualifierCompat, q1)
      ) ++ q2
    );
}

{-- Type qualifiers (cv or cvr qualifiers) -}
closed tracked nonterminal Qualifier with pp, qualIsPositive, qualIsNegative, qualAppliesWithinRef, qualCompat, qualIsHost, mangledName, typeToQualify, errors;
flowtype Qualifier = decorate {}, qualIsPositive {}, qualIsNegative {}, qualAppliesWithinRef {}, qualCompat {}, qualIsHost {}, errors {typeToQualify};

synthesized attribute qualIsPositive :: Boolean;
synthesized attribute qualIsNegative :: Boolean;
-- Variables refer to memory locations and thus there is an implicit ref
--   wrapping stated types (given `int x;', the type of x is ref(int)) which is
--   implicitly dereferenced when used as an r-value. This attribute specifies
--   where the qualifier applies, e.g. `const int' should be `const ref(int)'
--   but `nonzero int' should be `ref(nonzero int)'.
synthesized attribute qualAppliesWithinRef :: Boolean;

synthesized attribute qualCompat :: (Boolean ::= Qualifier);

-- set to false to drop qualifier in generated code
synthesized attribute qualIsHost :: Boolean;

aspect default production
top::Qualifier ::=
{
  top.qualIsHost = false;
}

abstract production constQualifier
top::Qualifier ::=
{
  top.pp = text("const");
  top.mangledName = "const";
  top.qualIsPositive = true;
  top.qualIsNegative = false;
  top.qualAppliesWithinRef = false;
  top.qualCompat = \qualToCompare::Qualifier ->
    case qualToCompare of constQualifier() -> true | _ -> false end;
  top.qualIsHost = true;
  top.errors := [];
}

abstract production volatileQualifier
top::Qualifier ::=
{
  top.pp = text("volatile");
  top.mangledName = "volatile";
  top.qualIsPositive = true;
  top.qualIsNegative = false;
  top.qualAppliesWithinRef = false;
  top.qualCompat = \qualToCompare::Qualifier ->
    case qualToCompare of volatileQualifier() -> true | _ -> false end;
  top.qualIsHost = true;
  top.errors := [];
}

abstract production restrictQualifier
top::Qualifier ::=
{
  top.pp = text("restrict");
  top.mangledName = "restrict";
  top.qualIsPositive = true;
  top.qualIsNegative = false;
  top.qualAppliesWithinRef = false;
  top.qualCompat = \qualToCompare::Qualifier ->
    case qualToCompare of
      restrictQualifier()   -> true
    | uuRestrictQualifier() -> true
    | _                     -> false
    end;
  top.qualIsHost = true;
  top.errors :=
		case top.typeToQualify.defaultFunctionArrayLvalueConversion of
			pointerType(_, _) -> []
		| _                 -> [errFromOrigin(top, "invalid use of `restrict'")]
		end;
}

abstract production uuRestrictQualifier
top::Qualifier ::=
{
  top.pp = text("__restrict");
  top.mangledName = "__restrict";
  top.qualIsPositive = true;
  top.qualIsNegative = false;
  top.qualAppliesWithinRef = false;
  top.qualCompat = \qualToCompare::Qualifier ->
    case qualToCompare of
      restrictQualifier()   -> true
    | uuRestrictQualifier() -> true
    | _                     -> false
    end;
  top.qualIsHost = true;
  top.errors :=
		case top.typeToQualify.defaultFunctionArrayLvalueConversion of
			pointerType(_, _) -> []
		| _                 -> [errFromOrigin(top, "invalid use of `restrict'")]
		end;
}

{-- Specifiers that apply to specific types.
 - e.g. Function specifiers (inline, _Noreturn)
 -      Alignment specifiers (_Alignas)
 -}
nonterminal SpecialSpecifier with pp, host, env, errors, globalDecls,
  functionDecls, defs, controlStmtContext;
flowtype SpecialSpecifier = decorate {env, controlStmtContext};

propagate env, host, errors, globalDecls, functionDecls, defs, controlStmtContext on SpecialSpecifier;

abstract production inlineQualifier
top::SpecialSpecifier ::=
{
  top.pp = text("inline");
}

-- C11
abstract production noreturnQualifier
top::SpecialSpecifier ::=
{
  top.pp = text("_Noreturn");
}

-- C11
abstract production alignasSpecifier
top::SpecialSpecifier ::= e::Expr
{
  top.pp = ppConcat([text("_Alignas"), parens(e.pp)]);
}

nonterminal SpecialSpecifiers with pps, host, env, errors,
  globalDecls, functionDecls, defs, controlStmtContext;
flowtype SpecialSpecifiers = decorate {env, controlStmtContext};

propagate env, host, errors, globalDecls, functionDecls, defs, controlStmtContext on SpecialSpecifiers;

abstract production consSpecialSpecifier
top::SpecialSpecifiers ::= h::SpecialSpecifier t::SpecialSpecifiers
{
  top.pps = h.pp :: t.pps;
}

abstract production nilSpecialSpecifier
top::SpecialSpecifiers ::=
{
  top.pps = [];
}


function containsQualifier
Boolean ::= q::Qualifier t::Type
{
  return containsBy(qualifierCompat, q, t.qualifiers);
}

function qualifierCat
Qualifiers ::= q1::Qualifiers  q2::Qualifiers
{
  return foldQualifier(q1.qualifiers ++ q2.qualifiers);
}

