grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

{-- In order to accomodate C's odd-ball syntax when it comes to type declarations
 - (with specifiers separate from declarators) we have a divided Type Expressions
 - abstract syntax.
 -
 - BaseTypeExpr represents specifiers: structs, typedefs, ints, etc
 - TypeModifierExpr represents declarators: pointers, arrays, functions, etc.
 -
 - We can't merge these into one TypeExpr because a BaseTypeExpr might be
 - used as part of several declarators.
 - For example, "struct { ... } bar, *baz;"
 - Here, we declare two variables: bar and baz. one of the anonymous struct
 - type, the other a pointer to it. However, we must NOT duplicate the
 - declaration of the struct!
 - That is, we cannot represent it as "struct { ... } bar; struct { ... } *baz;"
 - because that redeclares the type.
 -
 - Our solution is to have a BaseTypeExpr for a declarations, followed by
 - several identifiers each with their own TypeModifierExpr.
 - This way, the struct appears once in the abstract syntax.
 -
 - TypeModifierExpr are terminated by "baseTypeExpr" which provides a typerep
 - value that is equal to the Type obtained from the corresponding BaseTypeExpr.
 -
 - Invariant: a BaseTypeExpr and its corresponding TypeModifierExpr should have
 - the same environment
 -
 - Since BaseTypeExpr may contain new declarations, another invariant is that
 - extension productions containing a BaseTypeExpr must forward to a tree
 - containing that BaseTypeExpr exactly once.  However, they are free to use
 - directTypeExpr(ty.typerep) as many times as needed.
 -}

inherited attribute baseType :: Type;

{-- The TypeExpr is upside down, so build pp from outside-in -}
synthesized attribute lpp :: Document;
synthesized attribute rpp :: Document;

{-- Resolve the TypeExpr into a Type -}
synthesized attribute typerep :: Type;
synthesized attribute typereps :: [Type];

{-- Used to transform away typeModifierTypeExpr -}
synthesized attribute typeModifier :: TypeModifierExpr;
inherited attribute typeModifierIn :: TypeModifierExpr;

{-- Used to set the refId for a declaration via __attribute__ -}
inherited attribute givenRefId :: Maybe<String>;

{-- The declarations contained in this TypeExpr, corresponding to defs -}
monoid attribute decls :: [Decl];
flowtype decls {decorate} on
  Parameters, ParameterDecl,
  TypeName, BaseTypeExpr, TypeModifierExpr, TypeNames;

{-- Util attributes -}
synthesized attribute bty :: BaseTypeExpr;
synthesized attribute mty :: TypeModifierExpr;

tracked nonterminal TypeName with env, typerep, bty, mty, pp, host, errors, globalDecls,
  functionDecls, decls, defs, freeVariables, controlStmtContext;
flowtype TypeName = decorate {env, controlStmtContext},
  bty {}, mty {};

propagate givenRefId on BaseTypeExpr;

abstract production typeName
top::TypeName ::= bty::BaseTypeExpr  mty::TypeModifierExpr
{
  propagate errors, functionDecls, decls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([bty.pp, mty.lpp, mty.rpp]);
  top.host =
    case mty.modifiedBaseTypeExpr of
    | just(mbty) -> typeName(mbty, mty.host)
    | nothing() -> typeName(bty.host, mty.host)
    end;
  top.typerep = mty.typerep;
  top.bty = bty;
  top.mty = mty;
  bty.givenRefId = nothing();
  bty.env = top.env;
  mty.env = addEnv(bty.defs, bty.env);
  mty.baseType = bty.typerep;
  mty.typeModifierIn = bty.typeModifier;
  top.globalDecls :=
    case mty.modifiedBaseTypeExpr of
    | just(_) ->
      -- TODO: Should be lifting decls to the closest scope, not global!
      map(
        \ d::Decl ->
          decorate d with {env = top.env; isTopLevel = true;
                          controlStmtContext = top.controlStmtContext;},
        -- decorate needed here because of flowtype for decls
        decorate bty.host with {
          env = bty.env; givenRefId = bty.givenRefId;
          controlStmtContext = bty.controlStmtContext;
        }.decls)
    | nothing() -> []
    end ++ bty.globalDecls ++ mty.globalDecls;
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
abstract production decTypeName
top::TypeName ::= ty::Decorated TypeName
{
  top.pp = ty.pp;
  top.host = ty.host;
  top.typerep = ty.typerep;
  top.bty = ty.bty;
  top.mty = ty.mty;
  top.errors := ty.errors;
  top.globalDecls := ty.globalDecls;
  top.functionDecls := ty.functionDecls;
  top.decls := ty.decls;
  top.defs := ty.defs;
  top.freeVariables := ty.freeVariables;
  forwards to new(ty);
}


{--
 - Corresponds to types obtainable from a TypeSpecifiers.
 -}
nonterminal BaseTypeExpr with env, typerep, pp, host, errors, globalDecls,
  functionDecls, typeModifier, decls, defs, givenRefId, freeVariables,
  controlStmtContext;
flowtype BaseTypeExpr = decorate {env, givenRefId, controlStmtContext},
  typeModifier {decorate};

abstract production errorTypeExpr
top::BaseTypeExpr ::= msg::[Message]
{
  propagate host, errors, globalDecls, functionDecls, decls, defs, freeVariables, controlStmtContext;
  top.pp = pp"/*err*/";
  top.typerep = errorType();
  top.errors <- msg;
  top.typeModifier = baseTypeExpr();
}

{-- Raise messages about something syntactic but return ty as the reported type. -}
abstract production warnTypeExpr
top::BaseTypeExpr ::= msg::[Message]  ty::BaseTypeExpr
{
  propagate env, host, errors, globalDecls, functionDecls, decls, defs, freeVariables, controlStmtContext;
  top.pp = ty.pp;
  top.typerep = ty.typerep;
  top.errors <- msg;
  top.typeModifier = ty.typeModifier;
}

{-- Constructs a TypeExpr by translating a Type back to a TypeExpr
 - This is NOT a host production, since Type should not occur in the host tree.
 - Instead we transform the parameter type into a TypeExpr and return that.
 - Note that directTypeExpr(te.typerep) is not necessarily equivalent to te, since TypeExprs can
 - contain extra information relevant only to the declaration, not to the meaning of the type.
 - However, directTypeExpr(ty).typerep should be the same as ty, and
 - directTypeExpr(te.typerep).host.typerep should be the same as te.typerep.host
 -}
function directTypeExpr
BaseTypeExpr ::= result::Type
{
  return typeModifierTypeExpr(result.baseTypeExpr, result.typeModifierExpr);
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
abstract production decTypeExpr
top::BaseTypeExpr ::= ty::Decorated BaseTypeExpr
{
  top.pp = ty.pp;
  top.host = ty.host;
  top.typerep = ty.typerep;
  top.errors := ty.errors;
  top.globalDecls := ty.globalDecls;
  top.functionDecls := ty.functionDecls;
  top.typeModifier = ty.typeModifier;
  top.decls := ty.decls;
  top.defs := ty.defs;
  top.freeVariables := ty.freeVariables;
  forwards to new(ty); -- for easier pattern matching
}

{-- A TypeExpr that contains extra extension defs to be placed in the environment
 - This production should not occur in the host AST
 -}
abstract production defsTypeExpr
top::BaseTypeExpr ::= d::[Def]  bty::BaseTypeExpr
{
  propagate errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([pp"/* defsTypeExpr", showEnv(addEnv(d, emptyEnv())), pp"*/", bty.pp]);
  -- This production goes away when the transformation to host occurs, this is a special case where
  -- host is not simply propagated, because Def is a closed 'collection' nonterminal with special
  -- semantics
  top.host = bty.host;
  top.typerep = bty.typerep;
  top.typeModifier = bty.typeModifier;
  top.decls := defsDecl(d) :: bty.decls;
  top.defs <- d;

  bty.env = addEnv(d, top.env);
}

{-- A TypeExpr that contains a type modifier which must be lifted out
 - This production should not occur in the lifted AST
 -}
abstract production typeModifierTypeExpr
top::BaseTypeExpr ::= bty::BaseTypeExpr  mty::TypeModifierExpr
{
  propagate errors, globalDecls, functionDecls, decls, defs, freeVariables, controlStmtContext;
  top.pp = parens(ppConcat([bty.pp, mty.lpp, mty.rpp]));
  top.host = fromMaybe(bty.host, mty.modifiedBaseTypeExpr);
  top.typerep = mty.typerep;
  top.typeModifier = mty.host;
  bty.env = top.env;
  mty.env = addEnv(bty.defs, bty.env);
  mty.baseType = bty.typerep;
  mty.typeModifierIn = bty.typeModifier;
}

{-- Builtin C types: void, unsigned int, signed char, float, bool, etc.
 - also includes complex numbers e.g. 'float _Complex' -}
abstract production builtinTypeExpr
top::BaseTypeExpr ::= q::Qualifiers  result::BuiltinType
{
  propagate host, errors, globalDecls, functionDecls, decls, defs, freeVariables, env, controlStmtContext;
  top.pp = ppConcat([terminate(space(), q.pps), result.pp]);
  top.typerep = builtinType(q, result);
  top.typeModifier = baseTypeExpr();
  q.typeToQualify = top.typerep;
}

{-- A reference to a tag type. e.g. 'struct foo' not 'struct foo {...}' -}
{- TODO: A forward declaration of a new struct, e.g. 'struct foo;' should be semantically
 - different from a type expression referencing a struct, e.g. 'struct foo*;', since
 - the former looks only in the local scope for an existing definition before creating
 - a new refId while the latter only creates a new refId if there is no definition
 - found in any scope.  Currently we always only check the local scope for an existing
 - definition.
 -}
abstract production tagReferenceTypeExpr
top::BaseTypeExpr ::= q::Qualifiers  kwd::StructOrEnumOrUnion  n::Name
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([terminate(space(), q.pps), kwd.pp, space(), n.pp
    -- DEBUGGING
    --, text("/*" ++ refId ++ "*/")
    -- END DEBUGGING
    ]);

  -- This code is nassssty. TODO. Possibly split enum references to a separate production? This might simplify the logic considerably.

  local tags :: [TagItem] = lookupTag(n.name, top.env);

  top.typerep =
    case kwd, tags of
    -- It's an enum and we see the declaration.
    | enumSEU(), enumTagItem(d) :: _ -> extType(q, enumExtType(d))
    -- We don't see the declaration, so we're adding it.
    | _, [] -> extType(q, refIdExtType(kwd, just(n.name), fromMaybe(n.tagRefId, top.givenRefId)))
    -- It's a struct/union and the tag type agrees.
    | structSEU(), refIdTagItem(structSEU(), rid) :: _ -> extType(q, refIdExtType(kwd, just(n.name), rid))
    | unionSEU(), refIdTagItem(unionSEU(), rid) :: _ -> extType(q, refIdExtType(kwd, just(n.name), rid))
    -- Otherwise, error!
    | _, _ -> errorType()
    end;

  top.errors <-
    case kwd, tags of
    -- It's an enum and we see the declaration.
    | enumSEU(), enumTagItem(d) :: _ -> []
    | enumSEU(), [] -> [errFromOrigin(n, "Undeclared enum " ++ n.name)]
    | enumSEU(), _ :: _ -> [errFromOrigin(n, "Tag " ++ n.name ++ " is not an enum")]
    -- We don't see the declaration, so we're adding it.
    | _, [] -> []
    -- It's a struct/union and the tag type agrees.
    | structSEU(), refIdTagItem(structSEU(), rid) :: _ -> []
    | structSEU(), _ :: _ -> [errFromOrigin(n, "Tag " ++ n.name ++ " is not a struct")]
    | unionSEU(), refIdTagItem(unionSEU(), rid) :: _ -> []
    | unionSEU(), _ :: _ -> [errFromOrigin(n, "Tag " ++ n.name ++ " is not a union")]
    end;

  top.typeModifier = baseTypeExpr();

  top.decls :=
    if null(lookupTag(n.name, top.env))
    then
      -- TODO: Ugly way of forward-declaring a tag without overriding an existing definition
      [typedefDecls(
         nilAttribute(),
         top,
         consDeclarator(
           declarator(
             name("_unused_" ++ toString(genInt())),
             baseTypeExpr(),
             nilAttribute(),
             nothingInitializer()),
           nilDeclarator()))]
    else [];

  top.defs <-
    case kwd, tags of
    -- It's an enum and we see the declaration.
    | enumSEU(), enumTagItem(d) :: _ -> []
    -- We don't see the declaration, so we're adding it.
    | _, [] -> [tagDef(n.name, refIdTagItem(kwd, fromMaybe(n.tagRefId, top.givenRefId)))]
    -- It's a struct/union and the tag type agrees.
    | structSEU(), refIdTagItem(structSEU(), rid) :: _ -> []
    | unionSEU(), refIdTagItem(unionSEU(), rid) :: _ -> []
    -- Otherwise, error!
    | _, _ -> []
    end;

  q.typeToQualify = top.typerep;
}

{-- References to anon tag types by refId.  Can't appear in code, but can be generated
 - by turning an anon tag type back into a type expression. -}
abstract production anonTagReferenceTypeExpr
top::BaseTypeExpr ::= q::Qualifiers  kwd::StructOrEnumOrUnion  refId::String
{
  propagate host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([terminate(space(), q.pps), kwd.pp, space(), text("anon_" ++ refId)]);
  top.typerep = extType(q, refIdExtType(kwd, nothing(), refId));
  top.typeModifier = baseTypeExpr();
  top.decls := [];

  q.typeToQualify = top.typerep;
}

{-- An actual declaration of, not reference to, a struct. -}
abstract production structTypeExpr
top::BaseTypeExpr ::= q::Qualifiers  def::StructDecl
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([terminate(space(), q.pps), def.pp ]);
  top.typerep = extType(q, refIdExtType(structSEU(), map((.name), def.maybename), def.refId));
  top.typeModifier = baseTypeExpr();
  -- Avoid re-decorating and re-generating refIds
  top.decls := [typeExprDecl(nilAttribute(), decTypeExpr(top))];
  q.typeToQualify = top.typerep;
  def.isLast = true;
  def.inAnonStructItem = false;
}

{-- An actual declaration of, not reference to, a union. -}
abstract production unionTypeExpr
top::BaseTypeExpr ::= q::Qualifiers  def::UnionDecl
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([terminate(space(), q.pps), def.pp ]);
  top.typerep = extType(q, refIdExtType(unionSEU(), map((.name), def.maybename), def.refId));
  top.typeModifier = baseTypeExpr();
  -- Avoid re-decorating and re-generating refIds
  top.decls := [typeExprDecl(nilAttribute(), decTypeExpr(top))];
  q.typeToQualify = top.typerep;
  def.isLast = true;
  def.inAnonStructItem = false;
}

{-- An actual declaration of, not reference to, an enum. -}
abstract production enumTypeExpr
top::BaseTypeExpr ::= q::Qualifiers  def::EnumDecl
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([terminate(space(), q.pps), def.pp ]);
  top.typerep = extType(q, enumExtType(def));
  top.typeModifier = baseTypeExpr();
  top.decls := [typeExprDecl(nilAttribute(), top)];
  q.typeToQualify = top.typerep;
}

{-- Extension "new" types -}
abstract production extTypeExpr
top::BaseTypeExpr ::= q::Qualifiers  sub::ExtType
{
  propagate errors, globalDecls, functionDecls, defs, decls, freeVariables, controlStmtContext;
  top.pp = ppConcat([terminate(space(), q.pps), sub.lpp, sub.rpp]);
  top.typerep = extType(q, sub);
  top.host = sub.host.baseTypeExpr;
  top.typeModifier = sub.host.typeModifierExpr;
  q.typeToQualify = top.typerep;
  sub.givenQualifiers = q;
}

{-- A name, that needs to be looked up. -}
abstract production typedefTypeExpr
top::BaseTypeExpr ::= q::Qualifiers  name::Name
{
  propagate env, host, errors, globalDecls, functionDecls, defs, decls, freeVariables, controlStmtContext;
  top.pp = ppConcat([terminate(space(), q.pps), name.pp ]);

  top.typerep =
    noncanonicalType(
      typedefType(
        q, name.name,
        if !null(name.valueLookupCheck)
        then errorType()
        else addQualifiers(q.qualifiers, name.valueItem.typerep)));
  top.typeModifier = baseTypeExpr();

  top.errors <- name.valueLookupCheck;
  top.errors <-
    if name.valueItem.isItemType then []
    else [errFromOrigin(name, "'" ++ name.name ++ "' does not refer to a type.")];
  q.typeToQualify = top.typerep;
}
{--
 - GCC __attribute__ types
 - Note that there is no corresponding type expression in C for an attributed type, as attributes
 - can only be attatched on declarations.  Thus this production is never actually introduced by
 - concrete syntax, but it can be created when translating a transformed attributed type back to a
 - BaseTypeExpr.  To enable this, we must lift a typedef with the appropriate attributes and refer
 - to that.
 -}
abstract production attributedTypeExpr
top::BaseTypeExpr ::= attrs::Attributes  bt::BaseTypeExpr
{
  propagate controlStmtContext;

  top.pp = cat(ppAttributes(attrs), bt.pp);

  local liftedName::Name =
    name(s"_attributedType_${toString(genInt())}");
  forwards to
    -- TODO: We can currently only lift to the global level, but this should be lifted to the closest scope
    injectGlobalDeclsTypeExpr(
      consDecl(
        typedefDecls(
          attrs, bt,
          consDeclarator(
            declarator(liftedName, baseTypeExpr(), nilAttribute(), nothingInitializer()),
            nilDeclarator())),
        nilDecl()),
      typedefTypeExpr(nilQualifier(), liftedName));
}
{-- C11 atomic type -}
abstract production atomicTypeExpr
top::BaseTypeExpr ::= q::Qualifiers  wrapped::TypeName
{
  propagate env, host, errors, globalDecls, functionDecls, defs, decls, freeVariables, controlStmtContext;
  top.typerep = atomicType(q, wrapped.typerep);
  top.pp = ppConcat([ terminate(space(), q.pps),
                     text("_Atomic"), parens(wrapped.pp)]);
  top.typeModifier = baseTypeExpr();
  q.typeToQualify = top.typerep;
}
{-- GCC builtin type -}
abstract production vaListTypeExpr
top::BaseTypeExpr ::=
{
  propagate host, errors, globalDecls, functionDecls, defs, decls, freeVariables, controlStmtContext;
  top.typerep = pointerType(nilQualifier(),
    builtinType(nilQualifier(), voidType())); -- TODO this should be a special type, not void
  top.pp = text("__builtin_va_list");
  top.typeModifier = baseTypeExpr();
}
{-- GCC typeof type -}
abstract production typeofTypeExpr
top::BaseTypeExpr ::= q::Qualifiers  e::ExprOrTypeName
{
  propagate env, host, errors, globalDecls, functionDecls, defs, decls, freeVariables, controlStmtContext;
  top.typerep = noncanonicalType(typeofType(q, e.typerep));
  top.pp = ppConcat([text("__typeof__"), parens(e.pp)]);
  top.typeModifier = baseTypeExpr();
  q.typeToQualify = top.typerep;
}


{--
 - Mirrors Type somewhat, but these depend upon the environment.
 - Typically, these are just anchored somewhere to obtain the env,
 - and then turn into an environment-independent Type.
 -}
tracked nonterminal TypeModifierExpr with env, typerep, lpp, rpp, host, modifiedBaseTypeExpr,
  isFunctionArrayTypeExpr, baseType, typeModifierIn, errors, globalDecls,
  functionDecls, decls, defs, freeVariables, controlStmtContext;
flowtype TypeModifierExpr = decorate {env, baseType, typeModifierIn, controlStmtContext},
  modifiedBaseTypeExpr {decorate}, isFunctionArrayTypeExpr {};

propagate typeModifierIn, baseType, controlStmtContext on TypeModifierExpr;

synthesized attribute modifiedBaseTypeExpr::Maybe<BaseTypeExpr>;
synthesized attribute isFunctionArrayTypeExpr::Boolean;

aspect default production
top::TypeModifierExpr ::=
{
  top.isFunctionArrayTypeExpr = false;
}

{--
 - A TypeModifierExpr that corresponds to whatever the base TypeExpr was.
 - This gets transformed via host to include type modifiers that were included in the base
 - TypeExpr via typeModifierTypeExpr.
 -}
abstract production baseTypeExpr
top::TypeModifierExpr ::=
{
  propagate errors, globalDecls, functionDecls, defs, decls, freeVariables;
  top.lpp = notext();
  top.rpp = notext();
  top.host = top.typeModifierIn;
  top.modifiedBaseTypeExpr = nothing();
  top.typerep = top.baseType;
}

{--
 - A TypeModifierExpr specifying a different BaseTypeExpr to use instead of the corresponding one
 - referenced by baseTypeExpr(). This is transformed by host into baseTypeExpr(), while the
 - corresponding BaseTypeExpr is replaced by this one, possibly splitting variableDecls and
 - typedefDecls into mutiple declarations when needed.
 - This is used when extensions may wish to introduce new type modifiers, transforming a type into
 - some type not representable by host type modifiers.
 -}
abstract production modifiedTypeExpr
top::TypeModifierExpr ::= bty::BaseTypeExpr
{
  propagate env, errors, globalDecls, functionDecls, defs, decls, freeVariables;
  top.lpp = parens(bty.pp);
  top.rpp = notext();
  top.host = bty.typeModifier; -- top.typeModifierIn discarded
  top.modifiedBaseTypeExpr = just(bty.host);
  top.typerep = bty.typerep;

  bty.givenRefId = nothing();
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
abstract production decTypeModifierExpr
top::TypeModifierExpr ::= ty::Decorated TypeModifierExpr
{
  top.lpp = ty.lpp;
  top.rpp = ty.rpp;
  top.host = ty.host;
  top.modifiedBaseTypeExpr = ty.modifiedBaseTypeExpr;
  top.typerep = ty.typerep;
  top.errors := ty.errors;
  top.globalDecls := ty.globalDecls;
  top.functionDecls := ty.functionDecls;
  top.decls := ty.decls;
  top.defs := ty.defs;
  top.freeVariables := ty.freeVariables;
  forwards to new(ty);
}

{-- Pointers -}
abstract production pointerTypeExpr
top::TypeModifierExpr ::= q::Qualifiers  target::TypeModifierExpr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, decls, freeVariables;
  top.lpp = ppConcat([ target.lpp, space(),
                     if target.isFunctionArrayTypeExpr then text("(*") else text("*"),
                     terminate(space(), q.pps) ]);
  top.rpp = cat(if target.isFunctionArrayTypeExpr then text(")") else notext(), target.rpp);
  top.modifiedBaseTypeExpr = target.modifiedBaseTypeExpr;
  top.typerep = pointerType(q, target.typerep);
  q.typeToQualify = top.typerep;
}

{-- Arrays (constant, variable, etc) -}
abstract production arrayTypeExprWithExpr
top::TypeModifierExpr ::= element::TypeModifierExpr  indexQualifiers::Qualifiers  sizeModifier::ArraySizeModifier  size::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, decls, freeVariables;
  top.lpp = element.lpp;

  top.rpp = cat(brackets(ppConcat([
    terminate(space(), indexQualifiers.pps ++ sizeModifier.pps),
    size.pp
    ])), element.rpp);

  top.modifiedBaseTypeExpr = element.modifiedBaseTypeExpr;

  top.isFunctionArrayTypeExpr = true;

  top.typerep =
    arrayType(
      element.typerep, indexQualifiers, sizeModifier,
      case size.integerConstantValue of
        just(v) -> constantArrayType(v)
      | nothing() -> variableArrayType(size)
      end);
  indexQualifiers.typeToQualify = top.typerep;
}
abstract production arrayTypeExprWithoutExpr
top::TypeModifierExpr ::= element::TypeModifierExpr  indexQualifiers::Qualifiers  sizeModifier::ArraySizeModifier
{
  propagate env, host, errors, globalDecls, functionDecls, defs, decls, freeVariables;
  top.lpp = element.lpp;

  top.rpp = cat(brackets(
    ppImplode(space(), indexQualifiers.pps ++ sizeModifier.pps)
    ), element.rpp);

  top.modifiedBaseTypeExpr = element.modifiedBaseTypeExpr;

  top.isFunctionArrayTypeExpr = true;

  top.typerep = arrayType(element.typerep, indexQualifiers, sizeModifier, incompleteArrayType());
  indexQualifiers.typeToQualify = top.typerep;
}

{-- Functions (with or without args) -}
abstract production functionTypeExprWithArgs
top::TypeModifierExpr ::= result::TypeModifierExpr  args::Parameters  variadic::Boolean  q::Qualifiers
{
  propagate host, errors, globalDecls, functionDecls, defs, decls, freeVariables;
  top.lpp = ppConcat([ result.lpp ]);

  top.rpp =
    cat(parens(
      if null(args.pps)
      then text("void")
      else ppImplode(text(", "),
            (if variadic then args.pps ++ [text("...")] else args.pps)
           )
     ), result.rpp);

  top.modifiedBaseTypeExpr = result.modifiedBaseTypeExpr;

  top.isFunctionArrayTypeExpr = true;

  top.typerep = functionType(result.typerep,
                             protoFunctionType(args.typereps, variadic), q);
  result.env = top.env;
  
  args.env = openScopeEnv(top.env);
  args.position = 0;

  q.typeToQualify = top.typerep;
}
abstract production functionTypeExprWithoutArgs
top::TypeModifierExpr ::= result::TypeModifierExpr  ids::[Name]  q::Qualifiers --fnquals::[SpecialSpecifier]
{
  propagate env, host, errors, globalDecls, functionDecls, defs, decls, freeVariables;
  top.lpp = result.lpp;
  top.rpp = cat( parens(ppImplode(text(", "), map((.pp), ids))), result.rpp );

  top.modifiedBaseTypeExpr = result.modifiedBaseTypeExpr;

  top.isFunctionArrayTypeExpr = true;

  top.typerep = functionType(result.typerep, noProtoFunctionType(), q);
  q.typeToQualify = top.typerep;
}
{-- Parens -}
abstract production parenTypeExpr
top::TypeModifierExpr ::= wrapped::TypeModifierExpr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, decls, freeVariables;
  --top.pp = parens( wrapped.pp );
  top.lpp = cat( wrapped.lpp, text("(") );
  top.rpp = cat( text(")"), wrapped.rpp );
  top.modifiedBaseTypeExpr = wrapped.modifiedBaseTypeExpr;

  top.typerep = noncanonicalType(parenType(wrapped.typerep));
}

inherited attribute appendedTypeNames :: TypeNames;
synthesized attribute appendedTypeNamesRes :: TypeNames;

tracked nonterminal TypeNames with pps, host, env, typereps, count, errors, globalDecls,
  functionDecls, decls, defs, freeVariables, appendedTypeNames,
  appendedTypeNamesRes, controlStmtContext;
flowtype TypeNames = decorate {env, controlStmtContext},
  count {}, appendedTypeNamesRes {appendedTypeNames};

propagate host, errors, globalDecls, functionDecls, decls, defs, freeVariables, appendedTypeNames, controlStmtContext on TypeNames;

abstract production consTypeName
top::TypeNames ::= h::TypeName t::TypeNames
{
  top.pps = h.pp :: t.pps;
  top.typereps = h.typerep :: t.typereps;
  top.count = t.count + 1;
  top.appendedTypeNamesRes = consTypeName(h, t.appendedTypeNamesRes);

  h.env = top.env;
  t.env = addEnv(h.defs, h.env);
}

abstract production nilTypeName
top::TypeNames ::=
{
  top.pps = [];
  top.typereps = [];
  top.count = 0;
  top.appendedTypeNamesRes = top.appendedTypeNames;
}

function appendTypeNames
TypeNames ::= e1::TypeNames e2::TypeNames
{
  e1.appendedTypeNames = e2;
  return e1.appendedTypeNamesRes;
}
