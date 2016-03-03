
-- StructDecl, UnionDecl, and EnumDecl are all rooted in the abstract syntax within a TypeExpr.

-- FunctionDecl is (for now) always rooted in an ExternalDeclaration
-- Declaration is rooted in External, but also in stmts. Either a variableDecl or a typedefDecl.
-- ParameterDecl should probably be something special, distinct from variableDecl.

nonterminal Decls with pps, host<Decls>, errors, globalDecls, defs, env, isTopLevel, returnType, freeVariables;

-- String is name of decl, used to remove duplicates
synthesized attribute globalDecls::[Pair<String Decl>] with ++;

autocopy attribute isTopLevel :: Boolean;

-- Inserted globalDecls before h. Should only ever get used by top-level 
-- foldGlobalDecl in concrete syntax.
abstract production consGlobalDecl
top::Decls ::= h::Decl  t::Decls
{
  local globalDecls::[Decl] = removeDuplicateGlobalDecls(h.globalDecls); 
  top.globalDecls := [];
  
  top.pps = h.pp :: t.pps;
  
  forwards to 
    if null(globalDecls)
    then consDecl(h, t)
    else consGlobalDecl(decls(foldDecl(globalDecls)), consDecl(h, t));

-- forwards to appendDecls(foldDecl(globalDecls), consDecl(h, t));  
-- forwards to consDecl(decls(foldDecl([])), consDecl(h, t));
-- forwards to consDecl(decls(nilDecl()), consDecl(h, nilDecl()));
-- forwards to consDecl(decls(nilDecl()), consDecl(h, t));
-- forwards to consDecl(h, t);
-- forwards to consDecl(decls(consDecl(h,nilDecl())), t);
-- forwards to appendDecls( consDecl(decls(foldDecl(globalDecls)), consDecl(h, t)), nilDecl() );
}

function removeDuplicateGlobalDecls
[Decl] ::= ds::[Pair<String Decl>]
{
  return
    case ds of
      [] -> []
    | pair(n, d) :: t ->
        if false--containsBy(stringEq, n, map(fst, t))
        then removeDuplicateGlobalDecls(t)
        else d :: removeDuplicateGlobalDecls(t)
    end;
}

abstract production consDecl
top::Decls ::= h::Decl  t::Decls
{
  propagate host;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.defs = h.defs ++ t.defs;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  
  t.env = addEnv(h.defs, top.env);
}

abstract production nilDecl
top::Decls ::=
{
  propagate host;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
}

function appendDecls
Decls ::= d1::Decls d2::Decls
{
  return consDecl(decls(d1), d2);
}


nonterminal Decl with pp, host<Decl>, errors, globalDecls, defs, env, isTopLevel, returnType, freeVariables;

{-- Pass down from top-level declaration the list of attribute to each name-declaration -}
autocopy attribute givenAttributes :: [Attribute];

abstract production decls
top::Decl ::= d::Decls
{
  propagate host;
  top.pp = terminate( line(), d.pps );
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.defs = d.defs;
  top.freeVariables = d.freeVariables;
}

abstract production variableDecls
top::Decl ::= storage::[StorageClass]  attrs::[Attribute]  ty::BaseTypeExpr  dcls::Declarators
{
  propagate host;
  top.pp = concat(
    terminate(space(), map((.pp), storage)) ::
      ppAttributes(attrs) ::
      [ty.pp, space(), ppImplode(text(", "), dcls.pps), semi()]);
  top.errors := ty.errors ++ dcls.errors;
  top.globalDecls := dcls.globalDecls;
  top.defs = ty.defs ++ dcls.defs;
  top.freeVariables = ty.freeVariables ++ dcls.freeVariables;
  
  dcls.baseType = ty.typerep;
  dcls.isTypedef = false;
  dcls.givenAttributes = attrs;
}

abstract production typeExprDecl
top::Decl ::= attrs::[Attribute] ty::BaseTypeExpr
{
  propagate host;
  top.pp = cat( ty.pp, semi() );
  top.errors := ty.errors;
  top.globalDecls := ty.globalDecls;
  top.defs = ty.defs;
  top.freeVariables = ty.freeVariables;
}

abstract production typedefDecls
top::Decl ::= attrs::[Attribute]  ty::BaseTypeExpr  dcls::Declarators
{
  propagate host;
  top.pp = concat([text("typedef "), ppAttributes(attrs), ty.pp, space(), ppImplode(text(", "), dcls.pps), semi()]);
  top.errors := ty.errors ++ dcls.errors;
  top.globalDecls := ty.globalDecls ++ dcls.globalDecls;
  top.defs = ty.defs ++ dcls.defs;
  top.freeVariables = ty.freeVariables ++ dcls.freeVariables;
  
  dcls.baseType = ty.typerep;
  dcls.isTypedef = true;
  dcls.givenAttributes = attrs;
}

abstract production functionDeclaration
top::Decl ::= f::FunctionDecl
{
  propagate host;
  top.pp = f.pp;
  top.errors := f.errors;
  top.globalDecls := f.globalDecls;
  top.defs = f.defs;
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
  propagate host;
  top.pp = concat([text("/*"),
    ppImplode(line(), map(text, map((.output), msg))),
    text("*/")]);
  top.errors := msg;
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
}

-- C11
abstract production staticAssertDecl
top::Decl ::= e::Expr  s::String
{
  propagate host;
  top.pp = concat([text("_Static_assert("), e.pp, text(", "), text(s), text(");")]);
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.defs = e.defs;
  top.freeVariables = e.freeVariables;
}

abstract production fileScopeAsm
top::Decl ::= s::String
{
  propagate host;
  top.pp = concat([text("asm"), parens(text(s))]);
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
  -- TODO: should be file-scope only.
  -- Semantics note: just puts the string into the assembly file being created
  -- by the compiler. Usually a better way to do this now, with attributes,
  -- but used to be the way to put c functions and such in custom sections.
}

nonterminal Declarators with pps, host<Declarators>, errors, globalDecls, defs, env, baseType, isTopLevel, isTypedef, givenAttributes, returnType, freeVariables;

abstract production consDeclarator
top::Declarators ::= h::Declarator  t::Declarators
{
  propagate host;
  top.pps = h.pps ++ t.pps;
  top.errors := h.errors ++ t.errors;
  top.defs = h.defs ++ t.defs;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  
  t.env = addEnv(h.defs, h.env);
}
abstract production nilDeclarator
top::Declarators ::=
{
  propagate host;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
}

nonterminal Declarator with pps, host<Declarator>, errors, globalDecls, defs, env, baseType, typerep, sourceLocation, isTopLevel, isTypedef, givenAttributes, returnType, freeVariables;

autocopy attribute isTypedef :: Boolean;

abstract production declarator
top::Declarator ::= name::Name  ty::TypeModifierExpr  attrs::[Attribute]  initializer::MaybeInitializer
{
  propagate host;
  top.pps =
    case ty of
{-      pointerTypeExpr(qs, functionTypeExprWithArgs(result, args, variadic)) ->
        [concat([
          ty.lpp,
          parens(cat(name.pp, text("*"))),
          parens(
            if null(args.pps) 
            then text("void") 
            else ppImplode(text(", "), 
                (if variadic then args.pps ++ [text("...")] else args.pps))),
          result.rpp])]
    | pointerTypeExpr(qs, functionTypeExprWithoutArgs(result, ids)) ->
      [concat([
        ty.lpp,
        parens(cat(name.pp, text("*"))),
        parens(ppImplode(text(", "),
        map((.pp), ids))),
        result.rpp])]-}
    | _ -> [concat([ty.lpp, name.pp, ty.rpp, ppAttributesRHS(attrs), initializer.pp])]
    end;
  
  top.errors :=
    case initializer of
      justInitializer(exprInitializer(e)) ->
        if typeAssignableTo(e.typerep, top.typerep) then []
        else [err(top.sourceLocation, s"Incompatible type in initialization, expected ${showType(top.typerep)} but found ${showType(e.typerep)}")]
    | _ -> []
    end ++ ty.errors ++ initializer.errors;
  top.globalDecls := ty.globalDecls ++ initializer.globalDecls;
  top.defs = [valueDef(name.name, declaratorValueItem(top))];
  top.freeVariables = ty.freeVariables ++ initializer.freeVariables;
  top.typerep = animateAttributeOnType(allAttrs, ty.typerep);
  top.sourceLocation = name.location;
  
  top.errors <- 
    if top.isTopLevel then
      name.valueRedeclarationCheck(top.typerep)
    else
      name.valueRedeclarationCheckNoCompatible;
  
  local allAttrs :: [Attribute] = top.givenAttributes ++ attrs;
}
abstract production errorDeclarator
top::Declarator ::= msg::[Message]
{
  propagate host;
  top.pps = [];
  top.errors := msg;
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

nonterminal FunctionDecl with pp, host<FunctionDecl>, errors, globalDecls, defs, env, typerep, sourceLocation, returnType, freeVariables;

abstract production functionDecl
top::FunctionDecl ::= storage::[StorageClass]  fnquals::[SpecialSpecifier]  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::[Attribute]  decls::Decls  body::Stmt
{
  propagate host;
  top.pp = concat([terminate(space(), map((.pp), storage)), terminate( space(), map( (.pp), fnquals ) ),
    bty.pp, space(), mty.lpp, name.pp, mty.rpp, ppAttributesRHS(attrs), line(), terminate(cat(semi(), line()), decls.pps),
    text("{"), line(), nestlines(2,body.pp), text("}")]);
  
  local parameters :: Decorated Parameters =
    case mty of
    | functionTypeExprWithArgs(result, args, variadic) ->
        args
    | _ -> decorate nilParameters() with { env = top.env; returnType = top.returnType; }
    end;
  
  top.errors := bty.errors ++ mty.errors ++ body.errors;
  top.globalDecls := bty.globalDecls ++ mty.globalDecls ++ decls.globalDecls ++ 
                     body.globalDecls;
  top.defs = bty.defs ++ [valueDef(name.name, functionValueItem(top))];
  top.freeVariables =
    bty.freeVariables ++
    removeDefsFromNames([thisFuncDef], mty.freeVariables) ++
    decls.freeVariables ++ --TODO?
    removeDefsFromNames(top.defs ++ parameters.defs ++ decls.defs ++ body.functiondefs, body.freeVariables);
  top.typerep = mty.typerep;
  top.sourceLocation = name.location;
  
  mty.baseType = bty.typerep;
  
  body.returnType =
    case mty of
    | functionTypeExprWithArgs(ret, _, _) -> 
        just(decorate typeName(bty, ret) 
             with {env = top.env; returnType = top.returnType;}.typerep)

    | functionTypeExprWithoutArgs(ret, _) ->
        just(decorate typeName(bty, ret) 
             with {env = top.env; returnType = top.returnType;}.typerep)

    | _ -> nothing() -- Don't error here, this is caught in type checking
    end;
  

  local thisFuncDef :: Def = miscDef("this_func", currentFunctionItem(name, top));
  mty.env = addEnv ([thisFuncDef], top.env);  -- TODO: extend this to decls, body, etc.

  body.env = addEnv(top.defs ++ parameters.defs ++ decls.defs ++ body.functiondefs, 
                    openScope(addEnv(bty.defs, top.env)));
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
abstract production nestedFunctionDecl
top::FunctionDecl ::= storage::[StorageClass]  fnquals::[SpecialSpecifier]  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::[Attribute]  decls::Decls  body::Stmt
{
  top.defs = bty.defs ++ [valueDef(name.name, functionValueItem(top))];
  
  decls.isTopLevel = false;
  
  forwards to functionDecl(storage, fnquals, bty, mty, name, attrs, decls, body);
}

abstract production badFunctionDecl
top::FunctionDecl ::= msg::[Message]
{
  propagate host;
  top.pp = concat([text("/*"),
    ppImplode(line(), map(text, map((.output), msg))),
    text("*/")]);
  top.errors := msg;
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

nonterminal Parameters with typereps, pps, host<Parameters>, errors, globalDecls, defs, env, returnType, freeVariables;

abstract production consParameters
top::Parameters ::= h::ParameterDecl  t::Parameters
{
  propagate host;
  top.pps = h.pp :: t.pps;
  top.typereps = h.typerep :: t.typereps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.defs = h.defs ++ t.defs;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  
  t.env = addEnv(h.defs, top.env);
}

abstract production nilParameters
top::Parameters ::=
{
  propagate host;
  top.pps = [];
  top.typereps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
}

-- TODO: move these, later
synthesized attribute paramname :: Maybe<Name>;

nonterminal ParameterDecl with paramname, typerep, pp, host<ParameterDecl>, errors, globalDecls, defs, env, sourceLocation, returnType, freeVariables;

abstract production parameterDecl
top::ParameterDecl ::= storage::[StorageClass]  bty::BaseTypeExpr  mty::TypeModifierExpr  name::MaybeName  attrs::[Attribute]
{
  propagate host;
  top.pp = concat([terminate(space(), map((.pp), storage)),
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
  top.defs = bty.defs ++
    case name.maybename of
    | just(n) -> [valueDef(n.name, parameterValueItem(top))]
    | _ -> []
    end;
  top.freeVariables = bty.freeVariables ++ mty.freeVariables;
  
  mty.baseType = bty.typerep;
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;
}


synthesized attribute refId :: String; -- TODO move this later?

nonterminal StructDecl with location, pp, host<StructDecl>, maybename, errors, globalDecls, defs, env, tagEnv, refId, returnType, freeVariables;

abstract production structDecl
top::StructDecl ::= attrs::[Attribute]  name::MaybeName  dcls::StructItemList
{
  propagate host;
  top.maybename = name.maybename;
  top.pp = concat([text("struct "), ppAttributes(attrs), name.pp,
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

  local maybeAttribRefIdName::Maybe<String> = getRefIdFromAttributes(attrs);
  top.refId = fromMaybe(name.tagRefId, maybeAttribRefIdName);
  top.tagEnv = addEnv(dcls.localdefs, emptyEnv());
  
  -- If there is no forward declaration, and we have a name, then add a tag dcl for the refid.
  local preDefs :: [Def] = 
    if name.tagHasForwardDcl || !name.hasName then []
    else [tagDef(name.maybename.fromJust.name, refIdTagItem(structSEU(), top.refId))];
  -- Always add the refid TODO: deal with C11-allowed redeclarations?
  local postDefs :: [Def] =
    [refIdDef(top.refId, structRefIdItem(top))];

  top.defs = preDefs ++ dcls.defs ++ postDefs;
  top.freeVariables = dcls.freeVariables;
  
  dcls.env = openScope(addEnv(preDefs, top.env));
  
  
  -- Redeclaration error if there IS a forward declaration AND an existing refid declaration.
  top.errors <-
    if !name.tagHasForwardDcl || null(lookupRefId(top.refId, top.env)) then []
    else [err(top.location, "Redeclaration of struct " ++ name.maybename.fromJust.name)];
}

function getRefIdFromAttributes
Maybe<String> ::= attrs::[Attribute]
{
  return
    case attrs of
      gccAttribute(ats) :: rest -> orElse(getRefIdFromAttribs(ats), getRefIdFromAttributes(attrs))
    | _ :: rest -> getRefIdFromAttributes(rest)
    | [] -> nothing()
    end;
}

function getRefIdFromAttribs
Maybe<String> ::= attrs::Attribs
{
  return
    case attrs of
      consAttrib(appliedAttrib(attribName(name("refId")), consExpr(stringLiteral(s), nilExpr())), _) ->
        just(substring(1, length(s) - 1, s))
    | consAttrib(_, rest) -> getRefIdFromAttribs(rest)
    | nilAttrib() -> nothing()
    end;
}

nonterminal UnionDecl with location, pp, host<UnionDecl>, maybename, errors, globalDecls, defs, env, tagEnv, refId, returnType, freeVariables;

abstract production unionDecl
top::UnionDecl ::= attrs::[Attribute]  name::MaybeName  dcls::StructItemList
{
  propagate host;
  top.maybename = name.maybename;
  top.pp = concat([text("union "), ppAttributes(attrs), name.pp, 
    -- DEBUGGING
    --text("/*" ++ top.refId ++ "*/"),
    -- END DEBUGGING
    text(" {"), nestlines(2, terminate(cat(semi(),line()), dcls.pps)),
    text("}")]);
  top.errors := dcls.errors;
  top.globalDecls := dcls.globalDecls;

  top.refId = name.tagRefId;
  top.tagEnv = addEnv(dcls.localdefs, emptyEnv());
  
  -- If there is no forward declaration, and we have a name, then add a tag dcl for the refid.
  local preDefs :: [Def] = 
    if name.tagHasForwardDcl || !name.hasName then []
    else [tagDef(name.maybename.fromJust.name, refIdTagItem(unionSEU(), top.refId))];
  -- Always add the refid TODO: deal with C11-allowed redeclarations?
  local postDefs :: [Def] =
    [refIdDef(top.refId, unionRefIdItem(top))];

  top.defs = preDefs ++ dcls.defs ++ postDefs;
  top.freeVariables = dcls.freeVariables;
  
  dcls.env = openScope(addEnv(preDefs, top.env));
  
  
  -- Redeclaration error if there IS a forward declaration AND an existing refid declaration.
  top.errors <-
    if !name.tagHasForwardDcl || null(lookupRefId(top.refId, top.env)) then []
    else [err(top.location, "Redeclaration of union " ++ name.maybename.fromJust.name)];
}

nonterminal EnumDecl with location, pp, host<EnumDecl>, maybename, errors, globalDecls, defs, env, returnType, freeVariables;

abstract production enumDecl
top::EnumDecl ::= name::MaybeName  dcls::EnumItemList
{
  propagate host;
  top.maybename = name.maybename;
  top.pp = concat([text("enum"), space(), name.pp, space(), text("{"),
    nestlines(2, ppImplode(cat(comma(),line()), dcls.pps)),
    text("}")]);
  top.errors := dcls.errors;
  top.globalDecls := dcls.globalDecls;

  local thisdcl :: [Def] =
    case name.maybename of
    | just(n) -> [tagDef(n.name, enumTagItem(top))]
    | _ -> []
    end;
  top.defs = thisdcl ++ dcls.defs;
  top.freeVariables = dcls.freeVariables;
  
  dcls.env = addEnv(thisdcl, top.env);
  dcls.containingEnum = tagType([], enumTagType(top));
  

  top.errors <-
    if null(name.tagLocalLookup) then []
    else [err(top.location, "Redeclaration of enum " ++ name.maybename.fromJust.name)];
    -- We can rely on the name being present if it's a redeclaration
}


nonterminal StructItemList with pps, host<StructItemList>, errors, globalDecls, defs, env, localdefs, returnType, freeVariables;

abstract production consStructItem
top::StructItemList ::= h::StructItem  t::StructItemList
{
  propagate host;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.defs = h.defs ++ t.defs;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  top.localdefs = h.localdefs ++ t.localdefs;
  
  t.env = addEnv(h.defs ++ h.localdefs, h.env);
}

abstract production nilStructItem
top::StructItemList ::=
{
  propagate host;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
  top.localdefs = [];
}

nonterminal EnumItemList with pps, host<EnumItemList>, errors, globalDecls, defs, env, containingEnum, returnType, freeVariables;

autocopy attribute containingEnum :: Type;

abstract production consEnumItem
top::EnumItemList ::= h::EnumItem  t::EnumItemList
{
  propagate host;
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.defs = h.defs ++ t.defs;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.defs, t.freeVariables);
  
  t.env = addEnv(h.defs, h.env);
}

abstract production nilEnumItem
top::EnumItemList ::=
{
  propagate host;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
}

nonterminal StructItem with pp, host<StructItem>, errors, globalDecls, defs, env, localdefs, returnType, freeVariables;

abstract production structItem
top::StructItem ::= attrs::[Attribute]  ty::BaseTypeExpr  dcls::StructDeclarators
{
  propagate host;
  top.pp = concat([ppAttributes(attrs), ty.pp, space(), ppImplode(text(", "), dcls.pps)]);
  top.errors := ty.errors ++ dcls.errors;
  top.globalDecls := ty.globalDecls ++ dcls.globalDecls;
  top.defs = ty.defs;
  top.freeVariables = ty.freeVariables ++ dcls.freeVariables;
  top.localdefs = dcls.localdefs;
  
  dcls.baseType = ty.typerep;
  dcls.givenAttributes = attrs;
}
abstract production warnStructItem
top::StructItem ::= msg::[Message]
{
  propagate host;
  top.pp = notext();
  top.errors := msg;
  top.globalDecls := [];
  top.defs = [];
  top.freeVariables = [];
  top.localdefs = [];
}


nonterminal StructDeclarators with pps, host<StructDeclarators>, errors, globalDecls, localdefs, env, baseType, givenAttributes, returnType, freeVariables;

abstract production consStructDeclarator
top::StructDeclarators ::= h::StructDeclarator  t::StructDeclarators
{
  propagate host;
  top.pps = h.pps ++ t.pps;
  top.errors := h.errors ++ t.errors;
  top.globalDecls := h.globalDecls ++ t.globalDecls;
  top.localdefs = h.localdefs ++ t.localdefs;
  top.freeVariables =
    h.freeVariables ++
    removeDefsFromNames(h.localdefs, t.freeVariables);
  
  t.env = addEnv(h.localdefs, h.env);
}
abstract production nilStructDeclarator
top::StructDeclarators ::=
{
  propagate host;
  top.pps = [];
  top.errors := [];
  top.globalDecls := [];
  top.localdefs = [];
  top.freeVariables = [];
}

nonterminal StructDeclarator with pps, host<StructDeclarator>, errors, globalDecls, localdefs, env, typerep, sourceLocation, baseType, givenAttributes, returnType, freeVariables;

abstract production structField
top::StructDeclarator ::= name::Name  ty::TypeModifierExpr  attrs::[Attribute]
{
  propagate host;
  top.pps = [concat([ty.lpp, name.pp, ty.rpp, ppAttributesRHS(attrs)])];
  top.errors := ty.errors;
  top.globalDecls := ty.globalDecls;
  top.localdefs = [valueDef(name.name, fieldValueItem(top))];
  top.freeVariables = ty.freeVariables;
  top.typerep = ty.typerep;
  top.sourceLocation = name.location;
  
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;
  
  local allAttrs :: [Attribute] = top.givenAttributes ++ attrs;
}
abstract production structBitfield
top::StructDeclarator ::= name::MaybeName  ty::TypeModifierExpr  e::Expr  attrs::[Attribute]
{
  propagate host;
  top.pps = [concat([ty.lpp, name.pp, ty.rpp, text(" : "), e.pp, ppAttributesRHS(attrs)])];
  top.errors := ty.errors ++ e.errors;
  top.globalDecls := ty.globalDecls ++ e.globalDecls;

  local thisdcl :: [Def] =
    case name.maybename of
    | just(n) -> [valueDef(n.name, fieldValueItem(top))]
    | _ -> []
    end;
  top.localdefs = thisdcl;
  top.freeVariables = ty.freeVariables ++ e.freeVariables;
  top.typerep = ty.typerep;
  top.sourceLocation = 
    case name.maybename of
    | just(n) -> n.location
    | nothing() -> loc("??",-1,-1,-1,-1,-1,-1) -- TODO: bug? probably okay, since only used to lookup names from env
    end;
  
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;

  local allAttrs :: [Attribute] = top.givenAttributes ++ attrs;
}
-- Similar to external declarations, this pretends not to exist if it's only a warning
abstract production warnStructField
top::StructDeclarator ::= msg::[Message]
{
  propagate host;
  top.pps = [];
  top.errors := msg;
  top.globalDecls := [];
  top.localdefs = [];
  top.freeVariables = [];
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

nonterminal EnumItem with pp, host<EnumItem>, errors, globalDecls, defs, env, containingEnum, typerep, sourceLocation, returnType, freeVariables;

abstract production enumItem
top::EnumItem ::= name::Name  e::MaybeExpr
{
  propagate host;
  top.pp = concat([name.pp] ++ if e.isJust then [text(" = "), e.pp] else []);
  top.errors := e.errors;
  top.globalDecls := e.globalDecls;
  top.defs = [valueDef(name.name, enumValueItem(top))];
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
  -- Forwarding based on env.
  forwards to if false then error(hackUnparse(top.env)) else hackUnusedDecl();
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

