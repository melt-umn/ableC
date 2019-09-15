grammar edu:umn:cs:melt:ableC:abstractsyntax:host;
-- StructDecl, UnionDecl, and EnumDecl are all rooted in the abstract syntax within a TypeExpr.

-- FunctionDecl is (for now) always rooted in an ExternalDeclaration
-- Declaration is rooted in External, but also in stmts. Either a variableDecl or a typedefDecl.
-- ParameterDecl should probably be something special, distinct from variableDecl.

nonterminal GlobalDecls with pps, host<GlobalDecls>, errors, env, returnType, freeVariables;
flowtype GlobalDecls = decorate {env, returnType};

{-- Mirrors Decls, used for lifting mechanism to insert new Decls at top level -}
abstract production consGlobalDecl
top::GlobalDecls ::= h::Decl  t::GlobalDecls
{
  -- host defined in Lifted.sv
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors ++
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
  propagate host;
  top.pps = [];
  top.errors := [];
  top.freeVariables := [];
}

nonterminal Decls with pps, host<Decls>, errors, globalDecls, functionDecls, unfoldedGlobalDecls, unfoldedFunctionDecls, defs, env, isTopLevel, returnType, freeVariables;
flowtype Decls = decorate {env, isTopLevel, returnType};

autocopy attribute isTopLevel :: Boolean;

abstract production consDecl
top::Decls ::= h::Decl  t::Decls
{
  propagate host;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.defs := h.defs ++ t.defs;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.functionDecls := h.functionDecls ++ t.functionDecls;
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
  propagate host;
  top.pps = [];
  top.errors := [];
  top.defs := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.unfoldedGlobalDecls = [];
  top.unfoldedFunctionDecls = [];
  top.freeVariables := [];
}

function appendDecls
Decls ::= d1::Decls d2::Decls
{
  return consDecl(decls(d1), d2);
}


nonterminal Decl with pp, host<Decl>, errors, globalDecls, functionDecls, unfoldedGlobalDecls, unfoldedFunctionDecls, defs, env, isTopLevel, returnType, freeVariables;
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
  propagate host;
  top.pp = terminate( line(), d.pps );
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.functionDecls := d.functionDecls;
  top.unfoldedGlobalDecls = d.unfoldedGlobalDecls;
  top.unfoldedFunctionDecls = d.unfoldedFunctionDecls;
  top.defs := d.defs;
  top.freeVariables := d.freeVariables;
}

abstract production defsDecl
top::Decl ::= d::[Def]
{
  -- host, globalDecls defined in Deferred.sv
  top.pp = ppConcat([pp"/* defsDecl", showEnv(addEnv(d, emptyEnv())), pp"*/"]);
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := d;
  top.freeVariables := [];
}

abstract production variableDecls
top::Decl ::= storage::StorageClasses  attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  top.pp = ppConcat(
    terminate(space(), storage.pps) ::
      ppAttributes(attrs) ::
      [ty.pp, space(), ppImplode(text(", "), dcls.pps), semi()]);
  -- host, globalDecls defined in Deferred.sv
  top.errors := ty.errors ++ dcls.errors;
  top.functionDecls := ty.functionDecls ++ dcls.functionDecls;
  top.defs := ty.defs ++ dcls.defs;
  top.freeVariables := ty.freeVariables ++ dcls.freeVariables;

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
  -- host, globalDecls defined in Deferred.sv
  top.pp = ppConcat( ppAttributes(attrs) :: [ty.pp, semi()] );
  top.errors := ty.errors;
  top.functionDecls := ty.functionDecls;
  top.defs := ty.defs;
  top.freeVariables := ty.freeVariables;
  ty.givenRefId = attrs.maybeRefId;
}

abstract production typedefDecls
top::Decl ::= attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  top.pp = ppConcat([text("typedef "), ppAttributes(attrs), ty.pp, space(), ppImplode(text(", "), dcls.pps), semi()]);
  -- host, globalDecls defined in Deferred.sv
  top.errors := ty.errors ++ dcls.errors;
  top.functionDecls := ty.functionDecls ++ dcls.functionDecls;
  top.defs := ty.defs ++ dcls.defs;
  top.freeVariables := ty.freeVariables ++ dcls.freeVariables;
  
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
  top.pp = f.pp;
  -- host, globalDecls defined in Deferred.sv
  top.errors := f.errors;
  top.functionDecls := [];
  top.defs := f.defs;
  top.freeVariables := f.freeVariables;
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
  propagate host;
  top.pp = ppConcat([text("/*"),
    ppImplode(line(), map(text, map((.output), msg))),
    text("*/")]);
  top.errors := msg;
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := [];
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
}

-- C11
abstract production staticAssertDecl
top::Decl ::= e::Expr  s::String
{
  propagate host;
  top.pp = ppConcat([text("_Static_assert("), e.pp, text(", "), text(s), text(");")]);
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.functionDecls := e.functionDecls;
  top.defs := e.defs;
  top.freeVariables := e.freeVariables;
}

abstract production fileScopeAsm
top::Decl ::= s::String
{
  propagate host;
  top.pp = ppConcat([text("asm"), parens(text(s))]);
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := [];
  -- TODO: should be file-scope only.
  -- Semantics note: just puts the string into the assembly file being created
  -- by the compiler. Usually a better way to do this now, with attributes,
  -- but used to be the way to put c functions and such in custom sections.
}

-- Useful for extensions
abstract production autoDecl
top::Decl ::= n::Name  e::Expr
{
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
          justInitializer(exprInitializer(e.host))),
        nilDeclarator()));
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.functionDecls := e.functionDecls;
  top.defs := e.defs;
  top.freeVariables := e.freeVariables;
  
  top.errors <- n.valueRedeclarationCheckNoCompatible;
  top.defs <- [valueDef(n.name, autoValueItem(e))];
}

synthesized attribute hasModifiedTypeExpr::Boolean;
synthesized attribute hostDecls::[Decl];

nonterminal Declarators with pps, host<Declarators>, hostDecls, hasModifiedTypeExpr, errors, globalDecls, functionDecls, defs, env, baseType, typeModifierIn, isTopLevel, isTypedef, givenStorageClasses, givenAttributes, returnType, freeVariables;
flowtype Declarators = decorate {env, returnType, baseType, typeModifierIn, givenStorageClasses, givenAttributes, isTopLevel, isTypedef}, hostDecls {decorate}, hasModifiedTypeExpr {decorate};

abstract production consDeclarator
top::Declarators ::= h::Declarator  t::Declarators
{
  propagate host;
  top.pps = h.pps ++ t.pps;
  top.hostDecls = h.hostDecl :: t.hostDecls;
  top.hasModifiedTypeExpr = h.hasModifiedTypeExpr || t.hasModifiedTypeExpr;
  top.errors := h.errors ++ t.errors;
  top.defs := h.defs ++ t.defs;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.functionDecls := h.functionDecls ++ t.functionDecls;
  top.freeVariables :=
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);

  t.env = addEnv(h.defs, h.env);
}
abstract production nilDeclarator
top::Declarators ::=
{
  propagate host;
  top.pps = [];
  top.hostDecls = [];
  top.hasModifiedTypeExpr = false;
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := [];
}

synthesized attribute hostDecl::Decl;

nonterminal Declarator with pps, host<Declarator>, hostDecl, hasModifiedTypeExpr, errors, globalDecls, functionDecls, defs, env, baseType, typeModifierIn, typerep, sourceLocation, isTopLevel, isTypedef, givenStorageClasses, givenAttributes, returnType, freeVariables;
flowtype Declarator = decorate {env, returnType, baseType, typeModifierIn, givenStorageClasses, givenAttributes, isTopLevel, isTypedef}, hostDecl {decorate}, hasModifiedTypeExpr {decorate};

autocopy attribute isTypedef :: Boolean;

abstract production declarator
top::Declarator ::= name::Name  ty::TypeModifierExpr  attrs::Attributes  initializer::MaybeInitializer
{
  propagate host;
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
  top.hasModifiedTypeExpr = ty.modifiedBaseTypeExpr.isJust;
  
  top.errors :=
    case initializer of
      justInitializer(exprInitializer(e)) ->
        if typeAssignableTo(top.typerep, e.typerep) then []
        else [err(top.sourceLocation, s"Incompatible type in initialization, expected ${showType(top.typerep)} but found ${showType(e.typerep)}")]
    | _ -> []
    end ++ ty.errors ++ initializer.errors;
  top.globalDecls := ty.globalDecls ++ initializer.globalDecls;
  top.functionDecls := ty.functionDecls ++ initializer.functionDecls;
  top.defs :=
    [valueDef(name.name, declaratorValueItem(top))] ++ 
    globalDeclsDefs(ty.globalDecls) ++
    functionDeclsDefs(ty.functionDecls) ++
    ty.defs ++ initializer.defs;
  top.freeVariables := ty.freeVariables ++ initializer.freeVariables;
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
  
  local animatedTyperep :: Type = animateAttributeOnType(allAttrs, ty.typerep);

  -- accumulate extension qualifiers on redeclaration
  local typerepWithAllExtnQuals :: Type =
		if top.isTopLevel
		then name.valueMergeRedeclExtnQualifiers(animatedTyperep)
		else animatedTyperep;
}
abstract production errorDeclarator
top::Declarator ::= msg::[Message]
{
  propagate host;
  top.pps = [];
  top.hostDecl = warnDecl(msg);
  top.hasModifiedTypeExpr = false;
  top.errors := msg;
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := [];
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

nonterminal FunctionDecl with pp, host<Decl>, errors, globalDecls, defs, env, typerep, name, sourceLocation, returnType, freeVariables;
flowtype FunctionDecl = decorate {env, returnType}, name {}, sourceLocation {};

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
  implicitDefs <- map(valueDef(_, nameValueItem), ["__func__", "__FUNCTION__", "__PRETTY_FUNCTION__"]);
  
  top.errors := bty.errors ++ mty.errors ++ body.errors ++ fnquals.errors;
  top.globalDecls := bty.globalDecls ++ mty.globalDecls ++ ds.globalDecls ++ 
                     body.globalDecls ++ fnquals.globalDecls;

  top.defs :=
    funcDefs ++
    globalDeclsDefs(mty.globalDecls) ++
    globalDeclsDefs(ds.globalDecls) ++
    globalDeclsDefs(body.globalDecls) ++
    globalDeclsDefs(fnquals.globalDecls) ++
    functionDeclsDefs(mty.functionDecls) ++
    functionDeclsDefs(ds.functionDecls) ++
    functionDeclsDefs(body.functionDecls) ++
    functionDeclsDefs(fnquals.functionDecls);
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
  top.errors := msg;
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables := [];
  top.typerep = errorType();
  top.name = "badFunctionDecl";
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

synthesized attribute len::Integer;
inherited attribute position::Integer;

nonterminal Parameters with typereps, pps, count, host<Parameters>, errors, globalDecls, functionDecls, decls, defs, functionDefs, env, returnType, position, freeVariables, appendedParameters, appendedParametersRes;
flowtype Parameters = decorate {env, returnType, position}, appendedParametersRes {appendedParameters};

autocopy attribute appendedParameters :: Parameters;
synthesized attribute appendedParametersRes :: Parameters;

abstract production consParameters
top::Parameters ::= h::ParameterDecl  t::Parameters
{
  propagate host;
  top.pps = h.pp :: t.pps;
  top.count = t.count + 1;
  top.typereps = h.typerep :: t.typereps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.functionDecls := h.functionDecls ++ t.functionDecls;
  top.decls = h.decls ++ t.decls;
  top.defs := h.defs ++ t.defs;
  top.functionDefs := h.functionDefs ++ t.functionDefs;
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
  propagate host;
  top.pps = [];
  top.count = 0;
  top.typereps = [];
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.decls = [];
  top.defs := [];
  top.functionDefs := [];
  top.freeVariables := [];
  top.appendedParametersRes = top.appendedParameters;
}

function appendParameters
Parameters ::= p1::Parameters p2::Parameters
{
  p1.appendedParameters = p2;
  return p1.appendedParametersRes;
}

-- TODO: move these, later
synthesized attribute paramname :: Maybe<Name>;

nonterminal ParameterDecl with paramname, typerep, pp, host<ParameterDecl>, errors, globalDecls, functionDecls, decls, defs, functionDefs, env, position, sourceLocation, returnType, freeVariables;
flowtype ParameterDecl = decorate {env, returnType, position}, paramname {};

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
  top.errors := bty.errors ++ mty.errors;
  top.globalDecls :=
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
    end ++ bty.globalDecls ++ mty.globalDecls;
  top.functionDecls := bty.functionDecls ++ mty.functionDecls;
  top.decls = bty.decls ++ mty.decls;
  top.defs := bty.defs ++ mty.defs;
  top.functionDefs :=
    case name.maybename of
    | just(n) -> [valueDef(n.name, parameterValueItem(top))]
    | _ -> []
    end;
  top.freeVariables := bty.freeVariables ++ mty.freeVariables;
  
  bty.givenRefId = nothing();
  
  mty.env = addEnv(bty.defs, bty.env);
  mty.baseType = bty.typerep;
  mty.typeModifierIn = bty.typeModifier;
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;
  -- TODO: Check for incomplete types when we know this is an actual function definition
}

-- This is the last item in a struct/union declaration
inherited attribute isLast::Boolean;

synthesized attribute refId :: String; -- TODO move this later?

synthesized attribute hasConstField::Boolean;

nonterminal StructDecl with location, pp, host<StructDecl>, maybename, errors, globalDecls, functionDecls, defs, env, localDefs, tagEnv, isLast, givenRefId, refId, hasConstField, returnType, freeVariables;
flowtype StructDecl = decorate {env, isLast, givenRefId, returnType}, localDefs {decorate}, tagEnv {decorate}, refId {decorate}, hasConstField {decorate};

abstract production structDecl
top::StructDecl ::= attrs::Attributes  name::MaybeName  dcls::StructItemList
{
  propagate host;
  top.maybename = name.maybename;
  top.pp = ppConcat([text("struct "), ppAttributes(attrs), name.pp,
    -- DEBUGGING
    --text("/*" ++ top.refId ++ "*/"),
    -- END DEBUGGING
    text(" {"), nestlines(2, terminate(line(), dcls.pps)),
    text("}")]);
  top.errors := dcls.errors;
  top.globalDecls := dcls.globalDecls;
  top.functionDecls := dcls.functionDecls;

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
  top.refId = fromMaybe(name.tagRefId, maybeAttribRefIdName);
  
  top.hasConstField = dcls.hasConstField;
  
  top.localDefs := dcls.localDefs;
  top.tagEnv = addEnv(dcls.localDefs, emptyEnv());
  
  -- If there is no forward declaration, and we have a name, then add a tag dcl for the refid.
  local preDefs :: [Def] = 
    if name.tagHasForwardDcl || !name.hasName then []
    else [tagDef(name.maybename.fromJust.name, refIdTagItem(structSEU(), top.refId))];
  -- Always add the refid TODO: deal with C11-allowed redeclarations?
  local postDefs :: [Def] =
    [refIdDef(top.refId, structRefIdItem(top))];

  top.defs := preDefs ++ dcls.defs ++ postDefs;
  top.freeVariables := dcls.freeVariables;
  
  dcls.env = openScopeEnv(addEnv(preDefs, top.env));
  dcls.inStruct = true;
  dcls.isLast = top.isLast;
  
  
  -- Redeclaration error if there IS a forward declaration AND an existing refid declaration.
  top.errors <-
    if !name.tagHasForwardDcl || null(lookupRefId(top.refId, top.env)) then []
    else [err(top.location, "Redeclaration of struct " ++ name.maybename.fromJust.name)];
}

nonterminal UnionDecl with location, pp, host<UnionDecl>, maybename, errors, globalDecls, functionDecls, defs, env, localDefs, tagEnv, isLast, givenRefId, refId, hasConstField, returnType, freeVariables;
flowtype UnionDecl = decorate {env, isLast, givenRefId, returnType}, localDefs {decorate}, tagEnv {decorate}, refId {decorate}, hasConstField {decorate};

abstract production unionDecl
top::UnionDecl ::= attrs::Attributes  name::MaybeName  dcls::StructItemList
{
  propagate host;
  top.maybename = name.maybename;
  top.pp = ppConcat([text("union "), ppAttributes(attrs), name.pp, 
    -- DEBUGGING
    --text("/*" ++ top.refId ++ "*/"),
    -- END DEBUGGING
    text(" {"), nestlines(2, terminate(line(), dcls.pps)),
    text("}")]);
  top.errors := dcls.errors;
  top.globalDecls := dcls.globalDecls;
  top.functionDecls := dcls.functionDecls;

  local maybeAttribRefIdName::Maybe<String> = orElse(attrs.maybeRefId, top.givenRefId);
  top.refId = fromMaybe(name.tagRefId, maybeAttribRefIdName);
  
  top.hasConstField = dcls.hasConstField;
  
  top.localDefs := dcls.localDefs;
  top.tagEnv = addEnv(dcls.localDefs, emptyEnv());
  
  -- If there is no forward declaration, and we have a name, then add a tag dcl for the refid.
  local preDefs :: [Def] = 
    if name.tagHasForwardDcl || !name.hasName then []
    else [tagDef(name.maybename.fromJust.name, refIdTagItem(unionSEU(), top.refId))];
  -- Always add the refid TODO: deal with C11-allowed redeclarations?
  local postDefs :: [Def] =
    [refIdDef(top.refId, unionRefIdItem(top))];

  top.defs := preDefs ++ dcls.defs ++ postDefs;
  top.freeVariables := dcls.freeVariables;
  
  dcls.env = openScopeEnv(addEnv(preDefs, top.env));
  dcls.inStruct = false;
  dcls.isLast = top.isLast;
  
  
  -- Redeclaration error if there IS a forward declaration AND an existing refid declaration.
  top.errors <-
    if !name.tagHasForwardDcl || null(lookupRefId(top.refId, top.env)) then []
    else [err(top.location, "Redeclaration of union " ++ name.maybename.fromJust.name)];
}

nonterminal EnumDecl with location, pp, host<EnumDecl>, maybename, errors, globalDecls, functionDecls, defs, env, givenRefId, returnType, freeVariables;
flowtype EnumDecl = decorate {env, givenRefId, returnType};

abstract production enumDecl
top::EnumDecl ::= name::MaybeName  dcls::EnumItemList
{
  propagate host;
  top.maybename = name.maybename;
  top.pp = ppConcat([text("enum"), space(), name.pp, space(), text("{"),
    nestlines(2, ppImplode(cat(comma(),line()), dcls.pps)),
    text("}")]);
  top.errors := dcls.errors;
  top.globalDecls := dcls.globalDecls;
  top.functionDecls := dcls.functionDecls;

  local thisdcl :: [Def] =
    case name.maybename of
    | just(n) -> [tagDef(n.name, enumTagItem(top))]
    | _ -> []
    end;
  top.defs := thisdcl ++ dcls.defs;
  top.freeVariables := dcls.freeVariables;
  
  dcls.env = addEnv(thisdcl, top.env);
  dcls.containingEnum = extType(nilQualifier(), enumExtType(top));
  

  top.errors <-
    if null(name.tagLocalLookup) then []
    else [err(top.location, "Redeclaration of enum " ++ name.maybename.fromJust.name)];
    -- We can rely on the name being present if it's a redeclaration
}

autocopy attribute inStruct::Boolean;

autocopy attribute appendedStructItemList :: StructItemList;
synthesized attribute appendedStructItemListRes :: StructItemList;

nonterminal StructItemList with pps, host<StructItemList>, errors, globalDecls, functionDecls, defs, env, localDefs, hasConstField, inStruct, isLast, returnType, freeVariables, appendedStructItemList, appendedStructItemListRes;
flowtype StructItemList = decorate {env, returnType, inStruct, isLast}, appendedStructItemListRes {appendedStructItemList};

abstract production consStructItem
top::StructItemList ::= h::StructItem  t::StructItemList
{
  propagate host;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.functionDecls := h.functionDecls ++ t.functionDecls;
  top.defs := h.defs ++ t.defs;
  top.freeVariables :=
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  top.localDefs := h.localDefs ++ t.localDefs;
  top.hasConstField = h.hasConstField || t.hasConstField;
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
  propagate host;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := [];
  top.localDefs := [];
  top.hasConstField = false;
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

nonterminal EnumItemList with pps, host<EnumItemList>, errors, globalDecls, functionDecls, defs, env, containingEnum, returnType, freeVariables, appendedEnumItemList, appendedEnumItemListRes;
flowtype EnumItemList = decorate {env, containingEnum, returnType}, appendedEnumItemListRes {appendedEnumItemList};

autocopy attribute containingEnum :: Type;

abstract production consEnumItem
top::EnumItemList ::= h::EnumItem  t::EnumItemList
{
  propagate host;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.functionDecls := h.functionDecls ++ t.functionDecls;
  top.defs := h.defs ++ t.defs;
  top.freeVariables :=
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  top.appendedEnumItemListRes = consEnumItem(h, t.appendedEnumItemListRes);
  
  t.env = addEnv(h.defs, h.env);
}

abstract production nilEnumItem
top::EnumItemList ::=
{
  propagate host;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := [];
  top.appendedEnumItemListRes = top.appendedEnumItemList;
}

function appendEnumItemList
EnumItemList ::= e1::EnumItemList e2::EnumItemList
{
  e1.appendedEnumItemList = e2;
  return e1.appendedEnumItemListRes;
}

nonterminal StructItem with pp, host<StructItem>, errors, globalDecls, functionDecls, defs, env, localDefs, hasConstField, inStruct, isLast, returnType, freeVariables;
flowtype StructItem = decorate {env, returnType, inStruct, isLast};

abstract production structItem
top::StructItem ::= attrs::Attributes  ty::BaseTypeExpr  dcls::StructDeclarators
{
  top.pp = ppConcat([ppAttributes(attrs), ty.pp, space(), ppImplode(text(", "), dcls.pps), semi()]);
  top.host =
    if dcls.hasModifiedTypeExpr
    -- TODO: Discarding ty.decls!
    then structItems(foldStructItem(dcls.hostStructItems))
    else structItem(attrs.host, ty.host, dcls.host);
  top.errors := ty.errors ++ dcls.errors;
  top.globalDecls := ty.globalDecls ++ dcls.globalDecls;
  top.functionDecls := ty.functionDecls ++ dcls.functionDecls;
  top.defs := ty.defs ++ dcls.defs;
  top.freeVariables := ty.freeVariables ++ dcls.freeVariables;
  top.localDefs := dcls.localDefs;
  top.hasConstField = dcls.hasConstField;
  
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
  top.errors := dcls.errors;
  top.globalDecls := dcls.globalDecls;
  top.functionDecls := dcls.functionDecls;
  top.defs := dcls.defs;
  top.freeVariables := dcls.freeVariables;
  top.localDefs := dcls.localDefs;
  top.hasConstField = dcls.hasConstField;
  dcls.isLast = top.isLast;
}
abstract production anonStructStructItem
top::StructItem ::= d::StructDecl
{
  propagate host;
  top.pp = cat(d.pp, semi());
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.functionDecls := d.functionDecls;
  top.defs := d.defs;
  top.freeVariables := d.freeVariables;
  top.localDefs := d.localDefs;
  top.hasConstField = d.hasConstField;
  
  d.isLast = top.isLast;
  d.givenRefId = nothing();
}
abstract production anonUnionStructItem
top::StructItem ::= d::UnionDecl
{
  propagate host;
  top.pp = cat(d.pp, semi());
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.functionDecls := d.functionDecls;
  top.defs := d.defs;
  top.freeVariables := d.freeVariables;
  top.localDefs := d.localDefs;
  top.hasConstField = d.hasConstField;
  
  d.isLast = top.isLast;
  d.givenRefId = nothing();
}
abstract production warnStructItem
top::StructItem ::= msg::[Message]
{
  propagate host;
  top.pp = notext();
  top.errors := msg;
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := [];
  top.localDefs := [];
  top.hasConstField = false;
}

synthesized attribute hostStructItems::[StructItem];

nonterminal StructDeclarators with pps, host<StructDeclarators>, hostStructItems, hasModifiedTypeExpr, errors, globalDecls, functionDecls, defs, localDefs, hasConstField, env, baseType, inStruct, isLast, typeModifierIn, givenAttributes, returnType, freeVariables;
flowtype StructDeclarators = decorate {env, returnType, baseType, inStruct, isLast, typeModifierIn, givenAttributes}, hostStructItems {decorate}, hasModifiedTypeExpr {decorate};

abstract production consStructDeclarator
top::StructDeclarators ::= h::StructDeclarator  t::StructDeclarators
{
  propagate host;
  top.pps = h.pps ++ t.pps;
  top.hostStructItems = h.hostStructItem :: t.hostStructItems;
  top.hasModifiedTypeExpr = h.hasModifiedTypeExpr || t.hasModifiedTypeExpr;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.functionDecls := h.functionDecls ++ t.functionDecls;
  top.defs := h.defs ++ t.defs;
  top.localDefs := h.localDefs ++ t.localDefs;
  top.hasConstField = h.hasConstField || t.hasConstField;
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
  propagate host;
  top.pps = [];
  top.hostStructItems = [];
  top.hasModifiedTypeExpr = false;
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.localDefs := [];
  top.hasConstField = false;
  top.freeVariables := [];
}

synthesized attribute hostStructItem::StructItem;

nonterminal StructDeclarator with pps, host<StructDeclarator>, hostStructItem, hasModifiedTypeExpr, errors, globalDecls, functionDecls, defs, localDefs, hasConstField, env, typerep, sourceLocation, baseType, inStruct, isLast, typeModifierIn, givenAttributes, returnType, freeVariables;
flowtype StructDeclarator = decorate {env, returnType, baseType, inStruct, isLast, typeModifierIn, givenAttributes}, hostStructItem {decorate}, hasModifiedTypeExpr {decorate};

abstract production structField
top::StructDeclarator ::= name::Name  ty::TypeModifierExpr  attrs::Attributes
{
  propagate host;
  top.pps = [ppConcat([ty.lpp, name.pp, ty.rpp, ppAttributesRHS(attrs)])];
  
  top.hostStructItem =
    structItem(
      top.givenAttributes,
      fromMaybe(top.baseType.baseTypeExpr, ty.modifiedBaseTypeExpr),
      consStructDeclarator(top.host, nilStructDeclarator()));
  top.hasModifiedTypeExpr = ty.modifiedBaseTypeExpr.isJust;
  
  top.errors := ty.errors;
  top.globalDecls := ty.globalDecls;
  top.functionDecls := ty.functionDecls;
  top.defs := ty.defs;
  top.localDefs := [valueDef(name.name, fieldValueItem(top))];
  top.hasConstField = containsQualifier(constQualifier(location=bogusLoc()), ty.typerep);
  top.freeVariables := ty.freeVariables;
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
  propagate host;
  top.pps = [ppConcat([ty.lpp, name.pp, ty.rpp, text(" : "), e.pp, ppAttributesRHS(attrs)])];
  
  top.hostStructItem =
    structItem(
      top.givenAttributes,
      fromMaybe(top.baseType.baseTypeExpr, ty.modifiedBaseTypeExpr),
      consStructDeclarator(top.host, nilStructDeclarator()));
  top.hasModifiedTypeExpr = ty.modifiedBaseTypeExpr.isJust;
  
  top.errors := ty.errors ++ e.errors;
  top.globalDecls := ty.globalDecls ++ e.globalDecls;
  top.functionDecls := ty.functionDecls ++ e.functionDecls;

  top.defs := ty.defs ++ e.defs;
  local thisdcl :: [Def] =
    case name.maybename of
    | just(n) -> [valueDef(n.name, fieldValueItem(top))]
    | _ -> []
    end;
  top.localDefs := thisdcl;
  top.hasConstField = containsQualifier(constQualifier(location=bogusLoc()), ty.typerep);
  top.freeVariables := ty.freeVariables ++ e.freeVariables;
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
  propagate host;
  top.pps = [];
  top.hostStructItem = warnStructItem(msg);
  top.hasModifiedTypeExpr = false;
  top.errors := msg;
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.localDefs := [];
  top.hasConstField = false;
  top.freeVariables := [];
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

nonterminal EnumItem with pp, name, host<EnumItem>, errors, globalDecls, functionDecls, defs, env, containingEnum, typerep, sourceLocation, returnType, freeVariables;
flowtype EnumItem = decorate {env, containingEnum, returnType}, name {};

abstract production enumItem
top::EnumItem ::= name::Name  e::MaybeExpr
{
  propagate host;
  top.pp = ppConcat([name.pp] ++ if e.isJust then [text(" = "), e.pp] else []);
  top.name = name.name;
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.functionDecls := e.functionDecls;
  top.defs := valueDef(name.name, enumValueItem(top)) :: e.defs;
  top.freeVariables := e.freeVariables;
  top.typerep = top.containingEnum;
  top.sourceLocation = name.location;
  
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;
}

synthesized attribute isExtern::Boolean;
synthesized attribute isStatic::Boolean;

autocopy attribute appendedStorageClasses :: StorageClasses;
synthesized attribute appendedStorageClassesRes :: StorageClasses;

nonterminal StorageClasses with pps, isExtern, isStatic, appendedStorageClasses, appendedStorageClassesRes;
flowtype StorageClasses = decorate {}, isExtern {}, isStatic {}, appendedStorageClassesRes {appendedStorageClasses};

abstract production consStorageClass
top::StorageClasses ::= h::StorageClass  t::StorageClasses
{
  top.pps = h.pp :: t.pps;
  top.appendedStorageClassesRes = consStorageClass(h, t.appendedStorageClassesRes);
  top.isExtern = h.isExtern || t.isExtern;
  top.isStatic = h.isStatic || t.isStatic;
}

abstract production nilStorageClass
top::StorageClasses ::=
{
  top.pps = [];
  top.appendedStorageClassesRes = top.appendedStorageClasses;
  top.isExtern = false;
  top.isStatic = false;
}

function appendStorageClasses
StorageClasses ::= s1::StorageClasses s2::StorageClasses
{
  s1.appendedStorageClasses = s2;
  return s1.appendedStorageClassesRes;
}

nonterminal StorageClass with pp, isExtern, isStatic;
flowtype StorageClass = decorate {}, isExtern {}, isStatic {};

aspect default production
top::StorageClass ::=
{
  top.isExtern = false;
  top.isStatic = false;
}

abstract production externStorageClass
top::StorageClass ::=
{
  top.pp = text("extern");
  top.isExtern = true;
}
abstract production staticStorageClass
top::StorageClass ::=
{
  top.pp = text("static");
  top.isStatic = true;
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

