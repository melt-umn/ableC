
-- StructDecl, UnionDecl, and EnumDecl are all rooted in the abstract syntax within a TypeExpr.

-- FunctionDecl is (for now) always rooted in an ExternalDeclaration
-- Declaration is rooted in External, but also in stmts. Either a variableDecl or a typedefDecl.
-- ParameterDecl should probably be something special, distinct from variableDecl.

nonterminal GlobalDecls with pps, host<GlobalDecls>, lifted<GlobalDecls>, errors, env, returnType, freeVariables;

{-- Mirrors Decls, used for lifting mechanism to insert new Decls at top level -}
abstract production consGlobalDecl
top::GlobalDecls ::= h::Decl  t::GlobalDecls
{
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  
  -- host, lifted defined in Lifted.sv
    
  h.isTopLevel = true;
  
  t.env = addEnv(h.defs, top.env);
}

abstract production nilGlobalDecl
top::GlobalDecls ::=
{
  propagate host, lifted;
  top.pps = [];
  top.errors := [];
  top.freeVariables = [];
}

nonterminal Decls with pps, host<Decls>, lifted<Decls>, errors, globalDecls, unfoldedGlobalDecls, defs, env, isTopLevel, returnType, freeVariables;

autocopy attribute isTopLevel :: Boolean;

abstract production consDecl
top::Decls ::= h::Decl  t::Decls
{
  propagate host, lifted;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.defs := h.defs ++ t.defs;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.unfoldedGlobalDecls = h.unfoldedGlobalDecls ++ t.unfoldedGlobalDecls;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  
  t.env = addEnv(h.defs, top.env);
}

abstract production nilDecl
top::Decls ::=
{
  propagate host, lifted;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.unfoldedGlobalDecls = [];
  top.defs := [];
  top.freeVariables = [];
}

function appendDecls
Decls ::= d1::Decls d2::Decls
{
  return consDecl(decls(d1), d2);
}


nonterminal Decl with pp, host<Decl>, lifted<Decl>, errors, globalDecls, unfoldedGlobalDecls, defs, env, isTopLevel, returnType, freeVariables;

{-- Pass down from top-level declaration the list of attribute to each name-declaration -}
autocopy attribute givenAttributes :: Attributes;

aspect default production
top::Decl ::=
{
  top.unfoldedGlobalDecls = top.globalDecls ++ [top];
}

abstract production decls
top::Decl ::= d::Decls
{
  propagate host, lifted;
  top.pp = terminate( line(), d.pps );
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.unfoldedGlobalDecls = d.unfoldedGlobalDecls;
  top.defs := d.defs;
  top.freeVariables = d.freeVariables;
}

abstract production defsDecl
top::Decl ::= d::[Def]
{
  top.pp = ppConcat([pp"/* defsDecl", showEnv(addEnv(d, emptyEnv())), pp"*/"]);
  -- This production goes away when the transformation to host occurs, this is a special case where
  -- host is not simply propagated, because Def is a closed 'collection' nonterminal with special
  -- semantics
  top.host = decls(nilDecl());
  top.lifted = decls(nilDecl());
  top.errors := [];
  top.globalDecls := [];
  top.defs := d;
  top.freeVariables = [];
}

abstract production variableDecls
top::Decl ::= storage::[StorageClass]  attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  propagate host, lifted;
  top.pp = ppConcat(
    terminate(space(), map((.pp), storage)) ::
      ppAttributes(attrs) ::
      [ty.pp, space(), ppImplode(text(", "), dcls.pps), semi()]);
  top.errors := ty.errors ++ dcls.errors;
  top.globalDecls := ty.globalDecls ++ dcls.globalDecls;
  top.defs := ty.defs ++ dcls.defs;
  top.freeVariables = ty.freeVariables ++ dcls.freeVariables;
  
  ty.givenRefId = nothing();
  dcls.env = addEnv(ty.defs, ty.env);
  dcls.baseType = ty.typerep;
  dcls.typeModifiersIn = ty.typeModifiers;
  dcls.isTypedef = false;
  dcls.givenAttributes = attrs;
}

abstract production typeExprDecl
top::Decl ::= attrs::Attributes ty::BaseTypeExpr
{
  propagate host, lifted;
  top.pp = cat( ty.pp, semi() );
  top.errors := ty.errors;
  top.globalDecls := ty.globalDecls;
  top.defs := ty.defs;
  top.freeVariables = ty.freeVariables;
  ty.givenRefId = getRefIdFromAttributes(attrs);
}

abstract production typedefDecls
top::Decl ::= attrs::Attributes  ty::BaseTypeExpr  dcls::Declarators
{
  propagate host, lifted;
  top.pp = ppConcat([text("typedef "), ppAttributes(attrs), ty.pp, space(), ppImplode(text(", "), dcls.pps), semi()]);
  top.errors := ty.errors ++ dcls.errors;
  top.globalDecls := ty.globalDecls ++ dcls.globalDecls;
  top.defs := ty.defs ++ dcls.defs;
  top.freeVariables = ty.freeVariables ++ dcls.freeVariables;
  
  ty.givenRefId = getRefIdFromAttributes(attrs);
  dcls.env = addEnv(ty.defs, ty.env);
  dcls.baseType = ty.typerep;
  dcls.typeModifiersIn = ty.typeModifiers;
  dcls.isTypedef = true;
  dcls.givenAttributes = attrs;
}

abstract production functionDeclaration
top::Decl ::= f::FunctionDecl
{
  propagate host, lifted;
  top.pp = f.pp;
  top.errors := f.errors;
  top.globalDecls := f.globalDecls;
  top.defs := f.defs;
  top.freeVariables = f.freeVariables;
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
  propagate host, lifted;
  top.pp = ppConcat([text("/*"),
    ppImplode(line(), map(text, map((.output), msg))),
    text("*/")]);
  top.errors := msg;
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
}

-- C11
abstract production staticAssertDecl
top::Decl ::= e::Expr  s::String
{
  propagate host, lifted;
  top.pp = ppConcat([text("_Static_assert("), e.pp, text(", "), text(s), text(");")]);
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.defs := e.defs;
  top.freeVariables = e.freeVariables;
}

abstract production fileScopeAsm
top::Decl ::= s::String
{
  propagate host, lifted;
  top.pp = ppConcat([text("asm"), parens(text(s))]);
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  -- TODO: should be file-scope only.
  -- Semantics note: just puts the string into the assembly file being created
  -- by the compiler. Usually a better way to do this now, with attributes,
  -- but used to be the way to put c functions and such in custom sections.
}

nonterminal Declarators with pps, host<Declarators>, lifted<Declarators>, errors, globalDecls, defs, env, baseType, typeModifiersIn, isTopLevel, isTypedef, givenAttributes, returnType, freeVariables;

abstract production consDeclarator
top::Declarators ::= h::Declarator  t::Declarators
{
  propagate host, lifted;
  top.pps = h.pps ++ t.pps;
  top.errors := h.errors ++ t.errors;
  top.defs := h.defs ++ t.defs;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  
  t.env = addEnv(h.defs, h.env);
}
abstract production nilDeclarator
top::Declarators ::=
{
  propagate host, lifted;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
}

nonterminal Declarator with pps, host<Declarator>, lifted<Declarator>, errors, globalDecls, defs, env, baseType, typeModifiersIn, typerep, sourceLocation, isTopLevel, isTypedef, givenAttributes, returnType, freeVariables;

autocopy attribute isTypedef :: Boolean;

abstract production declarator
top::Declarator ::= name::Name  ty::TypeModifierExpr  attrs::Attributes  initializer::MaybeInitializer
{
  propagate host, lifted;
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
  
  top.errors :=
    case initializer of
      justInitializer(exprInitializer(e)) ->
        if typeAssignableTo(e.typerep, top.typerep) then []
        else [err(top.sourceLocation, s"Incompatible type in initialization, expected ${showType(top.typerep)} but found ${showType(e.typerep)}")]
    | _ -> []
    end ++ ty.errors ++ initializer.errors;
  top.globalDecls := ty.globalDecls ++ initializer.globalDecls;
  top.defs := [valueDef(name.name, declaratorValueItem(top))] ++ initializer.defs;
  top.freeVariables = ty.freeVariables ++ initializer.freeVariables;
  top.typerep = animateAttributeOnType(allAttrs, ty.typerep);
  top.sourceLocation = name.location;
  
  top.errors <- 
    if top.isTopLevel then
      name.valueRedeclarationCheck(top.typerep)
    else
      name.valueRedeclarationCheckNoCompatible;
  
  local allAttrs :: Attributes = appendAttribute(top.givenAttributes, attrs);
}
abstract production errorDeclarator
top::Declarator ::= msg::[Message]
{
  propagate host, lifted;
  top.pps = [];
  top.errors := msg;
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

nonterminal FunctionDecl with pp, host<FunctionDecl>, lifted<FunctionDecl>, errors, globalDecls, defs, env, typerep, sourceLocation, returnType, freeVariables;

abstract production functionDecl
top::FunctionDecl ::= storage::[StorageClass]  fnquals::[SpecialSpecifier]  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::Attributes  decls::Decls  body::Stmt
{
  propagate host, lifted;
  top.pp = ppConcat([terminate(space(), map((.pp), storage)), terminate( space(), map( (.pp), fnquals ) ),
    bty.pp, space(), mty.lpp, name.pp, mty.rpp, ppAttributesRHS(attrs), line(), terminate(cat(semi(), line()), decls.pps),
    text("{"), line(), nestlines(2,body.pp), text("}")]);
  
  local parameters :: Decorated Parameters =
    case mty of
    | functionTypeExprWithArgs(result, args, variadic) ->
        args
    | _ -> decorate nilParameters() with { env = top.env; returnType = top.returnType; }
    end;
  
  local funcDefs::[Def] = bty.defs ++ [valueDef(name.name, functionValueItem(top))];
  local thisFuncDef :: Def = miscDef("this_func", currentFunctionItem(name, top));
  
  top.errors := bty.errors ++ mty.errors ++ body.errors;
  top.globalDecls := bty.globalDecls ++ mty.globalDecls ++ decls.globalDecls ++ 
                     body.globalDecls;
  top.defs :=
    funcDefs ++
    globalDeclsDefs(mty.globalDecls) ++
    globalDeclsDefs(decls.globalDecls) ++
    globalDeclsDefs(body.globalDecls);
  top.freeVariables =
    bty.freeVariables ++
    removeDefsFromNames([thisFuncDef], mty.freeVariables) ++
    decls.freeVariables ++ --TODO?
    removeDefsFromNames(top.defs ++ parameters.defs ++ decls.defs ++ body.functiondefs, body.freeVariables);
  top.typerep = mty.typerep;
  top.sourceLocation = name.location;
  
  bty.givenRefId = nothing();
  
  mty.baseType = bty.typerep;
  mty.typeModifiersIn = bty.typeModifiers;
  
  -- This ugly bit of awesomeness is needed to avoid redecorating bty and potentially re-generating
  -- refIds, in case someone decides to declare a new struct in the function return type.  
  local retMty::TypeModifierExpr = 
    case mty of
    | functionTypeExprWithArgs(ret, _, _) -> ret
    | functionTypeExprWithoutArgs(ret, _) -> ret
    end;
  retMty.env = mty.env;
  retMty.returnType = mty.returnType;
  retMty.baseType = bty.typerep;
    
  body.returnType =
    case mty of
    | functionTypeExprWithArgs(ret, _, _) -> just(retMty.typerep)
    | functionTypeExprWithoutArgs(ret, _) -> just(retMty.typerep)
    | _ -> nothing() -- Don't error here, this is caught in type checking
    end;

  mty.env = addEnv([thisFuncDef], openScope(addEnv(funcDefs, top.env)));
  decls.env = addEnv(parameters.defs, mty.env);
  body.env = addEnv(decls.defs ++ body.functiondefs, decls.env);
  
  decls.isTopLevel = false;
  
  -- TODO: so long as the original wasn't also a definition
  top.errors <- name.valueRedeclarationCheck(top.typerep); 
  
  top.errors <-
    if name.name == "main" && 
      !compatibleTypes(bty.typerep, builtinType([], signedType(intType())), true)
    then [wrn(name.location, "Main function should return 'int' not " ++ showType(bty.typerep))]
    else []; -- TODO: check the rest of the signature.
}

-- Allows extensions to handle nested functions differently
-- TODO: is this needed?  Should this be forwarding?  
abstract production nestedFunctionDecl
top::FunctionDecl ::= storage::[StorageClass]  fnquals::[SpecialSpecifier]  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::Attributes  decls::Decls  body::Stmt
{
  --top.defs := bty.defs ++ [valueDef(name.name, functionValueItem(top))];
  
  decls.isTopLevel = false;
  
  forwards to functionDecl(storage, fnquals, bty, mty, name, attrs, decls, body);
}

abstract production badFunctionDecl
top::FunctionDecl ::= msg::[Message]
{
  propagate host, lifted;
  top.pp = ppConcat([text("/*"),
    ppImplode(line(), map(text, map((.output), msg))),
    text("*/")]);
  top.errors := msg;
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

nonterminal Parameters with typereps, pps, host<Parameters>, lifted<Parameters>, errors, globalDecls, defs, env, returnType, freeVariables;

abstract production consParameters
top::Parameters ::= h::ParameterDecl  t::Parameters
{
  propagate host, lifted;
  top.pps = h.pp :: t.pps;
  top.typereps = h.typerep :: t.typereps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.defs := h.defs ++ t.defs;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  
  t.env = addEnv(h.defs, top.env);
}

abstract production nilParameters
top::Parameters ::=
{
  propagate host, lifted;
  top.pps = [];
  top.typereps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
}

-- TODO: move these, later
synthesized attribute paramname :: Maybe<Name>;

nonterminal ParameterDecl with paramname, typerep, pp, host<ParameterDecl>, lifted<ParameterDecl>, errors, globalDecls, defs, env, sourceLocation, returnType, freeVariables;

abstract production parameterDecl
top::ParameterDecl ::= storage::[StorageClass]  bty::BaseTypeExpr  mty::TypeModifierExpr  name::MaybeName  attrs::Attributes
{
  propagate host, lifted;
  top.pp = ppConcat([terminate(space(), map((.pp), storage)),
    bty.pp, space(), mty.lpp, space(), name.pp, mty.rpp, ppAttributesRHS(attrs)]);
  top.paramname = name.maybename;
  top.typerep = mty.typerep;
  top.sourceLocation = 
    case name.maybename of
    | just(n) -> n.location
    | nothing() -> loc("??",-1,-1,-1,-1,-1,-1) -- TODO: bug? probably okay, since only used to lookup names from env
    end;
  top.errors := bty.errors ++ mty.errors;
  top.globalDecls := bty.globalDecls ++ mty.globalDecls;
  top.defs := bty.defs ++
    case name.maybename of
    | just(n) -> [valueDef(n.name, parameterValueItem(top))]
    | _ -> []
    end;
  top.freeVariables = bty.freeVariables ++ mty.freeVariables;
  
  bty.givenRefId = nothing();
  
  mty.baseType = bty.typerep;
  mty.typeModifiersIn = bty.typeModifiers;
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;
}


synthesized attribute refId :: String; -- TODO move this later?

nonterminal StructDecl with location, pp, host<StructDecl>, lifted<StructDecl>, maybename, errors, globalDecls, defs, env, tagEnv, givenRefId, refId, moduleName, returnType, freeVariables;

abstract production structDecl
top::StructDecl ::= attrs::Attributes  name::MaybeName  dcls::StructItemList
{
  propagate host, lifted;
  top.maybename = name.maybename;
  top.pp = ppConcat([text("struct "), ppAttributes(attrs), name.pp,
    -- DEBUGGING
    --text("/*" ++ top.refId ++ "*/"),
    -- END DEBUGGING
    text(" {"), nestlines(2, terminate(cat(semi(),line()), dcls.pps)),
    text("}")]);
  top.errors := dcls.errors;
  top.globalDecls := dcls.globalDecls;

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

  local maybeAttribRefIdName::Maybe<String> =
    orElse(getRefIdFromAttributes(attrs), top.givenRefId);
  top.refId = fromMaybe(name.tagRefId, maybeAttribRefIdName);
  
  top.moduleName = getModuleNameFromAttributes(attrs);
  
  top.tagEnv = addEnv(dcls.localdefs, emptyEnv());
  
  -- If there is no forward declaration, and we have a name, then add a tag dcl for the refid.
  local preDefs :: [Def] = 
    if name.tagHasForwardDcl || !name.hasName then []
    else [tagDef(name.maybename.fromJust.name, refIdTagItem(structSEU(), top.refId))];
  -- Always add the refid TODO: deal with C11-allowed redeclarations?
  local postDefs :: [Def] =
    [refIdDef(top.refId, structRefIdItem(top))];

  top.defs := preDefs ++ dcls.defs ++ postDefs;
  top.freeVariables = dcls.freeVariables;
  
  dcls.env = openScope(addEnv(preDefs, top.env));
  
  
  -- Redeclaration error if there IS a forward declaration AND an existing refid declaration.
  top.errors <-
    if !name.tagHasForwardDcl || null(lookupRefId(top.refId, top.env)) then []
    else [err(top.location, "Redeclaration of struct " ++ name.maybename.fromJust.name)];
}

nonterminal UnionDecl with location, pp, host<UnionDecl>, lifted<UnionDecl>, maybename, errors, globalDecls, defs, env, tagEnv, givenRefId, refId, moduleName, returnType, freeVariables;

abstract production unionDecl
top::UnionDecl ::= attrs::Attributes  name::MaybeName  dcls::StructItemList
{
  propagate host, lifted;
  top.maybename = name.maybename;
  top.pp = ppConcat([text("union "), ppAttributes(attrs), name.pp, 
    -- DEBUGGING
    --text("/*" ++ top.refId ++ "*/"),
    -- END DEBUGGING
    text(" {"), nestlines(2, terminate(cat(semi(),line()), dcls.pps)),
    text("}")]);
  top.errors := dcls.errors;
  top.globalDecls := dcls.globalDecls;

  local maybeAttribRefIdName::Maybe<String> =
    orElse(getRefIdFromAttributes(attrs), top.givenRefId);
  top.refId = fromMaybe(name.tagRefId, maybeAttribRefIdName);
  
  top.moduleName = getModuleNameFromAttributes(attrs);
  
  top.tagEnv = addEnv(dcls.localdefs, emptyEnv());
  
  -- If there is no forward declaration, and we have a name, then add a tag dcl for the refid.
  local preDefs :: [Def] = 
    if name.tagHasForwardDcl || !name.hasName then []
    else [tagDef(name.maybename.fromJust.name, refIdTagItem(unionSEU(), top.refId))];
  -- Always add the refid TODO: deal with C11-allowed redeclarations?
  local postDefs :: [Def] =
    [refIdDef(top.refId, unionRefIdItem(top))];

  top.defs := preDefs ++ dcls.defs ++ postDefs;
  top.freeVariables = dcls.freeVariables;
  
  dcls.env = openScope(addEnv(preDefs, top.env));
  
  
  -- Redeclaration error if there IS a forward declaration AND an existing refid declaration.
  top.errors <-
    if !name.tagHasForwardDcl || null(lookupRefId(top.refId, top.env)) then []
    else [err(top.location, "Redeclaration of union " ++ name.maybename.fromJust.name)];
}

nonterminal EnumDecl with location, pp, host<EnumDecl>, lifted<EnumDecl>, maybename, errors, globalDecls, defs, env, givenRefId, returnType, freeVariables;

abstract production enumDecl
top::EnumDecl ::= name::MaybeName  dcls::EnumItemList
{
  propagate host, lifted;
  top.maybename = name.maybename;
  top.pp = ppConcat([text("enum"), space(), name.pp, space(), text("{"),
    nestlines(2, ppImplode(cat(comma(),line()), dcls.pps)),
    text("}")]);
  top.errors := dcls.errors;
  top.globalDecls := dcls.globalDecls;

  local thisdcl :: [Def] =
    case name.maybename of
    | just(n) -> [tagDef(n.name, enumTagItem(top))]
    | _ -> []
    end;
  top.defs := thisdcl ++ dcls.defs;
  top.freeVariables = dcls.freeVariables;
  
  dcls.env = addEnv(thisdcl, top.env);
  dcls.containingEnum = tagType([], enumTagType(top));
  

  top.errors <-
    if null(name.tagLocalLookup) then []
    else [err(top.location, "Redeclaration of enum " ++ name.maybename.fromJust.name)];
    -- We can rely on the name being present if it's a redeclaration
}


nonterminal StructItemList with pps, host<StructItemList>, lifted<StructItemList>, errors, globalDecls, defs, env, localdefs, returnType, freeVariables;

abstract production consStructItem
top::StructItemList ::= h::StructItem  t::StructItemList
{
  propagate host, lifted;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.defs := h.defs ++ t.defs;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  top.localdefs := h.localdefs ++ t.localdefs;
  
  t.env = addEnv(h.defs ++ h.localdefs, h.env);
}

abstract production nilStructItem
top::StructItemList ::=
{
  propagate host, lifted;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.localdefs := [];
}

nonterminal EnumItemList with pps, host<EnumItemList>, lifted<EnumItemList>, errors, globalDecls, defs, env, containingEnum, returnType, freeVariables;

autocopy attribute containingEnum :: Type;

abstract production consEnumItem
top::EnumItemList ::= h::EnumItem  t::EnumItemList
{
  propagate host, lifted;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.defs := h.defs ++ t.defs;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  
  t.env = addEnv(h.defs, h.env);
}

abstract production nilEnumItem
top::EnumItemList ::=
{
  propagate host, lifted;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
}

nonterminal StructItem with pp, host<StructItem>, lifted<StructItem>, errors, globalDecls, defs, env, localdefs, returnType, freeVariables;

abstract production structItem
top::StructItem ::= attrs::Attributes  ty::BaseTypeExpr  dcls::StructDeclarators
{
  propagate host, lifted;
  top.pp = ppConcat([ppAttributes(attrs), ty.pp, space(), ppImplode(text(", "), dcls.pps)]);
  top.errors := ty.errors ++ dcls.errors;
  top.globalDecls := ty.globalDecls ++ dcls.globalDecls;
  top.defs := ty.defs;
  top.freeVariables = ty.freeVariables ++ dcls.freeVariables;
  top.localdefs := dcls.localdefs;
  
  ty.givenRefId = getRefIdFromAttributes(attrs);
  dcls.env = addEnv(ty.defs, ty.env);
  dcls.baseType = ty.typerep;
  dcls.typeModifiersIn = ty.typeModifiers;
  dcls.givenAttributes = attrs;
}
abstract production warnStructItem
top::StructItem ::= msg::[Message]
{
  propagate host, lifted;
  top.pp = notext();
  top.errors := msg;
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.localdefs := [];
}


nonterminal StructDeclarators with pps, host<StructDeclarators>, lifted<StructDeclarators>, errors, globalDecls, localdefs, env, baseType, typeModifiersIn, givenAttributes, returnType, freeVariables;

abstract production consStructDeclarator
top::StructDeclarators ::= h::StructDeclarator  t::StructDeclarators
{
  propagate host, lifted;
  top.pps = h.pps ++ t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.localdefs := h.localdefs ++ t.localdefs;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.localdefs, t.freeVariables);
  
  t.env = addEnv(h.localdefs, h.env);
}
abstract production nilStructDeclarator
top::StructDeclarators ::=
{
  propagate host, lifted;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.localdefs := [];
  top.freeVariables = [];
}

nonterminal StructDeclarator with pps, host<StructDeclarator>, lifted<StructDeclarator>, errors, globalDecls, localdefs, env, typerep, sourceLocation, baseType, typeModifiersIn, givenAttributes, returnType, freeVariables;

abstract production structField
top::StructDeclarator ::= name::Name  ty::TypeModifierExpr  attrs::Attributes
{
  propagate host, lifted;
  top.pps = [ppConcat([ty.lpp, name.pp, ty.rpp, ppAttributesRHS(attrs)])];
  top.errors := ty.errors;
  top.globalDecls := ty.globalDecls;
  top.localdefs := [valueDef(name.name, fieldValueItem(top))];
  top.freeVariables = ty.freeVariables;
  top.typerep = ty.typerep;
  top.sourceLocation = name.location;
  
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;
  
  local allAttrs :: Attributes = appendAttribute(top.givenAttributes, attrs);
}
abstract production structBitfield
top::StructDeclarator ::= name::MaybeName  ty::TypeModifierExpr  e::Expr  attrs::Attributes
{
  propagate host, lifted;
  top.pps = [ppConcat([ty.lpp, name.pp, ty.rpp, text(" : "), e.pp, ppAttributesRHS(attrs)])];
  top.errors := ty.errors ++ e.errors;
  top.globalDecls := ty.globalDecls ++ e.globalDecls;

  local thisdcl :: [Def] =
    case name.maybename of
    | just(n) -> [valueDef(n.name, fieldValueItem(top))]
    | _ -> []
    end;
  top.localdefs := thisdcl;
  top.freeVariables = ty.freeVariables ++ e.freeVariables;
  top.typerep = ty.typerep;
  top.sourceLocation = 
    case name.maybename of
    | just(n) -> n.location
    | nothing() -> loc("??",-1,-1,-1,-1,-1,-1) -- TODO: bug? probably okay, since only used to lookup names from env
    end;
  
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;

  local allAttrs :: Attributes = appendAttribute(top.givenAttributes, attrs);
}
-- Similar to external declarations, this pretends not to exist if it's only a warning
abstract production warnStructField
top::StructDeclarator ::= msg::[Message]
{
  propagate host, lifted;
  top.pps = [];
  top.errors := msg;
  top.globalDecls := [];
  top.localdefs := [];
  top.freeVariables = [];
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

nonterminal EnumItem with pp, host<EnumItem>, lifted<EnumItem>, errors, globalDecls, defs, env, containingEnum, typerep, sourceLocation, returnType, freeVariables;

abstract production enumItem
top::EnumItem ::= name::Name  e::MaybeExpr
{
  propagate host, lifted;
  top.pp = ppConcat([name.pp] ++ if e.isJust then [text(" = "), e.pp] else []);
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.defs := [valueDef(name.name, enumValueItem(top))];
  top.freeVariables = e.freeVariables;
  top.typerep = top.containingEnum;
  top.sourceLocation = name.location;
  
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;
}



nonterminal StorageClass with pp;
abstract production externStorageClass
top::StorageClass ::= { top.pp = text("extern"); }
abstract production staticStorageClass
top::StorageClass ::= { top.pp = text("static"); }
abstract production autoStorageClass
top::StorageClass ::= { top.pp = text("auto"); }
abstract production registerStorageClass
top::StorageClass ::= { top.pp = text("register"); }
abstract production threadLocalStorageClass
top::StorageClass ::= { top.pp = text("_Thread_local"); }

abstract production hackUnusedDecl
top::Decl ::=
{
  -- pp doesn't depend on env
  top.pp = text("hack");
  -- Forwarding based on env, returnType, and isTopLevel.
  forwards to if top.isTopLevel then error(hackUnparse(top.env) ++ hackUnparse(top.returnType)) else hackUnusedDecl();
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

