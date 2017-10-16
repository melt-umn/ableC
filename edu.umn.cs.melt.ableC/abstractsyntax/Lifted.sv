grammar edu:umn:cs:melt:ableC:abstractsyntax;

{--
 - Extensions that want to specify declartions to lift to a global scope
 - do so by forwarding to the host production `injectGlobalDecls` (or one
 - of the corresponding ones for Stmt, Type or BaseTypeExpr.)  
 - 
 - After extracting the `host` tree, there are no extension constructs, but
 - the AST contains constructs that cannot be directly translated into C, for
 - example declarations need to be lifted to the proper place. 
 - 
 - A pair of synthesized attributes can be used for this.
 - * `globalDecls`: the list of declarations to lift up
 - * `lifted`: the lifted tree.
 - An invariant here is that all Decl nodes in the `host` tree appear in
 - either `globalDecls` or in `lifted`.  Also, the 'injection' productions
 - defined here should not occur in the lifted tree.  
 -
 - One issue with this is how to generate the correct environment for the
 - 'lifted' tree passed to an injection production.  The behaviour we *want* is
 - to lift the decls to the global level, then add them to the env for the rest
 - of the tree, including the decl which emitted the globalDecls in the first
 - place.  This unfortunately doesn't work, because of a cyclical dependancy in
 - that the env is needed in the first place to figure out the names of the
 - items being injected, which are then used to generate the env.  
 -
 - Instead, we decorate the new decls at the level of the injection production
 - with an environment only containing the outermost scope in the current env,
 - and pass these new decls up the tree in the decorated form.  The defs from
 - these decls then get passed back up the tree wrapped in 'globalDefsDef',
 - which inserts them in the outermost scope of the environment.  To ensure
 - that these defs are in scope for the rest of the tree, we must re-add the
 - defs from the globalDecls being passed upward wherever a new scope is opened.
 - 
 - Some extensions may want to use the same global decl with the same name in
 - multiple places.  To avoid inserting the decl more than once, the new decl
 - must check that it has not already been defined before forwarding to
 - something that defines the 'missing' item.  To assist with this, an
 - extension may use the production 'maybeDecl', which takes a function to look
 - at the env and return true or false, determining whether the given decl is
 - to be kept.  
 -
 - If there are ever errors reported about something being redefined in the
 - lifted tree, then there is a bug in the host where something that 
 - 
 - TODO:
 - It would be nice to move all of this to its own grammar, but aspecting
 - everything for lifted and globalDecls would be kind of a pain
 -}

synthesized attribute lifted<a>::a;
synthesized attribute globalDecls::[Decorated Decl] with ++;
synthesized attribute unfoldedGlobalDecls::[Decorated Decl];

flowtype lifted {decorate} on
  Root,
  Attributes, Attribute, Attribs, Attrib, AttribName,
  GlobalDecls, Decls, Decl, Declarators, Declarator, FunctionDecl, Parameters, ParameterDecl, StructDecl, UnionDecl, EnumDecl, StructItemList, EnumItemList, StructItem, StructDeclarators, StructDeclarator, EnumItem,
  MemberDesignator,
  AsmStatement, AsmArgument, AsmClobbers, AsmOperands, AsmOperand,
  SpecialSpecifier, SpecialSpecifiers,
  Expr, GenericAssocs, GenericAssoc,
  TypeName, BaseTypeExpr, TypeModifierExpr, TypeNames,
  NumericConstant,
  MaybeExpr, Exprs, ExprOrTypeName,
  Stmt,
  UnaryOp, UnaryTypeOp,
  Name, MaybeName,
  BinOp, AssignOp, BoolOp, BitOp, CompareOp, NumOp,
  MaybeInitializer, Initializer, InitList, Init, Designator;
flowtype globalDecls {decorate} on
  Decls, Decl, Declarators, Declarator, FunctionDecl, Parameters, ParameterDecl, StructDecl, UnionDecl, EnumDecl, StructItemList, EnumItemList, StructItem, StructDeclarators, StructDeclarator, EnumItem,
  MemberDesignator,
  SpecialSpecifiers,
  Expr, GenericAssocs, GenericAssoc,
  TypeName, BaseTypeExpr, TypeModifierExpr, TypeNames,
  MaybeExpr, Exprs, ExprOrTypeName,
  Stmt,
  MaybeInitializer, Initializer, InitList, Init, Designator;
flowtype unfoldedGlobalDecls {decorate} on
  Decls, Decl;

