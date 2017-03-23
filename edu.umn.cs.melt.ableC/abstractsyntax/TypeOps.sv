
-- Some attributes for Type and BuiltinType.

-- RULE for using these: it must *ALWAYS* be the case than an error occurs if
-- the is* flag is FALSE.
-- i.e. if you need it both ways, there should be two attributes:
--   isTrue and isNotTrue.
-- Why? Because both of those will be true for *errorType*.
synthesized attribute isIntegerType :: Boolean; -- enum or integer builtin
synthesized attribute isArithmeticType :: Boolean; -- integer or floating (incl complex)
synthesized attribute isScalarType :: Boolean; -- pointers or arithmetic



function showType
String ::= t::Type
{
  return show(80, cat(t.lpp, t.rpp));
}


-- return true if a is a supertype of b; otherwise false
function compatibleTypes
Boolean ::= a::Type  b::Type
{
  return case a, b of
  -- Allow already raised errors to go by unbothered by more errors
  | errorType(), _ -> true
  | _, errorType() -> true
  -- Type specifiers
  | builtinType(q1, b1), builtinType(q2, b2) -> builtinEq(b1, b2) && qualifiersSubtype(q2, q1)
  | tagType(q1, enumTagType(_)), tagType(q2, enumTagType(_)) -> true -- TODO: FIXME: enums should be handled the same as other tags
  | tagType(q1, refIdTagType(_, _, r1)), tagType(q2, refIdTagType(_, _, r2)) -> r1 == r2 -- :) TODO: qualifiers?
  -- Compound types
  | atomicType(q1, t1), atomicType(q2, t2) -> compatibleTypes(t1, t2) && qualifiersSubtype(q2, q1)
  | pointerType(q1, p1), pointerType(q2, p2) -> compatibleTypes(p1, p2) && qualifiersSubtype(q2, q1)
  | arrayType(e1, q1, sm1, sub1), arrayType(e2, q2, sm2, sub2) -> compatibleTypes(e1, e2) && qualifiersSubtype(q2, q1)
      -- TODO: actually, should this include sub1/ sub2 at all? or those sm? maybe? probably. yeah, later, do that.
  | functionType(r1, noProtoFunctionType()),
    functionType(r2, noProtoFunctionType()) -> 
      compatibleTypes(r1, r2)
  | functionType(r1, protoFunctionType(a1, v1)),
    functionType(r2, protoFunctionType(a2, v2)) ->
      compatibleTypes(r1, r2) &&
        compatibleTypeList(a1, a2) &&
        v1 == v2
  | functionType(r1, _), functionType(r2, _) -> 
      compatibleTypes(r1, r2)
  -- extensions
  | vectorType(b1, s1), vectorType(b2, s2) -> s1 == s2 && compatibleTypes(b1, b2)
  -- otherwise
  | _, _ -> false
  end;
}

function compatibleTypeList
Boolean ::= a::[Type]  b::[Type]
{
  return if null(a) && null(b) then true
  else if null(a) || null(b) then false -- different lengths
  else compatibleTypes(head(a), head(b)) &&
         compatibleTypeList(tail(a), tail(b));
}

function usualAdditiveConversionsOnTypes
Type ::= a::Type  b::Type
{
  return case a, b of
  | builtinType(_, x), builtinType(_, y) ->
      case usualArithmeticConversions(x, y) of
      | nothing() -> errorType()
      | just(z) -> builtinType([], z) -- qualifiers?
      end
  -- TODO: these are not complete. they should be integers, etc.
  | pointerType(_, _), builtinType(_, _) -> a
  | builtinType(_, _), pointerType(_, _) -> a
  -- extensions
  | vectorType(b1, s1), vectorType(b2, s2) ->
      if compatibleTypes(b1, b2) && s1 == s2 then a else errorType() -- TODO: no idea
  | _, _ -> errorType()
  end;
}
function usualSubtractiveConversionsOnTypes
Type ::= a::Type  b::Type
{
  return case a, b of
  | builtinType(_, x), builtinType(_, y) ->
      case usualArithmeticConversions(x, y) of
      | nothing() -> errorType()
      | just(z) -> builtinType([], z) -- qualifiers?
      end
  -- TODO: these are not complete. they should be integers, etc.
  | pointerType(_, _), builtinType(_, _) -> a
  | builtinType(_, _), pointerType(_, _) -> a
  -- The special case for subtraction:
  | pointerType(_, _), pointerType(_, _) -> builtinType([], signedType(intType()))
  -- extensions
  | vectorType(b1, s1), vectorType(b2, s2) ->
      if compatibleTypes(b1, b2) && s1 == s2 then a else errorType() -- TODO: no idea
  | _, _ -> errorType()
  end;
}
function usualArithmeticConversionsOnTypes
Type ::= a::Type  b::Type
{
  return case a, b of
  | builtinType(_, x), builtinType(_, y) ->
      case usualArithmeticConversions(x, y) of
      | nothing() -> errorType()
      | just(z) -> builtinType([], z) -- qualifiers?
      end
  -- extensions
  | vectorType(b1, s1), vectorType(b2, s2) ->
      if compatibleTypes(b1, b2) && s1 == s2 then a else errorType() -- TODO: no idea
  | _, _ -> errorType()
  end;
}
function usualArithmeticConversions
Maybe<BuiltinType> ::= a::BuiltinType  b::BuiltinType
{
  return case a, b of
  | voidType(), _ -> nothing()
  | _, voidType() -> nothing()
  | realType(_), _ -> just(floatingConversion(a, b))
  | complexType(_), _ -> just(floatingConversion(a, b))
  | imaginaryType(_), _ -> just(floatingConversion(a, b))
  | _, realType(_) -> just(floatingConversion(b, a))
  | _, complexType(_) -> just(floatingConversion(b, a))
  | _, imaginaryType(_) -> just(floatingConversion(b, a))
  | _, _ -> just(integerConversion(a, b))
  end;
}

function floatingConversion
BuiltinType ::= a::BuiltinType  b::BuiltinType
{
  return case a, b of
  | realType(at),      realType(bt) ->      realType(realTypeConversion(at, bt))
  | realType(at),      complexType(bt) ->   complexType(realTypeConversion(at, bt))
  | realType(at),      imaginaryType(bt) -> complexType(realTypeConversion(at, bt))
  | complexType(at),   realType(bt) ->      complexType(realTypeConversion(at, bt))
  | complexType(at),   complexType(bt) ->   complexType(realTypeConversion(at, bt))
  | complexType(at),   imaginaryType(bt) -> complexType(realTypeConversion(at, bt))
  | imaginaryType(at), realType(bt) ->      complexType(realTypeConversion(at, bt))
  | imaginaryType(at), complexType(bt) ->   complexType(realTypeConversion(at, bt))
  | imaginaryType(at), imaginaryType(bt) -> imaginaryType(realTypeConversion(at, bt))
  -- If floating with non-floating type, just use the floating type.
  | realType(rt), _ -> a
  | complexType(rt), _ -> a
  | imaginaryType(rt), _ -> a
  -- Invariant: function always called with 'a' as one of these three contructors
  --| _, _ -> error("floating conversion called with " ++ show(100, a.pp) ++ " and " ++ show(100, b.pp))
  end;
}

function realTypeConversion
RealType ::= a::RealType  b::RealType
{
  return case a, b of
  | longdoubleType(), _ -> longdoubleType()
  | _, longdoubleType() -> longdoubleType()
  | floatType(), floatType() -> floatType()
  | _, _ -> doubleType()
  end;
}

function integerConversion
BuiltinType ::= a::BuiltinType  b::BuiltinType
{
  return case a.integerPromotionsBuiltin, b.integerPromotionsBuiltin of
  | signedType(at), signedType(bt) -> signedType(maximumConversionRank(at, bt))
  | signedType(at), unsignedType(bt) ->
      if at.integerConversionRank > bt.integerConversionRank then
        signedType(at)
      else
        unsignedType(bt)
  | unsignedType(at), signedType(bt) ->
      if at.integerConversionRank > bt.integerConversionRank then
        signedType(at)
      else
        unsignedType(bt)
  | unsignedType(at), unsignedType(bt) -> unsignedType(maximumConversionRank(at, bt))
  -- complex integer types:
  -- TODO: We don't have an "unsigned complex integer" type. Not sure if that's a bug or not
  -- considering it's not C anymore but gnu extension land. Since we don't even have syntax for
  -- '18ULI' yet, we'll just go with signed of whatever the larger is, complex type.
  | unsignedType(at), complexIntegerType(bt) -> complexIntegerType(maximumConversionRank(at, bt))
  | signedType(at), complexIntegerType(bt) -> complexIntegerType(maximumConversionRank(at, bt))
  | complexIntegerType(at), signedType(bt) -> complexIntegerType(maximumConversionRank(at, bt))
  | complexIntegerType(at), unsignedType(bt) -> complexIntegerType(maximumConversionRank(at, bt))
  | complexIntegerType(at), complexIntegerType(bt) -> complexIntegerType(maximumConversionRank(at, bt))
  -- No bools thanks to promotions, Invariant: always called with on of these three *only*
  end;
}

function maximumConversionRank
IntegerType ::= a::IntegerType  b::IntegerType
{
  return if a.integerConversionRank < b.integerConversionRank then b else a;
}


function builtinEq
Boolean ::= a::BuiltinType  b::BuiltinType
{
  return case a, b of
  | voidType(), voidType() -> true
  | boolType(), boolType() -> true
  | realType(r1), realType(r2) -> realTypeEq(r1, r2)
  | complexType(r1), complexType(r2) -> realTypeEq(r1, r2)
  | imaginaryType(r1), imaginaryType(r2) -> realTypeEq(r1, r2)
  | signedType(i1), signedType(i2) -> intTypeEq(i1, i2)
  | unsignedType(i1), unsignedType(i2) -> intTypeEq(i1, i2)
  | complexIntegerType(i1), complexIntegerType(i2) -> intTypeEq(i1, i2)
  | _, _ -> false
  end;
}

function realTypeEq
Boolean ::= a::RealType  b::RealType
{
  return case a, b of
  | floatType(), floatType() -> true
  | doubleType(), doubleType() -> true
  | longdoubleType(), longdoubleType() -> true
  | _, _ -> false
  end;
}

function intTypeEq
Boolean ::= a::IntegerType  b::IntegerType
{
  return case a, b of
  | charType(), charType() -> true
  | shortType(), shortType() -> true
  | intType(), intType() -> true
  | longType(), longType() -> true
  | longlongType(), longlongType() -> true
  | int128Type(), int128Type() -> true
  | _, _ -> false
  end;
}

function qualifiersSubtype
Boolean ::= q1::[Qualifier]  q2::[Qualifier]
{
  local pq1 :: [String] = map((.qualname), filter((.qualIsPositive), q1));
  local pq2 :: [String] = map((.qualname), filter((.qualIsPositive), q2));
  local nq1 :: [String] = map((.qualname), filter((.qualIsNegative), q1));
  local nq2 :: [String] = map((.qualname), filter((.qualIsNegative), q2));

  return qualSubset(pq1, pq2) && qualSubset(nq2, nq1);
}

function qualSubset
Boolean ::= a::[String] b::[String]
{
  return
    if   null(a)
    then true
    else containsBy(stringEq, head(a), b) && qualSubset(tail(a), b);
}

--function qualifiersEq
--Boolean ::= q1::[Qualifier]  q2::[Qualifier]
--{
--  return
--    qualifiersEqHelp(
--      sortBy(stringLte, map((.qualname), filter((.qualCheck), q1))),
--      sortBy(stringLte, map((.qualname), filter((.qualCheck), q2))));
--}

-- this code is frankly horrible, but hey, something to improve in the future, I suppose.
--function qualifiersEqHelp
--Boolean ::= q1::[String]  q2::[String]
--{
--  return case q1, q2 of
--  | "const" :: q1t, "const" :: q2t -> qualifiersEqHelp(q1t, q2t)
--  | "restrict" :: q1t, "restrict" :: q2t -> qualifiersEqHelp(q1t, q2t)
--  | "volatile" :: q1t, "volatile" :: q2t -> qualifiersEqHelp(q1t, q2t)
--  | [], [] -> true
--  | _, _ -> false
--  end;
--}


{--
 - True, if rval can be assigned to lval.
 -}
function typeAssignableTo
Boolean ::= lval::Type  rval::Type
{
--One of the following shall hold:112)
  return
-- the left operand has atomic, qualified, or unqualified arithmetic type, and the right has arithmetic type;
    if lval.isArithmeticType && rval.isArithmeticType then true
    else
    case lval of
    | errorType() -> true
    | _ -> false
    end ||
    case rval of
    | errorType() -> true
    | _ -> false
    end ||
-- the left operand has an atomic, qualified, or unqualified version of a structure or union type compatible with the type of the right;
    case lval.defaultFunctionArrayLvalueConversion of
    | tagType(_, _) -> compatibleTypes(lval.defaultFunctionArrayLvalueConversion, rval.defaultFunctionArrayLvalueConversion)
-- the left operand has atomic, qualified, or unqualified pointer type, and (considering the type the left operand would have after lvalue conversion) both operands are pointers to qualified or unqualified versions of compatible types, and the type pointed to by the left has all the qualifiers of the type pointed to by the right;
    | pointerType(_, _) -> compatibleTypes(lval, rval) -- TODO: sounds like a subsetting relation here for qualifiers!
-- the left operand is an atomic, qualified, or unqualified pointer, and the right is a null pointer constant; or
          || rval.defaultFunctionArrayLvalueConversion.isIntegerType -- TODO: well, accounting for zero here, I guess
-- the left operand has atomic, qualified, or unqualified pointer type, and (considering the type the left operand would have after lvalue conversion) one operand is a pointer to an object type, and the other is a pointer to a qualified or unqualified version of void, and the type pointed to by the left has all the qualifiers of the type pointed to by the right;
          || compatibleTypes(pointerType([], builtinType([], voidType())), rval.defaultFunctionArrayLvalueConversion)
    | pointerType(_, builtinType(_, voidType())) ->
        case rval.defaultFunctionArrayLvalueConversion of
        | pointerType(_, _) -> true
        | t -> t.isIntegerType -- TODO? nullptr
        end
  -- extensions
    | vectorType(b1, s1) ->
        case rval of
        | vectorType(b2, s2) ->
            compatibleTypes(b1, b2) && s1 == s2 -- TODO: no idea
        | _ -> false -- TODO also no idea
        end
-- the left operand has type atomic, qualified, or unqualified _Bool, and the right is a pointer.
    | _ ->
        case lval, rval.defaultFunctionArrayLvalueConversion of
        | builtinType(_, boolType()), pointerType(_, _) -> true
        | _, _ -> false
        end
    end;
}

{-- Tacks on qualifiers to a type at the outermost level -}
function addQualifiers
Type ::= qs::[Qualifier] base::Type
{
  base.addedTypeQualifiers = qs;
  return base.withTypeQualifiers;
}
