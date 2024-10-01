grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

tracked nonterminal Expr with pp, host, globalDecls, functionDecls, errors,
  defs, env, freeVariables, typerep, isLValue, isSimple, integerConstantValue,
  controlStmtContext,
  bindName, bindRefExpr, bindDefs, hostBindDecl;

flowtype Expr = decorate {env, controlStmtContext},
  isLValue {decorate}, isSimple {decorate}, integerConstantValue {decorate},
  bindRefExpr {decorate, bindName}, bindDefs {decorate, bindName}, hostBindDecl {decorate, bindName};

synthesized attribute isLValue::Boolean;
synthesized attribute isSimple::Boolean; -- true if expression can be duplicated without encurring any addtional work (is a name, constant, field access, etc.)
implicit synthesized attribute integerConstantValue::Maybe<Integer>;

inherited attribute bindName :: Name;
synthesized attribute bindRefExpr::Expr;
synthesized attribute bindDefs :: [Def];
synthesized attribute hostBindDecl :: Decl;

aspect default production
top::Expr ::=
{
  top.isLValue = false;
  top.isSimple = false;
  implicit top.integerConstantValue = ;

  top.bindRefExpr =
    if top.isSimple then ^top
    else declRefExpr(top.bindName);
  top.bindDefs = [valueDef(top.bindName.name, autoValueItem(top))];
  top.hostBindDecl =
    if top.isSimple then decls(nilDecl())
    else variableDecls(
      nilStorageClass(),
      nilAttribute(),
      top.typerep.host.baseTypeExpr,
      consDeclarator(
        declarator(
          top.bindName,
          top.typerep.host.typeModifierExpr,
          nilAttribute(),
          justInitializer(exprInitializer(top.host))),
        nilDeclarator()));
}

abstract production errorExpr
top::Expr ::= msg::[Message]
{
  propagate host, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([ text("/*"), text(messagesToStringNoOriginsCheck(msg)), text("*/") ]);
  top.errors := msg;
  top.typerep = errorType();
}
-- TODO, this production is interfering and could lose errors in an analysis
abstract production warnExpr
top::Expr ::= msg::[Message] e::Expr
{
  top.pp = ppConcat([ text("/*"), text(messagesToStringNoOriginsCheck(msg)), text("*/"), e.pp ]);
  top.errors <- msg;
  forwards to @e;
}
-- only wrap in warnExpr if have messages
function wrapWarnExpr
Expr ::= msg::[Message] e::Expr
{
  return if null(msg) then ^e else warnExpr(msg, ^e);
}

abstract production qualifiedExpr
top::Expr ::= q::Qualifiers e::Expr
{
  propagate env, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.host = e.host;
  top.typerep = addQualifiers(q.qualifiers, e.typerep);
  top.pp = pp"qualifiedExpr (${ppImplode(space(), q.pps)} (${e.pp}))";
  top.isLValue = e.isLValue;
  q.typeToQualify = e.typerep;
}
-- only wrap in qualifiedExpr if have qualifiers to wrap with
function wrapQualifiedExpr
Expr ::= q::[Qualifier]  e::Expr 
{
  return if null(q) then ^e else qualifiedExpr(foldQualifier(q), ^e);
}

abstract production directRefExpr
top::Expr ::= id::Name
{
  propagate env, controlStmtContext;
  -- Forwarding depends on env. We must be able to compute a pp without using env.
  top.pp = id.pp;

  forwards to id.valueItem.directRefHandler(^id);
}
-- If the identifier is an ordinary one, use the normal var reference production
function ordinaryVariableHandler
Expr ::= id::Name 
{
  return declRefExpr(^id);
}
abstract production declRefExpr
top::Expr ::= id::Name
{ -- Reference to a value. (Either a Decl or a EnumItem)
  propagate env, host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( id.pp );
  top.typerep = id.valueItem.typerep;
  top.freeVariables := top.typerep.freeVariables ++ [^id];
  top.isLValue = true;
  top.isSimple = true;
  top.integerConstantValue = id.valueItem.integerConstantValue;

  top.errors <- id.valueLookupCheck;
  top.errors <-
    if id.valueItem.isItemValue then []
    else [errFromOrigin(id, "'" ++ id.name ++ "' does not refer to a value.")];
}
abstract production stringLiteral
top::Expr ::= l::String
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = text(l);
  top.typerep =
    arrayType(
      builtinType(foldQualifier([]), signedType(charType())),
      nilQualifier(), normalArraySize(), incompleteArrayType());
  top.isSimple = true;
}
abstract production parenExpr
top::Expr ::= e::Expr
{
  propagate host;
  top.pp = parens( e.pp );
  forwards to @e;
}

abstract production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  top.pp = parens( ppConcat([ lhs.pp, brackets( rhs.pp )]) );

  lhs.env = top.env;
  rhs.env = addEnv(lhs.defs, lhs.env);
  propagate controlStmtContext;

  forwards to
    case lhs.typerep.arraySubscriptProd of
    | just(prod) -> prod(lhs, rhs)
    | nothing() -> defaultArraySubscriptExpr(lhs, rhs)
    end;
}
abstract production defaultArraySubscriptExpr
top::Expr ::= @lhs::Expr  @rhs::Expr
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = arraySubscriptExpr(lhs.host, rhs.host);
  top.freeVariables := lhs.freeVariables ++ removeDefsFromNames(rhs.defs, rhs.freeVariables);
  top.isLValue = true;

  local subtype :: Either<Type [Message]> =
    case lhs.typerep.defaultFunctionArrayLvalueConversion, rhs.typerep.defaultFunctionArrayLvalueConversion of
    | pointerType(_, sub), otherty ->
        if otherty.isIntegerType then left(^sub)
        else right([errFromOrigin(top, "index expression does not have integer type (got " ++ show(80, otherty) ++ ")")])
    | otherty, pointerType(_, sub) ->
        if otherty.isIntegerType then left(^sub)
        else right([errFromOrigin(top, "index expression does not have integer type (got " ++ show(80, otherty) ++ ")")])
    | errorType(), _ -> right([])
    | _, errorType() -> right([])
    | _, _ ->
        right([errFromOrigin(top, "expression is not an indexable type (got " ++ show(80, lhs.typerep) ++ ")")])
    end;
  top.typerep = case subtype of
                | left(t) -> t
                | right(_) -> errorType()
                end;
  top.errors <- case subtype of
                | left(_) -> []
                | right(m) -> m
                end;
}

{- Calls where the function expression is just an identifier. -}
abstract production directCallExpr
top::Expr ::= f::Name  a::Exprs
{
  -- Forwarding depends on env. We must be able to compute a pp without using env.
  top.pp = parens( ppConcat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );

  f.env = top.env;
  forwards to f.valueItem.directCallHandler(^f, a);
}

dispatch ReferenceCall = Expr ::= f::Name @a::Exprs;

-- If the identifier is an ordinary one, use the normal function call production
-- Or, if it's a pass-through builtin one, this works too!
production ordinaryFunctionHandler implements ReferenceCall
top::Expr ::= f::Name  @a::Exprs 
{
  forwards to callExpr(declRefExpr(@f), @a);
}

production bindDirectCallExpr implements ReferenceCall
top::Expr ::= f::Name @a::Exprs result::Expr
{
  forwards to letExpr(
    consDecl(bindExprsDecls(freshName("a"), @a), nilDecl()),
    @result);
}

{- Calls where the function is determined by an arbitrary expression. -}
abstract production callExpr
top::Expr ::= f::Expr a::Exprs
{
  top.pp = parens( ppConcat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );

  f.env = top.env;
  f.controlStmtContext = top.controlStmtContext;
  forwards to fromMaybe(defaultCallExpr, f.typerep.callProd)(f, a);
}
-- Non-overloaded version, for use by extensions
abstract production hostCallExpr
top::Expr ::= f::Expr a::Exprs
{
  f.env = top.env;
  f.controlStmtContext = top.controlStmtContext;
  forwards to defaultCallExpr(f, a);
}
abstract production defaultCallExpr implements Call
top::Expr ::= @f::Expr  @a::Exprs
{
  propagate errors, globalDecls, functionDecls, defs;
  top.pp = forwardParent.pp;
  top.host = callExpr(f.host, a.host);
  top.freeVariables := f.freeVariables ++ removeDefsFromNames(f.defs, a.freeVariables);
  top.isLValue = false; -- C++ style references would change this

  local subtype :: Either<Pair<Type FunctionType> [Message]> =
    case f.typerep.defaultFunctionArrayLvalueConversion of
    | pointerType(_, functionType(rt, sub, _)) -> left((^rt, ^sub))
    | errorType() -> right([]) -- error already raised.
    | _ -> right([errFromOrigin(f, "call expression is not function type (got " ++ show(80, f.typerep) ++ ")")])
    end;
  top.typerep =
    case subtype of
    | left(l) -> l.fst
    | right(_) -> errorType()
    end;
  top.errors <-
    case subtype of
     | left(_) -> a.argumentErrors
     | right(r) -> r
    end;

  a.expectedTypes =
    case subtype of
    | left(pair(fst=_, snd=protoFunctionType(args, _))) -> args
    | _ -> []
    end;
  a.argumentPosition = 1;
  a.callExpr = f;
  a.callVariadic =
    case subtype of
    | left(pair(fst=_, snd=protoFunctionType(_, variadic))) -> variadic
    | left(pair(fst=_, snd=noProtoFunctionType())) -> true
    | left(_) -> false
    | _ -> true -- suppress errors
    end;

  a.env = addEnv(f.defs, f.env);
  a.controlStmtContext = top.controlStmtContext;
}
abstract production memberCallExpr
top::Expr ::= e::Expr  deref::Boolean  name::Name  a::Exprs
{
  top.pp = parens( ppConcat([ e.pp, text(if deref then "->" else "."), name.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );
  e.env = top.env;
  e.controlStmtContext = top.controlStmtContext;

  forwards to
    fromMaybe(defaultMemberCallExpr, e.typerep.memberCallProd)(e, deref, @name, a);
}
abstract production defaultMemberCallExpr implements MemberCall
top::Expr ::= @e::Expr  deref::Boolean  name::Name  @a::Exprs
{
  forwards to callExpr(memberExpr(@e, deref, @name), @a);
}
abstract production memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  top.pp = parens(ppConcat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  propagate env, controlStmtContext;

  forwards to
    fromMaybe(defaultMemberExpr, lhs.typerep.memberProd)(lhs, deref, @rhs);
}
abstract production defaultMemberExpr implements MemberAccess
top::Expr ::= @lhs::Expr  deref::Boolean  rhs::Name
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = forwardParent.pp;
  top.host = memberExpr(lhs.host, deref, rhs.host);

  local isPointer::Boolean =
    case lhs.typerep.defaultFunctionArrayLvalueConversion.withoutAttributes of
    | pointerType(_, sub) -> true
    | _ -> false
    end;

  local quals_refid :: Pair<Qualifiers String> =
    case lhs.typerep.defaultFunctionArrayLvalueConversion.withoutAttributes of
    | pointerType(_, sub) ->
        case sub.withoutAttributes of
        | extType(q, e) -> (^q, fromMaybe("", e.maybeRefId))
        | _ -> (nilQualifier(), "")
        end
    | extType(q, e) -> (^q, fromMaybe("", e.maybeRefId))
    | _ -> (nilQualifier(), "")
    end;

  local refids :: [RefIdItem] =
    lookupRefId(quals_refid.snd, addEnv(lhs.defs, lhs.env));

  local valueitems :: [ValueItem] =
    lookupValue(rhs.name, head(refids).tagEnv);

  top.isLValue = true;

  top.typerep =
    if null(refids) then
      errorType()
    else if null(valueitems) then
      errorType()
    else addQualifiers(quals_refid.fst.qualifiers, head(valueitems).typerep);
  top.errors <-
    case isPointer, lhs.typerep.defaultFunctionArrayLvalueConversion of
    | _, errorType() -> []
    | true, pointerType(_, errorType()) -> []
    | _, _ ->
      if null(refids) then
        [errFromOrigin(lhs, "expression does not have defined fields (got " ++ show(80, lhs.typerep) ++ ")")]
      else if isPointer != deref then
        if deref
        then [errFromOrigin(lhs, "expression does not have pointer to struct or union type (got " ++ show(80, lhs.typerep) ++ ")")]
        else [errFromOrigin(lhs, "expression does not have struct or union type (got " ++ show(80, lhs.typerep) ++ ", did you mean to use -> ?)")]
      else if null(valueitems) then
        [errFromOrigin(lhs, "expression does not have field " ++ rhs.name)]
      else []
    end;
  top.isSimple = !deref && lhs.isSimple;
}

abstract production conditionalExpr
top::Expr ::= cond::Expr  t::Expr  e::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([ cond.pp, space(), text("?"), space(), t.pp, space(), text(":"),  space(), e.pp]) );
  top.freeVariables :=
    cond.freeVariables ++
    removeDefsFromNames(cond.defs, t.freeVariables) ++
    removeDefsFromNames(cond.defs ++ t.defs, e.freeVariables);

  top.typerep = t.typerep; -- TODO: this is wrong, but it's an approximation for now

  top.integerConstantValue =
    if cond.integerConstantValue != 0
    then t.integerConstantValue
    else e.integerConstantValue;

  cond.env = top.env;
  t.env = addEnv(cond.defs, cond.env);
  e.env = addEnv(t.defs, t.env);

  -- TODO: type checking!!
}
abstract production binaryConditionalExpr -- GCC extension.
top::Expr ::= cond::Expr  e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = ppConcat([ cond.pp, space(), text("?:"), space(), e.pp]);
  top.freeVariables := cond.freeVariables ++ removeDefsFromNames(cond.defs, e.freeVariables);

  top.typerep = e.typerep; -- TODO: not even sure what this should be

  top.integerConstantValue =
    if cond.integerConstantValue != 0
    then cond.integerConstantValue
    else e.integerConstantValue;

  -- TODO: type checking!!
}
abstract production explicitCastExpr
top::Expr ::= ty::TypeName  e::Expr
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([parens(ty.pp), e.pp]) );
  top.freeVariables := ty.freeVariables ++ removeDefsFromNames(ty.defs, e.freeVariables);
  top.typerep = ty.typerep;
  top.integerConstantValue = e.integerConstantValue;

  ty.env = top.env;
  e.env = addEnv(ty.defs, ty.env);

  -- TODO: type checking!!
}
abstract production compoundLiteralExpr
top::Expr ::= ty::TypeName  init::InitList
{
  propagate host, errors, globalDecls, functionDecls, defs, controlStmtContext;
  top.pp = parens( ppConcat([parens(ty.pp), text("{"), ppImplode(text(", "), init.pps), text("}")]) );
  top.freeVariables := ty.freeVariables ++ removeDefsFromNames(ty.defs, init.freeVariables);
  top.typerep = init.typerep;

  local refId::Maybe<String> =
    case ty.typerep of
    | extType( _, e) -> e.maybeRefId
    | _ -> nothing()
    end;

  local refIdLookup::[RefIdItem] =
    case refId of
    | just(rid) -> lookupRefId(rid, init.env)
    | nothing() -> []
    end;

  top.errors <-
    case ty.typerep, refId, refIdLookup of
    | errorType(), _, _ -> []
    -- Check that expected type for this initializer is some sort of object type or a scalar with a single init
    | arrayType(_, _, _, _), _, _ -> []
    | t, nothing(), _ when init.maxIndex < 0 -> [errFromOrigin(top, s"Empty scalar initializer for type ${show(80, t)}.")]
    -- Check that this type has a definition
    | t, just(_), [] -> [errFromOrigin(top, s"${show(80, t)} does not have a definition.")]
    | _, _, _ -> []
    end;

  init.initIndex = 0;
  ty.env = top.env;
  init.env = addEnv(ty.defs, ty.env);
  init.expectedType = ty.typerep;
  init.expectedTypes = fromMaybe([ty.typerep], objectMembers(top.env, ty.typerep));
}
-- C11 forbids empty initializer braces, but it is an error to include a scalar if one is
-- initializing an empty struct (gcc extension.)
-- This is provided as a convinience that just does the right thing to initialize any type.
-- TODO: We can get rid of this and just use empty initializers if we adopt C23.
abstract production defaultInitExpr
top::Expr ::= t::Type
{
  top.pp = pp"<defaultInit>";
  forwards to compoundLiteralExpr(
    typeName(directTypeExpr(^t), baseTypeExpr()),
    case objectMembers(top.env, ^t) of
    | just([]) -> nilInit()
    | just(mt :: _) when !typeAssignableTo(mt, builtinType(nilQualifier(), signedType(intType()))) ->
        consInit(
          positionalInit(exprInitializer(
            explicitCastExpr(typeName(directTypeExpr(mt), baseTypeExpr()), defaultInitExpr(mt.host)))),
          nilInit())
    | _ -> consInit(positionalInit(exprInitializer(mkIntConst(0))), nilInit())
    end);
}
abstract production predefinedFuncExpr
top::Expr ::=
{ -- Currently (C99) just __func__ in functions.
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = parens( text("__func__") );
  top.typerep = pointerType(nilQualifier(),
  builtinType(foldQualifier([constQualifier()]), signedType(charType()))); -- const char *
}

-- C11
abstract production genericSelectionExpr
top::Expr ::= e::Expr  gl::GenericAssocs  def::MaybeExpr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([text("_Generic"),
    parens(ppImplode(text(", "), e.pp :: gl.pps ++
      if def.isJust then
        [text("default: "), def.pp]
      else
        []
      ))]);
  top.typerep =
    if null(gl.compatibleSelections) then
      case def of
      | justExpr(e) -> e.typerep
      | nothingExpr() -> errorType()
      end
    else
      head(gl.compatibleSelections).typerep;

  gl.selectionType = e.typerep;

  -- TODO: type checking!!
}

tracked nonterminal GenericAssocs with pps, host, errors, globalDecls, functionDecls,
  defs, env, selectionType, compatibleSelections, freeVariables,
  controlStmtContext;
flowtype GenericAssocs = decorate {env, controlStmtContext},
  compatibleSelections {decorate, selectionType};

inherited attribute selectionType :: Type;
monoid attribute compatibleSelections :: [Decorated Expr];

propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, compatibleSelections, 
  selectionType, controlStmtContext on GenericAssocs;

abstract production consGenericAssoc
top::GenericAssocs ::= h::GenericAssoc  t::GenericAssocs
{
  top.pps = h.pp :: t.pps;
}
abstract production nilGenericAssoc
top::GenericAssocs ::=
{
  top.pps = [];
}

tracked nonterminal GenericAssoc with pp, host, globalDecls, functionDecls,
  errors, defs, env, selectionType, compatibleSelections, freeVariables, 
  controlStmtContext;
flowtype GenericAssoc = decorate {env, controlStmtContext},
  compatibleSelections {decorate, selectionType};

propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, selectionType on GenericAssoc;

abstract production genericAssoc
top::GenericAssoc ::= ty::TypeName  fun::Expr
{
  top.pp = ppConcat([ty.pp, text(": "), fun.pp]);
  top.compatibleSelections :=
    if compatibleTypes(top.selectionType, ty.typerep, true, false) then [fun] else [];
  fun.controlStmtContext = top.controlStmtContext;
  ty.controlStmtContext = top.controlStmtContext;
}

-- GCC stmtExpr
abstract production stmtExpr
top::Expr ::= body::Stmt result::Expr
{
  propagate host, errors, globalDecls, functionDecls;
  top.pp = ppConcat([text("({"), nestlines(2, ppConcat([body.pp, line(), result.pp, text("; })")]))]);

  -- defs are *not* propagated up. This is beginning of a scope.
  top.defs := globalDeclsDefs(body.globalDecls) ++ globalDeclsDefs(result.globalDecls)
           ++ functionDeclsDefs(body.functionDecls) ++ functionDeclsDefs(result.functionDecls);

  top.freeVariables := body.freeVariables ++ removeDefsFromNames(body.defs, result.freeVariables);
  top.typerep = result.typerep;

  -- Add body.functionDefs to env here, since labels don't bubble up
  -- from expressions to the top-level function.
  body.env = addEnv(body.functionDefs, openScopeEnv(top.env));
  body.controlStmtContext = controlAddLabels(top.controlStmtContext, body.labelDefs);
  result.controlStmtContext = top.controlStmtContext;
  result.env = addEnv(body.defs, body.env);
}

-- Utility for use by overloading and extensions
abstract production letExpr
top::Expr ::= d::Decls  e::Expr
{
  top.pp = ppConcat([text("let {"), nestlines(2, ppConcat([ppImplode(line(), d.pps), line(), e.pp, text("; }")]))]);
  local s::Stmt = declStmt(decls(@d));
  s.env = top.env;
  s.controlStmtContext = top.controlStmtContext;
  forwards to (if d.isEmpty then noStmtExpr else someStmtExpr)(s, e);
}

dispatch StmtExpr = Expr ::= @s::Stmt @e::Expr;
production noStmtExpr
top::Expr ::= @s::Stmt @e::Expr
{ forwards to @e; }
production someStmtExpr
top::Expr ::= @s::Stmt @e::Expr
{ forwards to stmtExpr(@s, @e); }


-- Inline comment TODO: wtf? delete this.
abstract production comment
top::Expr ::= s::String
{
  propagate host, errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = ppConcat([ text("/* "), text(s), text(" */") ]);
  top.typerep = errorType();
  top.isSimple = true;
}

{- from clang:

// Expressions
def Expr : Stmt<1>;
def PredefinedExpr : DStmt<Expr>;          __func__ in C99
def DeclRefExpr : DStmt<Expr>;             either a Decl or a EnumItem at the moment
def IntegerLiteral : DStmt<Expr>;
def FloatingLiteral : DStmt<Expr>;
def ImaginaryLiteral : DStmt<Expr>;
def StringLiteral : DStmt<Expr>;
def CharacterLiteral : DStmt<Expr>;
def ParenExpr : DStmt<Expr>;
def UnaryOperator : DStmt<Expr>;             except sizeof and alignof
def OffsetOfExpr : DStmt<Expr>;
def UnaryExprOrTypeTraitExpr : DStmt<Expr>;  sizeof and alignof  -- need some sort of 'expr or type' nonterminal. or two prods
def ArraySubscriptExpr : DStmt<Expr>;
def CallExpr : DStmt<Expr>;
def MemberExpr : DStmt<Expr>;                both -> and .
def CastExpr : DStmt<Expr, 1>;
def BinaryOperator : DStmt<Expr>;            all ops and comparisons
def CompoundAssignOperator : DStmt<BinaryOperator>;     assign-ops.
def AbstractConditionalOperator : DStmt<Expr, 1>;
def ConditionalOperator : DStmt<AbstractConditionalOperator>;        normal ?:
def BinaryConditionalOperator : DStmt<AbstractConditionalOperator>;  GNU missing-middle ?:
def ImplicitCastExpr : DStmt<CastExpr>;      TODO: we may need to insert these into the ast. Seems to do things like implicit conversion
def ExplicitCastExpr : DStmt<CastExpr, 1>;   Clang has subtypes, but this will always be a '(type)expr' I think
def CStyleCastExpr : DStmt<ExplicitCastExpr>;
def CompoundLiteralExpr : DStmt<Expr>;       this is (struct foo){initializer}
def ExtVectorElementExpr : DStmt<Expr>;      don't care
def InitListExpr : DStmt<Expr>;              Goes to an initializer
def DesignatedInitExpr : DStmt<Expr>;        C99 designated initializer
def ImplicitValueInitExpr : DStmt<Expr>;     I guess implicit zeros for an initializer?
def ParenListExpr : DStmt<Expr>;             TODO: no idea?
def VAArgExpr : DStmt<Expr>;                 __builtin_var_arg
def GenericSelectionExpr : DStmt<Expr>;      _Generic C11
def PseudoObjectExpr : DStmt<Expr>;          don't think we care?

// Atomic expressions
def AtomicExpr : DStmt<Expr>;

// GNU Extensions.
def AddrLabelExpr : DStmt<Expr>;
def StmtExpr : DStmt<Expr>;
def ChooseExpr : DStmt<Expr>;
def GNUNullExpr : DStmt<Expr>;

// Clang Extensions.
def ShuffleVectorExpr : DStmt<Expr>;
def BlockExpr : DStmt<Expr>;
def OpaqueValueExpr : DStmt<Expr>;

-}
