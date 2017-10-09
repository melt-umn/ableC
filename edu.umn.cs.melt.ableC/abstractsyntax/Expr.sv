grammar edu:umn:cs:melt:ableC:abstractsyntax;

import edu:umn:cs:melt:ableC:abstractsyntax:overload as ovrld;

nonterminal Expr with location, pp, host<Expr>, lifted<Expr>, globalDecls, errors, defs, env, returnType, freeVariables, typerep, isLValue;

flowtype Expr = decorate {env, returnType};

synthesized attribute integerConstantValue :: Maybe<Integer>;
synthesized attribute isLValue::Boolean;

{- The production below is never used.  But it adds a dependency for
   the forwards-to equation on returnType so that it may be used by
    extensions to determine what the forward to.  -}
abstract production seedingForwardsToEquationDependencies
top::Expr ::=
{
  top.pp = text("hack");
  
  forwards to case top.returnType of
    | nothing() -> mkIntConst(1, top.location)
    | _ -> mkIntConst(1, top.location)
    end;
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
  top.isLValue = false;
}
abstract production warnExpr
top::Expr ::= msg::[Message] e::Expr
{
  propagate host, lifted;
  top.pp = ppConcat([ text("/*"), text(messagesToString(msg)), text("*/"), e.pp ]);
  top.errors <- msg;
  forwards to e;
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
  top.isLValue = false;      
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
abstract production dereferenceExpr
top::Expr ::= e::Expr
{
  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := [];

  production attribute collectedTypeQualifiers :: [Qualifier] with ++;
  collectedTypeQualifiers := [];

  top.pp = parens( cat(text("*"), e.pp) );
  top.typerep = addQualifiers(collectedTypeQualifiers, forward.typerep);

  forwards to dereferenceHostExpr(applyMods(runtimeMods, e), location=top.location);
}
abstract production dereferenceHostExpr
top::Expr ::= e::Expr
{
  propagate host, lifted;
  top.pp = parens( cat(text("*"), e.pp) );
  top.errors :=
    case e.typerep.defaultFunctionArrayLvalueConversion of
    | pointerType(_, _) -> []
    | _ -> [err(top.location, "invalid type argument of unary ‘*’ (have ‘" ++
                               showType(e.typerep) ++ "’")]
    end ++
      e.errors;
  top.globalDecls := e.globalDecls;
  top.defs := e.defs;
  top.freeVariables = e.freeVariables;
  top.typerep =
    case e.typerep of
    | pointerType(_, innerty) -> innerty
    | _ -> errorType()
    end;
  top.isLValue = true;
}
abstract production unaryOpExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  op.op = e;
  top.pp = if op.preExpr
           then parens( cat( op.pp, e.pp ) )
           else parens( cat( e.pp, op.pp ) );
  top.typerep = addQualifiers(op.collectedTypeQualifiers, forward.typerep);
  forwards to unaryOpHostExpr(op, e, location=top.location);
}
abstract production unaryOpHostExpr
top::Expr ::= op::UnaryOp  e::Expr
{
  propagate host, lifted;
  top.pp = if op.preExpr
           then parens( cat( op.pp, e.pp ) )
           else parens( cat( e.pp, op.pp ) );
  top.errors := op.errors ++ e.errors;
  top.globalDecls := e.globalDecls;
  top.defs := e.defs;
  top.freeVariables = e.freeVariables;
  top.typerep = op.typerep;
  top.isLValue = op.isLValue;

  top.errors <- 
    if !e.isLValue && op.noLvalueConversion 
    then [err(e.location, "lvalue required as unary operand for " ++ op.opName)]
    else [];

  op.op = e;
}
abstract production unaryExprOrTypeTraitExpr
top::Expr ::= op::UnaryTypeOp  e::ExprOrTypeName
{
  propagate host, lifted;
  top.pp = parens( ppConcat([op.pp,parens(e.pp)]) );
  top.errors := op.errors ++ e.errors;
  top.globalDecls := e.globalDecls;
  top.defs := e.defs;
  top.freeVariables = e.freeVariables;
  top.typerep = builtinType(nilQualifier(), signedType(intType())); -- TODO sizeof / alignof result type

  top.isLValue = false;  
  
  op.typeop = e.typerep;
}
abstract production arraySubscriptExpr
top::Expr ::= lhs::Expr  rhs::Expr
{
  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := [];

  production attribute collectedTypeQualifiers :: [Qualifier] with ++;
  collectedTypeQualifiers := [];

  top.pp = parens( ppConcat([ lhs.pp, brackets( rhs.pp )]) );
  top.typerep = addQualifiers(collectedTypeQualifiers, forward.typerep);

  local modLhsRhs :: Pair<Expr Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  forwards to arraySubscriptHostExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location);
}
abstract production arraySubscriptHostExpr
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
  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := [];

  production attribute collectedTypeQualifiers :: [Qualifier] with ++;
  collectedTypeQualifiers := [];

  top.pp = parens(ppConcat([lhs.pp, text(if deref then "->" else "."), rhs.pp]));
  top.typerep = addQualifiers(collectedTypeQualifiers, forward.typerep);

  forwards to memberHostExpr(applyMods(runtimeMods, lhs), deref, rhs, location=top.location);
}
abstract production memberHostExpr
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

nonterminal LhsOrRhsRuntimeMods with modLhs, modRhs, lhsToModify, rhsToModify;
synthesized attribute modLhs :: Expr;
synthesized attribute modRhs :: Expr;
autocopy attribute lhsToModify :: Expr;
autocopy attribute rhsToModify :: Expr;

abstract production consLhsOrRhsRuntimeMod
top::LhsOrRhsRuntimeMods ::= h::LhsOrRhsRuntimeMod  t::LhsOrRhsRuntimeMods
{
  h.lhsToModify = t.modLhs;
  h.rhsToModify = t.modRhs;

  top.modLhs = h.modLhs;
  top.modRhs = h.modRhs;
}

abstract production nilLhsOrRhsRuntimeMod
top::LhsOrRhsRuntimeMods ::=
{
  top.modLhs = top.lhsToModify;
  top.modRhs = top.rhsToModify;
}

function applyLhsRhsMods
Pair<Expr Expr> ::= l::[LhsOrRhsRuntimeMod] lhs::Expr rhs::Expr
{
  local mods :: LhsOrRhsRuntimeMods = foldr(consLhsOrRhsRuntimeMod, nilLhsOrRhsRuntimeMod(), l);
  mods.lhsToModify = lhs;
  mods.rhsToModify = rhs;

  return pair(mods.modLhs, mods.modRhs);
}

nonterminal LhsOrRhsRuntimeMod with modLhs, modRhs, lhsToModify, rhsToModify;

abstract production lhsRuntimeMod
top::LhsOrRhsRuntimeMod ::= rm::RuntimeMod
{
  top.modLhs = rm.modExpr;
  top.modRhs = top.rhsToModify;

  rm.exprToModify = top.lhsToModify;
}

abstract production rhsRuntimeMod
top::LhsOrRhsRuntimeMod ::= rm::RuntimeMod
{
  top.modLhs = top.lhsToModify;
  top.modRhs = rm.modExpr;

  rm.exprToModify = top.rhsToModify;
}

nonterminal RuntimeMods with modExpr, exprToModify;
synthesized attribute modExpr :: Expr;
autocopy attribute exprToModify :: Expr;

abstract production consRuntimeMod
top::RuntimeMods ::= h::RuntimeMod  t::RuntimeMods
{
  h.exprToModify = t.modExpr;
  top.modExpr = h.modExpr;
}

abstract production nilRuntimeMod
top::RuntimeMods ::=
{
  top.modExpr = top.exprToModify;
}

function applyMods
Expr ::= l::[RuntimeMod] e::Expr
{
  local mods :: RuntimeMods = foldr(consRuntimeMod, nilRuntimeMod(), l);
  mods.exprToModify = e;

  return mods.modExpr;
}

nonterminal RuntimeMod with modExpr, exprToModify;

-- insert arbitrary boolean expressions and error message to print on exit if failed
abstract production runtimeCheck
top::RuntimeMod ::= check::(Expr ::= Expr)  failMessage::String  l::Location
{
  top.modExpr =
    stmtExpr(
      ifStmtNoElse(
        check(top.exprToModify),
        txtStmt(s"fprintf(stderr, \"${l.unparse}:${failMessage}\"); exit(255);")
      ),
      top.exprToModify,
      location=bogusLoc()
    );
}

-- wrap expr using provided function
abstract production runtimeConversion
top::RuntimeMod ::= conv::(Expr ::= Expr)
{
  top.modExpr = conv(top.exprToModify);
}

-- insert arbitrary code in stmtExpr that returns expr unchanged
abstract production runtimeInsertion
top::RuntimeMod ::= ins::(Stmt ::= Expr)
{
  top.modExpr = stmtExpr(ins(top.exprToModify), top.exprToModify, location=bogusLoc());
}

abstract production addExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := [];
  local modLhsRhs :: Pair<Expr Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute collectedTypeQualifiers :: [Qualifier] with ++;
  collectedTypeQualifiers := [];

  top.pp = parens( ppConcat([lhs.pp, space(), text("+"), space(), rhs.pp]) );
  top.typerep = addQualifiers(collectedTypeQualifiers, forward.typerep);

  forwards to addHostExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location);
}

abstract production addHostExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("+"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables =
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualAdditiveConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}
abstract production subtractExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := [];
  local modLhsRhs :: Pair<Expr Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute collectedTypeQualifiers :: [Qualifier] with ++;
  collectedTypeQualifiers := [];

  top.pp = parens( ppConcat([lhs.pp, space(), text("+"), space(), rhs.pp]) );
  top.typerep = addQualifiers(collectedTypeQualifiers, forward.typerep);

  forwards to subtractHostExpr(modLhsRhs.fst, modLhsRhs.snd, location=top.location);
}
abstract production subtractHostExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("-"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables =
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualSubtractiveConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}
abstract production binaryOpExpr
top::Expr ::= lhs::Expr  op::BinOp  rhs::Expr
{
  production attribute runtimeMods::[LhsOrRhsRuntimeMod] with ++;
  runtimeMods := op.lhsRhsRuntimeMods;
  local modLhsRhs :: Pair<Expr Expr> = applyLhsRhsMods(runtimeMods, lhs, rhs);

  production attribute collectedTypeQualifiers :: [Qualifier] with ++;
  collectedTypeQualifiers := [];

  top.typerep = addQualifiers(collectedTypeQualifiers, forward.typerep);

  op.lop = lhs;
  op.rop = rhs;
  top.pp = parens( ppConcat([ 
    {-case op, lhs.pp of
    | assignOp(eqOp()), cat(cat(text("("), lhsNoParens), text(")")) -> lhsNoParens
    | _, _ -> lhs.pp
    end-} lhs.pp, space(), op.pp, space(), rhs.pp ]) );
  forwards to binaryOpHostExpr(lhs, op, rhs, location=top.location);
}
abstract production binaryOpHostExpr
top::Expr ::= lhs::Expr  op::BinOp  rhs::Expr
{
  propagate host, lifted;
  -- case op here is a potential problem, since that emits a dep on op->forward, which eventually should probably include env
  -- Find a way to do this that doesn't cause problems if an op forwards.
  top.pp = parens( ppConcat([ 
    {-case op, lhs.pp of
    | assignOp(eqOp()), cat(cat(text("("), lhsNoParens), text(")")) -> lhsNoParens
    | _, _ -> lhs.pp
    end-} lhs.pp, space(), op.pp, space(), rhs.pp ]) );
  top.errors := lhs.errors ++ op.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables =
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = op.typerep;
  
  op.lop = lhs;
  op.rop = rhs;

  top.isLValue = false;
  
  rhs.env = addEnv(lhs.defs, lhs.env);
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
  top.isLValue = false;
  
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
  top.isLValue = false;
  
  top.typerep = e.typerep; -- TODO: not even sure what this should be
  
  -- TODO: type checking!!
}
abstract production explicitCastExpr
top::Expr ::= ty::TypeName  e::Expr
{
  production attribute runtimeMods::[RuntimeMod] with ++;
  runtimeMods := [];

  production attribute collectedTypeQualifiers :: [Qualifier] with ++;
  collectedTypeQualifiers := [];

  top.pp = parens( ppConcat([parens(ty.pp), e.pp]) );
  top.typerep = addQualifiers(collectedTypeQualifiers, forward.typerep);

  forwards to explicitCastHostExpr(ty, applyMods(runtimeMods, e), location=top.location);
}
abstract production explicitCastHostExpr
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

  top.isLValue = false;
  
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
  top.isLValue = false;

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
  top.isLValue = false;
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
  top.isLValue = false;
  
  gl.selectionType = e.typerep;
  
  -- TODO: type checking!!
}

nonterminal GenericAssocs with pps, host<GenericAssocs>, lifted<GenericAssocs>, errors, globalDecls, defs, env, selectionType, compatibleSelections, returnType, freeVariables;
flowtype GenericAssocs = decorate {env, returnType}, compatibleSelections {decorate, selectionType};

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

nonterminal GenericAssoc with location, pp, host<GenericAssoc>, lifted<GenericAssoc>, globalDecls, errors, defs, env, selectionType, compatibleSelections, returnType, freeVariables;
flowtype GenericAssoc = decorate {env, returnType}, compatibleSelections {decorate, selectionType};

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
  top.isLValue = false;
  
  body.env = openScope(top.env);
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
  top.isLValue = false;
}

function mkRuntimeChecks
Expr ::= conditionals::[Pair<(Expr ::= Expr) String>]  e::Expr  eTyperep::Type
{
  local tmpName :: Name = name("__runtime_check_tmp" ++ toString(genInt()), location=bogusLoc());
  local refTmp :: Expr = declRefExpr(tmpName, location=bogusLoc());

  return
    if null(conditionals)
    then e
    else
      stmtExpr(
        foldStmt(
          [
          declStmt(variableDecls(
            [], nilAttribute(), eTyperep.baseTypeExpr,
            foldDeclarator([
              declarator(
                tmpName, eTyperep.typeModifierExpr,
                nilAttribute(), justInitializer(exprInitializer(e))
              )
            ])
          ))
          ] ++
          map(
            \c::Pair<(Expr ::= Expr) String> -> mkRuntimeCheck(c, refTmp, e.location),
            conditionals
          )
        ),
        refTmp,
        location=bogusLoc()
      );
}

function mkRuntimeCheck
Stmt ::= c::Pair<(Expr ::= Expr) String>  tmpE::Expr  l::Location
{
  -- TODO: improve error handling
  return ifStmtNoElse(c.fst(tmpE), txtStmt(s"fprintf(stderr, \"${l.unparse}:${c.snd}\"); exit(255);"));
}

function mkRuntimeInsertions
Expr ::= insertions::[(Expr ::= Expr)]  e::Expr  eTyperep::Type
{
  local tmpName :: Name = name("__runtime_tmp" ++ toString(genInt()), location=bogusLoc());
  local refTmp :: Expr = declRefExpr(tmpName, location=bogusLoc());

  return
    if null(insertions)
    then e
    else
      stmtExpr(
        foldStmt(
          [
          declStmt(variableDecls(
            [], nilAttribute(), eTyperep.baseTypeExpr,
            foldDeclarator([
              declarator(
                tmpName, eTyperep.typeModifierExpr,
                nilAttribute(), justInitializer(exprInitializer(e))
              )
            ])
          ))
          ] ++
          map(
            \i::(Expr ::= Expr) -> exprStmt(i(refTmp)),
            insertions
          )
        ),
        refTmp,
        location=bogusLoc()
      );
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
