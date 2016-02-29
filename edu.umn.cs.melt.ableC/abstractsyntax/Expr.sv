grammar edu:umn:cs:melt:ableC:abstractsyntax;

import edu:umn:cs:melt:ableC:abstractsyntax:overload as ovrld;

nonterminal Expr with location, pp, host<Expr>, globalDecls, errors, defs, env, returnType, freeVariables, typerep;

synthesized attribute integerConstantValue :: Maybe<Integer>;

{- The production below is never used.  But it adds a dependency for
   the forwards-to equation on returnType so that it may be used by
    extensions to determine what the forward to.  -}
abstract production seedingForwardsToEquationDependencies
top::Expr ::=
{
  forwards to case top.returnType of
    | nothing() -> mkIntConst(1, top.location)
    | _ -> mkIntConst(1, top.location)
    end;
}

abstract production errorExpr
top::Expr ::= msg::[Message]
{
  propagate host;
  top.pp = concat([ text("/*"), text(messagesToString(msg)), text("*/") ]);
  top.errors := msg;
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
  top.typerep = errorType();
}
abstract production declRefExpr
top::Expr ::= id::Name
{ -- Reference to a value. (Either a Decl or a EnumItem)
  propagate host;
  top.pp = parens( id.pp );
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.typerep = id.valueItem.typerep;
  top.freeVariables = [id];
  
  top.errors <- id.valueLookupCheck;
}
abstract production stringLiteral
top::Expr ::= l::String
{
  propagate host;
  top.pp = text(l);
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
  top.typerep = pointerType([], builtinType([constQualifier()], signedType(charType())));
}
abstract production parenExpr
top::Expr ::= e::Expr
{
  propagate host;
  top.pp = parens( e.pp );
  top.errors := [];
  top.globalDecls := e.globalDecls;
  top.defs = e.defs;
  top.freeVariables = e.freeVariables;
  top.typerep = e.typerep;
}
abstract production unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  propagate host;
  top.pp = if op.preExpr
           then parens( cat( op.pp, e.pp ) )
           else parens( cat( e.pp, op.pp ) );
  top.errors := op.errors ++ e.errors;
  top.globalDecls := e.globalDecls;
  top.defs = e.defs;
  top.freeVariables = e.freeVariables;
  top.typerep = op.typerep;
  
  op.op = e;
}
abstract production unaryExprOrTypeTraitExpr
top::Expr ::= op::UnaryTypeOp  e::ExprOrTypeName
{
  propagate host;
  top.pp = parens( concat([op.pp,parens(e.pp)]) );
  top.errors := op.errors ++ e.errors;
  top.globalDecls := e.globalDecls;
  top.defs = e.defs;
  top.freeVariables = e.freeVariables;
  top.typerep = builtinType([], signedType(intType())); -- TODO sizeof / alignof result type
}
abstract production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  propagate host;
  top.pp = parens( concat([ lhs.pp, brackets( rhs.pp )]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.defs = lhs.defs ++ rhs.defs;
  top.freeVariables = lhs.freeVariables ++ removeDefsFromNames(rhs.defs, rhs.freeVariables);
  
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
  top.pp = parens( concat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );

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
  propagate host;
  top.pp = parens( concat([ f.pp, parens( ppImplode( cat( comma(), space() ), a.pps ))]) );
  top.errors := f.errors ++ a.errors;
  top.globalDecls := f.globalDecls ++ a.globalDecls;
  top.defs = f.defs ++ a.defs;
  top.freeVariables = f.freeVariables ++ removeDefsFromNames(f.defs, a.freeVariables);
  
  local subtype :: Either<Pair<Type FunctionType> [Message]> =
    case f.typerep.defaultFunctionArrayLvalueConversion of
    | pointerType(_, functionType(rt, sub)) -> left(pair(rt, sub))
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
  propagate host;
  top.pp = parens(concat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  top.errors := lhs.errors;
  top.globalDecls := lhs.globalDecls;
  top.defs = lhs.defs;
  top.freeVariables = lhs.freeVariables;
  
  local quals_refid :: Pair<[Qualifier] String> =
    case deref, lhs.typerep of
    | true, pointerType(_, tagType(q, refIdTagType(_, _, rid))) -> pair(q, rid)
    | false, tagType(q, refIdTagType(_, _, rid)) -> pair(q, rid)
    | _, _ -> pair([], "")
    end;
  
  local refids :: [RefIdItem] =
    lookupRefId(quals_refid.snd, top.env);
  
  local valueitems :: [ValueItem] =
    lookupValue(rhs.name, head(refids).tagEnv);
  
  top.typerep =
    if null(refids) then 
      errorType()
    else if null(valueitems) then
      errorType()
    else head(valueitems).typerep;
  
  -- TODO Add qualifiers from quals_refid.fst to the type!
  -- TODO: error checking!! Type checking
}
abstract production binaryOpExpr
top::Expr ::= lhs::Expr  op::BinOp  rhs::Expr
{
  propagate host;
  top.pp = parens( concat([ 
    case op, lhs.pp of
    | assignOp(eqOp()), cat(cat(text("("), lhsNoParens), text(")")) -> lhsNoParens
    | _, _ -> lhs.pp
    end, space(), op.pp, space(), rhs.pp ]) );
  top.errors := lhs.errors ++ op.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.defs = lhs.defs ++ rhs.defs;
  top.freeVariables =
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = op.typerep;
  
  op.lop = lhs;
  op.rop = rhs;
  
  rhs.env = addEnv(lhs.defs, lhs.env);
}
abstract production conditionalExpr
top::Expr ::= cond::Expr  t::Expr  e::Expr
{
  propagate host;
  top.pp = parens( concat([ cond.pp, space(), text("?"), space(), t.pp, space(), text(":"),  space(), e.pp]) );
  top.errors := cond.errors ++ t.errors ++ e.errors;
  top.globalDecls := cond.globalDecls ++ t.globalDecls ++ e.globalDecls;
  top.defs = cond.defs ++ t.defs ++ e.defs;
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
  propagate host;
  top.pp = concat([ cond.pp, space(), text("?:"), space(), e.pp]);
  top.errors := cond.errors ++ e.errors;
  top.globalDecls := cond.globalDecls ++ e.globalDecls;
  top.defs = cond.defs ++ e.defs;
  top.freeVariables = cond.freeVariables ++ e.freeVariables;
  
  top.typerep = e.typerep; -- TODO: not even sure what this should be
  
  -- TODO: type checking!!
}
abstract production explicitCastExpr
top::Expr ::= ty::TypeName  e::Expr
{
  propagate host;
  top.pp = parens( concat([parens(ty.pp), e.pp]) );
  top.errors := ty.errors ++ e.errors;
  top.globalDecls := ty.globalDecls ++ e.globalDecls;
  top.defs = ty.defs ++ e.defs;
  top.freeVariables = ty.freeVariables ++ removeDefsFromNames(ty.defs, e.freeVariables);
  top.typerep = ty.typerep;
  
  e.env = addEnv(ty.defs, ty.env);
  
  -- TODO: type checking!!
}
abstract production compoundLiteralExpr
top::Expr ::= ty::TypeName  init::InitList
{
  propagate host;
  top.pp = parens( concat([parens(ty.pp), text("{"), ppImplode(text(", "), init.pps), text("}")]) );
  top.errors := ty.errors ++ init.errors;
  top.globalDecls := ty.globalDecls ++ init.globalDecls;
  top.defs = ty.defs ++ init.defs;
  top.freeVariables = ty.freeVariables ++ removeDefsFromNames(ty.defs, init.freeVariables);
  top.typerep = ty.typerep; -- TODO: actually may involve learning from the initializer e.g. the length of the array.
  
  init.env = addEnv(ty.defs, ty.env);
  
  -- TODO: type checking!!
}
abstract production predefinedFuncExpr
top::Expr ::= 
{ -- Currently (C99) just __func__ in functions.
  propagate host;
  top.pp = parens( text("__func__") );
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
  top.typerep = pointerType([], builtinType([constQualifier()], signedType(charType()))); -- const char *
}

-- C11
abstract production genericSelectionExpr
top::Expr ::= e::Expr  gl::GenericAssocs  def::MaybeExpr
{
  propagate host;
  top.pp = concat([text("_Generic"),
    parens(ppImplode(text(", "), e.pp :: gl.pps ++
      if def.isJust then
        [text("default: "), def.pp]
      else
        []
      ))]);
  top.errors := e.errors ++ gl.errors ++ def.errors;
  top.globalDecls := e.globalDecls ++ gl.globalDecls ++ def.globalDecls;
  top.defs = e.defs ++ gl.defs ++ def.defs;
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

nonterminal GenericAssocs with pps, host<GenericAssocs>, errors, globalDecls, defs, env, selectionType, compatibleSelections, returnType, freeVariables;

autocopy attribute selectionType :: Type;
synthesized attribute compatibleSelections :: [Decorated Expr];

abstract production consGenericAssoc
top::GenericAssocs ::= h::GenericAssoc  t::GenericAssocs
{
  propagate host;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.defs = h.defs ++ t.defs;
  top.freeVariables = h.freeVariables ++ t.freeVariables;
  top.compatibleSelections = h.compatibleSelections ++ t.compatibleSelections;
}
abstract production nilGenericAssoc
top::GenericAssocs ::=
{
  propagate host;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
  top.compatibleSelections = [];
}

nonterminal GenericAssoc with location, pp, host<GenericAssoc>, globalDecls, errors, defs, env, selectionType, compatibleSelections, returnType, freeVariables;

abstract production genericAssoc
top::GenericAssoc ::= ty::TypeName  fun::Expr
{
  propagate host;
  top.pp = concat([ty.pp, text(": "), fun.pp]);
  top.errors := ty.errors ++ fun.errors;
  top.globalDecls := ty.globalDecls ++ fun.globalDecls;
  top.defs = ty.defs ++ fun.defs;
  top.freeVariables = ty.freeVariables ++ fun.freeVariables;
  top.compatibleSelections =
    if compatibleTypes(top.selectionType, ty.typerep, true) then [fun] else [];
}

-- GCC stmtExpr
abstract production stmtExpr
top::Expr ::= body::Stmt result::Expr
{
  propagate host;
  top.pp = concat([text("({"), nestlines(2, concat([body.pp, line(), result.pp, text("; })")]))]);
  top.errors := body.errors ++ result.errors;
  top.globalDecls := body.globalDecls ++ result.globalDecls;
  top.defs = []; -- defs are *not* propagated up. This is beginning of a scope.
  top.freeVariables = body.freeVariables ++ removeDefsFromNames(body.defs, result.freeVariables);
  top.typerep = result.typerep;
  
  body.env = openScope(top.env);
  result.env = addEnv(body.defs, body.env);
}

-- Inline comment TODO: wtf? delete this.
abstract production comment
top::Expr ::= s::String
{
  propagate host;
  top.pp = concat([ text("/* "), text(s), text(" */") ]);
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
  top.typerep = errorType();
}

-- Temporary hack to affect flowtypes generated by the host language.
-- Silver needs declarations to do this directly instead.
-- e.g. here we should have "flow Expr { forward { env }, pp { env } }" or something.
--{-
abstract production hackUnused
top::Expr ::=
{
  -- No pp equation: make that need env too (via forwarding)
  --top.pp = text("hack");
  -- Forwarding based on env.
  forwards to if false then error(hackUnparse(top.env)) else hackUnused(location=top.location);
}
---}


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
