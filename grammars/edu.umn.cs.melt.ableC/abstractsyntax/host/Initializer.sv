grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

inherited attribute initializerPos::String;
inherited attribute expectedType::Type;

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
}

nonterminal Initializer with location, pp, host, typerep, errors, globalDecls, functionDecls, defs, env, initializerPos, expectedType, freeVariables, returnType;
flowtype Initializer = decorate {env, initializerPos, expectedType, returnType};

abstract production exprInitializer
top::Initializer ::= e::Expr
{
  top.pp = e.pp;
  top.typerep = top.expectedType;
  top.errors <-
    if !typeAssignableTo(top.expectedType, e.typerep)
    then [err(e.location, s"Incompatible types for ${top.initializerPos}, expected ${showType(top.expectedType)} but found ${showType(e.typerep)}")]
    else [];
}

abstract production objectInitializer
top::Initializer ::= l::InitList
{
  top.pp = ppConcat([text("{"), ppImplode(text(", "), l.pps), text("}")]);
  top.typerep = l.typerep;

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
    -- Check that expected type for this initializer is some sort of object type
    | arrayType(_, _, _, _), _, _ -> []
    | t, nothing(), _ -> [err(top.location, s"Object initializer only permitted for array, struct or union types (got ${showType(t)}).")]
    -- Check that this type has a definition
    | t, just(id), [] -> [err(top.location, s"${showType(t)} does not have a definition.")]
    | _, _, _ -> []
    end;

  l.tagEnvIn =
    case refIdLookup of
    | item :: _ -> item.tagEnv
    | [] -> emptyEnv()
    end;
  l.fieldNamesIn =
    case refIdLookup of
    | item :: _ -> item.fieldNames
    | [] -> []
    end;
  l.expectedType = top.expectedType;
}

monoid attribute positionalInitCount::Integer with 0, +;
monoid attribute maxIndex::Integer with -1, max;
propagate positionalInitCount, maxIndex on InitList, Init;

autocopy attribute tagEnvIn::Decorated Env;
inherited attribute fieldNamesIn::[String];

-- TODO: warn on duplicate initialization of the same member
nonterminal InitList with pps, positionalInitCount, maxIndex, host, typerep, errors, globalDecls, functionDecls, defs, env, expectedType, tagEnvIn, fieldNamesIn, freeVariables, returnType;
flowtype InitList = decorate {env, expectedType, tagEnvIn, fieldNamesIn, returnType}, positionalInitCount {decorate}, maxIndex {decorate};

aspect default production
top::InitList ::=
{
  top.typerep =
    case top.expectedType of
    | arrayType(e, i, sm, incompleteArrayType()) ->
      arrayType(e, i, sm, constantArrayType(max(top.positionalInitCount, top.maxIndex + 1)))
    | t -> t
    end;
}

abstract production consInit
top::InitList ::= h::Init  t::InitList
{
  top.pps = h.pp :: t.pps;
  top.freeVariables := h.freeVariables ++ removeDefsFromNames(h.defs, t.freeVariables);
  
  h.expectedType = top.expectedType;
  
  t.env = addEnv(h.defs, h.env);
  t.expectedType = top.expectedType;
  
  -- TODO: Use threading here
  h.fieldNamesIn = top.fieldNamesIn;
  t.fieldNamesIn = h.fieldNames;
}

abstract production nilInit
top::InitList ::=
{
  top.pps = [];
  top.freeVariables := [];
}

nonterminal Init with pp, positionalInitCount, maxIndex, host, errors, globalDecls, functionDecls, defs, env, expectedType, tagEnvIn, fieldNamesIn, fieldNames, freeVariables, returnType;
flowtype Init = decorate {env, expectedType, tagEnvIn, fieldNamesIn, returnType}, fieldNames {decorate}, maxIndex {decorate};

abstract production positionalInit
top::Init ::= i::Initializer
{
  top.pp = i.pp;
  top.positionalInitCount <- 1;
  top.fieldNames :=
    case top.fieldNamesIn of
    | _ :: fs -> fs
    | [] -> []
    end;

  top.errors <-
    case top.expectedType of
    | errorType() -> []
    | arrayType(_, _, _, _) -> []
    | _ when null(top.fieldNamesIn) -> [err(i.location, s"Too many positional initializers for type ${showType(top.expectedType)}")]
    | _ -> []
    end;

  i.initializerPos =
    case top.fieldNames of
    | f :: _ -> s"field ${f} of ${showType(top.expectedType)}"
    | _ -> "positional initializer"
    end;
  i.expectedType =
    case top.expectedType, top.fieldNamesIn of
    | arrayType(e, _, _, _), _ -> e
    | _, f :: _ ->
      case lookupValue(f, top.tagEnvIn) of
      | v :: _ -> v.typerep
      | [] -> error(s"Field ${f} not in tag env!")
      end 
    | _, _ -> errorType()
    end;
}

abstract production designatedInit
top::Init ::= d::Designator  i::Initializer
{
  top.pp = ppConcat([d.pp, text(" = "), i.pp]);
  top.fieldNames := top.fieldNamesIn;
  
  d.expectedType = top.expectedType;
  
  i.env = addEnv(d.defs, d.env);
  i.initializerPos = s"member ${show(80, d.pp)} of ${showType(top.expectedType)}";
  i.expectedType = d.typerep;
}

{--
 - Tree access pattern for designators.
 - e.g.  "[1].d[0] = e" gives "array(0, field(d, array(1, initial)))"
 -}
nonterminal Designator with pp, maxIndex, host, errors, globalDecls, functionDecls, defs, env, expectedType, typerep, freeVariables, returnType;
flowtype Designator = decorate {env, expectedType, returnType}, maxIndex {decorate};

abstract production initialDesignator
top::Designator ::=
{
  top.pp = notext();
  top.maxIndex := -1;
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
    | _ -> errorType()
    end;

  top.errors <-
    case top.expectedType, refId, refIdLookup of
    | errorType(), _, _ -> []
    -- Check that expected type for this designator is some sort of type with fields
    | t, nothing(), _ -> [err(f.location, s"Field designator only permitted on struct or union types (got ${showType(t)}).")]
    -- Check that this type has a definition
    | t, just(id), [] -> [err(f.location, s"${showType(t)} does not have a definition.")]
    | _, _, _ -> []
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
  
  top.typerep = d.typerep;
}

