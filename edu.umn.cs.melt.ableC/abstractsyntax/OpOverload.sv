grammar edu:umn:cs:melt:ableC:abstractsyntax;

inherited attribute otherType::Type occurs on Type;

synthesized attribute preIncProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute preDecProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute postIncProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute postDecProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute unaryAndProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute unaryStarProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute unaryPlusProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute unaryMinusProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute unaryTildaProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute unaryBangProd::Maybe<(Expr ::= Expr Location)> occurs on Type;
synthesized attribute lAssignProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignStarProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignSlashProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignPercentProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignPlusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignMinusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignDoubleLtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignDoubleGtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignSingleAndProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignSingleOrProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lAssignCaratProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryDoubleAndProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryDoubleOrProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinarySingleAndProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinarySingleOrProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryCaratProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryDoubleLtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryDoubleGtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryEqProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryNeqProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryGtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryLtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryGteProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryLteProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryPlusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryMinusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryStarProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinarySlashProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute lBinaryPercentProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignStarProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignSlashProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignPercentProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignPlusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignMinusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignDoubleLtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignDoubleGtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignSingleAndProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignSingleOrProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rAssignCaratProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryDoubleAndProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryDoubleOrProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinarySingleAndProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinarySingleOrProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryCaratProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryDoubleLtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryDoubleGtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryEqProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryNeqProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryGtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryLtProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryGteProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryLteProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryPlusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryMinusProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryStarProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinarySlashProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;
synthesized attribute rBinaryPercentProd::Maybe<(Expr ::= Expr Expr Location)> occurs on Type;

aspect default production
top::Type ::= 
{
  top.preIncProd = nothing();
  top.preDecProd = nothing();
  top.postIncProd = nothing();
  top.postDecProd = nothing();
  top.unaryAndProd = nothing();
  top.unaryStarProd = nothing();
  top.unaryPlusProd = nothing();
  top.unaryMinusProd = nothing();
  top.unaryTildaProd = nothing();
  top.unaryBangProd = nothing();
  top.lAssignProd = nothing();
  top.lAssignStarProd = nothing();
  top.lAssignSlashProd = nothing();
  top.lAssignPercentProd = nothing();
  top.lAssignPlusProd = nothing();
  top.lAssignMinusProd = nothing();
  top.lAssignDoubleLtProd = nothing();
  top.lAssignDoubleGtProd = nothing();
  top.lAssignSingleAndProd = nothing();
  top.lAssignSingleOrProd = nothing();
  top.lAssignCaratProd = nothing();
  top.lBinaryDoubleAndProd = nothing();
  top.lBinaryDoubleOrProd = nothing();
  top.lBinarySingleAndProd = nothing();
  top.lBinarySingleOrProd = nothing();
  top.lBinaryCaratProd = nothing();
  top.lBinaryDoubleLtProd = nothing();
  top.lBinaryDoubleGtProd = nothing();
  top.lBinaryEqProd = nothing();
  top.lBinaryNeqProd = nothing();
  top.lBinaryGtProd = nothing();
  top.lBinaryLtProd = nothing();
  top.lBinaryGteProd = nothing();
  top.lBinaryLteProd = nothing();
  top.lBinaryPlusProd = nothing();
  top.lBinaryMinusProd = nothing();
  top.lBinaryStarProd = nothing();
  top.lBinarySlashProd = nothing();
  top.lBinaryPercentProd = nothing();
  top.rAssignProd = nothing();
  top.rAssignStarProd = nothing();
  top.rAssignSlashProd = nothing();
  top.rAssignPercentProd = nothing();
  top.rAssignPlusProd = nothing();
  top.rAssignMinusProd = nothing();
  top.rAssignDoubleLtProd = nothing();
  top.rAssignDoubleGtProd = nothing();
  top.rAssignSingleAndProd = nothing();
  top.rAssignSingleOrProd = nothing();
  top.rAssignCaratProd = nothing();
  top.rBinaryDoubleAndProd = nothing();
  top.rBinaryDoubleOrProd = nothing();
  top.rBinarySingleAndProd = nothing();
  top.rBinarySingleOrProd = nothing();
  top.rBinaryCaratProd = nothing();
  top.rBinaryDoubleLtProd = nothing();
  top.rBinaryDoubleGtProd = nothing();
  top.rBinaryEqProd = nothing();
  top.rBinaryNeqProd = nothing();
  top.rBinaryGtProd = nothing();
  top.rBinaryLtProd = nothing();
  top.rBinaryGteProd = nothing();
  top.rBinaryLteProd = nothing();
  top.rBinaryPlusProd = nothing();
  top.rBinaryMinusProd = nothing();
  top.rBinaryStarProd = nothing();
  top.rBinarySlashProd = nothing();
  top.rBinaryPercentProd = nothing();
}

function getUnaryOverload
(Expr ::= Expr Location) ::= op::UnaryOp t::Type
{
  return
    case op.opName of
      "pre++" -> convertUnaryMaybeProd(op, t.preIncProd)
    | "pre--" -> convertUnaryMaybeProd(op, t.preDecProd)
    | "post++" -> convertUnaryMaybeProd(op, t.postIncProd)
    | "post--" -> convertUnaryMaybeProd(op, t.postDecProd)
    | "&" -> convertUnaryMaybeProd(op, t.unaryAndProd)
    | "*" -> convertUnaryMaybeProd(op, t.unaryStarProd)
    | "+" -> convertUnaryMaybeProd(op, t.unaryPlusProd)
    | "-" -> convertUnaryMaybeProd(op, t.unaryMinusProd)
    | "~" -> convertUnaryMaybeProd(op, t.unaryTildaProd)
    | "!" -> convertUnaryMaybeProd(op, t.unaryBangProd)
    | _ -> unaryOpExprDefault(op, _, location=_) -- Misc. ops such as GCC extensions not overloaded
    end;
}

function convertUnaryMaybeProd
(Expr ::= Expr Location) ::= op::UnaryOp prod::Maybe<(Expr ::= Expr Location)>
{
  return
    if prod.isJust
    then prod.fromJust
    else unaryOpExprDefault(op, _, location=_);
}

function getBinaryOverload
(Expr ::= Expr Expr Location) ::= env::Decorated Env returnType::Maybe<Type> l::Type op::BinOp r::Type
{
  local prod::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryOverloadHelp(l, op.opName, r);
  local assignProd::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryOverloadHelp(l, "=", r);
  local assignOpProd::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryOverloadHelp(l, substitute("=", "", op.opName), r);
  local eqOpProd::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryOverloadHelp(l, "==", r);
  local gtOpProd::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryOverloadHelp(l, ">", r);
  local ltOpProd::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryOverloadHelp(l, "<", r);
  local gteOpProd::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryOverloadHelp(l, ">=", r);
  local lteOpProd::Maybe<(Expr ::= Expr Expr Location)> =
    getBinaryOverloadHelp(l, "<=", r);

  return
    if prod.isJust
    then prod.fromJust
    else if
      containsBy(stringEq, op.opName, ["*=", "/=", "%=", "+=", "-=", "<<=", ">>=", "&=", "|=", "^="]) &&
      assignOpProd.isJust && assignProd.isJust
    then constructAssignOp(_, _, _, assignOpProd.fromJust, assignProd.fromJust)
    else if op.opName == "!=" && eqOpProd.isJust
    then constructNot(_, _, _, env, returnType, eqOpProd.fromJust)
    else if op.opName == ">" && lteOpProd.isJust
    then constructNot(_, _, _, env, returnType, lteOpProd.fromJust)
    else if op.opName == "<" && gteOpProd.isJust
    then constructNot(_, _, _, env, returnType, gteOpProd.fromJust)
    else if op.opName == ">=" && ltOpProd.isJust
    then constructNot(_, _, _, env, returnType, ltOpProd.fromJust)
    else if op.opName == "<=" && gtOpProd.isJust
    then constructNot(_, _, _, env, returnType, gtOpProd.fromJust)
    else binaryOpExprDefault(_, op, _, location=_);
}

function constructAssignOp
Expr ::= e1::Expr e2::Expr l::Location assignOpProd::(Expr ::= Expr Expr Location) assignProd::(Expr ::= Expr Expr Location)
{
  return assignProd(e1, assignOpProd(e1, e2, l), l);
}

function constructNot
Expr ::= e1::Expr e2::Expr l::Location env::Decorated Env returnType::Maybe<Type> prod::(Expr ::= Expr Expr Location)
{
  local res::Expr = prod(e1, e2, l);
  res.env = env;
  res.returnType = returnType;
  return getUnaryOverload(notOp(location=l), res.typerep)(res, l);
}

-- TODO: Fix this, evaluates args twice
{-
function constructOr
Expr ::= e1::Expr e2::Expr l::Location prod1::(Expr ::= Expr Expr Location) prod2::(Expr ::= Expr Expr Location)
{
  local res1::Expr = prod1(e1, e2, l);
  local res2::Expr = prod2(e1, e2, l);
  return
    getBinaryOverload(
      res1.typerep,
      boolOp(andBoolOp(location=l), location=l),
      res2.typerep)(res1, res2, l);
}
-}

function getBinaryOverloadHelp
Maybe<(Expr ::= Expr Expr Location)> ::= l::Type opName::String r::Type
{
  local lProd::Maybe<(Expr ::= Expr Expr Location)> =
    getBinOpAttribute("l" ++ opName, l, r);
  local rProd::Maybe<(Expr ::= Expr Expr Location)> =
    getBinOpAttribute("r" ++ opName, r, l);

  return
    if lProd.isJust
    then lProd
    else if rProd.isJust
    then rProd
    else nothing();
}

function getBinOpAttribute
Maybe<(Expr ::= Expr Expr Location)> ::= opName::String t::Type other::Type
{
  t.otherType = other;
  return
    case opName of
      "l=" -> t.lAssignProd
    | "l*=" -> t.lAssignStarProd
    | "l/=" -> t.lAssignSlashProd
    | "l%=" -> t.lAssignPercentProd
    | "l+=" -> t.lAssignPlusProd
    | "l-=" -> t.lAssignMinusProd
    | "l<<=" -> t.lAssignDoubleLtProd
    | "l>>=" -> t.lAssignDoubleGtProd
    | "l&=" -> t.lAssignSingleAndProd
    | "l|=" -> t.lAssignSingleOrProd
    | "l^=" -> t.lAssignCaratProd
    | "l&&" -> t.lBinaryDoubleAndProd
    | "l||" -> t.lBinaryDoubleOrProd
    | "l&" -> t.lBinarySingleAndProd
    | "l|" -> t.lBinarySingleOrProd
    | "l^" -> t.lBinaryCaratProd
    | "l<<" -> t.lBinaryDoubleLtProd
    | "l>>" -> t.lBinaryDoubleGtProd
    | "l==" -> t.lBinaryEqProd
    | "l!=" -> t.lBinaryNeqProd
    | "l>" -> t.lBinaryGtProd
    | "l>=" -> t.lBinaryGteProd
    | "l<" -> t.lBinaryLtProd
    | "l<=" -> t.lBinaryLteProd
    | "l+" -> t.lBinaryPlusProd
    | "l-" -> t.lBinaryMinusProd
    | "l*" -> t.lBinaryStarProd
    | "l/" -> t.lBinarySlashProd
    | "l%" -> t.lBinaryPercentProd
    | "r=" -> t.rAssignProd
    | "r*=" -> t.rAssignStarProd
    | "r/=" -> t.rAssignSlashProd
    | "r%=" -> t.rAssignPercentProd
    | "r+=" -> t.rAssignPlusProd
    | "r-=" -> t.rAssignMinusProd
    | "r<<=" -> t.rAssignDoubleLtProd
    | "r>>=" -> t.rAssignDoubleGtProd
    | "r&=" -> t.rAssignSingleAndProd
    | "r|=" -> t.rAssignSingleOrProd
    | "r^=" -> t.rAssignCaratProd
    | "r&&" -> t.rBinaryDoubleAndProd
    | "r||" -> t.rBinaryDoubleOrProd
    | "r&" -> t.rBinarySingleAndProd
    | "r|" -> t.rBinarySingleOrProd
    | "r^" -> t.rBinaryCaratProd
    | "r<<" -> t.rBinaryDoubleLtProd
    | "r>>" -> t.rBinaryDoubleGtProd
    | "r==" -> t.rBinaryEqProd
    | "r!=" -> t.rBinaryNeqProd
    | "r>" -> t.rBinaryGtProd
    | "r>=" -> t.rBinaryGteProd
    | "r<" -> t.rBinaryLtProd
    | "r<=" -> t.rBinaryLteProd
    | "r+" -> t.rBinaryPlusProd
    | "r-" -> t.rBinaryMinusProd
    | "r*" -> t.rBinaryStarProd
    | "r/" -> t.rBinarySlashProd
    | "r%" -> t.rBinaryPercentProd
    | _ -> nothing()
    end;
}

-- Make binaryOverload depend on otherType
abstract production hackUnusedType2
top::Type ::=
{
  top.lAssignProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignStarProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignSlashProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignPercentProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignPlusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignMinusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignDoubleLtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignDoubleGtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignSingleAndProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignSingleOrProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lAssignCaratProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryDoubleAndProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryDoubleOrProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinarySingleAndProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinarySingleOrProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryCaratProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryDoubleLtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryDoubleGtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryEqProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryNeqProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryGtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryGteProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryLtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryLteProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryPlusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryMinusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryStarProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinarySlashProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.lBinaryPercentProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignStarProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignSlashProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignPercentProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignPlusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignMinusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignDoubleLtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignDoubleGtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignSingleAndProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignSingleOrProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rAssignCaratProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryDoubleAndProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryDoubleOrProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinarySingleAndProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinarySingleOrProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryCaratProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryDoubleLtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryDoubleGtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryEqProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryNeqProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryGtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryGteProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryLtProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryLteProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryPlusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryMinusProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryStarProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinarySlashProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  top.rBinaryPercentProd = case top.otherType of errorType() -> error("unused") | _ -> error("unused1") end;
  
  forwards to errorType();
}