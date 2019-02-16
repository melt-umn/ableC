grammar edu:umn:cs:melt:tutorials:ableC:interval:abstractsyntax;

import edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

abstract production intervalTypeExpr
top::BaseTypeExpr ::= q::Qualifiers loc::Location
{
  propagate substituted;
  top.pp = ppConcat([terminate(space(), q.pps), pp"interval"]);
  forwards to
    if !null(lookupRefId("edu:umn:cs:melt:tutorials:ableC:interval:interval", top.env))
    then extTypeExpr(q, intervalType())
    else errorTypeExpr([err(loc, "Missing include of interval.xh")]);
}

abstract production intervalType
top::ExtType ::= 
{
  propagate substituted, canonicalType;
  top.pp = pp"interval";
  -- Translate to a reference to the struct with the refId specified in the header file
  top.host =
    extType(
      top.givenQualifiers,
      refIdExtType(
        structSEU(), "_interval_s",
        "edu:umn:cs:melt:tutorials:ableC:interval:interval"));
  top.mangledName = "interval";
  top.isEqualTo =
    \ other::ExtType -> case other of intervalType() -> true | _ -> false end;
  
  -- Additional equations specify overload productions for the interval type
  top.lAddProd = just(addInterval(_, _, location=_));
  top.rAddProd = just(addInterval(_, _, location=_));
  top.lSubProd = nothing();  -- complete this
  top.rSubProd = nothing();  -- complete this
  -- create a production not unlike addInterval in AbstractSyntax.sv
  top.lMulProd = just(mulInterval(_, _, location=_));
  top.rMulProd = just(mulInterval(_, _, location=_));
  top.lDivProd = nothing();  -- complete this
  top.rDivProd = nothing();  -- complete this
  -- create a production not unlike addInterval in AbstractSyntax.sv

  top.memberProd = just(memberInterval(_, _, _, location=_));
  top.bitNegateProd = just(invInterval(_, location=_));
  top.negativeProd = nothing();   -- complete this
  -- create production not unlike invInterval in AbstractSyntax.sv

  -- Overloads for +=, -=, *=, /= automatically inferred from above
  top.lEqualsProd = just(equalsInterval(_, _, location=_));
  top.rEqualsProd = just(equalsInterval(_, _, location=_));
  -- Overload for != automatically inferred from above
}
