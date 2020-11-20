grammar edu:umn:cs:melt:ableC:abstractsyntax:host;
-- StructDecl, UnionDecl, and EnumDecl are all rooted in the abstract syntax within a TypeExpr.

-- FunctionDecl is (for now) always rooted in an ExternalDeclaration
-- Declaration is rooted in External, but also in stmts. Either a variableDecl or a typedefDecl.
-- ParameterDecl should probably be something special, distinct from variableDecl.

nonterminal GlobalDecls with pps, host, errors, env, returnType, freeVariables;
flowtype GlobalDecls = decorate {env, returnType};

propagate errors on GlobalDecls;

{-- Mirrors Decls, used for lifting mechanism to insert new Decls at top level -}
abstract production consGlobalDecl
top::GlobalDecls ::= h::Decl  t::GlobalDecls
{
  -- host defined in Lifted.sv
  top.pps = h.pp :: t.pps;
  top.errors <-
    if !null(h.functionDecls)
    then error("An extension is attempting to lift a declaration to a function scope, but it has reached global scope.")
    else [];
  top.freeVariables :=
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  
  h.isTopLevel = true;
  
  t.env = addEnv(h.defs, h.env);
}

abstract production nilGlobalDecl
top::GlobalDecls ::=
{
  propagate host, freeVariables;
  top.pps = [];
}

nonterminal Decls with pps, host, errors, globalDecls, functionDecls, unfoldedGlobalDecls, unfoldedFunctionDecls, defs, env, isTopLevel, returnType, freeVariables;
flowtype Decls = decorate {env, isTopLevel, returnType};

autocopy attribute isTopLevel :: Boolean;

propagate host, errors, defs, globalDecls, functionDecls on Decls;

abstract production consDecl
top::Decls ::= h::Decl  t::Decls
{
  top.pps = h.pp :: t.pps;
  top.unfoldedGlobalDecls = h.unfoldedGlobalDecls ++ t.unfoldedGlobalDecls;
  top.unfoldedFunctionDecls = h.unfoldedFunctionDecls ++ t.unfoldedFunctionDecls;
  top.freeVariables :=
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  
  t.env = addEnv(h.defs, h.env);
}

abstract production nilDecl
top::Decls ::=
{
  propagate freeVariables;
  top.pps = [];
  top.unfoldedGlobalDecls = [];
  top.unfoldedFunctionDecls = [];
}

function appendDecls
Decls ::= d1::Decls d2::Decls
{
  return consDecl(decls(d1), d2);
}


nonterminal Decl with pp, host, errors, globalDecls, functionDecls, unfoldedGlobalDecls, unfoldedFunctionDecls, defs, env, isTopLevel, returnType, freeVariables;
flowtype Decl = decorate {env, isTopLevel, returnType};

{-- Pass down from top-level declaration the list of attribute to each name-declaration -}
autocopy attribute givenStorageClasses :: StorageClasses;
autocopy attribute givenAttributes :: Attributes;

aspect default production
top::Decl ::=
{
  top.unfoldedGlobalDecls = top.globalDecls ++ [top];
  top.unfoldedFunctionDecls = top.functionDecls ++ [top];
}

abstract production decls
top::Decl ::= d::Decls
{
  propagate host, errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = terminate( line(), d.pps );
  top.unfoldedGlobalDecls = d.unfoldedGlobalDecls;
  top.unfoldedFunctionDecls = d.unfoldedFunctionDecls;
}

abstract production defsDecl
top::Decl ::= d::[Def]
{
  propagate errors, globalDecls, functionDecls, freeVariables;
  -- host defined in Deferred.sv
  top.pp = ppConcat([pp"/* defsDecl", showEnv(addEnv(d, emptyEnv())), pp"*/"]);
  top.defs := d;
}

abstract production variableDecls
top::Decl ::= storage::StorageClasses  attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = ppConcat(
    terminate(space(), storage.pps) ::
      ppAttributes(attrs) ::
      [ty.pp, space(), ppImplode(text(", "), dcls.pps), semi()]);
  -- host defined in Deferred.sv

  ty.givenRefId = nothing();
  dcls.env = addEnv(ty.defs, ty.env);
  dcls.baseType = ty.typerep;
  dcls.typeModifierIn = ty.typeModifier;
  dcls.isTypedef = false;
  dcls.givenStorageClasses = storage;
  dcls.givenAttributes = attrs;
}

abstract production typeExprDecl
top::Decl ::= attrs::Attributes ty::BaseTypeExpr
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  -- host defined in Deferred.sv
  top.pp = ppConcat( ppAttributes(attrs) :: [ty.pp, semi()] );
  ty.givenRefId = attrs.maybeRefId;
}

abstract production typedefDecls
top::Decl ::= attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = ppConcat([text("typedef "), ppAttributes(attrs), ty.pp, space(), ppImplode(text(", "), dcls.pps), semi()]);
  -- host defined in Deferred.sv
  
  ty.givenRefId = attrs.maybeRefId;
  dcls.env = addEnv(ty.defs, ty.env);
  dcls.baseType = ty.typerep;
  dcls.typeModifierIn = ty.typeModifier;
  dcls.isTypedef = true;
  dcls.givenStorageClasses = nilStorageClass();
  dcls.givenAttributes = attrs;
}

abstract production functionDeclaration
top::Decl ::= f::FunctionDecl
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = f.pp;
  -- host defined in Deferred.sv
}



{--
 - The semantics of this are to raise the messages in 'msg' and otherwise have
 - no effect. This is distinct from typical 'errorSomething' productions
 - in that the messages can be warnings about something, but this production
 - will otherwise behave as though it didn't exist. (whereas an 'error' production
 - typically has no interpretation beyond raising errors.)
 -}
abstract production warnDecl
top::Decl ::= msg::[Message]
{
  propagate host, globalDecls, functionDecls, defs, freeVariables;
  top.pp = ppConcat([text("/*"),
    ppImplode(line(), map(text, map((.output), msg))),
    text("*/")]);
  top.errors := msg;
}

{--
 - The purpose of this production is for an extension production to use to wrap
 - children that have already been decorated during error checking, etc. when
 - computing a forward tree, to avoid re-decoration and potential exponential
 - performance hits.  When using this production, one must be very careful to
 - ensure that the inherited attributes recieved by the wrapped tree are equivalent
 - to the ones that would have been passed down in the forward tree.
 - See https://github.com/melt-umn/silver/issues/86
 -}
abstract production decDecl
top::Decl ::= d::Decorated Decl
{
  top.pp = d.pp;
  top.host = d.host;
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.functionDecls := d.functionDecls;
  top.unfoldedGlobalDecls = d.unfoldedGlobalDecls;
  top.unfoldedFunctionDecls = d.unfoldedFunctionDecls;
  top.defs := d.defs;
  top.freeVariables := d.freeVariables;
  forwards to new(d); -- for easier pattern matching
}

-- C11
abstract production staticAssertDecl
top::Decl ::= e::Expr  s::String
{
  propagate host, errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = ppConcat([text("_Static_assert("), e.pp, text(", "), text(s), text(");")]);
}

abstract production fileScopeAsm
top::Decl ::= s::String
{
  propagate host, errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = ppConcat([text("asm"), parens(text(s))]);
  -- TODO: should be file-scope only.
  -- Semantics note: just puts the string into the assembly file being created
  -- by the compiler. Usually a better way to do this now, with attributes,
  -- but used to be the way to put c functions and such in custom sections.
}

-- Useful for extensions
abstract production autoDecl
top::Decl ::= n::Name  e::Expr
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables;
  top.pp = pp"auto ${n.pp} = ${e.pp};";
  top.host =
    variableDecls(
      nilStorageClass(),
      nilAttribute(),
      e.typerep.host.baseTypeExpr,
      consDeclarator(
        declarator(
          n,
          e.typerep.host.typeModifierExpr,
          nilAttribute(),
          justInitializer(exprInitializer(e.host, location=e.location))),
        nilDeclarator()));
  
  top.errors <- n.valueRedeclarationCheckNoCompatible;
  top.defs <- [valueDef(n.name, autoValueItem(e))];
}

monoid attribute hasModifiedTypeExpr::Boolean with false, ||;
synthesized attribute hostDecls::[Decl];

nonterminal Declarators with pps, host, hostDecls, hasModifiedTypeExpr, errors, globalDecls, functionDecls, defs, env, baseType, typeModifierIn, isTopLevel, isTypedef, givenStorageClasses, givenAttributes, returnType, freeVariables;
flowtype Declarators = decorate {env, returnType, baseType, typeModifierIn, givenStorageClasses, givenAttributes, isTopLevel, isTypedef}, hostDecls {decorate}, hasModifiedTypeExpr {decorate};

propagate host, errors, defs, globalDecls, functionDecls, hasModifiedTypeExpr on Declarators;

abstract production consDeclarator
top::Declarators ::= h::Declarator  t::Declarators
{
  top.pps = h.pps ++ t.pps;
  top.hostDecls = h.hostDecl :: t.hostDecls;
  top.freeVariables :=
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);

  t.env = addEnv(h.defs, h.env);
}
abstract production nilDeclarator
top::Declarators ::=
{
  top.pps = [];
  top.hostDecls = [];
  top.freeVariables := [];
}

synthesized attribute hostDecl::Decl;

nonterminal Declarator with pps, host, hostDecl, hasModifiedTypeExpr, errors, globalDecls, functionDecls, defs, env, baseType, typeModifierIn, typerep, sourceLocation, isTopLevel, isTypedef, givenStorageClasses, givenAttributes, returnType, freeVariables;
flowtype Declarator = decorate {env, returnType, baseType, typeModifierIn, givenStorageClasses, givenAttributes, isTopLevel, isTypedef}, hostDecl {decorate}, hasModifiedTypeExpr {decorate};

autocopy attribute isTypedef :: Boolean;

propagate host, errors, globalDecls, functionDecls, defs, freeVariables on Declarator;

abstract production declarator
top::Declarator ::= name::Name  ty::TypeModifierExpr  attrs::Attributes  initializer::MaybeInitializer
{
  top.pps =
    case ty of
{-      pointerTypeExpr(qs, functionTypeExprWithArgs(result, args, variadic)) ->
        [ppConcat([
          ty.lpp,
          parens(cat(name.pp, text("*"))),
          parens(
            if null(args.pps) 
            then text("void") 
            else ppImplode(text(", "), 
                (if variadic then args.pps ++ [text("...")] else args.pps))),
          result.rpp])]
    | pointerTypeExpr(qs, functionTypeExprWithoutArgs(result, ids)) ->
      [ppConcat([
        ty.lpp,
        parens(cat(name.pp, text("*"))),
        parens(ppImplode(text(", "),
        map((.pp), ids))),
        result.rpp])]-}
    | _ -> [ppConcat([ty.lpp, name.pp, ty.rpp, ppAttributesRHS(attrs), initializer.pp])]
    end;
  
  local hostTy::BaseTypeExpr = fromMaybe(top.baseType.baseTypeExpr, ty.modifiedBaseTypeExpr);
  top.hostDecl =
    if top.isTypedef
    then typedefDecls(top.givenAttributes, hostTy, consDeclarator(top.host, nilDeclarator()))
    else variableDecls(top.givenStorageClasses, top.givenAttributes, hostTy, consDeclarator(top.host, nilDeclarator()));
  top.hasModifiedTypeExpr := ty.modifiedBaseTypeExpr.isJust;
  
  initializer.expectedType = ty.typerep;
  
  top.defs <-
    [valueDef(name.name, declaratorValueItem(top))] ++ 
    globalDeclsDefs(ty.globalDecls) ++
    functionDeclsDefs(ty.functionDecls);
  top.typerep =
    if top.isTypedef
    then noncanonicalType(typedefType(nilQualifier(), name.name, typerepWithAllExtnQuals))
    else typerepWithAllExtnQuals;
  top.sourceLocation = name.location;
  
  attrs.env = addEnv(ty.defs, ty.env);
  initializer.env = attrs.env;
  
  top.errors <- 
    if top.isTopLevel then
      name.valueRedeclarationCheck(top.typerep)
    else
      name.valueRedeclarationCheckNoCompatible;
  
  top.errors <-
    if !top.isTypedef && !top.typerep.isCompleteType(ty.env)
    then
      case initializer of
      | justInitializer(_) ->
        [err(top.sourceLocation, s"variable ${name.name} has initializer but incomplete type ${showType(top.typerep)}")]
      | nothingInitializer() -> []
      end ++
      -- TODO: This check should be included for non-extern top-level declarations. However, we
      -- somehow need to check if a struct actually does have a declaration later on in the file,
      -- which would complicate the environment.
      if !top.isTopLevel --!(top.isTopLevel && top.givenStorageClasses.isExtern)
      then [err(top.sourceLocation, s"storage size of ${name.name} (type ${showType(top.typerep)}) isn't known")]
      else []
    else [];

  local allAttrs :: Attributes = appendAttribute(top.givenAttributes, attrs);
  allAttrs.env = top.env;
  allAttrs.returnType = top.returnType;
  
  local animatedTyperep :: Type = animateAttributeOnType(allAttrs, initializer.typerep);

  -- accumulate extension qualifiers on redeclaration
  local typerepWithAllExtnQuals :: Type =
		if top.isTopLevel
		then name.valueMergeRedeclExtnQualifiers(animatedTyperep)
		else animatedTyperep;
}
abstract production errorDeclarator
top::Declarator ::= msg::[Message]
{
  top.pps = [];
  top.hostDecl = warnDecl(msg);
  top.hasModifiedTypeExpr := false;
  top.errors <- msg;
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

nonterminal FunctionDecl with pp, host<Decl>, errors, globalDecls, defs, env, typerep, name, sourceLocation, returnType, freeVariables;
flowtype FunctionDecl = decorate {env, returnType}, name {}, sourceLocation {};

propagate errors, globalDecls on FunctionDecl;

abstract production functionDecl
top::FunctionDecl ::= storage::StorageClasses  fnquals::SpecialSpecifiers  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::Attributes  ds::Decls  body::Stmt
{
  top.pp = ppConcat([terminate(space(), storage.pps), terminate( space(), fnquals.pps ),
    bty.pp, space(), mty.lpp, name.pp, mty.rpp, ppAttributesRHS(attrs), line(), terminate(cat(semi(), line()), ds.pps),
    text("{"), line(), nestlines(2,body.pp), text("}")]);
  
  local functionDecls :: [Decorated Decl] = bty.functionDecls ++ 
    mty.functionDecls ++ ds.functionDecls ++ body.functionDecls ++ 
    fnquals.functionDecls;
  
  local hostBody :: Stmt =
    seqStmt(
      foldr(
        \ decl::Decorated Decl stmt::Stmt ->
          seqStmt(declStmt(decl.host), stmt),
        nullStmt(), functionDecls),
      body.host);

  top.host =
    case mty.modifiedBaseTypeExpr of
    | just(mbty) ->
      decls(
        foldDecl(
          -- decorate needed here because of flowtype for decls
          decorate bty.host with {
            env = bty.env; returnType = bty.returnType; givenRefId = bty.givenRefId;
          }.decls ++
          [functionDeclaration(
             functionDecl(
               storage,
               fnquals.host,
               mbty,
               mty.host,
               name.host,
               attrs.host,
               ds.host,
               hostBody))]))
    | nothing() ->
      functionDeclaration(
        functionDecl(
          storage,
          fnquals.host,
          bty.host,
          mty.host,
          name.host,
          attrs.host,
          ds.host,
          hostBody))
    end;
  
  fnquals.env = top.env;
  fnquals.returnType = top.returnType;  
  
  local parameters :: Decorated Parameters =
    case mty of
    | functionTypeExprWithArgs(result, args, variadic, q) ->
        args
    | _ -> decorate nilParameters() with { env = top.env; returnType = top.returnType; position = 0; }
    end;
  
  local funcDefs::[Def] = bty.defs ++ [valueDef(name.name, functionValueItem(top))];
  production attribute implicitDefs::[Def] with ++;
  implicitDefs := [miscDef("this_func", currentFunctionItem(name, top))];
  
  local nameValueItem::ValueItem =
    builtinValueItem(
      pointerType(
        nilQualifier(),
        builtinType(
          consQualifier(constQualifier(location=builtinLoc("host")), nilQualifier()),
          signedType(charType()))));
  implicitDefs <-
    [globalDefsDef( -- These should be seen as "global" for the purpose of computing free variables
       map(valueDef(_, nameValueItem), ["__func__", "__FUNCTION__", "__PRETTY_FUNCTION__"]))];

  top.defs :=
    funcDefs ++
    globalDeclsDefs(mty.globalDecls) ++
    globalDeclsDefs(ds.globalDecls) ++
    globalDeclsDefs(body.globalDecls) ++
    globalDeclsDefs(fnquals.globalDecls);
  top.freeVariables :=
    bty.freeVariables ++
    removeDefsFromNames(implicitDefs, mty.freeVariables) ++
    ds.freeVariables ++ --TODO?
    removeDefsFromNames(top.defs ++ parameters.defs ++ ds.defs ++ fnquals.defs, body.freeVariables);
  -- accumulate extension qualifiers on redeclaration
  top.typerep = name.valueMergeRedeclExtnQualifiers(mty.typerep);
  top.name = name.name;
  top.sourceLocation = name.location;
  
  bty.givenRefId = nothing();
  
  mty.baseType = bty.typerep;
  mty.typeModifierIn = bty.typeModifier;
  
  -- This ugly bit of awesomeness is needed to avoid redecorating bty and potentially re-generating
  -- refIds, in case someone decides to declare a new struct in the function return type.  
  local retMty::TypeModifierExpr = 
    case mty of
    | functionTypeExprWithArgs(ret, _, _, _) -> ret
    | functionTypeExprWithoutArgs(ret, _, _) -> ret
    end;
  retMty.env = mty.env;
  retMty.returnType = mty.returnType;
  retMty.baseType = bty.typerep;
  retMty.typeModifierIn = bty.typeModifier;
  
  body.returnType =
    case mty of
    | functionTypeExprWithArgs(ret, _, _, _) -> just(retMty.typerep)
    | functionTypeExprWithoutArgs(ret, _, _) -> just(retMty.typerep)
    | _ -> nothing() -- Don't error here, this is caught in type checking
    end;
  
  mty.env = addEnv(implicitDefs, openScopeEnv(addEnv(funcDefs, top.env)));
  ds.env = addEnv(mty.defs ++ parameters.functionDefs, mty.env);
  body.env = addEnv(ds.defs ++ body.functionDefs, ds.env);
  
  ds.isTopLevel = false;
  
  -- TODO: so long as the original wasn't also a definition
  top.errors <- name.valueRedeclarationCheck(top.typerep); 
  
  top.errors <-
    if name.name == "main" && 
      !compatibleTypes(bty.typerep, builtinType(nilQualifier(), signedType(intType())), false, false)
    then [wrn(name.location, "Main function should return 'int' not " ++ showType(bty.typerep))]
    else []; -- TODO: check the rest of the signature.
}

-- Allows extensions to handle nested functions differently
-- TODO: is this needed?  Should this be forwarding?  
abstract production nestedFunctionDecl
top::FunctionDecl ::= storage::StorageClasses  fnquals::SpecialSpecifiers  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::Attributes  ds::Decls  body::Stmt
{
  --top.defs := bty.defs ++ [valueDef(name.name, functionValueItem(top))];
  
  ds.isTopLevel = false;
  
  forwards to functionDecl(storage, fnquals, bty, mty, name, attrs, ds, body);
}

abstract production badFunctionDecl
top::FunctionDecl ::= msg::[Message]
{
  top.pp = ppConcat([text("/*"),
    ppImplode(line(), map(text, map((.output), msg))),
    text("*/")]);
  top.host = functionDeclaration(top);
  top.defs := [];
  top.freeVariables := [];
  top.typerep = errorType();
  top.name = "badFunctionDecl";
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

synthesized attribute len::Integer;
inherited attribute position::Integer;

nonterminal Parameters with typereps, pps, count, host, errors, globalDecls, functionDecls, decls, defs, functionDefs, env, returnType, position, freeVariables, appendedParameters, appendedParametersRes;
flowtype Parameters = decorate {env, returnType, position}, appendedParametersRes {appendedParameters};

autocopy attribute appendedParameters :: Parameters;
synthesized attribute appendedParametersRes :: Parameters;

propagate host, errors, globalDecls, functionDecls, decls, defs, functionDefs on Parameters;

abstract production consParameters
top::Parameters ::= h::ParameterDecl  t::Parameters
{
  top.pps = h.pp :: t.pps;
  top.count = t.count + 1;
  top.typereps = h.typerep :: t.typereps;
  top.freeVariables :=
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  top.appendedParametersRes = consParameters(h, t.appendedParametersRes);
  
  t.env = addEnv(h.defs ++ h.functionDefs, top.env);
  h.position = top.position;
  t.position = 1 + top.position;
}

abstract production nilParameters
top::Parameters ::=
{
  top.pps = [];
  top.count = 0;
  top.typereps = [];
  top.freeVariables := [];
  top.appendedParametersRes = top.appendedParameters;
}

abstract production decParameters
top::Parameters ::= p::Decorated Parameters
{
  top.pps = p.pps;
  top.host = p.host;
  top.count = p.count;
  top.typereps = p.typereps;
  top.errors := p.errors;
  top.globalDecls := p.globalDecls;
  top.functionDecls := p.functionDecls;
  top.decls := p.decls;
  top.defs := p.defs;
  top.functionDefs := p.functionDefs;
  top.freeVariables := p.freeVariables;
  forwards to new(p);
}

function appendParameters
Parameters ::= p1::Parameters p2::Parameters
{
  p1.appendedParameters = p2;
  return p1.appendedParametersRes;
}

-- TODO: move these, later
synthesized attribute paramname :: Maybe<Name>;

nonterminal ParameterDecl with paramname, typerep, pp, host, errors, globalDecls, functionDecls, decls, defs, functionDefs, env, position, sourceLocation, returnType, freeVariables;
flowtype ParameterDecl = decorate {env, returnType, position}, paramname {};

propagate errors, globalDecls, functionDecls, decls, defs, freeVariables on ParameterDecl;

abstract production parameterDecl
top::ParameterDecl ::= storage::StorageClasses  bty::BaseTypeExpr  mty::TypeModifierExpr  name::MaybeName  attrs::Attributes
{
  top.pp = ppConcat([terminate(space(), storage.pps),
    bty.pp, space(), mty.lpp, space(), name.pp, mty.rpp, ppAttributesRHS(attrs)]);
  top.host =
    case mty.modifiedBaseTypeExpr of
    | just(mbty) -> parameterDecl(storage, mbty, mty.host, name.host, attrs.host)
    | nothing() -> parameterDecl(storage, bty.host, mty.host, name.host, attrs.host)
    end;
  top.paramname = name.maybename;
  top.typerep = mty.typerep;
  top.sourceLocation = 
    case name.maybename of
    | just(n) -> n.location
    | nothing() -> loc("??",-1,-1,-1,-1,-1,-1) -- TODO: bug? probably okay, since only used to lookup names from env
    end;
  top.globalDecls <-
    case mty.modifiedBaseTypeExpr of
    | just(_) ->
      -- TODO: Should be lifting decls to the closest scope, not global!
      map(
        \ d::Decl ->
          decorate d with {env = top.env; returnType = top.returnType; isTopLevel = true;},
        -- decorate needed here because of flowtype for decls
        decorate bty.host with {
          env = bty.env; returnType = bty.returnType; givenRefId = bty.givenRefId;
        }.decls)
    | nothing() -> []
    end;
  top.functionDefs :=
    case name.maybename of
    | just(n) -> [valueDef(n.name, parameterValueItem(top))]
    | _ -> []
    end;
  
  bty.givenRefId = nothing();
  
  mty.env = addEnv(bty.defs, bty.env);
  mty.baseType = bty.typerep;
  mty.typeModifierIn = bty.typeModifier;
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;
  -- TODO: Check for incomplete types when we know this is an actual function definition
}

-- This is the last item in a struct/union declaration
inherited attribute isLast::Boolean;

inherited attribute inAnonStructItem::Boolean;

synthesized attribute refId :: String; -- TODO move this later?

monoid attribute hasConstField::Boolean with false, ||;
monoid attribute fieldNames::[Either<String ExtType>] with [], ++;

nonterminal StructDecl with location, pp, host, maybename, errors, globalDecls, functionDecls, defs, env, localDefs, tagEnv, isLast, inAnonStructItem, givenRefId, refId, hasConstField, fieldNames, returnType, freeVariables;
flowtype StructDecl = decorate {env, isLast, inAnonStructItem, givenRefId, returnType}, localDefs {decorate}, tagEnv {decorate}, refId {decorate}, hasConstField {decorate}, fieldNames {decorate};

propagate host, errors, globalDecls, functionDecls, localDefs, hasConstField, fieldNames, freeVariables on StructDecl;

abstract production structDecl
top::StructDecl ::= attrs::Attributes  name::MaybeName  dcls::StructItemList
{
  top.maybename = name.maybename;
  top.pp = ppConcat([text("struct "), ppAttributes(attrs),
    if name.hasName || top.inAnonStructItem then name.pp else text("anon_" ++ name.anonTagRefId),
    -- DEBUGGING
    --text("/*" ++ top.refId ++ "*/"),
    -- END DEBUGGING
    text(" {"), nestlines(2, terminate(line(), dcls.pps)),
    text("}")]);

{-
  A few notes on struct/union declarations.
  
  The declaration of a *name* of a struct creates a Tag def in the environment.
  This includes both forward declarations "struct foo;" and also regular declarations
  as "struct foo { ... }" creates the Tag def only for the env in the braces.
  
  Upon completion of struct decl (the closing brace), the RefIdItem is entered into
  the environment.
  
  The Type representation only ever references the refID. This allows types to
  (a) resolve to anonymous struct declarations that have no name
  (b) be created pointing to a forward declaration and later be updated with the
      concrete defintion
  (c) quick and easy equality: equality of refids.
-}

  local maybeAttribRefIdName::Maybe<String> = orElse(attrs.maybeRefId, top.givenRefId);
  -- Derive the default refId from the location - this needs to be fixed since
  -- we don't have a tag name available for the lookup.
  -- Somewhat brittle with generated locations, but by convention extensions
  -- shouldn't be forwarding to anon structs anyway.
  name.anonTagRefId =
    sflatMap(\ s::String -> if isAlpha(s) || isDigit(s) then s else "_", explode("", top.location.filename)) ++
    "_" ++ toString(top.location.line) ++ "_" ++ toString(top.location.column);
  top.refId = fromMaybe(name.tagRefId, maybeAttribRefIdName);
  
  top.tagEnv = addEnv(dcls.localDefs, emptyEnv());
  
  -- If there is no forward declaration, and we have a name, then add a tag dcl for the refid.
  local preDefs :: [Def] = 
    if name.tagHasForwardDcl || !name.hasName then []
    else [tagDef(name.maybename.fromJust.name, refIdTagItem(structSEU(), top.refId))];
  -- Always add the refid TODO: deal with C11-allowed redeclarations?
  local postDefs :: [Def] =
    [refIdDef(top.refId, structRefIdItem(top))];

  top.defs := preDefs ++ dcls.defs ++ postDefs;
  
  dcls.env = openScopeEnv(addEnv(preDefs, top.env));
  dcls.inStruct = true;
  dcls.isLast = top.isLast;
  
  
  -- Redeclaration error if there IS a forward declaration AND an existing refid declaration.
  top.errors <-
    if !name.tagHasForwardDcl || null(lookupRefId(top.refId, top.env)) then []
    else [err(top.location, "Redeclaration of struct " ++ name.maybename.fromJust.name)];
}

nonterminal UnionDecl with location, pp, host, maybename, errors, globalDecls, functionDecls, defs, env, localDefs, tagEnv, isLast, inAnonStructItem, givenRefId, refId, hasConstField, fieldNames, returnType, freeVariables;
flowtype UnionDecl = decorate {env, isLast, inAnonStructItem, givenRefId, returnType}, localDefs {decorate}, tagEnv {decorate}, refId {decorate}, hasConstField {decorate}, fieldNames {decorate};

propagate host, errors, globalDecls, functionDecls, localDefs, hasConstField, freeVariables on UnionDecl;

abstract production unionDecl
top::UnionDecl ::= attrs::Attributes  name::MaybeName  dcls::StructItemList
{
  top.maybename = name.maybename;
  top.pp = ppConcat([text("union "), ppAttributes(attrs),
    if name.hasName || top.inAnonStructItem then name.pp else text("anon_" ++ name.anonTagRefId),
    -- DEBUGGING
    --text("/*" ++ top.refId ++ "*/"),
    -- END DEBUGGING
    text(" {"), nestlines(2, terminate(line(), dcls.pps)),
    text("}")]);

  local maybeAttribRefIdName::Maybe<String> = orElse(attrs.maybeRefId, top.givenRefId);
  name.anonTagRefId =
    sflatMap(\ s::String -> if isAlpha(s) || isDigit(s) then s else "_", explode("", top.location.filename)) ++
    "_" ++ toString(top.location.line) ++ "_" ++ toString(top.location.column);
  top.refId = fromMaybe(name.tagRefId, maybeAttribRefIdName);
  
  top.tagEnv = addEnv(dcls.localDefs, emptyEnv());
  top.fieldNames :=
    case dcls.fieldNames of
    | f :: _ -> [f]
    | [] -> []
    end;
  
  -- If there is no forward declaration, and we have a name, then add a tag dcl for the refid.
  local preDefs :: [Def] = 
    if name.tagHasForwardDcl || !name.hasName then []
    else [tagDef(name.maybename.fromJust.name, refIdTagItem(unionSEU(), top.refId))];
  -- Always add the refid TODO: deal with C11-allowed redeclarations?
  local postDefs :: [Def] =
    [refIdDef(top.refId, unionRefIdItem(top))];

  top.defs := preDefs ++ dcls.defs ++ postDefs;
  
  dcls.env = openScopeEnv(addEnv(preDefs, top.env));
  dcls.inStruct = false;
  dcls.isLast = top.isLast;
  
  
  -- Redeclaration error if there IS a forward declaration AND an existing refid declaration.
  top.errors <-
    if !name.tagHasForwardDcl || null(lookupRefId(top.refId, top.env)) then []
    else [err(top.location, "Redeclaration of union " ++ name.maybename.fromJust.name)];
}

nonterminal EnumDecl with location, pp, host, maybename, errors, globalDecls, functionDecls, defs, env, givenRefId, returnType, freeVariables;
flowtype EnumDecl = decorate {env, givenRefId, returnType};

propagate host, errors, globalDecls, functionDecls, freeVariables on EnumDecl;

abstract production enumDecl
top::EnumDecl ::= name::MaybeName  dcls::EnumItemList
{
  top.maybename = name.maybename;
  top.pp = ppConcat([text("enum"), space(), name.pp, space(), text("{"),
    nestlines(2, ppImplode(cat(comma(),line()), dcls.pps)),
    text("}")]);

  local thisdcl :: [Def] =
    case name.maybename of
    | just(n) -> [tagDef(n.name, enumTagItem(top))]
    | _ -> []
    end;
  top.defs := thisdcl ++ dcls.defs;
  
  dcls.env = addEnv(thisdcl, top.env);
  dcls.containingEnum = extType(nilQualifier(), enumExtType(top));
  dcls.enumItemValueIn = 0;

  top.errors <-
    if null(name.tagLocalLookup) then []
    else [err(top.location, "Redeclaration of enum " ++ name.maybename.fromJust.name)];
    -- We can rely on the name being present if it's a redeclaration
}

autocopy attribute inStruct::Boolean;

autocopy attribute appendedStructItemList :: StructItemList;
synthesized attribute appendedStructItemListRes :: StructItemList;

nonterminal StructItemList with pps, host, errors, globalDecls, functionDecls, defs, env, localDefs, hasConstField, fieldNames, inStruct, isLast, returnType, freeVariables, appendedStructItemList, appendedStructItemListRes;
flowtype StructItemList = decorate {env, returnType, inStruct, isLast}, hasConstField {decorate}, fieldNames {decorate}, appendedStructItemListRes {appendedStructItemList};

propagate host, errors, globalDecls, functionDecls, defs, localDefs, hasConstField, fieldNames on StructItemList;

abstract production consStructItem
top::StructItemList ::= h::StructItem  t::StructItemList
{
  top.pps = h.pp :: t.pps;
  top.freeVariables :=
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  top.appendedStructItemListRes = consStructItem(h, t.appendedStructItemListRes);
  
  h.isLast =
    top.isLast &&
    (!top.inStruct || -- In a union all fields are structurally the "last" field
     case t of
     | consStructItem(_, _) -> false
     | nilStructItem() -> true
     end);
  
  t.env = addEnv(h.defs ++ h.localDefs, h.env);
  t.isLast = top.isLast;
}

abstract production nilStructItem
top::StructItemList ::=
{
  top.pps = [];
  top.freeVariables := [];
  top.appendedStructItemListRes = top.appendedStructItemList;
}

function appendStructItemList
StructItemList ::= s1::StructItemList s2::StructItemList
{
  s1.appendedStructItemList = s2;
  return s1.appendedStructItemListRes;
}

autocopy attribute appendedEnumItemList :: EnumItemList;
synthesized attribute appendedEnumItemListRes :: EnumItemList;

inherited attribute enumItemValueIn::Integer;
synthesized attribute enumItemValue::Integer;

nonterminal EnumItemList with pps, host, errors, globalDecls, functionDecls, defs, env, containingEnum, returnType, freeVariables, appendedEnumItemList, appendedEnumItemListRes, enumItemValueIn;
flowtype EnumItemList = decorate {env, containingEnum, enumItemValueIn, returnType}, appendedEnumItemListRes {appendedEnumItemList};

autocopy attribute containingEnum :: Type;

propagate host, errors, globalDecls, functionDecls, defs on EnumItemList;

abstract production consEnumItem
top::EnumItemList ::= h::EnumItem  t::EnumItemList
{
  top.pps = h.pp :: t.pps;
  top.freeVariables :=
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  top.appendedEnumItemListRes = consEnumItem(h, t.appendedEnumItemListRes);
  
  t.env = addEnv(h.defs, h.env);

  h.enumItemValueIn = top.enumItemValueIn;
  t.enumItemValueIn = h.enumItemValue + 1;
}

abstract production nilEnumItem
top::EnumItemList ::=
{
  top.pps = [];
  top.freeVariables := [];
  top.appendedEnumItemListRes = top.appendedEnumItemList;
}

function appendEnumItemList
EnumItemList ::= e1::EnumItemList e2::EnumItemList
{
  e1.appendedEnumItemList = e2;
  return e1.appendedEnumItemListRes;
}

nonterminal StructItem with pp, host, errors, globalDecls, functionDecls, defs, env, localDefs, hasConstField, fieldNames, inStruct, isLast, returnType, freeVariables;
flowtype StructItem = decorate {env, returnType, inStruct, isLast}, hasConstField {decorate}, fieldNames {decorate};

propagate errors, globalDecls, functionDecls, defs, freeVariables, localDefs, hasConstField on StructItem;
propagate fieldNames on StructItem excluding anonStructStructItem, anonUnionStructItem;

abstract production structItem
top::StructItem ::= attrs::Attributes  ty::BaseTypeExpr  dcls::StructDeclarators
{
  top.pp = ppConcat([ppAttributes(attrs), ty.pp, space(), ppImplode(text(", "), dcls.pps), semi()]);
  top.host =
    if dcls.hasModifiedTypeExpr
    -- TODO: Discarding ty.decls!
    then structItems(foldStructItem(dcls.hostStructItems))
    else structItem(attrs.host, ty.host, dcls.host);
  
  ty.givenRefId = attrs.maybeRefId;
  dcls.env = addEnv(ty.defs, ty.env);
  dcls.baseType = ty.typerep;
  dcls.isLast = top.isLast;
  dcls.typeModifierIn = ty.typeModifier;
  dcls.givenAttributes = attrs;
}
abstract production structItems
top::StructItem ::= dcls::StructItemList
{
  propagate host;
  top.pp = terminate(line(), dcls.pps);
  dcls.isLast = top.isLast;
}
abstract production anonStructStructItem
top::StructItem ::= d::StructDecl
{
  propagate host;
  top.pp = cat(d.pp, semi());
  top.fieldNames := [right(refIdExtType(structSEU(), mapMaybe((.name), d.maybename), d.refId))];
  
  d.isLast = top.isLast;
  d.inAnonStructItem = true;
  d.givenRefId = nothing();
}
abstract production anonUnionStructItem
top::StructItem ::= d::UnionDecl
{
  propagate host;
  top.pp = cat(d.pp, semi());
  top.fieldNames := [right(refIdExtType(unionSEU(), mapMaybe((.name), d.maybename), d.refId))];
  
  d.isLast = top.isLast;
  d.inAnonStructItem = true;
  d.givenRefId = nothing();
}
abstract production warnStructItem
top::StructItem ::= msg::[Message]
{
  propagate host;
  top.pp = notext();
  top.errors <- msg;
}

synthesized attribute hostStructItems::[StructItem];

nonterminal StructDeclarators with pps, host, hostStructItems, hasModifiedTypeExpr, errors, globalDecls, functionDecls, defs, localDefs, hasConstField, fieldNames, env, baseType, inStruct, isLast, typeModifierIn, givenAttributes, returnType, freeVariables;
flowtype StructDeclarators = decorate {env, returnType, baseType, inStruct, isLast, typeModifierIn, givenAttributes}, hostStructItems {decorate}, hasModifiedTypeExpr {decorate}, hasConstField {decorate}, fieldNames {decorate};

propagate host, hasModifiedTypeExpr, errors, globalDecls, functionDecls, defs, localDefs, hasConstField, fieldNames on StructDeclarators;

abstract production consStructDeclarator
top::StructDeclarators ::= h::StructDeclarator  t::StructDeclarators
{
  top.pps = h.pps ++ t.pps;
  top.hostStructItems = h.hostStructItem :: t.hostStructItems;
  top.freeVariables :=
    h.freeVariables ++
    removeDefsFromNames(h.localDefs, t.freeVariables);
  
  h.isLast =
    top.isLast &&
    (!top.inStruct || -- In a union all fields are structurally the "last" field
     case t of
     | consStructDeclarator(_, _) -> false
     | nilStructDeclarator() -> true
     end);
  
  t.env = addEnv(h.localDefs, h.env);
  t.isLast = top.isLast;
}
abstract production nilStructDeclarator
top::StructDeclarators ::=
{
  top.pps = [];
  top.hostStructItems = [];
  top.freeVariables := [];
}

synthesized attribute hostStructItem::StructItem;

nonterminal StructDeclarator with pps, host, hostStructItem, hasModifiedTypeExpr, errors, globalDecls, functionDecls, defs, localDefs, hasConstField, fieldNames, env, typerep, sourceLocation, baseType, inStruct, isLast, typeModifierIn, givenAttributes, returnType, freeVariables;
flowtype StructDeclarator = decorate {env, returnType, baseType, inStruct, isLast, typeModifierIn, givenAttributes}, hostStructItem {decorate}, hasModifiedTypeExpr {decorate}, hasConstField {decorate}, fieldNames {decorate};

propagate host, errors, globalDecls, functionDecls, defs, freeVariables on StructDeclarator;

abstract production structField
top::StructDeclarator ::= name::Name  ty::TypeModifierExpr  attrs::Attributes
{
  top.pps = [ppConcat([ty.lpp, name.pp, ty.rpp, ppAttributesRHS(attrs)])];
  
  top.hostStructItem =
    structItem(
      top.givenAttributes,
      fromMaybe(top.baseType.baseTypeExpr, ty.modifiedBaseTypeExpr),
      consStructDeclarator(top.host, nilStructDeclarator()));
  top.hasModifiedTypeExpr := ty.modifiedBaseTypeExpr.isJust;
  
  top.localDefs := [valueDef(name.name, fieldValueItem(top))];
  top.hasConstField := containsQualifier(constQualifier(location=bogusLoc()), ty.typerep);
  top.fieldNames := [left(name.name)];
  top.typerep = animateAttributeOnType(allAttrs, ty.typerep);
  top.sourceLocation = name.location;
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;
  top.errors <-
    case ty.typerep of
    | arrayType(_, _, _, incompleteArrayType()) ->
      if !top.inStruct
      then [err(top.sourceLocation, s"flexible array member ${name.name} only permitted in structs")]
      else if !top.isLast
      then [err(top.sourceLocation, s"flexible array member ${name.name} not at end of struct")]
      else []
    | _ -> []
    end;
  top.errors <-
    if !top.typerep.isCompleteType(top.env)
    then [err(top.sourceLocation, s"field ${name.name} has incomplete type")]
    else [];
  
  local allAttrs :: Attributes = appendAttribute(top.givenAttributes, attrs);
  allAttrs.env = top.env;
  allAttrs.returnType = top.returnType;
}
abstract production structBitfield
top::StructDeclarator ::= name::MaybeName  ty::TypeModifierExpr  e::Expr  attrs::Attributes
{
  top.pps = [ppConcat([ty.lpp, name.pp, ty.rpp, text(" : "), e.pp, ppAttributesRHS(attrs)])];
  
  top.hostStructItem =
    structItem(
      top.givenAttributes,
      fromMaybe(top.baseType.baseTypeExpr, ty.modifiedBaseTypeExpr),
      consStructDeclarator(top.host, nilStructDeclarator()));
  top.hasModifiedTypeExpr := ty.modifiedBaseTypeExpr.isJust;
  
  local thisdcl :: [Def] =
    case name.maybename of
    | just(n) -> [valueDef(n.name, fieldValueItem(top))]
    | _ -> []
    end;
  top.localDefs := thisdcl;
  top.hasConstField := containsQualifier(constQualifier(location=bogusLoc()), ty.typerep);
  top.fieldNames :=
    case name.maybename of
    | just(n) -> [left(n.name)]
    | _ -> []
    end;
  top.typerep = animateAttributeOnType(allAttrs, ty.typerep);
  top.sourceLocation = 
    case name.maybename of
    | just(n) -> n.location
    | nothing() -> loc("??",-1,-1,-1,-1,-1,-1) -- TODO: bug
    end;
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;
  
  local errName::String =
    case name.maybename of
    | just(n) -> n.name
    | nothing() -> "<anon>"
    end;
  top.errors <-
    if !top.typerep.isCompleteType(top.env)
    then [err(top.sourceLocation, s"field ${errName} has incomplete type")]
    else [];

  local allAttrs :: Attributes = appendAttribute(top.givenAttributes, attrs);
  allAttrs.env = top.env;
  allAttrs.returnType = top.returnType;
}
-- Similar to external declarations, this pretends not to exist if it's only a warning
abstract production warnStructField
top::StructDeclarator ::= msg::[Message]
{
  top.pps = [];
  top.hostStructItem = warnStructItem(msg);
  top.hasModifiedTypeExpr := false;
  top.errors <- msg;
  top.localDefs := [];
  top.fieldNames := [];
  top.hasConstField := false;
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

nonterminal EnumItem with pp, name, host, errors, globalDecls, functionDecls, defs, env, containingEnum, enumItemValue, enumItemValueIn, typerep, sourceLocation, returnType, freeVariables;
flowtype EnumItem = decorate {env, containingEnum, enumItemValueIn, returnType}, name {}, enumItemValue {decorate};

propagate host, errors, globalDecls, functionDecls, freeVariables on EnumItem;

abstract production enumItem
top::EnumItem ::= name::Name  e::MaybeExpr
{
  top.pp = ppConcat([name.pp] ++ if e.isJust then [text(" = "), e.pp] else []);
  top.name = name.name;
  top.defs := valueDef(name.name, enumValueItem(top)) :: e.defs;
  top.enumItemValue = fromMaybe(top.enumItemValueIn, e.integerConstantValue);
  top.typerep = top.containingEnum;
  top.sourceLocation = name.location;
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;
  top.errors <-
    if e.isJust && !e.integerConstantValue.isJust
    then [err(name.location, s"Enum item value must be an integer constant expression (got ${show(80, e.pp)})")]
    else [];
}

monoid attribute isExtern::Boolean with false, ||;
monoid attribute isStatic::Boolean with false, ||;

autocopy attribute appendedStorageClasses :: StorageClasses;
synthesized attribute appendedStorageClassesRes :: StorageClasses;

nonterminal StorageClasses with pps, isExtern, isStatic, appendedStorageClasses, appendedStorageClassesRes;
flowtype StorageClasses = decorate {}, isExtern {}, isStatic {}, appendedStorageClassesRes {appendedStorageClasses};

propagate isExtern, isStatic on StorageClasses;

abstract production consStorageClass
top::StorageClasses ::= h::StorageClass  t::StorageClasses
{
  top.pps = h.pp :: t.pps;
  top.appendedStorageClassesRes = consStorageClass(h, t.appendedStorageClassesRes);
}

abstract production nilStorageClass
top::StorageClasses ::=
{
  top.pps = [];
  top.appendedStorageClassesRes = top.appendedStorageClasses;
}

function appendStorageClasses
StorageClasses ::= s1::StorageClasses s2::StorageClasses
{
  s1.appendedStorageClasses = s2;
  return s1.appendedStorageClassesRes;
}

nonterminal StorageClass with pp, isExtern, isStatic;
flowtype StorageClass = decorate {}, isExtern {}, isStatic {};

propagate isExtern, isStatic on StorageClass;

abstract production externStorageClass
top::StorageClass ::=
{
  top.pp = text("extern");
  top.isExtern <- true;
}
abstract production staticStorageClass
top::StorageClass ::=
{
  top.pp = text("static");
  top.isStatic <- true;
}
abstract production autoStorageClass
top::StorageClass ::=
{
  top.pp = text("auto");
}
abstract production registerStorageClass
top::StorageClass ::=
{
  top.pp = text("register");
}
abstract production threadLocalStorageClass
top::StorageClass ::=
{
  top.pp = text("_Thread_local");
}

{-
From clang:

def TranslationUnit : Decl, DeclContext;
def Named : Decl<1>;
  def Label : DDecl<Named>;
  def Type : DDecl<Named, 1>;
    def TypedefName : DDecl<Type, 1>;
      def Typedef : DDecl<TypedefName>;   -- done
    def Tag : DDecl<Type, 1>, DeclContext;
      def Enum : DDecl<Tag>;  -- done in typeexpr
      def Record : DDecl<Tag>;  -- ditto
  def Value : DDecl<Named, 1>;
    def EnumConstant : DDecl<Value>;  -- done in typeexpr
    def Declarator : DDecl<Value, 1>;
      def Field : DDecl<Declarator>;  -- done in typeexpr
      def Function : DDecl<Declarator>, DeclContext;  -- done
      def Var : DDecl<Declarator>;  -- done
        def ParmVar : DDecl<Var>;  -- done
def FileScopeAsm : Decl; - ?
def StaticAssert : Decl; - ?
def Block : Decl, DeclContext;
def Captured : Decl, DeclContext;
def Empty : Decl; - ?

Notes: clang likes to have direct references to certain priviledged outer scopes.
e.g. 'getTranslationUnit' and 'getFunction' vs just getting the block scope.
This tends to result in getting things like the list of labels. We may not need that?
If we just have the list in a namespace in scope.


-}

