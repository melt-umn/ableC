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
autocopy attribute givenType :: ast:TypeModifierExpr;
{--
 - Plumbing, to give the attached statement to a function definition.
 -}
inherited attribute givenStmt :: ast:Stmt;

-- "Exported" nonterminals

closed nonterminal FunctionDefinition_c with location, ast<ast:FunctionDecl>;
concrete productions top::FunctionDefinition_c
| d::InitialFunctionDefinition_c  s::CompoundStatement_c 
    { top.ast = d.ast;
      d.givenStmt = s.ast;
    }
    action {
      context = lh:closeScope(context); -- Opened by InitialFunctionDefinition.
    }

closed nonterminal Declaration_c with location, ast<ast:Decl>;
concrete productions top::Declaration_c
| ds::DeclarationSpecifiers_c  idcl::InitDeclaratorList_c  ';'
    {
      ds.givenQualifiers = ds.typeQualifiers;
      
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(ds.location, ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
      local dcls :: ast:Declarators =
        ast:foldDeclarator(idcl.ast);
      
      top.ast = 
        if ds.isTypedef then
          if !null(ds.storageClass) then
            ast:typedefDecls(ds.attributes, 
              ast:warnTypeExpr(
                [err(ds.location, "Typedef declaration also claims another storage class")],
                bt),
              dcls)
          else
            ast:typedefDecls(ds.attributes, bt, dcls)
        else
          ast:variableDecls(ds.storageClass, ds.attributes, bt, dcls);
    }
    action {
      context =
        if ds.isTypedef
        then lh:addTypenamesToScope(idcl.declaredIdents, context)
        else lh:addIdentsToScope(idcl.declaredIdents, context);
    }
| ds::DeclarationSpecifiers_c  ';'
    { ds.givenQualifiers = ds.typeQualifiers;
      top.ast =
        ast:typeExprDecl(
          ds.attributes,
          ast:figureOutTypeFromSpecifiers(ds.location, ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers));
    }


closed nonterminal Declarator_c with location, declaredIdent, declaredParamIdents, ast<ast:TypeModifierExpr>, givenType; 
concrete productions top::Declarator_c
| p::Pointer_c dd::DirectDeclarator_c
    { top.declaredIdent = dd.declaredIdent; 
      top.declaredParamIdents = dd.declaredParamIdents;
      p.givenType = top.givenType;
      dd.givenType = p.ast;
      top.ast = dd.ast;}
| dd::DirectDeclarator_c
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = top.givenType;
      top.ast = dd.ast; }

closed nonterminal FunctionDeclarator_c with location, declaredIdent, declaredParamIdents, ast<ast:TypeModifierExpr>, givenType; 
concrete productions top::FunctionDeclarator_c
| p::Pointer_c dd::DirectFunctionDeclarator_c
    { top.declaredIdent = dd.declaredIdent; 
      top.declaredParamIdents = dd.declaredParamIdents;
      p.givenType = top.givenType;
      dd.givenType = p.ast;
      top.ast = dd.ast;}
| dd::DirectFunctionDeclarator_c
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = top.givenType;
      top.ast = dd.ast; }


closed nonterminal TypeName_c with location, ast<ast:TypeName>;
concrete productions top::TypeName_c
| sqs::SpecifierQualifierList_c
    { 
      sqs.givenQualifiers = sqs.typeQualifiers;
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(sqs.location, sqs.typeQualifiers, sqs.preTypeSpecifiers, sqs.realTypeSpecifiers, sqs.mutateTypeSpecifiers);
      top.ast =
        ast:typeName(
          case decorate sqs.attributes with { ast:returnType = nothing(); } of
          | ast:nilAttribute() -> bt
          | _ -> ast:warnTypeExpr([wrn(top.location, "Ignoring attributes in type name1")], bt)
          end,
          ast:baseTypeExpr());
    }
| sqs::SpecifierQualifierList_c d::AbstractDeclarator_c
    { 
      sqs.givenQualifiers = sqs.typeQualifiers;
      d.givenType = ast:baseTypeExpr();
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(sqs.location, sqs.typeQualifiers, sqs.preTypeSpecifiers, sqs.realTypeSpecifiers, sqs.mutateTypeSpecifiers);
      top.ast =
        ast:typeName(
          case decorate sqs.attributes with { ast:returnType = nothing(); } of
          | ast:nilAttribute() -> bt
          | _ -> ast:warnTypeExpr([wrn(top.location, "Ignoring attributes in type name1")], bt)
          end,
          d.ast);
    }

-- Not actually used in the host language, just really useful for extensions
nonterminal TypeNames_c with ast<ast:TypeNames>;

concrete productions top::TypeNames_c
| h::TypeName_c ',' t::TypeNames_c
    { top.ast = ast:consTypeName(h.ast, t.ast); }
| h::TypeName_c 
    { top.ast = ast:consTypeName(h.ast, ast:nilTypeName()); }
| 
    { top.ast = ast:nilTypeName(); }

-- Ugly hack to add things to the follow set TypeNames_c
-- We set this to match what is allowed by C++ for extensions to use
terminal TypeNames_NEVER_t 'TypeNames_NEVER_t!!!nevernever1234567890' ;
concrete productions top::Expr_c
| 'TypeNames_NEVER_t!!!nevernever1234567890' TypeNames_c ')'
    { top.ast = ast:errorExpr ( [ err (top.location, "Internal Error. " ++
        "Placeholder for TypeNames_c should not appear in the tree.") ],
        location=top.location ) ; }
| 'TypeNames_NEVER_t!!!nevernever1234567890' TypeNames_c '>'
    { top.ast = ast:errorExpr ( [ err (top.location, "Internal Error. " ++
        "Placeholder for TypeNames_c should not appear in the tree.") ],
        location=top.location ) ; }
| 'TypeNames_NEVER_t!!!nevernever1234567890' TypeNames_c ';'
    { top.ast = ast:errorExpr ( [ err (top.location, "Internal Error. " ++
        "Placeholder for TypeNames_c should not appear in the tree.") ],
        location=top.location ) ; }


-- "Non-exported" nonterminals


{--
 - This nonterminal is not a part of the standard c99 grammar. We used it
 - to inject a reduce action before the parsing of the CompoundStatement.
 - Note we open a scope here, and that this scope is explicitly closed in the
 - rule for FunctionDefinition. This is to handle adding parameter names
 - with the correct scoping rules.
 -}
closed nonterminal InitialFunctionDefinition_c with location, ast<ast:FunctionDecl>, givenStmt;
concrete productions top::InitialFunctionDefinition_c
| ds::DeclarationSpecifiers_c  d::FunctionDeclarator_c  l::DeclarationList_c
    {
      ds.givenQualifiers = ds.typeQualifiers;
      d.givenType = ast:baseTypeExpr();
      
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(ds.location, ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);

      local specialSpecifiers :: ast:SpecialSpecifiers =
        foldr(ast:consSpecialSpecifier, ast:nilSpecialSpecifier(), ds.specialSpecifiers);

      top.ast = 
        ast:functionDecl(ds.storageClass, specialSpecifiers, bt, d.ast, d.declaredIdent, ds.attributes, ast:foldDecl(l.ast), top.givenStmt);
    }
    action {
      -- Function are annoying because we have to open a scope, then add the
      -- parameters, and close it after the brace.
      context = lh:beginFunctionScope(d.declaredIdent, d.declaredParamIdents, context);
    }
| d::FunctionDeclarator_c  l::DeclarationList_c
    {
      d.givenType = ast:baseTypeExpr();
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(d.location, ast:nilQualifier(), [], [], []);

      top.ast = 
        ast:functionDecl([], ast:nilSpecialSpecifier(), bt, d.ast, d.declaredIdent, ast:nilAttribute(), ast:foldDecl(l.ast), top.givenStmt);
    }
    action {
      -- Unfortunate duplication. This production is necessary for K&R compatibility
      -- We can't make it a proper optional nonterminal, since that requires a reduce far too early.
      -- (i.e. LALR conflicts)
      context = lh:beginFunctionScope(d.declaredIdent, d.declaredParamIdents, context);
    }
| ds::DeclarationSpecifiers_c  d::FunctionDeclarator_c  q::TypeQualifierList_c
    {
      ds.givenQualifiers = ds.typeQualifiers;
      d.givenType = ast:baseTypeExpr();
      
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(ds.location, ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);

      local specialSpecifiers :: ast:SpecialSpecifiers =
        foldr(ast:consSpecialSpecifier, ast:nilSpecialSpecifier(), ds.specialSpecifiers);

      top.ast = 
        ast:functionDecl(ds.storageClass, specialSpecifiers, bt, d.ast, d.declaredIdent, ds.attributes, ast:nilDecl(), top.givenStmt);
    }
    action {
      -- Function are annoying because we have to open a scope, then add the
      -- parameters, and close it after the brace.
      context = lh:beginFunctionScope(d.declaredIdent, d.declaredParamIdents, context);
    }
| d::FunctionDeclarator_c  q::TypeQualifierList_c
    {
      d.givenType = ast:baseTypeExpr();
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(d.location, ast:nilQualifier(), [], [], []);

      top.ast = 
        ast:functionDecl([], ast:nilSpecialSpecifier(), bt, d.ast, d.declaredIdent, ast:nilAttribute(), ast:nilDecl(), top.givenStmt);
    }
    action {
      -- Unfortunate duplication. This production is necessary for K&R compatibility
      -- We can't make it a proper optional nonterminal, since that requires a reduce far too early.
      -- (i.e. LALR conflicts)
      context = lh:beginFunctionScope(d.declaredIdent, d.declaredParamIdents, context);
    }


synthesized attribute isDeclListEmpty :: Boolean;

{--
 - C99 requires at least one declaration. We change this to be 0 or more
 - since it's only use is in (our) InitialFunctionDefinition,
 - where it's optional.
 -}
closed nonterminal DeclarationList_c with location, ast<[ast:Decl]>, isDeclListEmpty;
concrete productions top::DeclarationList_c
|
    { top.ast = [];
      top.isDeclListEmpty = true; }
| h::Declaration_c  t::DeclarationList_c
    { top.ast = h.ast :: t.ast;
      top.isDeclListEmpty = false; }


closed nonterminal Pointer_c with location, ast<ast:TypeModifierExpr>, givenType; 
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


closed nonterminal DirectDeclarator_c with location, declaredIdent, declaredParamIdents, ast<ast:TypeModifierExpr>, givenType;
concrete productions top::DirectDeclarator_c
| id::Identifier_c 
    { top.declaredIdent = id.ast;
      top.declaredParamIdents = nothing();
      top.ast = top.givenType;
    }
| '(' d::Declarator_c ')'
    { top.declaredIdent = d.declaredIdent;
      top.declaredParamIdents = d.declaredParamIdents;
      d.givenType = ast:parenTypeExpr(top.givenType);
      top.ast = d.ast;
    }
| dd::DirectDeclarator_c '[' q::TypeQualifierList_c e::AssignExpr_c ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithExpr(top.givenType, q.typeQualifiers, ast:normalArraySize(), e.ast);
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' e::AssignExpr_c ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithExpr(top.givenType, ast:nilQualifier(), ast:normalArraySize(), e.ast);
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' q::TypeQualifierList_c ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithoutExpr(top.givenType, q.typeQualifiers, ast:normalArraySize());
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithoutExpr(top.givenType, ast:nilQualifier(), ast:normalArraySize());
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' 'static' q::TypeQualifierList_c e::AssignExpr_c ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithExpr(top.givenType, q.typeQualifiers, ast:staticArraySize(), e.ast);
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' 'static' e::AssignExpr_c ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithExpr(top.givenType, ast:nilQualifier(), ast:staticArraySize(), e.ast);
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' q::TypeQualifierList_c 'static' e::AssignExpr_c ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithExpr(top.givenType, q.typeQualifiers, ast:staticArraySize(), e.ast);
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' q::TypeQualifierList_c '*' ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithoutExpr(top.givenType, q.typeQualifiers, ast:starArraySize());
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' '*' ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithoutExpr(top.givenType, ast:nilQualifier(), ast:starArraySize());
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '(' ptl::ParameterTypeList_c ')' q::OptTypeQualifierList_c
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = -- use the inner one if it exists!
        orElse(dd.declaredParamIdents, just(ptl.declaredIdents));
      dd.givenType = ast:functionTypeExprWithArgs(top.givenType, ast:foldParameterDecl(ptl.ast), ptl.isVariadic, q.typeQualifiers);
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '(' idl::IdentifierList_c ')' q::OptTypeQualifierList_c
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents =
        orElse(dd.declaredParamIdents, just(idl.declaredIdents));
      dd.givenType = ast:functionTypeExprWithoutArgs(top.givenType, idl.declaredIdents, q.typeQualifiers);
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '(' ')' q::OptTypeQualifierList_c
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents =
        orElse(dd.declaredParamIdents, just([]));
      dd.givenType = ast:functionTypeExprWithoutArgs(top.givenType, [], q.typeQualifiers);
      top.ast = dd.ast;
    }

closed nonterminal DirectFunctionDeclarator_c with location, declaredIdent, declaredParamIdents, ast<ast:TypeModifierExpr>, givenType;
concrete productions top::DirectFunctionDeclarator_c
| id::Identifier_c 
    { top.declaredIdent = id.ast;
      top.declaredParamIdents = nothing();
      top.ast = top.givenType;
    }
| '(' d::Declarator_c ')'
    { top.declaredIdent = d.declaredIdent;
      top.declaredParamIdents = d.declaredParamIdents;
      d.givenType = ast:parenTypeExpr(top.givenType);
      top.ast = d.ast;
    }
| dd::DirectDeclarator_c '[' q::TypeQualifierList_c e::AssignExpr_c ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithExpr(top.givenType, q.typeQualifiers, ast:normalArraySize(), e.ast);
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' e::AssignExpr_c ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithExpr(top.givenType, ast:nilQualifier(), ast:normalArraySize(), e.ast);
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' q::TypeQualifierList_c ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithoutExpr(top.givenType, q.typeQualifiers, ast:normalArraySize());
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithoutExpr(top.givenType, ast:nilQualifier(), ast:normalArraySize());
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' 'static' q::TypeQualifierList_c e::AssignExpr_c ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithExpr(top.givenType, q.typeQualifiers, ast:staticArraySize(), e.ast);
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' 'static' e::AssignExpr_c ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithExpr(top.givenType, ast:nilQualifier(), ast:staticArraySize(), e.ast);
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' q::TypeQualifierList_c 'static' e::AssignExpr_c ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithExpr(top.givenType, q.typeQualifiers, ast:staticArraySize(), e.ast);
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' q::TypeQualifierList_c '*' ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithoutExpr(top.givenType, q.typeQualifiers, ast:starArraySize());
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '[' '*' ']'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = dd.declaredParamIdents;
      dd.givenType = ast:arrayTypeExprWithoutExpr(top.givenType, ast:nilQualifier(), ast:starArraySize());
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '(' ptl::ParameterTypeList_c ')'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents = -- use the inner one if it exists!
        orElse(dd.declaredParamIdents, just(ptl.declaredIdents));
      dd.givenType = ast:functionTypeExprWithArgs(top.givenType,
        ast:foldParameterDecl(ptl.ast), ptl.isVariadic, ast:nilQualifier());
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '(' idl::IdentifierList_c ')'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents =
        orElse(dd.declaredParamIdents, just(idl.declaredIdents));
      dd.givenType = ast:functionTypeExprWithoutArgs(top.givenType,
        idl.declaredIdents, ast:nilQualifier());
      top.ast = dd.ast;
    }
| dd::DirectDeclarator_c '(' ')'
    { top.declaredIdent = dd.declaredIdent;
      top.declaredParamIdents =
        orElse(dd.declaredParamIdents, just([]));
      dd.givenType = ast:functionTypeExprWithoutArgs(top.givenType, [],
        ast:nilQualifier());
      top.ast = dd.ast;
    }

closed nonterminal OptTypeQualifierList_c with location, typeQualifiers;
concrete productions top::OptTypeQualifierList_c
|
    { top.typeQualifiers = ast:nilQualifier(); }
| q::TypeQualifierList_c
    { top.typeQualifiers = q.typeQualifiers; }


closed nonterminal AbstractDeclarator_c with location, ast<ast:TypeModifierExpr>, givenType;
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


closed nonterminal DirectAbstractDeclarator_c with location, ast<ast:TypeModifierExpr>, givenType;
concrete productions top::DirectAbstractDeclarator_c
| '(' d::AbstractDeclarator_c ')'
    {
      d.givenType = ast:parenTypeExpr(top.givenType);
      top.ast = d.ast;
    }
| dd::DirectAbstractDeclarator_c  '[' e::AssignExpr_c ']'
    {
      dd.givenType = ast:arrayTypeExprWithExpr(top.givenType, ast:nilQualifier(), ast:normalArraySize(), e.ast);
      top.ast = dd.ast;
    }
| '[' e::AssignExpr_c ']'
    {
      top.ast = ast:arrayTypeExprWithExpr(top.givenType, ast:nilQualifier(), ast:normalArraySize(), e.ast);
    }
| dd::DirectAbstractDeclarator_c '['  ']'
    {
      dd.givenType = ast:arrayTypeExprWithoutExpr(top.givenType, ast:nilQualifier(), ast:normalArraySize());
      top.ast = dd.ast;
    }
| '['  ']'
    {
      top.ast = ast:arrayTypeExprWithoutExpr(top.givenType, ast:nilQualifier(), ast:normalArraySize());
    }
| dd::DirectAbstractDeclarator_c '[' '*' ']'
    {
      dd.givenType = ast:arrayTypeExprWithoutExpr(top.givenType, ast:nilQualifier(), ast:starArraySize());
      top.ast = dd.ast;
    }
| '[' '*' ']'
    {
      top.ast = ast:arrayTypeExprWithoutExpr(top.givenType, ast:nilQualifier(), ast:starArraySize());
    }
| dd::DirectAbstractDeclarator_c  '(' ptl::ParameterTypeList_c ')' q::OptTypeQualifierList_c
    {
      dd.givenType = ast:functionTypeExprWithArgs(top.givenType, ast:foldParameterDecl(ptl.ast), ptl.isVariadic, q.typeQualifiers);
      top.ast = dd.ast;
    }
| '(' ptl::ParameterTypeList_c ')' q::OptTypeQualifierList_c
    {
      top.ast = ast:functionTypeExprWithArgs(top.givenType, ast:foldParameterDecl(ptl.ast), ptl.isVariadic, q.typeQualifiers);
    }
| dd::DirectAbstractDeclarator_c  '(' ')' q::OptTypeQualifierList_c
    {
      dd.givenType = ast:functionTypeExprWithoutArgs(top.givenType, [], q.typeQualifiers);
      top.ast = dd.ast;
    }
| '(' ')' q::OptTypeQualifierList_c
    {
      top.ast = ast:functionTypeExprWithoutArgs(top.givenType, [], q.typeQualifiers);
    }


synthesized attribute isVariadic :: Boolean;

closed nonterminal ParameterTypeList_c with location, declaredIdents, ast<[ast:ParameterDecl]>, isVariadic;
concrete productions top::ParameterTypeList_c
| pl::ParameterList_c
    { top.declaredIdents = pl.declaredIdents;
      top.ast = pl.ast;
      top.isVariadic = false; }
| pl::ParameterList_c ',' '...'
    { top.declaredIdents = pl.declaredIdents;
      top.ast = pl.ast;
      top.isVariadic = true; }


closed nonterminal ParameterList_c with location, declaredIdents, ast<[ast:ParameterDecl]>;
concrete productions top::ParameterList_c
| h::ParameterDeclaration_c 
    { top.declaredIdents = h.declaredIdents;
      top.ast = [h.ast];
    }
| h::ParameterList_c ',' t::ParameterDeclaration_c
    { top.declaredIdents = h.declaredIdents ++ t.declaredIdents;
      top.ast = h.ast ++ [t.ast];
    }


closed nonterminal ParameterDeclaration_c with location, declaredIdents, ast<ast:ParameterDecl>;
concrete productions top::ParameterDeclaration_c
| ds::DeclarationSpecifiers_c d::Declarator_c
    { top.declaredIdents = [d.declaredIdent];
      ds.givenQualifiers = ds.typeQualifiers;
      d.givenType = ast:baseTypeExpr();
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(ds.location, ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
      top.ast = ast:parameterDecl(ds.storageClass, bt, d.ast, ast:justName(d.declaredIdent), ds.attributes);
      }
| ds::DeclarationSpecifiers_c d::AbstractDeclarator_c 
    { top.declaredIdents = [];
      ds.givenQualifiers = ds.typeQualifiers;
      d.givenType = ast:baseTypeExpr();
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(ds.location, ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
      top.ast = ast:parameterDecl(ds.storageClass, bt, d.ast, ast:nothingName(), ds.attributes);
    }
| ds::DeclarationSpecifiers_c 
    { top.declaredIdents = [];
      ds.givenQualifiers = ds.typeQualifiers;
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers(ds.location, ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
      top.ast = ast:parameterDecl(ds.storageClass, bt, ast:baseTypeExpr(), ast:nothingName(), ds.attributes);
    }


closed nonterminal IdentifierList_c with location, declaredIdents;
concrete productions top::IdentifierList_c
| id::Identifier_c
    { top.declaredIdents = [id.ast]; }
| l::IdentifierList_c ',' id::Identifier_c 
    { top.declaredIdents = l.declaredIdents ++ [id.ast]; }


closed nonterminal InitDeclaratorList_c with location, declaredIdents, ast<[ast:Declarator]>;
concrete productions top::InitDeclaratorList_c
| h::InitDeclarator_c
    { top.declaredIdents = [h.declaredIdent];
      top.ast = h.ast; }
| h::InitDeclaratorList_c ',' t::InitDeclarator_c
    { top.declaredIdents = h.declaredIdents ++ [t.declaredIdent];
      top.ast = h.ast ++ t.ast; }


closed nonterminal InitDeclarator_c with location, declaredIdent, ast<[ast:Declarator]>;
concrete productions top::InitDeclarator_c
| d::Declarator_c 
    operator=Cpp_Attribute_high_prec
    { top.declaredIdent = d.declaredIdent;
      d.givenType = ast:baseTypeExpr();
      top.ast = [ast:declarator(d.declaredIdent, d.ast, ast:nilAttribute(), ast:nothingInitializer())];
    }
| d::Declarator_c '=' i::Initializer_c
    { top.declaredIdent = d.declaredIdent;
      d.givenType = ast:baseTypeExpr();
      top.ast = [ast:declarator(d.declaredIdent, d.ast, ast:nilAttribute(), ast:justInitializer(i.ast))];
    }
-- For Initializer_c see Expr.sv

