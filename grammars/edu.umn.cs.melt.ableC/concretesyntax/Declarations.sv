grammar edu:umn:cs:melt:ableC:concretesyntax;

{--
 - Contains all outermost identifiers on whatever syntax object it is on.
 - e.g. "int x(int y)" will be ["x"]. "y" isn't outermost.
 - e.g. "int x, y, z" will be ["x", "y", "z"].
 -}
synthesized attribute declaredIdents :: [ast:Name];
synthesized attribute declaredIdent :: ast:Name;
{--
 - Contains the parameter list directly relevant to this DirectDecl only.
 - e.g. "int x(int y)" will be ["y"].
 - e.g. "int x(int y)(int z)" will be ["y"]. N.B. this is the inner parameter list
 -
 - Used in two places: 1: typedef lexer hack. 2: old style K&R function decls.
 -}
synthesized attribute declaredParamIdents :: Maybe<[ast:Name]>;
{--
 - The type being operated upon by a declarator.
 -}
inherited attribute givenType :: ast:TypeModifierExpr;

propagate givenType on 
  StructDeclaratorList_c, 
  StructDeclarator_c, 
  EnumSpecifier_c;

{--
 - Plumbing, to give the attached statement to a function definition.
 -}
inherited attribute givenStmt :: ast:Stmt;

-- "Exported" nonterminals

closed tracked nonterminal FunctionDefinition_c with ast<ast:FunctionDecl>;
concrete productions top::FunctionDefinition_c
| d::InitialFunctionDefinition_c  s::CompoundStatement_c
    { top.ast = d.ast;
      d.givenStmt = s.ast;
    }
    action {
      context = closeScope(context); -- Opened by InitialFunctionDefinition.
    }

closed tracked nonterminal Declaration_c with ast<ast:Decl>;
concrete productions top::Declaration_c
| ds::DeclarationSpecifiers_c  idcl::InitDeclaratorList_c  ';'
    {
      ds.givenQualifiers = ds.typeQualifiers;

      nondecorated local bt::ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers( ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
      nondecorated local dcls::ast:Declarators = ast:foldDeclarator(idcl.ast);

      top.ast =
        if ds.isTypedef then
          if !null(ds.storageClass) then
            ast:typedefDecls(ds.attributes,
              ast:warnTypeExpr(
                [errFromOrigin(ds, "Typedef declaration also claims another storage class")],
                bt),
              dcls)
          else
            ast:typedefDecls(ds.attributes, bt, dcls)
        else
          ast:variableDecls(ast:foldStorageClass(ds.storageClass), ds.attributes, bt, dcls);
    }
    action {
      context =
        if ds.isTypedef
        then addIdentsToScope(idcl.declaredIdents, TypeName_t, context)
        else addIdentsToScope(idcl.declaredIdents, Identifier_t, context);
    }
| ds::DeclarationSpecifiers_c  ';'
    { ds.givenQualifiers = ds.typeQualifiers;
      top.ast =
        ast:typeExprDecl(
          ds.attributes,
          ast:figureOutTypeFromSpecifiers( ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers));
    }


-- Attributes arrising from type qualifier lists in declarators always flow up to be attatched to the enclosing declaration, for now.
closed tracked nonterminal Declarator_c with declaredIdent, declaredParamIdents, ast<ast:TypeModifierExpr>, attributes, givenType;
concrete productions top::Declarator_c
| p::Pointer_c dd::DirectDeclarator_c
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      p.givenType = top.givenType;
      dd.givenType = p.ast;
      top.ast = dd.ast;
      top.attributes = dd.attributes;
    }
| dd::DirectDeclarator_c
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = top.givenType;
      top.ast = dd.ast;
      top.attributes = dd.attributes; }


closed tracked nonterminal DirectDeclarator_c with declaredIdent, declaredParamIdents, ast<ast:TypeModifierExpr>, attributes, givenType;
concrete productions top::DirectDeclarator_c
| '(' d::Declarator_c ')'
    { top.declaredIdent = d.declaredIdent;
      top.declaredParamIdents = d.declaredParamIdents;
      d.givenType = ast:parenTypeExpr(top.givenType);
      top.ast = d.ast;
      top.attributes = d.attributes;
    }
| dd::DirectDeclarator_c '(' idl::IdentifierList_c ')' q::OptTypeQualifierList_c
    {
      top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents =
        orElse(dd.declaredParamIdents, just(idl.declaredIdents));
      dd.givenType = ast:functionTypeExprWithoutArgs(top.givenType, idl.declaredIdents, q.typeQualifiers);
      top.ast = dd.ast;
      top.attributes = ast:appendAttribute(dd.attributes, q.attributes);
    }
| id::Identifier_c
    { top.declaredIdent = id.ast;
      top.declaredParamIdents = nothing();
      top.ast = top.givenType;
      top.attributes = ast:nilAttribute();
    }
| dd::DirectDeclarator_c mod::PostfixModifier_c
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = -- use the inner one if it exists!
        orElse(dd.declaredParamIdents, mod.declaredParamIdents);
      mod.givenType = top.givenType;
      dd.givenType = mod.ast;
      top.ast = dd.ast;
      top.attributes = dd.attributes;
    }


closed tracked nonterminal AbstractDeclarator_c with ast<ast:TypeModifierExpr>, givenType;
concrete productions top::AbstractDeclarator_c
| p::Pointer_c  dd::DirectAbstractDeclarator_c
    { p.givenType = top.givenType;
      dd.givenType = p.ast;
      top.ast = dd.ast;
    }
| dd::DirectAbstractDeclarator_c
    { dd.givenType = top.givenType;
      top.ast = dd.ast;
    }
| p::Pointer_c
    { p.givenType = top.givenType;
      top.ast = p.ast;
    }


closed tracked nonterminal DirectAbstractDeclarator_c with ast<ast:TypeModifierExpr>, givenType;
concrete productions top::DirectAbstractDeclarator_c
| '(' d::AbstractDeclarator_c ')'
    {
      d.givenType = ast:parenTypeExpr(top.givenType);
      top.ast = d.ast;
    }
| mod::PostfixModifier_c
  {
    propagate givenType;
    top.ast = mod.ast;
  }
| dd::DirectAbstractDeclarator_c mod::PostfixModifier_c
  {
    mod.givenType = top.givenType;
    dd.givenType = mod.ast;
    top.ast = dd.ast;
  }

closed tracked nonterminal TypeName_c with ast<ast:TypeName>;
concrete productions top::TypeName_c
| sqs::SpecifierQualifierList_c
    {
      sqs.givenQualifiers = sqs.typeQualifiers;
      nondecorated local bt::ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers( sqs.typeQualifiers, sqs.preTypeSpecifiers, sqs.realTypeSpecifiers, sqs.mutateTypeSpecifiers);
      top.ast =
        ast:typeName(
          case decorate sqs.attributes with { ast:controlStmtContext = ast:initialControlStmtContext; } of
          | ast:nilAttribute() -> bt
          | _ -> ast:warnTypeExpr([wrnFromOrigin(top, "Ignoring attributes in type name")], bt)
          end,
          ast:baseTypeExpr());
    }
| sqs::SpecifierQualifierList_c d::AbstractDeclarator_c
    {
      sqs.givenQualifiers = sqs.typeQualifiers;
      d.givenType = ast:baseTypeExpr();
      nondecorated local bt::ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers( sqs.typeQualifiers, sqs.preTypeSpecifiers, sqs.realTypeSpecifiers, sqs.mutateTypeSpecifiers);
      top.ast =
        ast:typeName(
          case decorate sqs.attributes with { ast:controlStmtContext = ast:initialControlStmtContext; } of
          | ast:nilAttribute() -> bt
          | _ -> ast:warnTypeExpr([wrnFromOrigin(top, "Ignoring attributes in type name")], bt)
          end,
          d.ast);
    }

-- Not actually used in the host language, just really useful for extensions
closed tracked nonterminal TypeNames_c with ast<ast:TypeNames>;
concrete productions top::TypeNames_c
| h::TypeName_c ',' t::TypeNames_c
    { top.ast = ast:consTypeName(h.ast, t.ast); }
| h::TypeName_c
    { top.ast = ast:consTypeName(h.ast, ast:nilTypeName()); }
|
    { top.ast = ast:nilTypeName(); }

closed tracked nonterminal Names_c with ast<[ast:Name]>;
concrete productions top::Names_c
| h::Identifier_c ',' t::Names_c
  { top.ast = h.ast :: t.ast; }
| h::Identifier_c
  { top.ast = [h.ast]; }
|
  { top.ast = []; }

-- Ugly hack to add things to the follow sets of several nonterminals
-- We set this to include what is allowed by C++ for extensions to use
terminal TypeNames_NEVER_t 'TypeNames_NEVER_t!!!nevernever1234567890';
terminal Names_NEVER_t 'Names_NEVER_t!!!nevernever1234567890';
terminal Declarator_NEVER_t 'Declarator_NEVER_t!!!nevernever1234567890';
terminal DirectDeclarator_NEVER_t 'DirectDeclarator_NEVER_t!!!nevernever1234567890';
concrete productions top::Expr_c
| 'TypeNames_NEVER_t!!!nevernever1234567890' TypeNames_c ')'
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for TypeNames_c should not appear in the tree.") ] ) ; }
| 'TypeNames_NEVER_t!!!nevernever1234567890' TypeNames_c '{'
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for TypeNames_c should not appear in the tree.") ] ) ; }
| 'TypeNames_NEVER_t!!!nevernever1234567890' TypeNames_c '}'
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for TypeNames_c should not appear in the tree.") ] ) ; }
| 'TypeNames_NEVER_t!!!nevernever1234567890' TypeNames_c '>'
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for TypeNames_c should not appear in the tree.") ] ) ; }
| 'TypeNames_NEVER_t!!!nevernever1234567890' TypeNames_c ';'
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for TypeNames_c should not appear in the tree.") ] ) ; }
| 'TypeNames_NEVER_t!!!nevernever1234567890' TypeNames_c AllowSEUDecl_t
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for TypeNames_c should not appear in the tree.") ] ) ; }
| 'Names_NEVER_t!!!nevernever1234567890' Names_c ')'
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for Names_c should not appear in the tree.") ] ) ; }
| 'Names_NEVER_t!!!nevernever1234567890' Names_c '}'
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for Names_c should not appear in the tree.") ] ) ; }
| 'Names_NEVER_t!!!nevernever1234567890' Names_c '>'
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for Names_c should not appear in the tree.") ] ) ; }
| 'Names_NEVER_t!!!nevernever1234567890' Names_c ';'
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for Names_c should not appear in the tree.") ] ) ; }
| 'Declarator_NEVER_t!!!nevernever1234567890' Declarator_c '>'
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for Declarator_c should not appear in the tree.") ] ) ; }
| 'DirectDeclarator_NEVER_t!!!nevernever1234567890' DirectDeclarator_c '>'
    { top.ast = ast:errorExpr ( [ errFromOrigin(top, "Internal Error. " ++
        "Placeholder for DirectDeclarator_c should not appear in the tree.") ] ) ; }

-- "Non-exported" nonterminals


{--
 - This nonterminal is not a part of the standard c99 grammar. We used it
 - to inject a reduce action before the parsing of the CompoundStatement.
 - Note we open a scope here, and that this scope is explicitly closed in the
 - rule for FunctionDefinition. This is to handle adding parameter names
 - with the correct scoping rules.
 -}
closed tracked nonterminal InitialFunctionDefinition_c with ast<ast:FunctionDecl>, givenStmt;
concrete productions top::InitialFunctionDefinition_c
| ds::DeclarationSpecifiers_c  d::Declarator_c  l::InitiallyUnqualifiedDeclarationList_c
    {
      ds.givenQualifiers = ds.typeQualifiers;
      d.givenType = ast:baseTypeExpr();
      l.givenQualifiers =
        case baseMT of
        | ast:functionTypeExprWithArgs(t, p, v, q) -> ^q
        | ast:functionTypeExprWithoutArgs(t, v, q) -> ^q
        | _ -> ast:nilQualifier()
        end;

      nondecorated local specialSpecifiers::ast:SpecialSpecifiers =
        foldr(ast:consSpecialSpecifier, ast:nilSpecialSpecifier(), ds.specialSpecifiers);

      nondecorated local bt::ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);

      -- If this is a K&R-style declaration, attatch any function qualifiers to the first declaration instead
      local baseMT  :: ast:TypeModifierExpr = d.ast;
      baseMT.ast:baseType = ast:errorType();
      baseMT.ast:typeModifierIn = ast:baseTypeExpr();
      baseMT.ast:env = ast:emptyEnv();
      baseMT.ast:controlStmtContext = ast:initialControlStmtContext;
      nondecorated local mt::ast:TypeModifierExpr =
        case l.isDeclListEmpty, baseMT of
        | false, ast:functionTypeExprWithArgs(t, p, v, q) ->
          ast:functionTypeExprWithArgs(^t, ^p, v, ast:nilQualifier())
        | false, ast:functionTypeExprWithoutArgs(t, v, q) ->
          ast:functionTypeExprWithoutArgs(^t, v, ast:nilQualifier())
        | _, mt -> ^mt
        end;

      top.ast =
        ast:functionDecl(
          ast:foldStorageClass(ds.storageClass),
          specialSpecifiers, bt, mt,
          d.declaredIdent,
          ast:appendAttribute(ds.attributes, d.attributes),
          ast:foldDecl(l.ast),
          top.givenStmt);
    }
    action {
      -- Function are annoying because we have to open a scope, then add the
      -- parameters, and close it after the brace.
      context = beginFunctionScope(d.declaredIdent, Identifier_t, d.declaredParamIdents, Identifier_t, context);
    }
| d::Declarator_c  l::InitiallyUnqualifiedDeclarationList_c
    {
      d.givenType = ast:baseTypeExpr();
      l.givenQualifiers =
        case baseMT of
        | ast:functionTypeExprWithArgs(t, p, v, q) -> ^q
        | ast:functionTypeExprWithoutArgs(t, v, q) -> ^q
        | _ -> ast:nilQualifier()
        end;

      nondecorated local bt::ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(ast:nilQualifier(), [], [], []);

      -- If this is a K&R-style declaration, attatch any function qualifiers to the first declaration instead
      local baseMT  :: ast:TypeModifierExpr = d.ast;
      baseMT.ast:baseType = ast:errorType();
      baseMT.ast:typeModifierIn = ast:baseTypeExpr();
      baseMT.ast:env = ast:emptyEnv();
      baseMT.ast:controlStmtContext = ast:initialControlStmtContext;
      nondecorated local mt::ast:TypeModifierExpr =
        case l.isDeclListEmpty, baseMT of
        | false, ast:functionTypeExprWithArgs(t, p, v, q) ->
          ast:functionTypeExprWithArgs(^t, ^p, v, ast:nilQualifier())
        | false, ast:functionTypeExprWithoutArgs(t, v, q) ->
          ast:functionTypeExprWithoutArgs(^t, v, ast:nilQualifier())
        | _, mt -> ^mt
        end;

      top.ast =
        ast:functionDecl(
          ast:nilStorageClass(),
          ast:nilSpecialSpecifier(), bt, mt,
          d.declaredIdent,
          d.attributes,
          ast:foldDecl(l.ast),
          top.givenStmt);
    }
    action {
      -- Unfortunate duplication. This production is necessary for K&R compatibility
      -- We can't make it a proper optional nonterminal, since that requires a reduce far too early.
      -- (i.e. LALR conflicts)
      context = beginFunctionScope(d.declaredIdent, Identifier_t, d.declaredParamIdents, Identifier_t, context);
    }

{--
 - Due to the addtion of our custom (C++-style) syntax for writing type
 - qualifiers on functions, we must deal with the conflict of whether function
 - qualifiers should actually be attatched to the first declaration in the
 - declaration list. We want to always parse K&R-style programs correctly, but
 - we don't care about allowing function qualifiers on K&R-style function
 - declarations.
 - To achieve this, we choose to disallow type qualifiers from ocurring at the
 - beginning of the first declaration in the declaration list, and attaching
 - any function qualifiers to the first declaration if there is a declaration
 - list present while constructing the abstract syntax.  This is prefered to
 - the approach of disallowing function qualifiers on function declarations and
 - attaching any qualifiers from a single 'declaration' with no specifiers, as
 - that would require significantly more invasive grammar modifications.
 -}
closed tracked nonterminal InitiallyUnqualifiedDeclaration_c with ast<ast:Decl>, givenQualifiers;
concrete productions top::InitiallyUnqualifiedDeclaration_c
| ds::InitiallyUnqualifiedDeclarationSpecifiers_c  idcl::InitDeclaratorList_c  ';'
    {
      ds.givenQualifiers = ast:qualifierCat(top.givenQualifiers, ds.typeQualifiers);

      nondecorated local bt::ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers( ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
      nondecorated local dcls::ast:Declarators = ast:foldDeclarator(idcl.ast);

      top.ast =
        if ds.isTypedef then
          if !null(ds.storageClass) then
            ast:typedefDecls(ds.attributes,
              ast:warnTypeExpr(
                [errFromOrigin(ds, "Typedef declaration also claims another storage class")],
                bt),
              dcls)
          else
            ast:typedefDecls(ds.attributes, bt, dcls)
        else
          ast:variableDecls(ast:foldStorageClass(ds.storageClass), ds.attributes, bt, dcls);
    }
    action {
      context =
        if ds.isTypedef
        then addIdentsToScope(idcl.declaredIdents, TypeName_t, context)
        else addIdentsToScope(idcl.declaredIdents, Identifier_t, context);
    }
| ds::InitiallyUnqualifiedDeclarationSpecifiers_c  ';'
    { ds.givenQualifiers = ds.typeQualifiers;
      top.ast =
        ast:typeExprDecl(
          ds.attributes,
          ast:figureOutTypeFromSpecifiers(
            ast:qualifierCat(top.givenQualifiers, ds.typeQualifiers),
            ds.preTypeSpecifiers,
            ds.realTypeSpecifiers,
            ds.mutateTypeSpecifiers));
    }


synthesized attribute isDeclListEmpty :: Boolean;

{--
 - C99 requires at least one declaration. We change this to be 0 or more
 - since it's only use is in (our) InitialFunctionDefinition,
 - where it's optional.
 -}
closed tracked nonterminal InitiallyUnqualifiedDeclarationList_c with ast<[ast:Decl]>, isDeclListEmpty, givenQualifiers;
concrete productions top::InitiallyUnqualifiedDeclarationList_c
|
    { top.ast = [];
      top.isDeclListEmpty = true; }
| h::InitiallyUnqualifiedDeclaration_c  t::DeclarationList_c
    { top.ast = h.ast :: t.ast;
      top.isDeclListEmpty = false; }

closed tracked nonterminal DeclarationList_c with ast<[ast:Decl]>, isDeclListEmpty;
concrete productions top::DeclarationList_c
|
    { top.ast = [];
      top.isDeclListEmpty = true; }
| h::Declaration_c  t::DeclarationList_c
    { top.ast = h.ast :: t.ast;
      top.isDeclListEmpty = false; }


closed tracked nonterminal Pointer_c with ast<ast:TypeModifierExpr>, givenType;
concrete productions top::Pointer_c
| '*'
    { top.ast = ast:pointerTypeExpr(ast:nilQualifier(), top.givenType); }
| '*'  q::TypeQualifierList_c
    { top.ast = ast:pointerTypeExpr(q.typeQualifiers, top.givenType); }
| '*'  t::Pointer_c
    { t.givenType = ast:pointerTypeExpr(ast:nilQualifier(), top.givenType);
      top.ast = t.ast; }
| '*'  q::TypeQualifierList_c  t::Pointer_c
    { t.givenType = ast:pointerTypeExpr(q.typeQualifiers, top.givenType);
      top.ast = t.ast; }

-- TODO: Discarding attributes here.
-- GCC currently ignores them anyway, so not gonna worry about it for now.
closed tracked nonterminal PostfixModifier_c with declaredParamIdents, ast<ast:TypeModifierExpr>, givenType;
concrete productions top::PostfixModifier_c
| '[' ']'
    {
      top.declaredParamIdents = nothing();
      top.ast = ast:arrayTypeExprWithoutExpr(top.givenType, ast:nilQualifier(), ast:normalArraySize());
    }
| '[' q::TypeQualifierList_c e::AssignExpr_c ']'
    {
      top.declaredParamIdents = nothing();
      top.ast = ast:arrayTypeExprWithExpr(top.givenType, q.typeQualifiers, ast:normalArraySize(), e.ast);
    }
| '[' e::AssignExpr_c ']'
    {
      top.declaredParamIdents = nothing();
      top.ast = ast:arrayTypeExprWithExpr(top.givenType, ast:nilQualifier(), ast:normalArraySize(), e.ast);
    }
| '[' q::TypeQualifierList_c ']'
    {
      top.declaredParamIdents = nothing();
      top.ast = ast:arrayTypeExprWithoutExpr(top.givenType, q.typeQualifiers, ast:normalArraySize());
    }
| '[' 'static' q::TypeQualifierList_c e::AssignExpr_c ']'
    {
      top.declaredParamIdents = nothing();
      top.ast = ast:arrayTypeExprWithExpr(top.givenType, q.typeQualifiers, ast:staticArraySize(), e.ast);
    }
| '[' 'static' e::AssignExpr_c ']'
    {
      top.declaredParamIdents = nothing();
      top.ast = ast:arrayTypeExprWithExpr(top.givenType, ast:nilQualifier(), ast:staticArraySize(), e.ast);
    }
| '[' q::TypeQualifierList_c 'static' e::AssignExpr_c ']'
    {
      top.declaredParamIdents = nothing();
      top.ast = ast:arrayTypeExprWithExpr(top.givenType, q.typeQualifiers, ast:staticArraySize(), e.ast);
    }
| '[' q::TypeQualifierList_c '*' ']'
    {
      top.declaredParamIdents = nothing();
      top.ast = ast:arrayTypeExprWithoutExpr(top.givenType, q.typeQualifiers, ast:starArraySize());
    }
| '[' '*' ']'
    {
    top.declaredParamIdents = nothing();
    top.ast = ast:arrayTypeExprWithoutExpr(top.givenType, ast:nilQualifier(), ast:starArraySize());
    }
| '(' ptl::ParameterTypeList_c ')' q::OptTypeQualifierList_c
    {
      top.declaredParamIdents = just(ptl.declaredIdents);
      top.ast = ast:functionTypeExprWithArgs(top.givenType, ast:foldParameterDecl(ptl.ast), ptl.isVariadic, q.typeQualifiers);
    }
| '(' ')' q::OptTypeQualifierList_c
    {
      top.declaredParamIdents = just([]);
      top.ast = ast:functionTypeExprWithoutArgs(top.givenType, [], q.typeQualifiers);
    }



closed tracked nonterminal OptTypeQualifierList_c with typeQualifiers, attributes;
concrete productions top::OptTypeQualifierList_c
|
  operator=CPP_Attr_LowerPrec_t
    { top.typeQualifiers = ast:nilQualifier();
      top.attributes = ast:nilAttribute(); }
| q::TypeQualifierList_c
    { top.typeQualifiers = q.typeQualifiers;
      top.attributes = q.attributes; }




synthesized attribute isVariadic :: Boolean;

closed tracked nonterminal ParameterTypeList_c with declaredIdents, ast<[ast:ParameterDecl]>, isVariadic;
concrete productions top::ParameterTypeList_c
| pl::ParameterList_c
    { top.declaredIdents = pl.declaredIdents;
      top.ast = pl.ast;
      top.isVariadic = false; }
| pl::ParameterList_c ',' '...'
    { top.declaredIdents = pl.declaredIdents;
      top.ast = pl.ast;
      top.isVariadic = true; }


closed tracked nonterminal ParameterList_c with declaredIdents, ast<[ast:ParameterDecl]>;
concrete productions top::ParameterList_c
| h::ParameterDeclaration_c
    { top.declaredIdents = h.declaredIdents;
      top.ast = [h.ast];
    }
| h::ParameterList_c ',' t::ParameterDeclaration_c
    { top.declaredIdents = h.declaredIdents ++ t.declaredIdents;
      top.ast = h.ast ++ [t.ast];
    }


closed tracked nonterminal ParameterDeclaration_c with declaredIdents, ast<ast:ParameterDecl>;
concrete productions top::ParameterDeclaration_c
| ds::DeclarationSpecifiers_c d::Declarator_c
    { top.declaredIdents = [d.declaredIdent];
      ds.givenQualifiers = ds.typeQualifiers;
      d.givenType = ast:baseTypeExpr();
      nondecorated local bt::ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers( ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
      top.ast = ast:parameterDecl(ast:foldStorageClass(ds.storageClass), bt, d.ast, ast:justName(d.declaredIdent), ast:appendAttribute(ds.attributes, d.attributes));
      }
| ds::DeclarationSpecifiers_c d::AbstractDeclarator_c
    { top.declaredIdents = [];
      ds.givenQualifiers = ds.typeQualifiers;
      d.givenType = ast:baseTypeExpr();
      nondecorated local bt::ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers( ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
      top.ast = ast:parameterDecl(ast:foldStorageClass(ds.storageClass), bt, d.ast, ast:nothingName(), ds.attributes);
    }
| ds::DeclarationSpecifiers_c
    { top.declaredIdents = [];
      ds.givenQualifiers = ds.typeQualifiers;
      nondecorated local bt::ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers( ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
      top.ast = ast:parameterDecl(ast:foldStorageClass(ds.storageClass), bt, ast:baseTypeExpr(), ast:nothingName(), ds.attributes);
    }


closed tracked nonterminal IdentifierList_c with declaredIdents;
concrete productions top::IdentifierList_c
| id::Identifier_c
    { top.declaredIdents = [id.ast]; }
| l::IdentifierList_c ',' id::Identifier_c
    { top.declaredIdents = l.declaredIdents ++ [id.ast]; }


closed tracked nonterminal InitDeclaratorList_c with declaredIdents, ast<[ast:Declarator]>;
concrete productions top::InitDeclaratorList_c
| h::InitDeclarator_c
    { top.declaredIdents = [h.declaredIdent];
      top.ast = h.ast; }
| h::InitDeclaratorList_c ',' t::InitDeclarator_c
    { top.declaredIdents = h.declaredIdents ++ [t.declaredIdent];
      top.ast = h.ast ++ t.ast; }


closed tracked nonterminal InitDeclarator_c with declaredIdent, ast<[ast:Declarator]>;
concrete productions top::InitDeclarator_c
| d::Declarator_c
    operator=Cpp_Attribute_high_prec
    { top.declaredIdent = d.declaredIdent;
      d.givenType = ast:baseTypeExpr();
      top.ast = [ast:declarator(d.declaredIdent, d.ast, d.attributes, ast:nothingInitializer())];
    }
| d::Declarator_c '=' i::Initializer_c
    { top.declaredIdent = d.declaredIdent;
      d.givenType = ast:baseTypeExpr();
      top.ast = [ast:declarator(d.declaredIdent, d.ast, d.attributes, ast:justInitializer(i.ast))];
    }
-- For Initializer_c see Expr.sv

