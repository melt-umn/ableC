grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

-- Some attributes for Type and BuiltinType.

-- RULE for using these: it must *ALWAYS* be the case than an error occurs if
-- the is* flag is FALSE.
-- i.e. if you need it both ways, there should be two attributes:
--   isTrue and isNotTrue.
-- Why? Because both of those will be true for *errorType*.
synthesized attribute isIntegerType :: Boolean; -- enum or integer builtin
synthesized attribute isArithmeticType :: Boolean; -- integer or floating (incl complex)
synthesized attribute isScalarType :: Boolean; -- pointers or arithmetic
synthesized attribute isCompleteType :: (Boolean ::= Decorated Env); -- test if we know the size of a type


function showType
String ::= t::Type
{
  return show(80, cat(t.lpp, t.rpp));
}


-- if allowSubtypes is false then check type equality; otherwise
--   return true if a is a supertype of b; otherwise false
-- if dropOuterQual is true then remove qualifiers with qualAppliesWithinRef=false
function compatibleTypes
Boolean ::= a::Type  b::Type  allowSubtypes::Boolean  dropOuterQual::Boolean
{
  return case a, b of
  -- Allow already raised errors to go by unbothered by more errors
  | errorType(), _ -> true
  | _, errorType() -> true
  -- Type specifiers
  | builtinType(q1, b1), builtinType(q2, b2) -> builtinCompatible(^b1, ^b2, allowSubtypes) && compatibleQualifiers(^q1, ^q2, allowSubtypes, dropOuterQual)
  | builtinType(q1, b1), extType(q2, enumExtType(_)) -> allowSubtypes && b1.isIntegerType && compatibleQualifiers(^q1, ^q2, allowSubtypes, dropOuterQual)
  | extType(q1, enumExtType(_)), builtinType(q2, b2) -> allowSubtypes && b2.isIntegerType && compatibleQualifiers(^q1, ^q2, allowSubtypes, dropOuterQual)
  | extType(q1, s1), extType(q2, s2) -> s1.isEqualTo(^s2) && compatibleQualifiers(^q1, ^q2, allowSubtypes, dropOuterQual)
  -- Compound types
  | atomicType(q1, t1), atomicType(q2, t2) -> compatibleTypes(^t1, ^t2, allowSubtypes, dropOuterQual) && compatibleQualifiers(^q1, ^q2, allowSubtypes, dropOuterQual)
  | pointerType(q1, p1), pointerType(q2, p2) ->
      compatibleTypes(^p1, ^p2, allowSubtypes && containsQualifier(constQualifier(), ^p1), false) &&
        compatibleQualifiers(^q1, ^q2, allowSubtypes, dropOuterQual)
  | arrayType(e1, q1, sm1, sub1), arrayType(e2, q2, sm2, sub2) -> compatibleTypes(^e1, ^e2, allowSubtypes, dropOuterQual) && compatibleQualifiers(^q1, ^q2, allowSubtypes, dropOuterQual)
      -- TODO: actually, should this include sub1/ sub2 at all? or those sm? maybe? probably. yeah, later, do that.
  | functionType(r1, noProtoFunctionType(), q1),
    functionType(r2, noProtoFunctionType(), q2) -> 
      compatibleTypes(^r1, ^r2, allowSubtypes, true) && compatibleQualifiers(^q1, ^q2, allowSubtypes, dropOuterQual)
  | functionType(r1, protoFunctionType(a1, v1), q1),
    functionType(r2, protoFunctionType(a2, v2), q2) ->
      compatibleTypes(^r1, ^r2, false, false) &&
        compatibleTypeList(
          map((.defaultFunctionArrayLvalueConversion), a1),
          map((.defaultFunctionArrayLvalueConversion), a2),
          false, true) &&
        compatibleQualifiers(^q1, ^q2, allowSubtypes, dropOuterQual) &&
        v1 == v2
  | functionType(r1, _, q1), functionType(r2, _, q2) -> 
      compatibleTypes(^r1, ^r2, allowSubtypes, dropOuterQual) &&
        compatibleQualifiers(^q1, ^q2, allowSubtypes, dropOuterQual)
  -- extensions
  | attributedType(_, t1), attributedType(_, t2) -> compatibleTypes(^t1, ^t2, allowSubtypes, dropOuterQual)
  | attributedType(_, t1), t2 -> compatibleTypes(^t1, ^t2, allowSubtypes, dropOuterQual)
  | t1, attributedType(_, t2) -> compatibleTypes(^t1, ^t2, allowSubtypes, dropOuterQual)
  | vectorType(b1, s1), vectorType(b2, s2) -> s1 == s2 && compatibleTypes(^b1, ^b2, allowSubtypes, dropOuterQual)
  -- otherwise
  | noncanonicalType(s1), _ -> compatibleTypes(s1.canonicalType, ^b, allowSubtypes, dropOuterQual)
  | _, noncanonicalType(s2) -> compatibleTypes(^a, s2.canonicalType, allowSubtypes, dropOuterQual)
  -- atomics
  | atomicType(q1, t1), _ -> compatibleTypes((decorate ^t1 with {addedTypeQualifiers=q1.qualifiers;}).withTypeQualifiers, ^b, allowSubtypes, dropOuterQual)
  | _, atomicType(q2, t2) -> compatibleTypes(^a, (decorate ^t2 with {addedTypeQualifiers=q2.qualifiers;}).withTypeQualifiers, allowSubtypes, dropOuterQual)
  | _, _ -> false
  end;
}

fun compatibleTypeList
Boolean ::= a::[Type]  b::[Type]  allowSubtypes::Boolean  dropOuterQual::Boolean =
  if null(a) && null(b) then true
else if null(a) || null(b) then false -- different lengths
else compatibleTypes(head(a), head(b), allowSubtypes, dropOuterQual) &&
  compatibleTypeList(tail(a), tail(b), allowSubtypes, dropOuterQual);

function usualAdditiveConversionsOnTypes
Type ::= a::Type  b::Type
{
  return case a.defaultFunctionArrayLvalueConversion, b.defaultFunctionArrayLvalueConversion of
  | builtinType(_, x), builtinType(_, y) ->
      case usualArithmeticConversions(^x, ^y) of
      | nothing() -> errorType()
      | just(z) -> builtinType(nilQualifier(), z) -- qualifiers?
      end
  -- TODO: these are not complete. they should be integers, etc.
  | pointerType(_, _), builtinType(_, _) -> ^a
  | builtinType(_, _), pointerType(_, _) -> ^b
  -- extensions
  | vectorType(b1, s1), vectorType(b2, s2) ->
      if compatibleTypes(^b1, ^b2, true, false) && s1 == s2 then ^a else errorType() -- TODO: no idea
  | _, _ -> errorType()
  end;
}
function usualSubtractiveConversionsOnTypes
Type ::= a::Type  b::Type
{
  return case a.defaultFunctionArrayLvalueConversion, b.defaultFunctionArrayLvalueConversion of
  | builtinType(_, x), builtinType(_, y) ->
      case usualArithmeticConversions(^x, ^y) of
      | nothing() -> errorType()
      | just(z) -> builtinType(nilQualifier(), z) -- qualifiers?
      end
  -- TODO: these are not complete. they should be integers, etc.
  | pointerType(_, _), builtinType(_, _) -> ^a
  | builtinType(_, _), pointerType(_, _) -> ^b
  -- The special case for subtraction:
  | pointerType(_, _), pointerType(_, _) -> builtinType(nilQualifier(), signedType(intType()))
  -- extensions
  | vectorType(b1, s1), vectorType(b2, s2) ->
      if compatibleTypes(^b1, ^b2, true, false) && s1 == s2 then ^a else errorType() -- TODO: no idea
  | _, _ -> errorType()
  end;
}
function usualArithmeticConversionsOnTypes
Type ::= a::Type  b::Type
{
  return case a, b of
  | builtinType(_, x), builtinType(_, y) ->
      case usualArithmeticConversions(^x, ^y) of
      | nothing() -> errorType()
      | just(z) -> builtinType(nilQualifier(), z) -- qualifiers?
      end
  -- extensions
  | vectorType(b1, s1), vectorType(b2, s2) ->
      if compatibleTypes(^b1, ^b2, true, false) && s1 == s2 then ^a else errorType() -- TODO: no idea
  | _, _ -> errorType()
  end;
}
function usualArithmeticConversions
Maybe<BuiltinType> ::= a::BuiltinType  b::BuiltinType
{
  return case a, b of
  | voidType(), _ -> nothing()
  | _, voidType() -> nothing()
  | realType(_), _ -> just(floatingConversion(^a, ^b))
  | complexType(_), _ -> just(floatingConversion(^a, ^b))
  | imaginaryType(_), _ -> just(floatingConversion(^a, ^b))
  | _, realType(_) -> just(floatingConversion(^b, ^a))
  | _, complexType(_) -> just(floatingConversion(^b, ^a))
  | _, imaginaryType(_) -> just(floatingConversion(^b, ^a))
  | _, _ -> just(integerConversion(^a, ^b))
  end;
}

function floatingConversion
BuiltinType ::= a::BuiltinType  b::BuiltinType
{
  return case a, b of
  | realType(at),      realType(bt) ->      realType(realTypeConversion(^at, ^bt))
  | realType(at),      complexType(bt) ->   complexType(realTypeConversion(^at, ^bt))
  | realType(at),      imaginaryType(bt) -> complexType(realTypeConversion(^at, ^bt))
  | complexType(at),   realType(bt) ->      complexType(realTypeConversion(^at, ^bt))
  | complexType(at),   complexType(bt) ->   complexType(realTypeConversion(^at, ^bt))
  | complexType(at),   imaginaryType(bt) -> complexType(realTypeConversion(^at, ^bt))
  | imaginaryType(at), realType(bt) ->      complexType(realTypeConversion(^at, ^bt))
  | imaginaryType(at), complexType(bt) ->   complexType(realTypeConversion(^at, ^bt))
  | imaginaryType(at), imaginaryType(bt) -> imaginaryType(realTypeConversion(^at, ^bt))
  -- If floating with non-floating type, just use the floating type.
  | realType(rt), _ -> a
  | complexType(rt), _ -> a
  | imaginaryType(rt), _ -> a
  -- Invariant: function always called with 'a' as one of these three contructors
  | _, _ -> error("floating conversion called with " ++ show(100, a.pp) ++ " and " ++ show(100, b.pp))
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
  | signedType(at), signedType(bt) -> signedType(maximumConversionRank(^at, ^bt))
  | signedType(at), unsignedType(bt) ->
      if at.integerConversionRank > bt.integerConversionRank then
        signedType(^at)
      else
        unsignedType(^bt)
  | unsignedType(at), signedType(bt) ->
      if at.integerConversionRank > bt.integerConversionRank then
        signedType(^at)
      else
        unsignedType(^bt)
  | unsignedType(at), unsignedType(bt) -> unsignedType(maximumConversionRank(^at, ^bt))
  -- complex integer types:
  -- TODO: We don't have an "unsigned complex integer" type. Not sure if that's a bug or not
  -- considering it's not C anymore but gnu extension land. Since we don't even have syntax for
  -- '18ULI' yet, we'll just go with signed of whatever the larger is, complex type.
  | unsignedType(at), complexIntegerType(bt) -> complexIntegerType(maximumConversionRank(^at, ^bt))
  | signedType(at), complexIntegerType(bt) -> complexIntegerType(maximumConversionRank(^at, ^bt))
  | complexIntegerType(at), signedType(bt) -> complexIntegerType(maximumConversionRank(^at, ^bt))
  | complexIntegerType(at), unsignedType(bt) -> complexIntegerType(maximumConversionRank(^at, ^bt))
  | complexIntegerType(at), complexIntegerType(bt) -> complexIntegerType(maximumConversionRank(^at, ^bt))
  -- No bools thanks to promotions, Invariant: always called with on of these three *only*
  | _, _ -> error("integer conversion called with " ++ show(100, a.pp) ++ " and " ++ show(100, b.pp))
  end;
}

function maximumConversionRank
IntegerType ::= a::IntegerType  b::IntegerType
{
  return if a.integerConversionRank < b.integerConversionRank then ^b else ^a;
}


function builtinCompatible
Boolean ::= a::BuiltinType  b::BuiltinType  allowSubtypes::Boolean
{
  return
    (allowSubtypes && a.isArithmeticType && b.isArithmeticType) ||
    case a, b of
    | voidType(), voidType() -> true
    | boolType(), boolType() -> true
    | realType(r1), realType(r2) -> realTypeEq(^r1, ^r2)
    | complexType(r1), complexType(r2) -> realTypeEq(^r1, ^r2)
    | imaginaryType(r1), imaginaryType(r2) -> realTypeEq(^r1, ^r2)
    | signedType(i1), signedType(i2) -> intTypeEq(^i1, ^i2)
    | unsignedType(i1), unsignedType(i2) -> intTypeEq(^i1, ^i2)
    | complexIntegerType(i1), complexIntegerType(i2) -> intTypeEq(^i1, ^i2)
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

-- if allowSubtypes is false then check qualifier equality; otherwise
--   return true if q1 T is a supertype of q2 T, for some type T; otherwise false
function compatibleQualifiers
Boolean ::= q1::Qualifiers  q2::Qualifiers  allowSubtypes::Boolean  dropOuterQual::Boolean
{
  local q1Filtered :: [Qualifier] =
    if   dropOuterQual
    then filter((.qualAppliesWithinRef), q1.qualifiers)
    else q1.qualifiers;
  local q2Filtered :: [Qualifier] =
    if   dropOuterQual
    then filter((.qualAppliesWithinRef), q2.qualifiers)
    else q2.qualifiers;

  -- ignore allowSubtypes for builtin qualifiers: standard C seems to allow deep
  --   subtyping for all qualifiers including volatile and restrict
  local q1FilteredHost :: [Qualifier] = filter(\q :: Qualifier -> !q.qualIsHost, q1Filtered);
  local q2FilteredHost :: [Qualifier] = filter(\q :: Qualifier -> !q.qualIsHost, q2Filtered);

  return qualifiersSubtype(q2Filtered, q1Filtered) &&
           (allowSubtypes || qualifiersSubtype(q1FilteredHost, q2FilteredHost));
}

-- return true if q1 T is a subtype of q2 T, for some type T; otherwise false
function qualifiersSubtype
Boolean ::= q1::[Qualifier]  q2::[Qualifier]
{
  local inQ1notQ2 :: [Qualifier] =
    filter(\q::Qualifier -> !containsBy(qualifierCompat, q, q2), q1);
  local inQ2notQ1 :: [Qualifier] =
    filter(\q::Qualifier -> !containsBy(qualifierCompat, q, q1), q2);

  -- all extra qualifiers in q1 must be negative
  -- all extra qualifiers in q2 must be positive
  return foldr(\a::Boolean b::Boolean -> a && b, true, map((.qualIsNegative), inQ1notQ2)) &&
    foldr(\a::Boolean b::Boolean -> a && b, true, map((.qualIsPositive), inQ2notQ1));
}

function qualifierCompat
Boolean ::= a::Qualifier b::Qualifier
{
  return a.qualCompat(^b);
}

{--
 - True, if rval can be assigned to lval.
 -}
function typeAssignableTo
Boolean ::= lval::Type  rval::Type
{
--One of the following shall hold:112)
  return
-- the left operand has atomic, qualified, or unqualified arithmetic type, and the right has arithmetic type;
    if lval.isArithmeticType && rval.isArithmeticType then compatibleTypes(^lval, ^rval, true, true)
    else
    case lval of
    | errorType() -> true
    | _ -> false
    end ||
    case rval of
    | errorType() -> true
    | _ -> false
    end ||

    case lval, rval of
-- the left operand has an atomic, qualified, or unqualified version of a structure, enum, union or extension type compatible with the type
    | extType(_, _), _ -> compatibleTypes(lval.defaultFunctionArrayLvalueConversion, rval.defaultFunctionArrayLvalueConversion, true, true)
-- the left operand has atomic, qualified, or unqualified pointer type, and (considering the type the left operand would have after lvalue conversion) both operands are pointers to qualified or unqualified versions of compatible types, and the type pointed to by the left has all the qualifiers of the type pointed to by the right;
    | pointerType(q1, p1), _ when rval.defaultFunctionArrayLvalueConversion matches pointerType(q2, p2) ->
        (compatibleTypes(^p1, ^p2, containsQualifier(constQualifier(), ^p1), false) ||
          compatibleTypes(
            pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())),
            rval.defaultFunctionArrayLvalueConversion,
            true, true
          ) ||
          case p1 of
          | builtinType(_, voidType()) -> true
          | _ -> false
          end
        ) && compatibleQualifiers(^q1, ^q2, true, true)
    | pointerType(q1, p1), _ ->
-- the left operand is an atomic, qualified, or unqualified pointer, and the right is a null pointer constant; or
        -- TODO: well, accounting for zero here, I guess
        rval.defaultFunctionArrayLvalueConversion.isIntegerType ||
-- the left operand has atomic, qualified, or unqualified pointer type, and (considering the type the left operand would have after lvalue conversion) one operand is a pointer to an object type, and the other is a pointer to a qualified or unqualified version of void, and the type pointed to by the left has all the qualifiers of the type pointed to by the right;
          compatibleTypes(
            pointerType(nilQualifier(), builtinType(nilQualifier(), voidType())),
            rval.defaultFunctionArrayLvalueConversion,
            true, true
          ) ||
          case p1 of
          | builtinType(_, voidType()) ->
              case rval.defaultFunctionArrayLvalueConversion of
              | pointerType(_, _) -> true
              | t -> t.isIntegerType -- TODO? nullptr
              end
          | _ -> false
          end
        -- TODO: handle qualifiers when casting rhs 0 or void
  -- extensions
  -- ignore type attributes that don't have a specialized representation (e.g. vector)
    | attributedType(_, t1), attributedType(_, t2) -> typeAssignableTo(^t1, ^t2)
    | attributedType(_, t1), t2 -> typeAssignableTo(^t1, ^t2)
    | t1, attributedType(_, t2) -> typeAssignableTo(^t1, ^t2)

    | vectorType(b1, s1), vectorType(b2, s2) ->
            compatibleTypes(^b1, ^b2, true, true) && s1 == s2 -- TODO: no idea
-- the left operand has type atomic, qualified, or unqualified _Bool, and the right is a pointer.
    | builtinType(_, boolType()), _ when rval.defaultFunctionArrayLvalueConversion matches pointerType(_, _) -> true
    | _, _ -> false
    end;
}

{-- Tacks on qualifiers to a type at the outermost level,
    without adding duplicates -}
function addQualifiers
Type ::= qs::[Qualifier] base::Type
{
  base.addedTypeQualifiers = filter(
      \q::Qualifier -> !containsBy(qualifierCompat, q, base.qualifiers),
      nubBy(qualifierCompat, qs));
  return base.withTypeQualifiers;
}

fun repeatInfinite [a] ::= x::a = x :: repeatInfinite(x);

function objectMembers
Maybe<[Type]> ::= env::Decorated Env t::Type
{
  return
    case t of
    | arrayType(e, _, _, constantArrayType(size)) -> just(repeat(e, size))
    | arrayType(e, _, _, incompleteArrayType()) -> just(repeatInfinite(e))
    | extType(_, sub) when sub.maybeRefId matches just(refId) ->
      case lookupRefId(refId, env) of
      | r :: _ ->
        just(
          map(
            \ f::Either<String ExtType> ->
              case f of
              | left(fn) -> head(lookupValue(fn, r.tagEnv)).typerep
              | right(e) -> extType(nilQualifier(), e)
              end,
            r.fieldNames))
      | [] -> just([]) -- Don't know the members yet, but still not a scalar
      end
    | extType(_, _) -> just([]) -- May translate into an object type, so don't treat as scalar
    | _ -> nothing()
    end;
}

function remainingObjectMembers
Maybe<[Type]> ::= env::Decorated Env expected::Type actual::Type
{
  return
    if typeAssignableTo(^expected, ^actual)
    then just([])
    else do {
      ts1 :: [Type] <- objectMembers(env, ^expected);
      if null(ts1) then nothing() else do {
        ts2 :: [Type] <- remainingObjectMembers(env, head(ts1), ^actual);
        return ts2 ++ tail(ts1);
      };
    };
}

function objectTagEnv
Decorated Env ::= env::Decorated Env t::Type
{
  return
    case t of
    | extType(_, sub) when sub.maybeRefId matches just(refId) ->
      case lookupRefId(refId, env) of
      | r :: _ -> r.tagEnv
      | [] -> emptyEnv()
      end
    | _ -> emptyEnv()
    end;
}
