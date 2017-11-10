grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

import edu:umn:cs:melt:ableC:abstractsyntax:overloadable as ovrld;

nonterminal Expr with location, pp, host<Expr>, lifted<Expr>, globalDecls, errors, defs, env, labelEnv, returnType, freeVariables, typerep, isLValue;

flowtype Expr = decorate {env, labelEnv, returnType}, isLValue {decorate};

synthesized attribute integerConstantValue :: Maybe<Integer>; -- TODO: Is this actually used for anything
synthesized attribute isLValue::Boolean;

aspect default production
top::Expr ::=
{
  top.isLValue = false;
}

abstract production errorExpr
top::Expr ::= msg::[Message]
{
  propagate host, lifted;
  top.pp = ppConcat([ text("/*"), text(messagesToString(msg)), text("*/") ]);
  top.errors := msg;
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.typerep = errorType();
}
-- TODO, this production is interfering and could lose errors in an analysis
abstract production warnExpr
top::Expr ::= msg::[Message] e::Expr
{
  propagate host, lifted;
  top.pp = ppConcat([ text("/*"), text(messagesToString(msg)), text("*/"), e.pp ]);
  top.errors <- msg;
  forwards to e;
}
-- only wrap in warnExpr if have messages
function wrapWarnExpr
Expr ::= msg::[Message] e::Expr l::Location
{
  return if null(msg) then e else warnExpr(msg, e, location=l);
}
abstract production qualifiedExpr
top::Expr ::= q::Qualifiers e::Expr
{
  propagate lifted;
  top.host = e.host;
  top.typerep = addQualifiers(q.qualifiers, e.typerep);
  top.pp = pp"qualifiedExpr (${ppImplode(space(), q.pps)} (${e.pp}))";
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.defs := e.defs;
  top.freeVariables = e.freeVariables;
  top.isLValue = e.isLValue;
}
-- only wrap in qualifiedExpr if have qualifiers to wrap with
function wrapQualifiedExpr
Expr ::= q::[Qualifier]  e::Expr  l::Location
{
  return if null(q) then e else qualifiedExpr(foldQualifier(q), e, location=l);
}
abstract production declRefExpr
top::Expr ::= id::Name
{ -- Reference to a value. (Either a Decl or a EnumItem)
  propagate host, lifted;
  top.pp = parens( id.pp );
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.typerep = id.valueItem.typerep;
  top.freeVariables = [id];
  top.isLValue = true;
  
  top.errors <- id.valueLookupCheck;
  top.errors <-
    if id.valueItem.isItemValue then []
    else [err(id.location, "'" ++ id.name ++ "' does not refer to a value.")];
}
abstract production stringLiteral
top::Expr ::= l::String
{
  propagate host, lifted;
  top.pp = text(l);
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];  
  top.typerep = pointerType(nilQualifier(),
    builtinType(foldQualifier([]), signedType(charType())));
}
abstract production parenExpr
top::Expr ::= e::Expr
{
  propagate host, lifted;
  top.pp = parens( e.pp );
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.defs := e.defs;
  top.freeVariables = e.freeVariables;
  top.typerep = e.typerep;
  top.isLValue = e.isLValue;  
  
}
abstract production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([ lhs.pp, brackets( rhs.pp )]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables = lhs.freeVariables ++ removeDefsFromNames(rhs.defs, rhs.freeVariables);
  top.isLValue = true;
  
  local subtype :: Either<Type [Message]> =
    case lhs.typerep.defaultFunctionArrayLvalueConversion, rhs.typerep.defaultFunctionArrayLvalueConversion of
    | pointerType(_, sub), otherty ->
        if otherty.isIntegerType then left(sub)
        else right([err(top.location, "index expression does not have integer type (got " ++ showType(otherty) ++ ")")])
    | otherty, pointerType(_, sub) ->
        if otherty.isIntegerType then left(sub)
        else right([err(top.location, "index expression does not have integer type (got " ++ showType(otherty) ++ ")")])
    | _, _ ->
        right([err(top.location, "expression is not an indexable type (got " ++ showType(lhs.typerep) ++ ")")])
    end;
  top.typerep = case subtype of
                | left(t) -> t
                | right(_) -> errorType()
                end;
  top.errors <- case subtype of
                | left(_) -> []
                | right(m) -> m
                end;
  
  rhs.env = addEnv(lhs.defs, lhs.env);
}
{- Calls where the function expression is just an identifier. -}
abstract production directCallExpr
top::Expr ::= f::Name  a::Exprs
{
  -- Forwarding depends on env. We must be able to compute a pp without using env.
  top.pp = parens( ppConcat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );

  forwards to f.valueItem.directCallHandler(f, a, top.location);
}
-- If the identifier is an ordinary one, use the normal function call production
-- Or, if it's a pass-through builtin one, this works too!
function ordinaryFunctionHandler
Expr ::= f::Name  a::Exprs  l::Location
{
  -- TODO: Figure out a better solution to integrating overloading
  return ovrld:callExpr(declRefExpr(f, location=f.location), a, location=l);
}

{- Calls where the function is determined by an arbitrary expression. -}
abstract production callExpr
top::Expr ::= f::Expr  a::Exprs
{
  propagate host, lifted;
  top.pp = parens( ppConcat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );
  top.errors := f.errors ++ a.errors;
  top.globalDecls := f.globalDecls ++ a.globalDecls;
  top.defs := f.defs ++ a.defs;
  top.freeVariables = f.freeVariables ++ removeDefsFromNames(f.defs, a.freeVariables);
  top.isLValue = false; -- C++ style references would change this
  
  local subtype :: Either<Pair<Type FunctionType> [Message]> =
    case f.typerep.defaultFunctionArrayLvalueConversion of
    | pointerType(_, functionType(rt, sub, _)) -> left(pair(rt, sub))
    | errorType() -> right([]) -- error already raised.
    | _ -> right([err(f.location, "call expression is not function type (got " ++ showType(f.typerep) ++ ")")])
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
    | left(pair(_, protoFunctionType(args, _))) -> args
    | _ -> []
    end;
  a.argumentPosition = 1;
  a.callExpr = f;
  a.callVariadic =
    case subtype of
    | left(pair(_, protoFunctionType(_, variadic))) -> variadic
    | left(pair(_, noProtoFunctionType())) -> true
    | left(_) -> false
    | _ -> true -- suppress errors
    end;
  
  a.env = addEnv(f.defs, f.env);
}
abstract production memberExpr
top::Expr ::= lhs::Expr  deref::Boolean  rhs::Name
{
  propagate host, lifted;
  top.pp = parens(ppConcat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  top.errors := lhs.errors;
  top.globalDecls := lhs.globalDecls;
  top.defs := lhs.defs;
  top.freeVariables = lhs.freeVariables;
  
  local isPointer::Boolean =
    case lhs.typerep.withoutAttributes of
    | pointerType(_, sub) ->
        case sub.withoutAttributes of
          tagType(q, refIdTagType(_, _, rid)) -> true
        | _ -> false
        end
    | tagType(q, refIdTagType(_, _, rid)) -> false
    | _ -> false
    end;
  
  local quals_refid :: Pair<Qualifiers String> =
    case lhs.typerep.withoutAttributes of
    | pointerType(_, sub) ->
        case sub.withoutAttributes of
          tagType(q, refIdTagType(_, _, rid)) -> pair(q, rid)
        | _ -> pair(nilQualifier(), "")
        end
    | tagType(q, refIdTagType(_, _, rid)) -> pair(q, rid)
    | _ -> pair(nilQualifier(), "")
    end;
  
  local refids :: [RefIdItem] =
    lookupRefId(quals_refid.snd, top.env);
  
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
    if null(refids) then 
      [err(lhs.location, "expression does not have defined fields (got " ++ showType(lhs.typerep) ++ ")")]
    else if isPointer != deref then 
      if deref
      then [err(lhs.location, "expression does not have pointer to struct or union type (got " ++ showType(lhs.typerep) ++ ")")]
      else [err(lhs.location, "expression does not have struct or union type (got " ++ showType(lhs.typerep) ++ ", did you mean to use -> ?)")]
    else if null(valueitems) then
      [err(lhs.location, "expression does not field " ++ rhs.name)]
    else [];
}

abstract production conditionalExpr
top::Expr ::= cond::Expr  t::Expr  e::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([ cond.pp, space(), text("?"), space(), t.pp, space(), text(":"),  space(), e.pp]) );
  top.errors := cond.errors ++ t.errors ++ e.errors;
  top.globalDecls := cond.globalDecls ++ t.globalDecls ++ e.globalDecls;
  top.defs := cond.defs ++ t.defs ++ e.defs;
  top.freeVariables =
    cond.freeVariables ++
    removeDefsFromNames(cond.defs, t.freeVariables) ++
    removeDefsFromNames(cond.defs ++ t.defs, e.freeVariables);
  
  top.typerep = t.typerep; -- TODO: this is wrong, but it's an approximation for now
  
  t.env = addEnv(cond.defs, cond.env);
  e.env = addEnv(t.defs, t.env);
  
  -- TODO: type checking!!
}
abstract production binaryConditionalExpr -- GCC extension.
top::Expr ::= cond::Expr  e::Expr
{
  propagate host, lifted;
  top.pp = ppConcat([ cond.pp, space(), text("?:"), space(), e.pp]);
  top.errors := cond.errors ++ e.errors;
  top.globalDecls := cond.globalDecls ++ e.globalDecls;
  top.defs := cond.defs ++ e.defs;
  top.freeVariables = cond.freeVariables ++ e.freeVariables;
  
  top.typerep = e.typerep; -- TODO: not even sure what this should be
  
  -- TODO: type checking!!
}
abstract production explicitCastExpr
top::Expr ::= ty::TypeName  e::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([parens(ty.pp), e.pp]) );
  top.errors := ty.errors ++ e.errors;
  top.globalDecls := ty.globalDecls ++ e.globalDecls;
  top.defs := ty.defs ++ e.defs;
  top.freeVariables = ty.freeVariables ++ removeDefsFromNames(ty.defs, e.freeVariables);
  top.typerep = ty.typerep;
  
  e.env = addEnv(ty.defs, ty.env);
  
  -- TODO: type checking!!
}
abstract production compoundLiteralExpr
top::Expr ::= ty::TypeName  init::InitList
{
  propagate host, lifted;
  top.pp = parens( ppConcat([parens(ty.pp), text("{"), ppImplode(text(", "), init.pps), text("}")]) );
  top.errors := ty.errors ++ init.errors;
  top.globalDecls := ty.globalDecls ++ init.globalDecls;
  top.defs := ty.defs ++ init.defs;
  top.freeVariables = ty.freeVariables ++ removeDefsFromNames(ty.defs, init.freeVariables);
  top.typerep = ty.typerep; -- TODO: actually may involve learning from the initializer e.g. the length of the array.

  init.env = addEnv(ty.defs, ty.env);
  
  -- TODO: type checking!!
}
abstract production predefinedFuncExpr
top::Expr ::= 
{ -- Currently (C99) just __func__ in functions.
  propagate host, lifted;
  top.pp = parens( text("__func__") );
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.typerep = pointerType(nilQualifier(),
  builtinType(foldQualifier([constQualifier(location=builtinLoc("host"))]), signedType(charType()))); -- const char *
}

-- C11
abstract production genericSelectionExpr
top::Expr ::= e::Expr  gl::GenericAssocs  def::MaybeExpr
{
  propagate host, lifted;
  top.pp = ppConcat([text("_Generic"),
    parens(ppImplode(text(", "), e.pp :: gl.pps ++
      if def.isJust then
        [text("default: "), def.pp]
      else
        []
      ))]);
  top.errors := e.errors ++ gl.errors ++ def.errors;
  top.globalDecls := e.globalDecls ++ gl.globalDecls ++ def.globalDecls;
  top.defs := e.defs ++ gl.defs ++ def.defs;
  top.freeVariables = e.freeVariables ++ gl.freeVariables ++ def.freeVariables;
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

nonterminal GenericAssocs with pps, host<GenericAssocs>, lifted<GenericAssocs>, errors, globalDecls, defs, env, labelEnv, selectionType, compatibleSelections, returnType, freeVariables;
flowtype GenericAssocs = decorate {env, labelEnv, returnType}, compatibleSelections {decorate, selectionType};

autocopy attribute selectionType :: Type;
synthesized attribute compatibleSelections :: [Decorated Expr];

abstract production consGenericAssoc
top::GenericAssocs ::= h::GenericAssoc  t::GenericAssocs
{
  propagate host, lifted;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.defs := h.defs ++ t.defs;
  top.freeVariables = h.freeVariables ++ t.freeVariables;
  top.compatibleSelections = h.compatibleSelections ++ t.compatibleSelections;
}
abstract production nilGenericAssoc
top::GenericAssocs ::=
{
  propagate host, lifted;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.compatibleSelections = [];
}

nonterminal GenericAssoc with location, pp, host<GenericAssoc>, lifted<GenericAssoc>, globalDecls, errors, defs, env, labelEnv, selectionType, compatibleSelections, returnType, freeVariables;
flowtype GenericAssoc = decorate {env, labelEnv, returnType}, compatibleSelections {decorate, selectionType};

abstract production genericAssoc
top::GenericAssoc ::= ty::TypeName  fun::Expr
{
  propagate host, lifted;
  top.pp = ppConcat([ty.pp, text(": "), fun.pp]);
  top.errors := ty.errors ++ fun.errors;
  top.globalDecls := ty.globalDecls ++ fun.globalDecls;
  top.defs := ty.defs ++ fun.defs;
  top.freeVariables = ty.freeVariables ++ fun.freeVariables;
  top.compatibleSelections =
    if compatibleTypes(top.selectionType, ty.typerep, true, false) then [fun] else [];
}

-- GCC stmtExpr
abstract production stmtExpr
top::Expr ::= body::Stmt result::Expr
{
  propagate host, lifted;
  top.pp = ppConcat([text("({"), nestlines(2, ppConcat([body.pp, line(), result.pp, text("; })")]))]);
  top.errors := body.errors ++ result.errors;
  top.globalDecls := body.globalDecls ++ result.globalDecls;
  top.defs := globalDeclsDefs(body.globalDecls) ++ globalDeclsDefs(result.globalDecls); -- defs are *not* propagated up. This is beginning of a scope.
  top.freeVariables = body.freeVariables ++ removeDefsFromNames(body.defs, result.freeVariables);
  top.typerep = result.typerep;
  
  body.env = openEnvScope(top.env);
  result.env = addEnv(body.defs, body.env);
}

-- Inline comment TODO: wtf? delete this.
abstract production comment
top::Expr ::= s::String
{
  propagate host, lifted;
  top.pp = ppConcat([ text("/* "), text(s), text(" */") ]);
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.typerep = errorType();
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
