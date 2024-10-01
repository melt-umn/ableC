grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

inherited attribute initializerPos::String;
inherited attribute expectedType::Type;
inherited attribute inObject::Boolean;

propagate errors, globalDecls, functionDecls, defs on MaybeInitializer, Initializer, InitList, Init, Designator;
propagate host on MaybeInitializer, InitList, Init, Designator;
propagate freeVariables on MaybeInitializer, Initializer, Init, Designator;

tracked nonterminal MaybeInitializer with pp, host, typerep, errors, globalDecls,
  functionDecls, defs, env, expectedType, freeVariables, controlStmtContext;
flowtype MaybeInitializer = decorate {env, expectedType, controlStmtContext};

propagate controlStmtContext on MaybeInitializer;

abstract production nothingInitializer
top::MaybeInitializer ::=
{
  top.pp = notext();
  top.typerep = top.expectedType;
}
abstract production justInitializer
top::MaybeInitializer ::= i::Initializer
{
  propagate env;
  
  top.pp = ppConcat([ text(" = "), i.pp ]);
  top.typerep = i.typerep;
  i.initializerPos = "initializer";
  i.expectedType = top.expectedType;
  i.inObject = false;
}

threaded attribute expectedTypes, expectedTypesOut :: [Type];
threaded attribute nestedInits, nestedInitsOut :: Integer;

synthesized attribute asExpr::Expr;

tracked nonterminal Initializer with pp, host, typerep, errors, globalDecls,
  functionDecls, defs, env, initializerPos, inObject, expectedType, expectedTypesOut,
  nestedInits, nestedInitsOut, freeVariables, controlStmtContext,
  isSimple, asExpr;
flowtype Initializer = decorate {env, initializerPos, inObject, expectedType,
  controlStmtContext},
  expectedTypesOut {decorate}, nestedInitsOut {decorate, nestedInits}, asExpr {decorate}, isSimple {decorate};

propagate controlStmtContext on Initializer;

abstract production exprInitializer
top::Initializer ::= e::Expr
{
  top.pp = e.pp;
  forwards to fromMaybe(defaultExprInitializer, top.expectedType.exprInitProd)(e);
}
-- For use by extensions
abstract production hostExprInitializer
top::Initializer ::= e::Expr
{
  top.pp = e.pp;
  forwards to defaultExprInitializer(e);
}

abstract production defaultExprInitializer implements ExprInitializer
top::Initializer ::= @e::Expr
{
  propagate @env, @controlStmtContext;
  top.pp = e.pp;
  top.host = exprInitializer(e.host);
  top.typerep = top.expectedType;
  top.isSimple = e.isSimple;
  top.asExpr = ^e;

  local newMembers::Maybe<[Type]> = remainingObjectMembers(top.env, top.expectedType, e.typerep);
  top.expectedTypesOut = fromMaybe([], newMembers);
  top.nestedInitsOut = max(0, top.nestedInits + length(top.expectedTypesOut) - 1);

  top.errors <-
    if top.inObject
    then
      if newMembers.isJust then []
      else [errFromOrigin(e, s"Incompatible types in ${top.initializerPos}, expected ${show(80, top.expectedType)} but found ${show(80, e.typerep)}")]
    else case top.expectedType of
    | arrayType(_, _, _, _) ->
      case e of
      | stringLiteral(_) -> []
      | _ -> [errFromOrigin(e, "invalid array initializer")]
      end
    | _ when typeAssignableTo(top.expectedType, e.typerep) -> []
    | _ -> [errFromOrigin(e, s"Incompatible types in ${top.initializerPos}, expected ${show(80, top.expectedType)} but found ${show(80, e.typerep)}")]
    end;
}

abstract production objectInitializer
top::Initializer ::= l::InitList
{
  top.pp = ppConcat([text("{"), ppImplode(text(", "), l.pps), text("}")]);
  forwards to fromMaybe(defaultObjectInitializer, top.expectedType.objectInitProd)(l);
}
-- For use by extensions
abstract production hostObjectInitializer
top::Initializer ::= l::InitList
{
  top.pp = ppConcat([text("{"), ppImplode(text(", "), l.pps), text("}")]);
  forwards to defaultObjectInitializer(l);
}

abstract production defaultObjectInitializer implements ObjectInitializer
top::Initializer ::= @l::InitList
{
  propagate @env, @controlStmtContext;

  top.pp = forwardParent.pp;
  top.host = objectInitializer(l.host);
  top.typerep = l.typerep;
  top.isSimple = l.isSimple;
  top.asExpr = compoundLiteralExpr(typeName(top.typerep.baseTypeExpr, top.typerep.typeModifierExpr), ^l);

  top.expectedTypesOut = [];
  top.nestedInitsOut = max(0, top.nestedInits - 1);

  l.initIndex = 0;
  l.expectedType = top.expectedType;
  l.expectedTypes = fromMaybe([top.expectedType], objectMembers(top.env, top.expectedType));

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
    | t, nothing(), _ when l.maxIndex < 0 -> [errFromOrigin(top, s"Empty scalar initializer for type ${show(80, t)}.")]
    -- Check that this type has a definition
    | t, just(_), [] -> [errFromOrigin(top, s"${show(80, t)} does not have a definition.")]
    | _, _, _ -> []
    end;
  top.errors <-
    case top.expectedType, refId of
    | errorType(), _ -> []
    | arrayType(_, _, _, _), _ -> []
    | t, nothing() when top.inObject -> [wrnFromOrigin(top, s"Braces around scalar initializer for type ${show(80, t)}.")]
    | _, _ -> []
    end;
}

threaded attribute initIndex, initIndexOut::Integer;
monoid attribute maxIndex::Integer with -1, max;

tracked nonterminal InitList with pps, initIndex, initIndexOut, maxIndex, host, typerep,
  errors, globalDecls, functionDecls, defs, env, expectedType, expectedTypes,
  nestedInits, freeVariables, controlStmtContext,
  isSimple, bindName, bindRefExprs, bindDefs, hostBindDecls;
flowtype InitList = decorate {initIndex, env, expectedType, expectedTypes,
  controlStmtContext},
  maxIndex {decorate};
propagate initIndex, initIndexOut, maxIndex, expectedTypes, nestedInits, controlStmtContext on InitList;

aspect default production
top::InitList ::=
{
  top.typerep =
    case top.expectedType of
    | arrayType(e, i, sm, incompleteArrayType()) ->
      arrayType(^e, ^i, ^sm, constantArrayType(top.maxIndex + 1))
    | t -> t
    end;
}

abstract production consInit
top::InitList ::= h::Init  t::InitList
{
  propagate expectedType;

  top.pps = h.pp :: t.pps;
  top.freeVariables := h.freeVariables ++ removeDefsFromNames(h.defs, t.freeVariables);
  top.isSimple = h.isSimple && t.isSimple;

  h.env = top.env;
  t.env = addEnv(h.defs, h.env);

  h.bindName = name(top.bindName.name ++ "_" ++ toString(top.initIndex));
  t.bindName = top.bindName;
  top.bindRefExprs = h.bindRefExpr :: t.bindRefExprs;
  top.bindDefs = h.bindDefs ++ t.bindDefs;
  top.hostBindDecls = appendDecls(h.hostBindDecls, t.hostBindDecls);
}

abstract production nilInit
top::InitList ::=
{
  top.pps = [];
  top.freeVariables := [];
  top.isSimple = true;
  top.bindRefExprs = [];
  top.bindDefs = [];
  top.hostBindDecls = nilDecl();
}

tracked nonterminal Init with pp, initIndex, initIndexOut, maxIndex, host, errors,
  globalDecls, functionDecls, defs, env, expectedType, expectedTypes, expectedTypesOut,
  nestedInits, nestedInitsOut, freeVariables, controlStmtContext,
  isSimple, bindName, bindRefExpr, bindDefs, hostBindDecls;
flowtype Init = decorate {initIndex, env, expectedType, expectedTypes,
  controlStmtContext},
  maxIndex {decorate}, initIndexOut {decorate}, expectedTypesOut {decorate};

propagate controlStmtContext, bindName on Init;

abstract production positionalInit
top::Init ::= i::Initializer
{
  propagate env;

  top.pp = i.pp;
  top.initIndexOut = 1 + top.initIndex;
  top.maxIndex := top.initIndex;
  top.isSimple = i.isSimple;

  top.bindRefExpr = if i.isSimple then i.asExpr else declRefExpr(top.bindName);
  top.bindDefs =
    if i.isSimple then []
    else [valueDef(top.bindName.name, preDeclValueItem(i.typerep))];
  top.hostBindDecls =
    if i.isSimple
    then nilDecl()
    else consDecl(
      variableDecls(
        nilStorageClass(),
        nilAttribute(),
        i.expectedType.host.baseTypeExpr,
        consDeclarator(
          declarator(
            top.bindName,
            i.expectedType.host.typeModifierExpr,
            nilAttribute(),
            justInitializer(i.host)),
          nilDeclarator())),
      nilDecl());

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
    then [wrnFromOrigin(i, s"Excess elements in initializer for type ${show(80, top.expectedType)}")]
    else [];

  i.initializerPos = s"positional initializer for type ${show(80, top.expectedType)}"; -- TODO: Include the field name, somehow.
}

abstract production designatedInit
top::Init ::= d::Designator  i::Initializer
{
  top.pp = ppConcat([d.pp, text(" = "), i.pp]);
  top.initIndexOut = d.maxIndex + 1;
  top.maxIndex := d.maxIndex;
  top.isSimple = false;

  top.bindRefExpr = if i.isSimple then i.asExpr else declRefExpr(top.bindName);
  top.bindDefs =
    if i.isSimple then []
    else [valueDef(top.bindName.name, preDeclValueItem(i.typerep))];
  top.hostBindDecls =
    if i.isSimple
    then nilDecl()
    else consDecl(
      variableDecls(
        nilStorageClass(),
        nilAttribute(),
        i.expectedType.host.baseTypeExpr,
        consDeclarator(
          declarator(
            top.bindName,
            i.expectedType.host.typeModifierExpr,
            nilAttribute(),
            justInitializer(i.host)),
          nilDeclarator())),
      nilDecl());

  top.expectedTypesOut = d.expectedTypesOut;
  top.nestedInitsOut = 0;

  d.expectedType = top.expectedType;

  d.env = top.env;
  i.env = addEnv(d.defs, d.env);
  i.initializerPos = s"member ${show(80, d.pp)} of ${show(80, top.expectedType)}";
  i.inObject = true;
  i.expectedType = d.typerep;
}

{--
 - Tree access pattern for designators.
 - e.g.  "[1].d[0] = e" gives "array(0, field(d, array(1, initial)))"
 -}
tracked nonterminal Designator with pp, maxIndex, host, errors, globalDecls, functionDecls,
  defs, env, expectedType, expectedTypesOut, typerep, freeVariables, controlStmtContext;
flowtype Designator = decorate {env, expectedType, controlStmtContext},
  maxIndex {decorate}, expectedTypesOut {decorate};

propagate controlStmtContext on Designator;

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
  propagate env;

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

  local tagEnv::Env =
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
    | t, nothing(), _, _ -> [errFromOrigin(f, s"Field designator only permitted on struct or union types (got ${show(80, t)})")]
    -- Check that this type has a definition
    | t, just(_), [], _ -> [errFromOrigin(f, s"${show(80, t)} does not have a definition")]
    | t, just(_), _, [] -> [errFromOrigin(f, s"${show(80, t)} does not have field ${f.name}")]
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
        [errFromOrigin(e, s"Array index in initializer out of bounds (size ${toString(size)}, index ${toString(i)})")]
      | _ -> []
      end
    | arrayType(_, _, _, _) -> []
    | t -> [errFromOrigin(e, s"Array designator only permitted on array types (got ${show(80, t)}).")]
    end;
  top.errors <-
    if !e.integerConstantValue.isJust
    then [errFromOrigin(e, "Non-constant array index in initializer")]
    else [];

  d.expectedType =
    case top.expectedType of
    | arrayType(e, _, _, _) -> ^e
    | _ -> errorType()
    end;
  top.expectedTypesOut =
    case top.expectedType of
    | arrayType(elem, _, _, constantArrayType(size))
      when e.integerConstantValue matches just(i) -> repeat(^elem, size - (i + 1))
    | arrayType(elem, _, _, incompleteArrayType()) -> repeatInfinite(^elem)
    | _ -> []
    end;

  d.env = top.env;
  e.env = addEnv(d.defs, d.env);

  top.typerep = d.typerep;
}

-- GCC extension
abstract production arrayRangeDesignator
top::Designator ::= d::Designator  l::Expr  u::Expr
{
  propagate env;

  top.pp = ppConcat([d.pp, text("["), l.pp, text("..."), u.pp, text("]")]);
  top.maxIndex := fromMaybe(-1, u.integerConstantValue);

  top.errors <-
    case top.expectedType of
    | errorType() -> []
    | arrayType(_, _, _, constantArrayType(size)) ->
      case l.integerConstantValue of
      | just(li) when li < 0 || li >= size ->
        [errFromOrigin(l, s"Lower array index in initializer out of bounds (size ${toString(size)}, index ${toString(li)})")]
      | _ -> []
      end ++
      case u.integerConstantValue of
      | just(ui) when ui < 0 || ui >= size ->
        [errFromOrigin(u, s"Upper array index in initializer out of bounds (size ${toString(size)}, index ${toString(ui)})")]
      | _ -> []
      end ++
      case l.integerConstantValue, u.integerConstantValue of
      | just(li), just(ui) when li > ui ->
        [wrnFromOrigin(l, s"Empty range in array initializer (size ${toString(size)}, indices ${toString(li)} ... ${toString(ui)})")]
      | _, _ -> []
      end
    | arrayType(_, _, _, _) -> []
    | t -> [errFromOrigin(l, s"Array range designator only permitted on array types (got ${show(80, t)}).")]
    end;
  top.errors <-
    if !u.integerConstantValue.isJust
    then [errFromOrigin(u, "Non-constant array index in initializer")]
    else [];
  top.errors <-
    if !l.integerConstantValue.isJust
    then [errFromOrigin(l, "Non-constant array index in initializer")]
    else [];

  d.expectedType =
    case top.expectedType of
    | arrayType(e, _, _, _) -> ^e
    | _ -> errorType()
    end;
  top.expectedTypesOut =
    case top.expectedType of
    | arrayType(elem, _, _, constantArrayType(size))
      when u.integerConstantValue matches just(i) -> repeat(^elem, size - (i + 1))
    | arrayType(elem, _, _, incompleteArrayType()) -> repeatInfinite(^elem)
    | _ -> []
    end;

  top.typerep = d.typerep;
}

