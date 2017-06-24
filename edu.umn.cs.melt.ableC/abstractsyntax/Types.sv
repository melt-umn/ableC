grammar edu:umn:cs:melt:ableC:abstractsyntax;

{--
 - Type representations, with qualifiers on appropriate constructors,
 - distinct from type expressions which are environment-independent.
 -
 - Host is included, we might want that, but lifted doesn't make sense in this context.
 -
 - Variants: builtin, pointer, array, function, tagged, noncanonical.
 - Noncanonical forwards, and so doesn't need any attributes, etc attached to it.
 -}
nonterminal Type with lpp, rpp, host<Type>, baseTypeExpr, typeModifierExpr, mangledName, integerPromotions, defaultArgumentPromotions, defaultLvalueConversion, defaultFunctionArrayLvalueConversion, isIntegerType, isScalarType, isArithmeticType, withoutAttributes, withoutTypeQualifiers, withTypeQualifiers, addedTypeQualifiers, qualifiers, errors;

-- Used to turn a Type back into a TypeName
synthesized attribute baseTypeExpr :: BaseTypeExpr;
synthesized attribute typeModifierExpr :: TypeModifierExpr;

-- Compute a unique name for a type that is a valid C identifier
synthesized attribute mangledName :: String;

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
}

{-------------------------------------------------------------------------------
 - An error occurred while trying to construct the type.
 - Typically, this should be considered "compatible" with any type: an error
 - has already been raised, further errors are redundant.
 -}
abstract production errorType
top::Type ::=
{
  propagate host;
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
  top.qualifiers = [];
  top.errors := [];

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
  propagate host;
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
  top.withTypeQualifiers = builtinType(foldQualifier(top.addedTypeQualifiers ++
    q.qualifiers), bt);
  top.qualifiers = q.qualifiers;
  top.errors := q.qualifyErrors;
  q.typeToQualify = top;
}


{-------------------------------------------------------------------------------
 - Pointer to another type.
 - e.g.  'const int * foo' is pointer([], builtin([const], int)).
 - while 'int * const foo' is pointer([const], builtin([], int)).
 -}
abstract production pointerType
top::Type ::= q::Qualifiers  target::Type
{
  propagate host;
  top.lpp = ppConcat([ target.lpp, space(), text("*"), space(), ppImplode(space(), q.pps) ]);
  top.rpp = target.rpp;
  top.baseTypeExpr = target.baseTypeExpr;
  top.typeModifierExpr = pointerTypeExpr(q, target.typeModifierExpr);
  top.mangledName = s"${q.mangledName}_pointer_${target.mangledName}_";
  top.integerPromotions = top;
  top.defaultArgumentPromotions = top;
  top.defaultLvalueConversion = pointerType(nilQualifier(), target);
  top.defaultFunctionArrayLvalueConversion = top;
  top.withoutTypeQualifiers = pointerType(nilQualifier(), target);
  top.withTypeQualifiers = pointerType(foldQualifier(top.addedTypeQualifiers ++
    q.qualifiers), target);
  top.qualifiers = q.qualifiers;
  top.errors := q.qualifyErrors ++ target.errors;
  
  top.isScalarType = true;
  q.typeToQualify = top;
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
  propagate host;
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
  top.qualifiers = indexQualifiers.qualifiers;
  top.errors := element.errors ++ indexQualifiers.qualifyErrors;
  indexQualifiers.typeToQualify = top;
}

{-- The subtypes of arrays -}
nonterminal ArrayType with pp, host<ArrayType>;

abstract production constantArrayType
top::ArrayType ::= size::Integer
{
  propagate host;
  top.pp = text(toString(size));
  -- TODO: include the Decorated Expr here too maybe?
}
abstract production incompleteArrayType
top::ArrayType ::=
{
  propagate host;
  top.pp = notext();
}
abstract production variableArrayType
top::ArrayType ::= size::Decorated Expr
{
  propagate host;
  top.pp = size.pp;
}

{-- Modifiers attached to array types that are function parameters -}
nonterminal ArraySizeModifier with pps;
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
top::Type ::= result::Type  sub::FunctionType
{
  propagate host;
  --TODO should this space be here? also TODO: ordering? result lpp before sub.lpp maybe? TODO: actually sub.lpp is always nothing. FIXME
  top.lpp = ppConcat([ sub.lpp, space(), result.lpp ]);
  top.rpp = cat(sub.rpp, result.rpp);
  top.baseTypeExpr = result.baseTypeExpr;
  top.typeModifierExpr =
    case sub of
      protoFunctionType(args, variadic) ->
        functionTypeExprWithArgs(result.typeModifierExpr, argTypesToParameters(args), variadic)
    | noProtoFunctionType() ->
        functionTypeExprWithoutArgs(result.typeModifierExpr, [])
    end;
  top.mangledName = s"function_${result.mangledName}_${sub.mangledName}_";
  top.integerPromotions = top;
  top.defaultArgumentPromotions = top;
  top.defaultLvalueConversion = top;
  top.defaultFunctionArrayLvalueConversion =
    noncanonicalType(decayedType(top,
      pointerType(nilQualifier(), top)));
  top.qualifiers = [];
  top.errors := result.errors ++ sub.errors;
}

{-- The subtypes of functions -}
nonterminal FunctionType with lpp, rpp, host<FunctionType>, mangledName, errors;
-- clang has an 'extinfo' structure with calling convention, noreturn, 'produces'?, regparam

abstract production protoFunctionType
top::FunctionType ::= args::[Type]  variadic::Boolean
{
  top.host = protoFunctionType(map(\t::Type -> t.host, args), variadic);
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
}
-- Evidently, old K&R C functions don't have args as part of function type
abstract production noProtoFunctionType
top::FunctionType ::=
{
  propagate host;
  top.lpp = notext();
  top.rpp = text("()");
  top.mangledName = "noproto";
  top.errors := [];
}

function argTypesToParameters
Parameters ::= args::[Type]
{
  return
    case args of
      h :: t ->
        consParameters(
          parameterDecl([], directTypeExpr(h), baseTypeExpr(), nothingName(), nilAttribute()),
          argTypesToParameters(t))
    | [] -> nilParameters()
    end;
}


{-------------------------------------------------------------------------------
 - Tagged types: enum, struct, union
 -}
abstract production tagType
top::Type ::= q::Qualifiers  sub::TagType
{
  propagate host;
  top.lpp = ppConcat([ terminate(space(), q.pps), sub.pp ]);
  top.rpp = notext();
  top.baseTypeExpr =
    case sub of
      enumTagType(ref) -> enumTypeExpr(q, new(ref))
    | refIdTagType(kwd, n, refId) ->
      tagReferenceTypeExpr(q, kwd, name(n, location=builtinLoc("host")))
    end;
  top.typeModifierExpr = baseTypeExpr();
  top.mangledName = s"${q.mangledName}_tag_${sub.mangledName}_";
  top.integerPromotions = top;
  top.defaultArgumentPromotions = top;
  top.defaultLvalueConversion = tagType(nilQualifier(), sub);
  top.defaultFunctionArrayLvalueConversion = top;
  top.withoutTypeQualifiers = tagType(nilQualifier(), sub);
  top.withTypeQualifiers = tagType(foldQualifier(top.addedTypeQualifiers ++
    q.qualifiers), sub);
  top.qualifiers = q.qualifiers;
  top.errors := q.qualifyErrors;
  
  top.isIntegerType = sub.isIntegerType;
  top.isArithmeticType = sub.isIntegerType;
  top.isScalarType = sub.isIntegerType;

  q.typeToQualify = top;
}

{-- Structs, unions and enums -}
nonterminal TagType with pp, host<TagType>, mangledName, isIntegerType;

abstract production enumTagType
top::TagType ::= ref::Decorated EnumDecl
{
  propagate host;
  top.pp =
    case ref.maybename of
    | just(n) -> cat(text("enum "), n.pp)
    | nothing() -> text("int/*anon enum*/") -- TODO: location
    end;
  top.mangledName =
    "enum_" ++
    case ref.maybename of
    | just(n) -> n.name
    | nothing() -> "anon"
    end;
    
  top.isIntegerType = true;
}
{--
 - Our env-independent type representation must end at resolving to a 'refId' of
 - the struct/union. This DOES give us equality (refIds equal), but not structural
 - information about the tag, without bailing out of type code and going back
 - to consult the environment about what's known about that tag.
 -} 
abstract production refIdTagType
top::TagType ::= kwd::StructOrEnumOrUnion  name::String  refId::String
{
  propagate host;
  top.pp = ppConcat([kwd.pp, space(), text(name)]);
  top.mangledName = s"${kwd.mangledName}_${name}_${substitute(":", "_", refId)}";
  top.isIntegerType = false;
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
  propagate host;
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
  top.withTypeQualifiers = atomicType(foldQualifier(top.addedTypeQualifiers ++
    q.qualifiers), bt);
  top.qualifiers = q.qualifiers;
  top.errors := q.qualifyErrors ++ bt.errors;
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
  propagate host;
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
  top.qualifiers = bt.qualifiers;
  top.isIntegerType = bt.isIntegerType;
  top.isScalarType = bt.isScalarType;
  top.isArithmeticType = bt.isArithmeticType;
  top.errors := bt.errors;
  
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
  propagate host;
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
  top.qualifiers = [];
  -- TODO: dunno? left here explicitly since... dunno what to do here.
  top.isIntegerType = false;
  top.isScalarType = false;
  top.isArithmeticType = false;
  top.errors := bt.errors;
}

{-------------------------------------------------------------------------------
 - Types that resolve to other types
 -}
abstract production noncanonicalType
top::Type ::= sub::NoncanonicalType
{
  propagate host;
  top.lpp = sub.lpp;
  top.rpp = sub.rpp;
  top.baseTypeExpr = sub.baseTypeExpr;
  top.typeModifierExpr = sub.typeModifierExpr;

  -- behavior? maybe it should be pushed down? TODO
  --top.mangledName = ;
  --top.integerPromotions = ;
  --top.defaultArgumentPromotions = ;
  --top.defaultLvalueConversion = ;
  --top.defaultFunctionArrayLvalueConversion = ;
  
  forwards to sub.canonicalType;
}

{-- Types that resolve to other types. -}
nonterminal NoncanonicalType with canonicalType, lpp, rpp, host<NoncanonicalType>, baseTypeExpr, typeModifierExpr;

synthesized attribute canonicalType :: Type;

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
}


-- TODO: Why isn't this in TypeNames.sv?
abstract production hackUnusedType
top::BaseTypeExpr ::=
{
  -- pp doesn't depend on env
  top.pp = text("hack");
  -- Forwarding based on env and returnType.
  forwards to if false then error(hackUnparse(top.env) ++ hackUnparse(top.returnType)) else hackUnusedType();
}


{- 
NON_CANONICAL_UNLESS_DEPENDENT_TYPE(TypeOfExpr, Type)
NON_CANONICAL_UNLESS_DEPENDENT_TYPE(TypeOf, Type)

-- Evidently, GCC extensions for SIMD vector types
 TYPE(Vector, Type)
 TYPE(ExtVector, VectorType)

-}
