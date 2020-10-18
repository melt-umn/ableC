grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

inherited attribute initializerPos::String;
inherited attribute expectedType::Type;
autocopy attribute inObject::Boolean;

propagate host, errors, globalDecls, functionDecls, defs on MaybeInitializer, Initializer, InitList, Init, Designator;
propagate freeVariables on MaybeInitializer, Initializer, Init, Designator;

nonterminal MaybeInitializer with pp, host, typerep, errors, globalDecls, functionDecls, defs, env, expectedType, freeVariables, returnType;
flowtype MaybeInitializer = decorate {env, expectedType, returnType};

abstract production nothingInitializer
top::MaybeInitializer ::=
{
  top.pp = notext();
  top.typerep = top.expectedType;
}
abstract production justInitializer
top::MaybeInitializer ::= i::Initializer
{
  top.pp = ppConcat([ text(" = "), i.pp ]);
  top.typerep = i.typerep;
  i.initializerPos = "initializer";
  i.expectedType = top.expectedType;
  i.inObject = false;
}

threaded attribute expectedTypes, expectedTypesOut :: [Type];
threaded attribute nestedInits, nestedInitsOut :: Integer;

nonterminal Initializer with location, pp, host, typerep, errors, globalDecls, functionDecls, defs, env, initializerPos, inObject, expectedType, expectedTypesOut, nestedInits, nestedInitsOut, freeVariables, returnType;
flowtype Initializer = decorate {env, initializerPos, inObject, expectedType, returnType}, expectedTypesOut {decorate};

abstract production exprInitializer
top::Initializer ::= e::Expr
{
  top.pp = e.pp;
  top.typerep = top.expectedType;
  
  local newMembers::Maybe<[Type]> = remainingObjectMembers(top.env, top.expectedType, e.typerep);
  top.expectedTypesOut = fromMaybe([], newMembers);
  top.nestedInitsOut = max(0, top.nestedInits + length(top.expectedTypesOut) - 1);
  
  top.errors <-
    if (if top.inObject then !newMembers.isJust else !typeAssignableTo(top.expectedType, e.typerep))
    then [err(e.location, s"Incompatible types in ${top.initializerPos}, expected ${showType(top.expectedType)} but found ${showType(e.typerep)}")]
    else [];
}

abstract production objectInitializer
top::Initializer ::= l::InitList
{
  top.pp = ppConcat([text("{"), ppImplode(text(", "), l.pps), text("}")]);
  top.typerep = l.typerep;
  
  top.expectedTypesOut = [];
  top.nestedInitsOut = max(0, top.nestedInits - 1);

  l.initIndex = 0;
  l.expectedType = top.expectedType;
  l.expectedTypes = fromMaybe([top.expectedType], objectMembers(top.env, top.expectedType));
  l.tagEnvIn = objectTagEnv(top.env, top.expectedType);

  local refId::Maybe<String> =
    case top.expectedType of
    | extType( _, e) -> e.maybeRefId
    | _ -> nothing()
    end;

  local refIdLookup::[RefIdItem] =
    case refId of
    | just(rid) -> lookupRefId(rid, top.env)
    | nothing() -> []
    end;

  top.errors <-
    case top.expectedType, refId, refIdLookup of
    | errorType(), _, _ -> []
    -- Check that expected type for this initializer is some sort of object type or a scalar with a single init
    | arrayType(_, _, _, _), _, _ -> []
    | t, nothing(), _ when l.maxIndex < 0 -> [err(top.location, s"Empty scalar initializer for type ${showType(t)}.")]
    -- Check that this type has a definition
    | t, just(_), [] -> [err(top.location, s"${showType(t)} does not have a definition.")]
    | _, _, _ -> []
    end;
  top.errors <-
    case top.expectedType, refId of
    | errorType(), _ -> []
    | arrayType(_, _, _, _), _ -> []
    | t, nothing() when top.inObject -> [wrn(top.location, s"Braces around scalar initializer for type ${showType(t)}.")]
    | _, _ -> []
    end;
}

threaded attribute initIndex, initIndexOut::Integer;
monoid attribute maxIndex::Integer with -1, max;

autocopy attribute tagEnvIn::Decorated Env;

nonterminal InitList with pps, initIndex, initIndexOut, maxIndex, host, typerep, errors, globalDecls, functionDecls, defs, env, expectedType, expectedTypes, nestedInits, tagEnvIn, freeVariables, returnType;
flowtype InitList = decorate {initIndex, env, expectedType, expectedTypes, tagEnvIn, returnType}, maxIndex {decorate};
propagate initIndex, initIndexOut, maxIndex, expectedTypes, nestedInits on InitList;

aspect default production
top::InitList ::=
{
  top.typerep =
    case top.expectedType of
    | arrayType(e, i, sm, incompleteArrayType()) ->
      arrayType(e, i, sm, constantArrayType(top.maxIndex + 1))
    | t -> t
    end;
}

abstract production consInit
top::InitList ::= h::Init  t::InitList
{
  top.pps = h.pp :: t.pps;
  top.freeVariables := h.freeVariables ++ removeDefsFromNames(h.defs, t.freeVariables);

  propagate expectedType;
  t.env = addEnv(h.defs, h.env);
}

abstract production nilInit
top::InitList ::=
{
  top.pps = [];
  top.freeVariables := [];
}

nonterminal Init with pp, initIndex, initIndexOut, maxIndex, host, errors, globalDecls, functionDecls, defs, env, expectedType, expectedTypes, expectedTypesOut, nestedInits, nestedInitsOut, tagEnvIn, freeVariables, returnType;
flowtype Init = decorate {initIndex, env, expectedType, expectedTypes, tagEnvIn, returnType}, maxIndex {decorate}, initIndexOut {decorate}, expectedTypesOut {decorate};

abstract production positionalInit
top::Init ::= i::Initializer
{
  top.pp = i.pp;
  top.initIndexOut = 1 + top.initIndex;
  top.maxIndex := top.initIndex;
  
  i.inObject = true;
  i.expectedType =
    case top.expectedTypes of
    | h :: _ -> h
    | _ -> errorType()
    end;
  top.expectedTypesOut =
    case top.expectedTypes of
    | _ :: t -> i.expectedTypesOut ++ t
    | _ -> []
    end;
  propagate nestedInits, nestedInitsOut;
  
  top.errors <-
    if null(top.expectedTypes)
    then [wrn(i.location, s"Excess elements in initializer for type ${showType(top.expectedType)}")]
    else [];
    
  i.initializerPos = s"positional initializer for type ${showType(top.expectedType)}"; -- TODO: Include the field name, somehow.
}

abstract production designatedInit
top::Init ::= d::Designator  i::Initializer
{
  top.pp = ppConcat([d.pp, text(" = "), i.pp]);
  top.initIndexOut = d.maxIndex + 1;
  top.maxIndex := d.maxIndex;
  
  top.expectedTypesOut = d.expectedTypesOut;
  top.nestedInitsOut = 0;
  
  d.expectedType = top.expectedType;
  
  i.env = addEnv(d.defs, d.env);
  i.initializerPos = s"member ${show(80, d.pp)} of ${showType(top.expectedType)}";
  i.inObject = true;
  i.expectedType = d.typerep;
}

{--
 - Tree access pattern for designators.
 - e.g.  "[1].d[0] = e" gives "array(0, field(d, array(1, initial)))"
 -}
nonterminal Designator with pp, maxIndex, host, errors, globalDecls, functionDecls, defs, env, expectedType, expectedTypesOut, typerep, freeVariables, returnType;
flowtype Designator = decorate {env, expectedType, returnType}, maxIndex {decorate}, expectedTypesOut {decorate};

abstract production initialDesignator
top::Designator ::=
{
  top.pp = notext();
  top.maxIndex := -1;
  top.expectedTypesOut = [];
  top.typerep = top.expectedType;
}

abstract production fieldDesignator
top::Designator ::= d::Designator  f::Name
{
  top.pp = ppConcat([d.pp, text("."), f.pp]);
  top.maxIndex := -1;

  local refId::Maybe<String> =
    case top.expectedType of
    | extType( _, e) -> e.maybeRefId
    | _ -> nothing()
    end;

  local refIdLookup::[RefIdItem] =
    case refId of
    | just(rid) -> lookupRefId(rid, top.env)
    | nothing() -> []
    end;

  local tagEnv::Decorated Env =
    case refIdLookup of
    | item :: _ -> item.tagEnv
    | [] -> emptyEnv()
    end;

  local fieldLookup::[ValueItem] = lookupValue(f.name, tagEnv);
  d.expectedType =
    case fieldLookup of
    | v :: _ -> v.typerep
    | [] -> errorType()
    end;

  top.errors <-
    case top.expectedType, refId, refIdLookup, fieldLookup of
    | errorType(), _, _, _ -> []
    -- Check that expected type for this designator is some sort of type with fields
    | t, nothing(), _, _ -> [err(f.location, s"Field designator only permitted on struct or union types (got ${showType(t)})")]
    -- Check that this type has a definition
    | t, just(_), [], _ -> [err(f.location, s"${showType(t)} does not have a definition")]
    | t, just(_), _, [] -> [err(f.location, s"${showType(t)} does not have field ${f.name}")]
    | _, _, _, _ -> []
    end;

  top.expectedTypesOut =
    case refIdLookup of
    | r :: _ ->
      map(
        \ f::Either<String ExtType> ->
          case f of
          | left(fn) -> head(lookupValue(fn, r.tagEnv)).typerep
          | right(e) -> extType(nilQualifier(), e)
          end,
        case dropWhile(\ f1::Either<String ExtType> -> f1.isRight || f1.fromLeft != f.name, r.fieldNames) of
        | _ :: fs -> fs
        | [] -> []
        end)
    | [] -> []
    end;
  top.typerep = d.typerep;
}

abstract production arrayDesignator
top::Designator ::= d::Designator  e::Expr
{
  top.pp = ppConcat([d.pp, text("["), e.pp, text("]")]);
  top.maxIndex := fromMaybe(-1, e.integerConstantValue);
  
  top.errors <-
    case top.expectedType of
    | errorType() -> []
    | arrayType(_, _, _, constantArrayType(size)) ->
      case e.integerConstantValue of
      | just(i) when i < 0 || i >= size ->
        [err(e.location, s"Array index in initializer out of bounds (size ${toString(size)}, index ${toString(i)})")]
      | _ -> []
      end
    | arrayType(_, _, _, _) -> []
    | t -> [err(e.location, s"Array designator only permitted on array types (got ${showType(t)}).")]
    end;
  top.errors <-
    if !e.integerConstantValue.isJust
    then [err(e.location, "Non-constant array index in initializer")]
    else [];
  
  d.expectedType =
    case top.expectedType of
    | arrayType(e, _, _, _) -> e
    | _ -> errorType()
    end;
  top.expectedTypesOut =
    case top.expectedType of
    | arrayType(elem, _, _, constantArrayType(size))
      when e.integerConstantValue matches just(i) -> repeat(elem, size - (i + 1))
    | arrayType(elem, _, _, incompleteArrayType()) -> repeatInfinite(elem)
    | _ -> []
    end;
  
  e.env = addEnv(d.defs, d.env);
  
  top.typerep = d.typerep;
}

-- GCC extension
abstract production arrayRangeDesignator
top::Designator ::= d::Designator  l::Expr  u::Expr
{
  top.pp = ppConcat([d.pp, text("["), l.pp, text("..."), u.pp, text("]")]);
  top.maxIndex := fromMaybe(-1, u.integerConstantValue);
  
  top.errors <-
    case top.expectedType of
    | errorType() -> []
    | arrayType(_, _, _, constantArrayType(size)) ->
      case l.integerConstantValue of
      | just(li) when li < 0 || li >= size ->
        [err(l.location, s"Lower array index in initializer out of bounds (size ${toString(size)}, index ${toString(li)})")]
      | _ -> []
      end ++
      case u.integerConstantValue of
      | just(ui) when ui < 0 || ui >= size ->
        [err(u.location, s"Upper array index in initializer out of bounds (size ${toString(size)}, index ${toString(ui)})")]
      | _ -> []
      end ++
      case l.integerConstantValue, u.integerConstantValue of
      | just(li), just(ui) when li > ui ->
        [wrn(l.location, s"Empty range in array initializer (size ${toString(size)}, indices ${toString(li)} ... ${toString(ui)})")]
      | _, _ -> []
      end
    | arrayType(_, _, _, _) -> []
    | t -> [err(l.location, s"Array range designator only permitted on array types (got ${showType(t)}).")]
    end;
  top.errors <-
    if !u.integerConstantValue.isJust
    then [err(u.location, "Non-constant array index in initializer")]
    else [];
  top.errors <-
    if !l.integerConstantValue.isJust
    then [err(l.location, "Non-constant array index in initializer")]
    else [];
  
  d.expectedType =
    case top.expectedType of
    | arrayType(e, _, _, _) -> e
    | _ -> errorType()
    end;
  top.expectedTypesOut =
    case top.expectedType of
    | arrayType(elem, _, _, constantArrayType(size))
      when u.integerConstantValue matches just(i) -> repeat(elem, size - (i + 1))
    | arrayType(elem, _, _, incompleteArrayType()) -> repeatInfinite(elem)
    | _ -> []
    end;
  
  top.typerep = d.typerep;
}

