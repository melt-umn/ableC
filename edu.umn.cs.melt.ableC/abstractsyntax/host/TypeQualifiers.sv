grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production consQualifier
top::Qualifiers ::= h::Qualifier  t::Qualifiers
{
  top.host = if h.qualIsHost then consQualifier(h, t.host) else t.host;
  top.mangledName = h.mangledName ++ "_" ++ t.mangledName;
  top.qualifiers = cons(h, t.qualifiers);
  top.pps = cons(h.pp, t.pps);
  top.errors := h.errors ++ t.errors;
}

abstract production nilQualifier
top::Qualifiers ::=
{
  propagate host;
  top.mangledName = "";
  top.qualifiers = [];
  top.pps = [];
  top.errors := [];
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
		| _                 -> [err(top.location, "invalid use of `restrict'")]
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
		| _                 -> [err(top.location, "invalid use of `restrict'")]
		end;
}

abstract production inlineQualifier
top::SpecialSpecifier ::=
{
  propagate host, lifted;
  top.pp = text("inline");
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
}

-- C11
abstract production noreturnQualifier
top::SpecialSpecifier ::=
{
  propagate host, lifted;
  top.pp = text("_Noreturn");
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
}

-- C11
abstract production alignasSpecifier
top::SpecialSpecifier ::= e::Expr
{
  propagate host, lifted;
  top.pp = ppConcat([text("_Alignas"), parens(e.pp)]);
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.defs := e.defs;
}

abstract production consSpecialSpecifier
top::SpecialSpecifiers ::= h::SpecialSpecifier t::SpecialSpecifiers
{
  propagate host, lifted;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.defs := h.defs ++ t.defs;
}

abstract production nilSpecialSpecifier
top::SpecialSpecifiers ::=
{
  propagate host, lifted;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
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

