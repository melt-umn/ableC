
-- StructDecl, UnionDecl, and EnumDecl are all rooted in the abstract syntax within a TypeExpr.

-- FunctionDecl is (for now) always rooted in an ExternalDeclaration
-- Declaration is rooted in External, but also in stmts. Either a variableDecl or a typedefDecl.
-- ParameterDecl should probably be something special, distinct from variableDecl.

nonterminal Decls with pps, errors, defs, env, isTopLevel;

autocopy attribute isTopLevel :: Boolean;

abstract production consDecl
top::Decls ::= h::Decl  t::Decls
{
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.defs = h.defs ++ t.defs;
  
  t.env = addEnv(h.defs, top.env);
}

abstract production nilDecl
top::Decls ::=
{
  top.pps = [];
  top.errors := [];
  top.defs = [];
}

nonterminal Decl with pp, errors, defs, env, isTopLevel;

{-- Pass down from top-level declaration the list of attribute to each name-declaration -}
autocopy attribute givenAttributes :: [Attribute];

abstract production variableDecls
top::Decl ::= storage::[StorageClass]  attrs::[Attribute]  ty::BaseTypeExpr  dcls::Declarators
{
  top.pp = concat(
    terminate(space(), map((.pp), storage)) ::
      ppAttributes(attrs) ::
      [ty.pp, space(), ppImplode(text(", "), dcls.pps), semi()]);
  top.errors := ty.errors ++ dcls.errors;
  top.defs = ty.defs ++ dcls.defs;
  
  dcls.baseType = ty.typerep;
  dcls.isTypedef = false;
  dcls.givenAttributes = attrs;
}

abstract production typeExprDecl
top::Decl ::= ty::BaseTypeExpr
{
  top.pp = cat( ty.pp, semi() );
  top.errors := ty.errors;
  top.defs = ty.defs;
}

abstract production typedefDecls
top::Decl ::= attrs::[Attribute]  ty::BaseTypeExpr  dcls::Declarators
{
  top.pp = concat([text("typedef "), ppAttributes(attrs), ty.pp, space(), ppImplode(text(", "), dcls.pps), semi()]);
  top.errors := ty.errors ++ dcls.errors;
  top.defs = ty.defs ++ dcls.defs;
  
  dcls.baseType = ty.typerep;
  dcls.isTypedef = true;
  dcls.givenAttributes = attrs;
}

abstract production functionDeclaration
top::Decl ::= f::FunctionDecl
{
  top.pp = f.pp;
  top.errors := f.errors;
  top.defs = f.defs;
}

abstract production decls
top::Decl ::= d::Decls
{
  top.pp = terminate( line(), d.pps );
  top.errors := d.errors;
  top.defs = d.defs;
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
  top.pp = concat([text("/*"),
    ppImplode(line(), map(text, map((.output), msg))),
    text("*/")]);
  top.errors := msg;
  top.defs = [];
}

-- C11
abstract production staticAssertDecl
top::Decl ::= e::Expr  s::String
{
  top.pp = concat([text("_Static_assert("), e.pp, text(", "), text(s), text(");")]);
  top.errors := e.errors;
  top.defs = e.defs;
}

abstract production fileScopeAsm
top::Decl ::= s::String
{
  top.pp = concat([text("asm"), parens(text(s))]);
  top.errors := [];
  top.defs = [];
  -- TODO: should be file-scope only.
  -- Semantics note: just puts the string into the assembly file being created
  -- by the compiler. Usually a better way to do this now, with attributes,
  -- but used to be the way to put c functions and such in custom sections.
}

nonterminal Declarators with pps, errors, defs, env, baseType, isTopLevel, isTypedef, givenAttributes;

abstract production consDeclarator
top::Declarators ::= h::Declarator  t::Declarators
{
  top.pps = h.pps ++ t.pps;
  top.errors := h.errors ++ t.errors;
  top.defs = h.defs ++ t.defs;
  
  t.env = addEnv(h.defs, h.env);
}
abstract production nilDeclarator
top::Declarators ::=
{
  top.pps = [];
  top.errors := [];
  top.defs = [];
}

nonterminal Declarator with pps, errors, defs, env, baseType, typerep, sourceLocation, isTopLevel, isTypedef, givenAttributes;

autocopy attribute isTypedef :: Boolean;

abstract production declarator
top::Declarator ::= name::Name  ty::TypeModifierExpr  attrs::[Attribute]  initializer::MaybeInitializer
{
  top.pps = [concat([ty.lpp, name.pp, ty.rpp, ppAttributesRHS(attrs), initializer.pp])];
  top.errors := ty.errors ++ initializer.errors;
  top.defs = [valueDef(name.name, declaratorValueItem(top))];
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
  top.pps = [];
  top.errors := msg;
  top.defs = [];
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

nonterminal FunctionDecl with pp, errors, defs, env, typerep, sourceLocation;

abstract production functionDecl
top::FunctionDecl ::= storage::[StorageClass]  fnquals::[SpecialSpecifier]  bty::BaseTypeExpr mty::TypeModifierExpr  name::Name  attrs::[Attribute]  decls::Decls  body::Stmt
{
  top.pp = concat([terminate(space(), map((.pp), storage)), terminate( space(), map( (.pp), fnquals ) ),
    bty.pp, space(), mty.lpp, name.pp, mty.rpp, ppAttributesRHS(attrs), line(), terminate(cat(semi(), line()), decls.pps),
    text("{"), line(), nestlines(2,body.pp), text("}")]);
  
  local parameters :: Decorated Parameters =
    case mty of
    | functionTypeExprWithArgs(result, args, variadic) ->
        args
    | _ -> decorate nilParameters() with { env = top.env; }
    end;
  
  top.errors := bty.errors ++ mty.errors ++ body.errors;
  top.defs = bty.defs ++ [valueDef(name.name, functionValueItem(top))];
  top.typerep = mty.typerep;
  top.sourceLocation = name.location;
  
  mty.baseType = bty.typerep;
  
  -- TODO: add __func__ to environment here!
  body.env = addEnv(top.defs ++ parameters.defs ++ decls.defs ++ body.functiondefs, openScope(addEnv(bty.defs, top.env)));
  decls.isTopLevel = false;
  
  top.errors <- name.valueRedeclarationCheck(top.typerep); -- TODO: so long as the original wasn't also a definition
  
  top.errors <-
    if name.name == "main" && 
      !compatibleTypes(bty.typerep, builtinType([], signedType(intType())), true)
    then [wrn(name.location, "Main function should return 'int' not " ++ showType(bty.typerep))]
    else []; -- TODO: check the rest of the signature.
}

abstract production badFunctionDecl
top::FunctionDecl ::= msg::[Message]
{
  top.pp = concat([text("/*"),
    ppImplode(line(), map(text, map((.output), msg))),
    text("*/")]);
  top.errors := msg;
  top.defs = [];
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

nonterminal Parameters with typereps, pps, errors, defs, env;

abstract production consParameters
top::Parameters ::= h::ParameterDecl  t::Parameters
{
  top.pps = h.pp :: t.pps;
  top.typereps = h.typerep :: t.typereps;
  top.errors := h.errors ++ t.errors;
  top.defs = h.defs ++ t.defs;
  
  t.env = addEnv(h.defs, top.env);
}

abstract production nilParameters
top::Parameters ::=
{
  top.pps = [];
  top.typereps = [];
  top.errors := [];
  top.defs = [];
}

-- TODO: move these, later
synthesized attribute paramname :: Maybe<Name>;

nonterminal ParameterDecl with paramname, typerep, pp, errors, defs, env, sourceLocation;

abstract production parameterDecl
top::ParameterDecl ::= storage::[StorageClass]  bty::BaseTypeExpr  mty::TypeModifierExpr  name::MaybeName  attrs::[Attribute]
{
  top.pp = concat([terminate(space(), map((.pp), storage)),
    bty.pp, space(), mty.lpp, space(), name.pp, mty.rpp, ppAttributesRHS(attrs)]);
  top.paramname = name.maybename;
  top.typerep = mty.typerep;
  top.sourceLocation = error("fixme location"); -- TODO oh whatever name.location;
  top.errors := bty.errors ++ mty.errors;
  top.defs = bty.defs ++
    case name.maybename of
    | just(n) -> [valueDef(n.name, parameterValueItem(top))]
    | _ -> []
    end;

  mty.baseType = bty.typerep;
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;
}


synthesized attribute refId :: String; -- TODO move this later?

nonterminal StructDecl with location, pp, maybename, errors, defs, env, tagEnv, refId;

abstract production structDecl
top::StructDecl ::= attrs::[Attribute]  name::MaybeName  dcls::StructItemList
{
  top.maybename = name.maybename;
  top.pp = concat([text("struct "), ppAttributes(attrs), name.pp,
    -- DEBUGGING
    --text("/*" ++ top.refId ++ "*/"),
    -- END DEBUGGING
    text(" {"), nestlines(2, terminate(cat(semi(),line()), dcls.pps)),
    text("}")]);
  top.errors := dcls.errors;

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

  top.refId = name.tagRefId;
  top.tagEnv = addEnv(dcls.localdefs, emptyEnv());
  
  -- If there is no forward declaration, and we have a name, then add a tag dcl for the refid.
  local preDefs :: [Def] = 
    if name.tagHasForwardDcl || !name.hasName then []
    else [tagDef(name.maybename.fromJust.name, refIdTagItem(structSEU(), top.refId))];
  -- Always add the refid TODO: deal with C11-allowed redeclarations?
  local postDefs :: [Def] =
    [refIdDef(top.refId, structRefIdItem(top))];

  top.defs = preDefs ++ dcls.defs ++ postDefs;
  
  dcls.env = openScope(addEnv(preDefs, top.env));
  
  -- Redeclaration error if there IS a forward declaration AND an existing refid declaration.
  top.errors <-
    if !name.tagHasForwardDcl || null(lookupRefId(top.refId, top.env)) then []
    else [err(top.location, "Redeclaration of struct " ++ name.maybename.fromJust.name)];
}

nonterminal UnionDecl with location, pp, maybename, errors, defs, env, tagEnv, refId;

abstract production unionDecl
top::UnionDecl ::= attrs::[Attribute]  name::MaybeName  dcls::StructItemList
{
  top.maybename = name.maybename;
  top.pp = concat([text("union "), ppAttributes(attrs), name.pp, 
    -- DEBUGGING
    --text("/*" ++ top.refId ++ "*/"),
    -- END DEBUGGING
    text(" {"), nestlines(2, terminate(cat(semi(),line()), dcls.pps)),
    text("}")]);
  top.errors := dcls.errors;

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
  
  dcls.env = openScope(addEnv(preDefs, top.env));
  
  -- Redeclaration error if there IS a forward declaration AND an existing refid declaration.
  top.errors <-
    if !name.tagHasForwardDcl || null(lookupRefId(top.refId, top.env)) then []
    else [err(top.location, "Redeclaration of union " ++ name.maybename.fromJust.name)];
}

nonterminal EnumDecl with location, pp, maybename, errors, defs, env;

abstract production enumDecl
top::EnumDecl ::= name::MaybeName  dcls::EnumItemList
{
  top.maybename = name.maybename;
  top.pp = concat([text("enum"), space(), name.pp, space(), text("{"),
    nestlines(2, ppImplode(cat(comma(),line()), dcls.pps)),
    text("}")]);
  top.errors := dcls.errors;

  local thisdcl :: [Def] =
    case name.maybename of
    | just(n) -> [tagDef(n.name, enumTagItem(top))]
    | _ -> []
    end;
  top.defs = thisdcl ++ dcls.defs;
  
  dcls.env = addEnv(thisdcl, top.env);
  dcls.containingEnum = tagType([], enumTagType(top));

  top.errors <-
    if null(name.tagLocalLookup) then []
    else [err(top.location, "Redeclaration of enum " ++ name.maybename.fromJust.name)];
    -- We can rely on the name being present if it's a redeclaration
}


nonterminal StructItemList with pps, errors, defs, env, localdefs;

abstract production nilStructItem
top::StructItemList ::=
{
  top.pps = [];
  top.errors := [];
  top.defs = [];
  top.localdefs = [];
}

abstract production consStructItem
top::StructItemList ::= h::StructItem  t::StructItemList
{
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.defs = h.defs ++ t.defs;
  top.localdefs = h.localdefs ++ t.localdefs;
  
  t.env = addEnv(h.defs ++ h.localdefs, h.env);
}

nonterminal EnumItemList with pps, errors, defs, env, containingEnum;

autocopy attribute containingEnum :: Type;

abstract production nilEnumItem
top::EnumItemList ::=
{
  top.pps = [];
  top.errors := [];
  top.defs = [];
}

abstract production consEnumItem
top::EnumItemList ::= h::EnumItem  t::EnumItemList
{
  top.pps = h.pp :: t.pps;
  top.errors := h.errors ++ t.errors;
  top.defs = h.defs ++ t.defs;
  
  t.env = addEnv(h.defs, h.env);
}

nonterminal StructItem with pp, errors, defs, env, localdefs;

abstract production structItem
top::StructItem ::= attrs::[Attribute]  ty::BaseTypeExpr  dcls::StructDeclarators
{
  top.pp = concat([ppAttributes(attrs), ty.pp, space(), ppImplode(text(", "), dcls.pps)]);
  top.errors := ty.errors ++ dcls.errors;
  top.defs = ty.defs;
  top.localdefs = dcls.localdefs;
  
  dcls.baseType = ty.typerep;
  dcls.givenAttributes = attrs;
}
abstract production warnStructItem
top::StructItem ::= msg::[Message]
{
  top.pp = notext();
  top.errors := msg;
  top.defs = [];
  top.localdefs = [];
}


nonterminal StructDeclarators with pps, errors, localdefs, env, baseType, givenAttributes;

abstract production consStructDeclarator
top::StructDeclarators ::= h::StructDeclarator  t::StructDeclarators
{
  top.pps = h.pps ++ t.pps;
  top.errors := h.errors ++ t.errors;
  top.localdefs = h.localdefs ++ t.localdefs;
  
  t.env = addEnv(h.localdefs, h.env);
}
abstract production nilStructDeclarator
top::StructDeclarators ::=
{
  top.pps = [];
  top.errors := [];
  top.localdefs = [];
}

nonterminal StructDeclarator with pps, errors, localdefs, env, typerep, sourceLocation, baseType, givenAttributes;

abstract production structField
top::StructDeclarator ::= name::Name  ty::TypeModifierExpr  attrs::[Attribute]
{
  top.pps = [concat([ty.lpp, name.pp, ty.rpp, ppAttributesRHS(attrs)])];
  top.errors := ty.errors;
  top.localdefs = [valueDef(name.name, fieldValueItem(top))];
  top.typerep = ty.typerep;
  top.sourceLocation = name.location;
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;
  
  local allAttrs :: [Attribute] = top.givenAttributes ++ attrs;
}
abstract production structBitfield
top::StructDeclarator ::= name::MaybeName  ty::TypeModifierExpr  e::Expr  attrs::[Attribute]
{
  top.pps = [concat([ty.lpp, name.pp, ty.rpp, text(" : "), e.pp, ppAttributesRHS(attrs)])];
  top.errors := ty.errors ++ e.errors;

  local thisdcl :: [Def] =
    case name.maybename of
    | just(n) -> [valueDef(n.name, fieldValueItem(top))]
    | _ -> []
    end;
  top.localdefs = thisdcl;
  top.typerep = ty.typerep;
  top.sourceLocation = error("fixme location 2"); -- TODO oh whatever name.location;
  
  top.errors <- name.valueRedeclarationCheckNoCompatible;

  local allAttrs :: [Attribute] = top.givenAttributes ++ attrs;
}
-- Similar to external declarations, this pretends not to exist if it's only a warning
abstract production warnStructField
top::StructDeclarator ::= msg::[Message]
{
  top.pps = [];
  top.errors := msg;
  top.localdefs = [];
  top.typerep = errorType();
  top.sourceLocation = loc("nowhere", -1, -1, -1, -1, -1, -1); -- TODO fix this? add locaiton maybe?
}

nonterminal EnumItem with pp, errors, defs, env, containingEnum, typerep, sourceLocation;

abstract production enumItem
top::EnumItem ::= name::Name  e::MaybeExpr
{
  top.pp = concat([name.pp] ++ if e.isJust then [text(" = "), e.pp] else []);
  top.errors := e.errors;
  top.defs = [valueDef(name.name, enumValueItem(top))];
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

