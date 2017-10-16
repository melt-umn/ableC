
-- StructDecl, UnionDecl, and EnumDecl are all rooted in the abstract syntax within a TypeExpr.

-- FunctionDecl is (for now) always rooted in an ExternalDeclaration
-- Declaration is rooted in External, but also in stmts. Either a variableDecl or a typedefDecl.
-- ParameterDecl should probably be something special, distinct from variableDecl.

nonterminal GlobalDecls with pps, host<GlobalDecls>, lifted<GlobalDecls>, errors, env, returnType, freeVariables;
flowtype GlobalDecls = decorate {env, returnType};

nonterminal Decls with pps, host<Decls>, lifted<Decls>, errors, globalDecls, unfoldedGlobalDecls, defs, env, isTopLevel, returnType, freeVariables;
flowtype Decls = decorate {env, isTopLevel, returnType};

autocopy attribute isTopLevel :: Boolean;

nonterminal Decl with pp, host<Decl>, lifted<Decl>, errors, globalDecls, unfoldedGlobalDecls, defs, env, isTopLevel, returnType, freeVariables;
flowtype Decl = decorate {env, isTopLevel, returnType};

{-- Pass down from top-level declaration the list of attribute to each name-declaration -}
autocopy attribute givenAttributes :: Attributes;

nonterminal Declarators with pps, host<Declarators>, lifted<Declarators>, errors, globalDecls, defs, env, baseType, typeModifiersIn, isTopLevel, isTypedef, givenAttributes, returnType, freeVariables;
flowtype Declarators = decorate {env, returnType, baseType, typeModifiersIn, givenAttributes, isTopLevel, isTypedef};

nonterminal Declarator with pps, host<Declarator>, lifted<Declarator>, errors, globalDecls, defs, env, baseType, typeModifiersIn, typerep, sourceLocation, isTopLevel, isTypedef, givenAttributes, returnType, freeVariables;
flowtype Declarator = decorate {env, returnType, baseType, typeModifiersIn, givenAttributes, isTopLevel, isTypedef};

autocopy attribute isTypedef :: Boolean;

nonterminal FunctionDecl with pp, host<FunctionDecl>, lifted<FunctionDecl>, errors, globalDecls, defs, env, typerep, sourceLocation, returnType, freeVariables;
flowtype FunctionDecl = decorate {env, returnType};

nonterminal Parameters with typereps, pps, host<Parameters>, lifted<Parameters>, errors, globalDecls, defs, env, returnType, freeVariables;
flowtype Parameters = decorate {env, returnType};

-- TODO: move these, later
synthesized attribute paramname :: Maybe<Name>;

nonterminal ParameterDecl with paramname, typerep, pp, host<ParameterDecl>, lifted<ParameterDecl>, errors, globalDecls, defs, env, sourceLocation, returnType, freeVariables;
flowtype ParameterDecl = decorate {env, returnType};

synthesized attribute refId :: String; -- TODO move this later?
-- Name of the extension that declared this struct/union
synthesized attribute moduleName :: Maybe<String>;

nonterminal StructDecl with location, pp, host<StructDecl>, lifted<StructDecl>, maybename, errors, globalDecls, defs, env, tagEnv, givenRefId, refId, moduleName, returnType, freeVariables;
flowtype StructDecl = decorate {env, givenRefId, returnType};

nonterminal UnionDecl with location, pp, host<UnionDecl>, lifted<UnionDecl>, maybename, errors, globalDecls, defs, env, tagEnv, givenRefId, refId, moduleName, returnType, freeVariables;
flowtype UnionDecl = decorate {env, givenRefId, returnType};

nonterminal EnumDecl with location, pp, host<EnumDecl>, lifted<EnumDecl>, maybename, errors, globalDecls, defs, env, givenRefId, returnType, freeVariables;
flowtype EnumDecl = decorate {env, givenRefId, returnType};

nonterminal StructItemList with pps, host<StructItemList>, lifted<StructItemList>, errors, globalDecls, defs, env, localdefs, returnType, freeVariables;
flowtype StructItemList = decorate {env, returnType};

nonterminal EnumItemList with pps, host<EnumItemList>, lifted<EnumItemList>, errors, globalDecls, defs, env, containingEnum, returnType, freeVariables;
flowtype EnumItemList = decorate {env, containingEnum, returnType};

autocopy attribute containingEnum :: Type;

nonterminal StructItem with pp, host<StructItem>, lifted<StructItem>, errors, globalDecls, defs, env, localdefs, returnType, freeVariables;
flowtype StructItem = decorate {env, returnType};

nonterminal StructDeclarators with pps, host<StructDeclarators>, lifted<StructDeclarators>, errors, globalDecls, localdefs, env, baseType, typeModifiersIn, givenAttributes, returnType, freeVariables;
flowtype StructDeclarators = decorate {env, returnType, baseType, typeModifiersIn, givenAttributes};

nonterminal StructDeclarator with pps, host<StructDeclarator>, lifted<StructDeclarator>, errors, globalDecls, localdefs, env, typerep, sourceLocation, baseType, typeModifiersIn, givenAttributes, returnType, freeVariables;
flowtype StructDeclarator = decorate {env, returnType, baseType, typeModifiersIn, givenAttributes};

nonterminal EnumItem with pp, host<EnumItem>, lifted<EnumItem>, errors, globalDecls, defs, env, containingEnum, typerep, sourceLocation, returnType, freeVariables;
flowtype EnumItem = decorate {env, containingEnum, returnType};

-- TODO: Also make a StorageClasses nonterminal
nonterminal StorageClass with pp;
flowtype StorageClass = decorate {};

