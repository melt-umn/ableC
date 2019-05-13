grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

{--
 - Type representations, with qualifiers on appropriate constructors,
 - distinct from type expressions which are environment-independent.
 -
 - host is included, we might want that, but lifted doesn't make sense in this context.
 -
 - Variants: builtin, pointer, array, function, tagged, noncanonical.
 - Noncanonical forwards, and so doesn't need any attributes, etc attached to it.
 -}
nonterminal Type with lpp, rpp, host<Type>, canonicalType<Type>, baseTypeExpr, typeModifierExpr, mangledName, integerPromotions, defaultArgumentPromotions, defaultLvalueConversion, defaultFunctionArrayLvalueConversion, isIntegerType, isScalarType, isArithmeticType, isCompleteType, maybeRefId, withoutAttributes, withoutTypeQualifiers, withoutExtensionQualifiers<Type>, withTypeQualifiers, addedTypeQualifiers, qualifiers, mergeQualifiers<Type>, errors, freeVariables;
flowtype Type = decorate {}, canonicalType {}, baseTypeExpr {}, typeModifierExpr {}, integerPromotions {}, defaultArgumentPromotions {}, defaultLvalueConversion {}, defaultFunctionArrayLvalueConversion {}, isIntegerType {}, isScalarType {}, isArithmeticType {}, isCompleteType {}, maybeRefId {}, withoutAttributes {}, withoutTypeQualifiers {}, withoutExtensionQualifiers {}, withTypeQualifiers {addedTypeQualifiers}, qualifiers {}, mergeQualifiers {};

-- Transform away noncanonical types such as typedefs, etc. while preserving extension types
synthesized attribute canonicalType<a> :: a;

-- Used to turn a Type back into a TypeName
synthesized attribute baseTypeExpr :: BaseTypeExpr;
synthesized attribute typeModifierExpr :: TypeModifierExpr;

-- Compute a unique name for a type that is a valid C identifier
synthesized attribute mangledName :: String;
flowtype mangledName {} on
  Type, FunctionType, ExtType, StructOrEnumOrUnion,
  Qualifiers, Qualifier,
  BuiltinType, RealType, IntegerType,
  NumericConstant;

-- char -> int and stuff in operations
synthesized attribute integerPromotions :: Type;
-- float -> double for variadic args
synthesized attribute defaultArgumentPromotions :: Type;
-- drop qualifiers and attributes
synthesized attribute defaultLvalueConversion :: Type;
-- conversion to pointers
synthesized attribute defaultFunctionArrayLvalueConversion :: Type;

-- Strip top-level only of GCC __attribute__s from the type
synthesized attribute withoutAttributes :: Type;

-- Strip top-level only of qualifiers from the type
synthesized attribute withoutTypeQualifiers :: Type;

-- Strip non-host qualifiers from all levels of the type
synthesized attribute withoutExtensionQualifiers<a> :: a;

-- To support accumulation of extension qualifiers on redeclaration
synthesized attribute mergeQualifiers<a> :: (a ::= a);

-- Used in addQualifiers to add qualifiers to a type
synthesized attribute withTypeQualifiers :: Type;
inherited attribute addedTypeQualifiers :: [Qualifier];

aspect default production
top::Type ::=
{
  top.withoutAttributes = top;
  top.withoutTypeQualifiers = top;
  top.withTypeQualifiers = top;
  
  top.isIntegerType = false;
  top.isScalarType = false;
  top.isArithmeticType = false;
  top.isCompleteType = \ Decorated Env -> true;
  top.maybeRefId = nothing();
}

{-------------------------------------------------------------------------------
 - An error occurred while trying to construct the type.
 - Typically, this should be considered "compatible" with any type: an error
 - has already been raised, further errors are redundant.
 -}
abstract production errorType
top::Type ::=
{
  propagate host, canonicalType;
  top.lpp = text("/*err*/");
  top.rpp = text("");
  top.baseTypeExpr = errorTypeExpr([]);
  top.typeModifierExpr = baseTypeExpr();
  top.mangledName = "error";
  top.integerPromotions = top;
  top.defaultArgumentPromotions = top;
  top.defaultLvalueConversion = top;
  top.defaultFunctionArrayLvalueConversion = top;
  top.withoutTypeQualifiers = top;
  top.withoutExtensionQualifiers = top;
  top.mergeQualifiers = \t2::Type -> errorType();
  top.qualifiers = [];
  top.errors := [];
  top.freeVariables := [];

  -- The semantics for all flags is that they should be TRUE is no error is to be
  -- raised. Thus, all should be true here, to suppress errors.
  top.isIntegerType = true;
  top.isScalarType = true;
  top.isArithmeticType = true;
}


{-------------------------------------------------------------------------------
 - Builtin C types: void, unsigned int, signed char, float, bool, etc.
 - also includes complex numbers e.g. 'float _Complex'
 -}
abstract production builtinType
top::Type ::= q::Qualifiers  bt::BuiltinType
{
  propagate host, canonicalType;
  top.lpp =
    ppConcat([terminate(space(), q.pps), bt.pp]);
  top.rpp = notext();
  top.baseTypeExpr = builtinTypeExpr(q, bt);
  top.typeModifierExpr = baseTypeExpr();
  top.mangledName = s"${q.mangledName}_builtin_${bt.mangledName}_";
  top.integerPromotions = builtinType(q, bt.integerPromotionsBuiltin);
  top.defaultArgumentPromotions = builtinType(q, bt.defaultArgumentPromotionsBuiltin);
  top.defaultLvalueConversion = builtinType(nilQualifier(), bt);
  top.defaultFunctionArrayLvalueConversion = top;
  top.isIntegerType = bt.isIntegerType;
  top.isArithmeticType = bt.isArithmeticType;
  top.isScalarType = bt.isArithmeticType;
  top.withoutTypeQualifiers = builtinType(nilQualifier(), bt);
  top.withoutExtensionQualifiers = builtinType(filterExtensionQualifiers(q), bt);
  top.withTypeQualifiers = builtinType(foldQualifier(top.addedTypeQualifiers ++
    q.qualifiers), bt);
  top.mergeQualifiers = \t2::Type ->
    case t2 of
      builtinType(q2, bt2) -> builtinType(unionQualifiers(top.qualifiers, q2.qualifiers), bt)
    | _ -> builtinType(q, bt)
    end;
  top.qualifiers = q.qualifiers;
  top.errors := q.errors;
  q.typeToQualify = top;
  top.freeVariables := [];
}


{-------------------------------------------------------------------------------
 - Pointer to another type.
 - e.g.  'const int * foo' is pointer([], builtin([const], int)).
 - while 'int * const foo' is pointer([const], builtin([], int)).
 -}
abstract production pointerType
top::Type ::= q::Qualifiers  target::Type
{
  propagate host, canonicalType;
  
  local wrapTarget::Boolean = 
    case target of
      noncanonicalType(parenType(_)) -> false
    | noncanonicalType(typedefType(_, _, _)) -> false
    | noncanonicalType(typeofType(_, _)) -> false
    | arrayType(_, _, _, _) -> true
    | functionType(_, _, _) -> true
    | _ -> false
    end;
  top.lpp =
    ppConcat([
      target.lpp, space(),
      if wrapTarget then text("(*") else text("*"),
      space(), ppImplode(space(), q.pps)]);
  top.rpp = cat(if wrapTarget then text(")") else notext(), target.rpp);
  top.baseTypeExpr = target.baseTypeExpr;
  top.typeModifierExpr = pointerTypeExpr(q, target.typeModifierExpr);
  top.mangledName = s"${q.mangledName}_pointer_${target.mangledName}_";
  top.integerPromotions = top;
  top.defaultArgumentPromotions = top;
  top.defaultLvalueConversion = pointerType(nilQualifier(), target);
  top.defaultFunctionArrayLvalueConversion = top;
  top.withoutTypeQualifiers = pointerType(nilQualifier(), target);
  top.withoutExtensionQualifiers = pointerType(filterExtensionQualifiers(q), target.withoutExtensionQualifiers);
  top.withTypeQualifiers = pointerType(foldQualifier(top.addedTypeQualifiers ++
    q.qualifiers), target);
  top.mergeQualifiers = \t2::Type ->
    case t2 of
      pointerType(q2, target2) ->
        pointerType(unionQualifiers(top.qualifiers, q2.qualifiers), target.mergeQualifiers(target2))
    | _ -> pointerType(q, target)
    end;
  top.qualifiers = q.qualifiers;
  top.errors := q.errors ++ target.errors;
  
  top.isScalarType = true;
  q.typeToQualify = top;
  top.freeVariables := target.freeVariables;
}


{-------------------------------------------------------------------------------
 - Arrays
 -
 - @param element  The array element type. e.g. int for 'array of int'
 - @param sub  Constant, variable, or incomplete array size?
 -
 - The following are *only* valid in function parameter types (at the 'top' of the type):
 -
 - @param indexQualifiers  Qualifiers to attach to a decayed pointer type
 -          e.g. 'char foo[restrict 10]' decays to a 'restrict char *'
 - @param sizeModifier  None, typically, but may be 'static' or 'star'
 -          star is further valid only in function *prototypes* not even definitions.
 -          star means "is a complete array type, but I'm not saying how here"
 -          static means "must be an array with this many elements"
 -
 - It'd be nice to make these "noncanonical" somehow, but I'm not sure how.
 - They actually do matter for the purposes of checking 'compatible types' for
 - example, which kinda makes them canonical, even if they never appear outside
 - function parameters.
 -}
abstract production arrayType
top::Type ::= element::Type  indexQualifiers::Qualifiers  sizeModifier::ArraySizeModifier  sub::ArrayType
{
  propagate host, canonicalType;
  top.lpp = element.lpp;
  
  top.rpp = cat(brackets(ppConcat([
    terminate(space(), indexQualifiers.pps ++ sizeModifier.pps),
    sub.pp
    ])), element.rpp);
  top.baseTypeExpr = element.baseTypeExpr;
  top.typeModifierExpr =
    case sub of
      constantArrayType(size) ->
        arrayTypeExprWithExpr(
          element.typeModifierExpr,
          indexQualifiers,
          sizeModifier,
          mkIntConst(size, bogusLoc())) -- TODO: location
    | incompleteArrayType() ->
        arrayTypeExprWithoutExpr(
          element.typeModifierExpr,
          indexQualifiers,
          sizeModifier)
    | variableArrayType(size) ->
        arrayTypeExprWithExpr(
          element.typeModifierExpr,
          indexQualifiers,
          sizeModifier,
          new(size))
    end;
  top.mangledName = top.defaultFunctionArrayLvalueConversion.mangledName; -- TODO?
  top.integerPromotions = top;
  top.defaultArgumentPromotions = top;
  top.defaultLvalueConversion = top;
  top.defaultFunctionArrayLvalueConversion = 
    noncanonicalType(decayedType(top,
      pointerType(indexQualifiers, element)));
  top.withoutExtensionQualifiers = arrayType(element.withoutExtensionQualifiers, filterExtensionQualifiers(indexQualifiers), sizeModifier, sub);
  top.mergeQualifiers = \t2::Type ->
    case t2 of
      arrayType(element2, q2, _, _) ->
        arrayType(element.mergeQualifiers(element2),
          unionQualifiers(top.qualifiers, q2.qualifiers), sizeModifier, sub)
    | _ -> arrayType(element, indexQualifiers, sizeModifier, sub)
    end;
  top.qualifiers = indexQualifiers.qualifiers;
  top.errors := element.errors ++ indexQualifiers.errors;
  top.freeVariables := element.freeVariables ++ sub.freeVariables;
  indexQualifiers.typeToQualify = top;
}

{-- The subtypes of arrays -}
nonterminal ArrayType with pp, host<ArrayType>, freeVariables;
flowtype ArrayType = decorate {};

abstract production constantArrayType
top::ArrayType ::= size::Integer
{
  propagate host;
  top.pp = text(toString(size));
  top.freeVariables := [];
  -- TODO: include the Decorated Expr here too maybe?
}
abstract production incompleteArrayType
top::ArrayType ::=
{
  propagate host;
  top.pp = notext();
  top.freeVariables := [];
}
abstract production variableArrayType
top::ArrayType ::= size::Decorated Expr
{
  top.host =
    variableArrayType(
      decorate size.host with {env = size.env; returnType = size.returnType;});
  top.pp = size.pp;
  top.freeVariables := size.freeVariables;
}

{-- Modifiers attached to array types that are function parameters -}
nonterminal ArraySizeModifier with pps;
flowtype ArraySizeModifier = decorate {};

{-- Normal array. -}
abstract production normalArraySize
top::ArraySizeModifier ::= { top.pps = []; }
{-- Array must have at least this many arguments -}
abstract production staticArraySize
top::ArraySizeModifier ::= { top.pps = [text("static")]; }
{-- Array of unknown but fixed size. Valid only in prototypes, not definitions. -}
abstract production starArraySize
top::ArraySizeModifier ::= { top.pps = [text("*")]; }


{-------------------------------------------------------------------------------
 - Functions (with or without args)
 - Evidentally, old-style K&R function *types* do not contain any information
 - about parameter types. Not even number.
 -}
abstract production functionType
top::Type ::= result::Type  sub::FunctionType  q::Qualifiers
{
  propagate host, canonicalType, withoutExtensionQualifiers;
  --TODO should this space be here? also TODO: ordering? result lpp before sub.lpp maybe? TODO: actually sub.lpp is always nothing. FIXME
  top.lpp = ppConcat([ sub.lpp, space(), result.lpp ]);
  top.rpp = cat(sub.rpp, result.rpp);
  top.baseTypeExpr = result.baseTypeExpr;
  top.typeModifierExpr =
    case sub of
      protoFunctionType(args, variadic) ->
        functionTypeExprWithArgs(result.typeModifierExpr, argTypesToParameters(args), variadic, q)
    | noProtoFunctionType() ->
        functionTypeExprWithoutArgs(result.typeModifierExpr, [], q)
    end;
  top.mangledName = s"function_${result.mangledName}_${sub.mangledName}_";
  top.integerPromotions = top;
  top.defaultArgumentPromotions = top;
  top.defaultLvalueConversion = top;
  top.defaultFunctionArrayLvalueConversion =
    noncanonicalType(decayedType(top,
      pointerType(nilQualifier(), top)));
  top.mergeQualifiers = \t2::Type ->
    case t2 of
      functionType(result2, sub2, q2) ->
        functionType(result.mergeQualifiers(result2), sub.mergeQualifiers(sub2), unionQualifiers(q.qualifiers, q2.qualifiers))
    | _ -> functionType(result, sub, q)
    end;
  top.qualifiers = q.qualifiers;
  top.errors := result.errors ++ sub.errors;
  top.freeVariables := result.freeVariables ++ sub.freeVariables;
}

{-- The subtypes of functions -}
nonterminal FunctionType with lpp, rpp, host<FunctionType>, canonicalType<FunctionType>, mangledName, withoutExtensionQualifiers<FunctionType>, mergeQualifiers<FunctionType>, errors, freeVariables;
flowtype FunctionType = decorate {}, canonicalType {};
-- clang has an 'extinfo' structure with calling convention, noreturn, 'produces'?, regparam

abstract production protoFunctionType
top::FunctionType ::= args::[Type]  variadic::Boolean
{
  top.host = protoFunctionType(map(\t::Type -> t.host, args), variadic);
  top.canonicalType = protoFunctionType(map(\t::Type -> t.canonicalType, args), variadic);
  top.withoutExtensionQualifiers = protoFunctionType(map(\t::Type -> t.withoutExtensionQualifiers, args), variadic);
  top.mergeQualifiers = \t2::FunctionType ->
    case t2 of
      protoFunctionType(args2, _) ->
        protoFunctionType(zipWith(\arg1::Type arg2::Type -> arg1.mergeQualifiers(arg2), args, args2), variadic)
    | _ -> protoFunctionType(args, variadic)
    end;
  top.lpp = notext();
  top.rpp = parens(
    if null(args) then
      text("void")
    else
      ppImplode(text(", "), argpp)
    );
  local argpp :: [Document] =
    zipWith(cat,
      map((.lpp), args),
      map((.rpp), args)) ++ if variadic then [text("...")] else [];
  top.mangledName = implode("_", map((.mangledName), args)) ++ if variadic then "_variadic" else "";
  top.errors := concat(map((.errors), args));
  top.freeVariables := concat(map((.freeVariables), args));
}
-- Evidently, old K&R C functions don't have args as part of function type
abstract production noProtoFunctionType
top::FunctionType ::=
{
  propagate host, canonicalType, withoutExtensionQualifiers;
  top.mergeQualifiers = \t2::FunctionType -> noProtoFunctionType();
  top.lpp = notext();
  top.rpp = text("()");
  top.mangledName = "noproto";
  top.errors := [];
  top.freeVariables := [];
}

function argTypesToParameters
Parameters ::= args::[Type]
{
  return
    case args of
      h :: t ->
        consParameters(
          parameterDecl(nilStorageClass(), directTypeExpr(h), baseTypeExpr(), nothingName(), nilAttribute()),
          argTypesToParameters(t))
    | [] -> nilParameters()
    end;
}

{-------------------------------------------------------------------------------
 - "New" types: structs, unions and enums, but also new types defined by extensions.
 -}

abstract production extType
top::Type ::= q::Qualifiers  sub::ExtType
{
  propagate canonicalType;
  top.lpp = sub.lpp;
  top.rpp = sub.rpp;
  top.host = sub.host;
  top.baseTypeExpr = sub.baseTypeExpr;
  top.typeModifierExpr = sub.typeModifierExpr;
  top.mangledName = s"${q.mangledName}_${sub.mangledName}_";
  top.integerPromotions = sub.integerPromotions;
  top.defaultArgumentPromotions = sub.defaultArgumentPromotions;
  top.defaultLvalueConversion = sub.defaultLvalueConversion;
  top.defaultFunctionArrayLvalueConversion = sub.defaultFunctionArrayLvalueConversion;
  top.withoutTypeQualifiers = extType(nilQualifier(), sub);
  top.withoutExtensionQualifiers = extType(filterExtensionQualifiers(q), sub);
  top.withTypeQualifiers = extType(foldQualifier(top.addedTypeQualifiers ++
    q.qualifiers), sub);
  top.mergeQualifiers = \t2::Type ->
    case t2 of
      extType(q2, _) -> extType(unionQualifiers(q.qualifiers, q2.qualifiers), sub)
    | _ -> top
    end;
  top.qualifiers = q.qualifiers;
  top.errors := q.errors;
  top.freeVariables := sub.freeVariables;
  
  top.isIntegerType = sub.isIntegerType;
  top.isArithmeticType = sub.isArithmeticType;
  top.isScalarType = sub.isScalarType;
  top.isCompleteType = sub.isCompleteType;
  top.maybeRefId = sub.maybeRefId;

  q.typeToQualify = top;
  sub.givenQualifiers = q;
}

inherited attribute givenQualifiers::Qualifiers;

-- t1.isEqualTo(t2) iff t1.mangledName == t2.mangledName
synthesized attribute isEqualTo::(Boolean ::= ExtType);

closed nonterminal ExtType with givenQualifiers, pp, lpp, rpp, host<Type>, canonicalType<ExtType>, baseTypeExpr, typeModifierExpr, mangledName, isEqualTo, integerPromotions, defaultArgumentPromotions, defaultLvalueConversion, defaultFunctionArrayLvalueConversion, isIntegerType, isScalarType, isArithmeticType, isCompleteType, maybeRefId, freeVariables;
flowtype ExtType = decorate {givenQualifiers}, lpp {givenQualifiers}, rpp {givenQualifiers}, canonicalType {decorate}, baseTypeExpr {decorate}, typeModifierExpr {decorate}, isEqualTo {}, integerPromotions {decorate}, defaultArgumentPromotions {decorate}, defaultLvalueConversion {decorate}, defaultFunctionArrayLvalueConversion {decorate}, isIntegerType {}, isScalarType {}, isArithmeticType {}, isCompleteType {}, maybeRefId {};

-- Forward flowtype is empty, since extensions would primarilly introduce new non-forwarding
-- productions on ExtType, and we would like to be able to pattern match on these.
flowtype forward {} on ExtType;

aspect default production
top::ExtType ::=
{
  top.lpp = ppConcat([ terminate(space(), top.givenQualifiers.pps), top.pp ]);
  top.rpp = notext();
  top.baseTypeExpr = extTypeExpr(top.givenQualifiers, top);
  top.typeModifierExpr = baseTypeExpr();

  top.integerPromotions = extType(top.givenQualifiers, top);
  top.defaultArgumentPromotions = extType(top.givenQualifiers, top);
  top.defaultLvalueConversion = extType(top.givenQualifiers, top);
  top.defaultFunctionArrayLvalueConversion = extType(top.givenQualifiers, top);
  top.freeVariables := [];
  
  top.isIntegerType = false;
  top.isArithmeticType = false;
  top.isScalarType = false;
  top.isCompleteType = \ Decorated Env -> true;
  top.maybeRefId = nothing();
}

abstract production enumExtType
top::ExtType ::= ref::Decorated EnumDecl
{
  propagate canonicalType;
  top.host = extType(top.givenQualifiers, top);
  top.baseTypeExpr =
    case ref.maybename of
    | just(n) -> tagReferenceTypeExpr(top.givenQualifiers, enumSEU(), n)
    -- TODO: Technically this should be whatever integer type is large enough to
    -- hold all the enumerated values
    | nothing() -> builtinTypeExpr(top.givenQualifiers, unsignedType(intType()))
    end;
  top.pp =
    case ref.maybename of
    | just(n) -> cat(text("enum "), n.pp)
    | nothing() -> text("enum <anon>") -- TODO: location
    end;
  top.mangledName =
    "enum_" ++
    case ref.maybename of
    | just(n) -> n.name
    | nothing() -> "anon"
    end;
  top.isEqualTo =
    \ other::ExtType ->
      case other of
      | enumExtType(otherRef) ->
        -- TODO: This code is slightly broken, since our representation of
        -- enum types lacks a method of uniquely identifying each type.
        -- For now, we just check that the tags are the same.
        -- This isn't quite correct (due to name shadowing), but is close enough for now. 
        -- Properly fixing this would require giving enums refIds.
        case ref.maybename, otherRef.maybename of
        -- Check that tag names are equal
        | just(n1), just(n2) -> n1.name == n2.name
        -- For now, assuming all anon enums have the same type.
        | nothing(), nothing() -> true
        | _, _ -> false
        end
      | _ -> false
      end;
    
  top.isIntegerType = true;
  top.isArithmeticType = true;
}
{--
 - Our env-independent type representation must end at resolving to a 'refId' of
 - the struct/union. This DOES give us equality (refIds equal), but not structural
 - information about the tag, without bailing out of type code and going back
 - to consult the environment about what's known about that tag.
 -
 - This production, despite its signature, only represents structs and unions, not enums.
 -}
abstract production refIdExtType
top::ExtType ::= kwd::StructOrEnumOrUnion  n::String  refId::String
{
  propagate canonicalType;
  top.host = extType(top.givenQualifiers, top);
  top.baseTypeExpr =
    tagReferenceTypeExpr(top.givenQualifiers, kwd, name(n, location=builtinLoc("host")));
  top.pp = ppConcat([kwd.pp, space(), text(n)]);
  top.mangledName =
    s"${kwd.mangledName}_${if n == "<anon>" then "anon" else n}_${substitute(":", "_", refId)}";
  top.isEqualTo =
    \ other::ExtType ->
      case other of
      | refIdExtType(_, _, otherRefId) -> refId == otherRefId
      | _ -> false
      end;
  top.isCompleteType =
    \ env::Decorated Env -> !null(lookupRefId(refId, env));
  top.maybeRefId = just(refId);
}

nonterminal StructOrEnumOrUnion with pp, mangledName; -- Silver enums would be nice.
abstract production structSEU
top::StructOrEnumOrUnion ::= { top.pp = text("struct"); top.mangledName = "struct"; }
abstract production unionSEU
top::StructOrEnumOrUnion ::= { top.pp = text("union"); top.mangledName = "union"; }
abstract production enumSEU
top::StructOrEnumOrUnion ::= { top.pp = text("enum"); top.mangledName = "enum"; }

{-------------------------------------------------------------------------------
 - C11 atomic types.
 -}
abstract production atomicType
top::Type ::= q::Qualifiers  bt::Type
{
  propagate host, canonicalType;
  top.lpp = ppConcat([ terminate(space(), q.pps),
                     text("_Atomic"), parens(cat(bt.lpp, bt.rpp))]);
  top.rpp = notext();
  top.mangledName = s"${q.mangledName}_atomic_${bt.mangledName}_";
  top.baseTypeExpr = atomicTypeExpr(q, typeName(bt.baseTypeExpr, bt.typeModifierExpr));
  top.typeModifierExpr = baseTypeExpr();
  top.integerPromotions = top;
  top.defaultArgumentPromotions = top;
  -- discarding qualifiers in lvalue conversion discards atomic qualifier, too.
  top.defaultLvalueConversion = bt.defaultLvalueConversion;
  top.defaultFunctionArrayLvalueConversion = top;
  top.withoutTypeQualifiers = atomicType(nilQualifier(), bt);
  top.withoutExtensionQualifiers = atomicType(filterExtensionQualifiers(q), bt.withoutExtensionQualifiers);
  top.withTypeQualifiers = atomicType(foldQualifier(top.addedTypeQualifiers ++
    q.qualifiers), bt);
  top.mergeQualifiers = \t2::Type ->
    case t2 of
      atomicType(q2, bt2) ->
        atomicType(unionQualifiers(top.qualifiers, q2.qualifiers), bt.mergeQualifiers(bt2))
    | _ -> atomicType(q, bt)
    end;
  top.qualifiers = q.qualifiers;
  top.errors := q.errors ++ bt.errors;
  top.freeVariables := bt.freeVariables;
  q.typeToQualify = top;
}

{-------------------------------------------------------------------------------
 - GCC __attribute__ types.
 - This represents attributes attatched to types that aren't handled specially (e.g. vector).  
 - We assume all attributed types are type-equivalent.
 - TODO: Make sure we animate attributes with actual custom types instead of attributedType in all
 - cases where this isn't true.
 -}
abstract production attributedType
top::Type ::= attrs::Attributes  bt::Type
{
  propagate host, canonicalType, withoutExtensionQualifiers;
  top.lpp = ppConcat([ ppAttributes(attrs), space(), bt.lpp]);
  top.rpp = bt.rpp;
  top.mangledName = bt.mangledName;
  top.baseTypeExpr = attributedTypeExpr(attrs, bt.baseTypeExpr);
  top.typeModifierExpr = baseTypeExpr();
  top.integerPromotions = attributedType(attrs, bt.integerPromotions);
  top.defaultArgumentPromotions = attributedType(attrs, bt.defaultArgumentPromotions);
  top.defaultLvalueConversion = bt.defaultLvalueConversion;
  top.defaultFunctionArrayLvalueConversion = bt.defaultFunctionArrayLvalueConversion;
  top.withoutAttributes = bt.withoutAttributes;
  top.withoutTypeQualifiers = attributedType(attrs, bt.withoutTypeQualifiers);
  top.withTypeQualifiers = attributedType(attrs, bt.withTypeQualifiers);
  bt.addedTypeQualifiers = top.addedTypeQualifiers;
  top.mergeQualifiers = \t2::Type ->
    case t2 of
      attributedType(_, bt2) ->
        attributedType(attrs, bt.mergeQualifiers(bt2))
    | _ -> attributedType(attrs, bt)
    end;
  top.qualifiers = bt.qualifiers;
  top.isIntegerType = bt.isIntegerType;
  top.isScalarType = bt.isScalarType;
  top.isArithmeticType = bt.isArithmeticType;
  top.isCompleteType = bt.isCompleteType;
  top.maybeRefId = bt.maybeRefId;
  top.errors := bt.errors;
  top.freeVariables := bt.freeVariables;
  
  -- Whatever...
  attrs.env = emptyEnv();
  attrs.returnType = nothing();
}

{-------------------------------------------------------------------------------
 - GCC Vector (MMX/SSE/etc) types.
 - TODO: This is very broken, __attribute__ can't occur at the outermost level, should involve
 - attributedType somehow?  
 -}
abstract production vectorType
top::Type ::= bt::Type  bytes::Integer
{
  propagate host, canonicalType, withoutExtensionQualifiers;
  top.lpp = ppConcat([ text("__attribute__((__vector_size__(" ++ toString(bytes) ++ "))) "), bt.lpp]);
  top.rpp = bt.rpp;
  top.mangledName = s"vector_${bt.mangledName}_${toString(bytes)}_";
  -- Translate vectorType
  top.baseTypeExpr =
    attributedTypeExpr(
      consAttribute(
        gccAttribute(
          consAttrib(
            appliedAttrib(
              attribName(name("__vector_size__", location=builtinLoc("host"))),
              consExpr(mkIntConst(bytes, builtinLoc("host")), nilExpr())),
          nilAttrib())),
        nilAttribute()),
      bt.baseTypeExpr);
  top.typeModifierExpr = baseTypeExpr();
  -- You know, who knows what these rules are: TODO
  top.integerPromotions = top;
  top.defaultArgumentPromotions = top;
  top.defaultLvalueConversion = top;
  top.defaultFunctionArrayLvalueConversion = top;
  top.withTypeQualifiers = top; -- TODO Discarding Qualifiers!
  top.mergeQualifiers = \t2::Type ->
    case t2 of
      vectorType(bt2, _) ->
        vectorType(bt.mergeQualifiers(bt2), bytes)
    | _ -> vectorType(bt, bytes)
    end;
  top.qualifiers = [];
  -- TODO: dunno? left here explicitly since... dunno what to do here.
  top.isIntegerType = false;
  top.isScalarType = false;
  top.isArithmeticType = false;
  top.isCompleteType = bt.isCompleteType;
  top.errors := bt.errors;
  top.freeVariables := bt.freeVariables;
}

{-------------------------------------------------------------------------------
 - Types that resolve to other types
 -}
abstract production noncanonicalType
top::Type ::= sub::NoncanonicalType
{
  -- These equations are all equivalent to the values obtained from the forward,
  -- but simply serve to preserve the equivalent noncanonicalType when possible.
  propagate host;
  top.lpp = sub.lpp;
  top.rpp = sub.rpp;
  top.baseTypeExpr = sub.baseTypeExpr;
  top.typeModifierExpr = sub.typeModifierExpr;
  top.withTypeQualifiers = sub.withTypeQualifiers;
  sub.addedTypeQualifiers = top.addedTypeQualifiers;

  -- behavior? maybe it should be pushed down? TODO
  --top.mangledName = ;
  --top.integerPromotions = ;
  --top.defaultArgumentPromotions = ;
  --top.defaultLvalueConversion = ;
  --top.defaultFunctionArrayLvalueConversion = ;
  
  forwards to sub.canonicalType;
}

{-- Types that resolve to other types. -}
nonterminal NoncanonicalType with canonicalType<Type>, lpp, rpp, host<NoncanonicalType>, baseTypeExpr, typeModifierExpr, withTypeQualifiers, addedTypeQualifiers;
flowtype NoncanonicalType = decorate {}, canonicalType {}, baseTypeExpr {}, typeModifierExpr {}, withTypeQualifiers {addedTypeQualifiers};

{-- A NoncanonicalType that is really just a normal Type
 - e.g. the result of performing a substitution for a typedef
 -}
abstract production resolvedType
top::NoncanonicalType ::= resolved::Type
{
  propagate host;
  top.lpp = resolved.lpp;
  top.rpp = resolved.rpp;
  top.baseTypeExpr = resolved.baseTypeExpr;
  top.typeModifierExpr = resolved.typeModifierExpr;
  top.withTypeQualifiers = resolved.withTypeQualifiers;
  resolved.addedTypeQualifiers = top.addedTypeQualifiers;

  top.canonicalType = resolved;
}

{-- Parens. 
 - No qualifiers, as it's not even syntactically possible. This exists for no
 - reason but to mirror the type exactly as the programmer wrote it.
 - e.g. 'const ((footypedef))' if that's their preferred thing.
 -
 - Note: parens are weird in that they're "inside out". That is, the thing that's
 - in parenthesis is what's above us in the type tree.
 - e.g. 'pointer(paren(int))' is a pointer to an int, but it's written 'int (*)'
 - with the parens around the 'pointer to' not the 'int'
 -
 - There's a good (almost sorta attribute grammary) pretty printer example of
 - how to render types in the presence of this sort of thing in Clang.
 -}
abstract production parenType
top::NoncanonicalType ::= wrapped::Type
{
  propagate host;
  top.lpp = ppConcat([ wrapped.lpp, space(), text("(") ]);
  top.rpp = cat( text(")"), wrapped.rpp );
  top.baseTypeExpr = wrapped.baseTypeExpr;
  top.typeModifierExpr = parenTypeExpr(wrapped.typeModifierExpr);
  top.withTypeQualifiers = wrapped.withTypeQualifiers;
  wrapped.addedTypeQualifiers = top.addedTypeQualifiers;

  top.canonicalType = wrapped;
}

{-- Represents "decayed pointers" from array or function type.
 -
 - The "default conversions" should turn array types into
 - pointer types, but we want to be able to report the orginal
 - array type in error messages, for example.
 -
 - e.g. 'char foo[2];' when we write 'foo[1]' and consult
 - the type of the 'foo' subexpression, we would then perform
 - default conversions, getting 'char *' which isn't the ideal
 - type to report if there's an error. 
 -
 - This exists to provide us a way to preserve
 - the original type, while still decaying in the conversion.
 - 'char [2]' can be converted instead to 'decayed(char [2], char *)'
 - which then forwards to char *.
 -}
abstract production decayedType
top::NoncanonicalType ::= original::Type  pointer::Type
{
  propagate host;
  top.lpp = original.lpp;
  top.rpp = original.rpp;
  top.baseTypeExpr = original.baseTypeExpr;
  top.typeModifierExpr = original.typeModifierExpr;
  top.withTypeQualifiers = pointer.withTypeQualifiers;
  pointer.addedTypeQualifiers = top.addedTypeQualifiers;

  top.canonicalType = pointer;
}

{-- A name, that has already been looked up, but of course we'd like to
 - refer to it by name if possible.
 -
 - Invariant: any qualifiers on this typedef (i.e. 'q')
 - have already been injected into 'resolved'.
 -
 - They are only preserved here for essentially pp purposes. 
 - e.g. given: typedef volatile struct foo { } Foo;
 -    'const Foo' will have 'const' in q, and 'resolved' will have const and volatile. -}
abstract production typedefType
top::NoncanonicalType ::= q::Qualifiers  n::String  resolved::Type
{
  propagate host;
  top.lpp = ppConcat([ terminate(space(), q.pps), text(n) ]);
  top.rpp = notext();
  top.baseTypeExpr = typedefTypeExpr(q, name(n, location=builtinLoc("host")));
  top.typeModifierExpr = baseTypeExpr();
  top.withTypeQualifiers =
    noncanonicalType(
      typedefType(foldQualifier(top.addedTypeQualifiers ++ q.qualifiers), n, resolved));

  top.canonicalType = resolved;
}

{-- GCC typeof type expression -}
abstract production typeofType
top::NoncanonicalType ::= q::Qualifiers  resolved::Type
{
  propagate host;
  top.canonicalType = resolved;-- TODO: some sort of discipline of what to do with qualifiers here
  top.lpp = ppConcat([text("__typeof__"), parens(cat(resolved.lpp, resolved.rpp))]);
  top.rpp = notext();
  top.baseTypeExpr =
    typeofTypeExpr(q, typeNameExpr(typeName(resolved.baseTypeExpr, resolved.typeModifierExpr)));
  top.typeModifierExpr = baseTypeExpr();
  top.withTypeQualifiers =
    noncanonicalType(
      typeofType(foldQualifier(top.addedTypeQualifiers ++ q.qualifiers), resolved));
}

function filterExtensionQualifiers
Qualifiers ::= q::Qualifiers
{
  return foldQualifier(filter((.qualIsHost), q.qualifiers));
}

{- 
NON_CANONICAL_UNLESS_DEPENDENT_TYPE(TypeOfExpr, Type)
NON_CANONICAL_UNLESS_DEPENDENT_TYPE(TypeOf, Type)

-- Evidently, GCC extensions for SIMD vector types
 TYPE(Vector, Type)
 TYPE(ExtVector, VectorType)

-}
