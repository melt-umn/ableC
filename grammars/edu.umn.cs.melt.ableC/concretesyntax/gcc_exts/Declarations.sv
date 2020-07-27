grammar edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

imports edu:umn:cs:melt:ableC:concretesyntax;

imports edu:umn:cs:melt:ableC:abstractsyntax:host as ast;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction as ast;
imports silver:langutil;

terminal CPP_Extension_t '__extension__' lexer classes {Keyword, Reserved}, precedence=0;
terminal CPP_Inline_OneSided_t '__inline' lexer classes {Keyword, Reserved};
terminal CPP_Inline_t '__inline__' lexer classes {Keyword, Reserved};
terminal CPP_Signed_t '__signed__' lexer classes {Keyword, Reserved};
terminal CPP_Volatile_t '__volatile__' lexer classes {Keyword, Reserved};
terminal CPP_UUVolatile_t '__volatile' lexer classes {Keyword, Reserved};
terminal UUConst_t '__const' lexer classes { Keyword, Reserved };
terminal UUBuiltinVAList_t '__builtin_va_list' lexer classes {Keyword, Reserved};
terminal UURestrict_t '__restrict' lexer classes { Keyword, Reserved };
terminal UURestrictUU_t '__restrict__' lexer classes { Keyword, Reserved };
terminal Typeof_t 'typeof' lexer classes {Keyword, Reserved};
terminal CPP_Typeof_t '__typeof__' lexer classes {Keyword, Reserved};
terminal CPP_UUTypeof_t '__typeof' lexer classes {Keyword, Reserved};
terminal Float128_t '_Float128' lexer classes {Keyword, Reserved};
terminal Int128_t '__int128' lexer classes {Keyword, Reserved};

concrete productions top::TranslationUnit_c
| h::TranslationUnit_c  ';' 
    { top.ast = h.ast; }

concrete productions top::ExternalDeclaration_c
| '__extension__' d::ExternalDeclaration_c
    { top.ast = d.ast; } -- We simply discard and ignore these annotations.
| s::SimpleAsmStatement_c
    { top.ast = ast:fileScopeAsm(s.ast); }

concrete productions top::FunctionSpecifier_c
| '__inline__'
    { top.specialSpecifiers = [ast:inlineQualifier()]; }
| '__inline'
    { top.specialSpecifiers = [ast:inlineQualifier()]; }

concrete productions top::TypeQualifier_c
| '__const'
    { top.typeQualifiers = ast:foldQualifier([ast:constQualifier()]);
      top.mutateTypeSpecifiers = []; }
| '__restrict'
    { top.typeQualifiers = ast:foldQualifier([ast:uuRestrictQualifier()]);
      top.mutateTypeSpecifiers = []; }
| '__restrict__'
    { top.typeQualifiers = ast:foldQualifier([ast:restrictQualifier()]);
      top.mutateTypeSpecifiers = []; }
| '__volatile__'
    { top.typeQualifiers = ast:foldQualifier([ast:volatileQualifier()]);
      top.mutateTypeSpecifiers = []; }
| '__volatile'
    { top.typeQualifiers = ast:foldQualifier([ast:volatileQualifier()]);
      top.mutateTypeSpecifiers = []; }

concrete productions top::TypeSpecifier_c
| '__builtin_va_list'
    { top.preTypeSpecifiers = [];
      top.realTypeSpecifiers = [ast:vaListTypeExpr()]; }
| '__signed__'
    { top.realTypeSpecifiers = [];
      top.preTypeSpecifiers = ["signed"]; }
| t::TypeofStarter_c '(' ts::TypeName_c ')' 
    { top.preTypeSpecifiers = [];
      top.realTypeSpecifiers = [ast:typeofTypeExpr(top.givenQualifiers, ast:typeNameExpr(ts.ast))]; } -- TODO: bug: qualifiers get attached to what? I suppose here and all
| t::TypeofStarter_c '(' e::Expr_c ')'
    { top.preTypeSpecifiers = [];
      top.realTypeSpecifiers = [ast:typeofTypeExpr(top.givenQualifiers, ast:exprExpr(e.ast))]; }
| '_Float128'
    { top.realTypeSpecifiers = [ast:builtinTypeExpr(top.givenQualifiers, ast:realType(ast:longdoubleType()))]; -- TODO: Not sure, this shows up in GCC header files
      top.preTypeSpecifiers = []; }
| '__int128'
    { top.realTypeSpecifiers = [];
      top.preTypeSpecifiers = ["__int128"]; }

closed tracked nonterminal TypeofStarter_c;
concrete productions top::TypeofStarter_c
| 'typeof' {}
| '__typeof__' {}
| '__typeof' {}

concrete productions top::StructDeclaration_c
| '__extension__' d::StructDeclaration_c
    { top.ast = d.ast; }

-- We need a separate nonterminal for this because we're *requiring* the initial DeclSpecs, to avoid ambiguity.
-- We also don't allow old-style DeclarationLists.
closed tracked nonterminal NestedFunctionDefinition_c with ast<ast:FunctionDecl>;
concrete productions top::NestedFunctionDefinition_c
| d::InitialNestedFunctionDefinition_c  s::CompoundStatement_c 
    { top.ast = d.ast;
      d.givenStmt = s.ast;
    }
    action {
      context = closeScope(context); -- Opened by InitialNestedFunctionDefinition.
    }
closed tracked nonterminal InitialNestedFunctionDefinition_c with ast<ast:FunctionDecl>, givenStmt;
concrete productions top::InitialNestedFunctionDefinition_c
| ds::DeclarationSpecifiers_c  d::Declarator_c
    {
      ds.givenQualifiers = ds.typeQualifiers;
      d.givenType = ast:baseTypeExpr();

      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers( ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);

      local specialSpecifiers :: ast:SpecialSpecifiers =
        foldr(ast:consSpecialSpecifier, ast:nilSpecialSpecifier(), ds.specialSpecifiers);

      top.ast =
        ast:nestedFunctionDecl(ast:foldStorageClass(ds.storageClass), specialSpecifiers, bt, d.ast, d.declaredIdent, ds.attributes, ast:foldDecl([]), top.givenStmt);
    }
    action {
      -- TODO: we have to duplicate this more. yaaay...
      context = beginFunctionScope(d.declaredIdent, Identifier_t, d.declaredParamIdents, Identifier_t, context);
    }

concrete productions top::InitDeclarator_c
| d::Declarator_c  aa::Attributes_c
    precedence = 20 -- See DeclarationSpecifiers below.
    { top.declaredIdent = d.declaredIdent;
      d.givenType = ast:baseTypeExpr();
      top.ast =
        [ast:declarator(d.declaredIdent, d.ast, aa.ast, ast:nothingInitializer())];
    }
| d::Declarator_c  aa::Attributes_c  '='  i::Initializer_c
    { top.declaredIdent = d.declaredIdent;
      d.givenType = ast:baseTypeExpr();
      top.ast =
        [ast:declarator(d.declaredIdent, d.ast, aa.ast, ast:justInitializer(i.ast))];
    }
| d::Declarator_c  a::SimpleAsmStatement_c
    operator=Cpp_Attribute_high_prec
    { top.declaredIdent = d.declaredIdent;
      d.givenType = ast:baseTypeExpr();
      top.ast =
        [ast:declarator(d.declaredIdent, d.ast, ast:consAttribute(ast:simpleAsm(a.ast), ast:nilAttribute()), ast:nothingInitializer())];
    }
| d::Declarator_c  a::SimpleAsmStatement_c  aa::Attributes_c
    operator=Cpp_Attribute_high_prec
    { top.declaredIdent = d.declaredIdent;
      d.givenType = ast:baseTypeExpr();
      top.ast =
        [ast:declarator(d.declaredIdent, d.ast, ast:consAttribute(ast:simpleAsm(a.ast), aa.ast), ast:nothingInitializer())];
    }


concrete productions top::DeclarationSpecifiers_c
| h::Attributes_c  t::DeclarationSpecifiers_c
    { top.isTypedef = t.isTypedef;
      top.storageClass = t.storageClass;
      top.preTypeSpecifiers = t.preTypeSpecifiers;
      top.realTypeSpecifiers = t.realTypeSpecifiers;
      top.typeQualifiers = t.typeQualifiers;
      top.specialSpecifiers = t.specialSpecifiers;
      top.mutateTypeSpecifiers = t.mutateTypeSpecifiers;
      top.attributes = ast:appendAttribute(h.ast, t.attributes); }
| h::Attributes_c
    precedence = 10 -- See InitDeclarator above.
    -- Looking at a function decl: DeclarationSpecifiers Declarator . DeclarationList CompoundStatement
    -- We choose to make it part of the declarator, always, not as a DeclSpec for the DeclarationList.
    { top.isTypedef = false;
      top.storageClass = [];
      top.preTypeSpecifiers = [];
      top.realTypeSpecifiers = [];
      top.typeQualifiers = ast:nilQualifier();
      top.specialSpecifiers = [];
      top.mutateTypeSpecifiers = [];
      top.attributes = h.ast; }

concrete productions top::SpecifierQualifierList_c
| h::Attributes_c  t::SpecifierQualifierList_c
    { top.preTypeSpecifiers = t.preTypeSpecifiers;
      top.realTypeSpecifiers = t.realTypeSpecifiers;
      top.typeQualifiers = t.typeQualifiers;
      top.mutateTypeSpecifiers = t.mutateTypeSpecifiers;
      top.specialSpecifiers = t.specialSpecifiers;
      top.attributes = ast:appendAttribute(h.ast, t.attributes); }
| h::Attributes_c 
    { top.preTypeSpecifiers = [];
      top.realTypeSpecifiers = [];
      top.typeQualifiers = ast:nilQualifier();
      top.mutateTypeSpecifiers = [];
      top.specialSpecifiers = [];
      top.attributes = h.ast; }

{- These failures if these are removed. They don't *seem* to be a new type of qualifier, not sure.
  ./tests/gcc/default/positive/fail_always_inline2.c at   416 	 __attribute__ ((__nothrow__)) realpath (__const ch
              ./tests/gcc/compile/positive/pr50287.c at  1645 	 __attribute__((noinline,noclone)) 
            ./tests/gcc/compile/positive/attr-nest.c at   211 	 __attribute__ ((format (printf, 1, 2)))) (const ch

  The trouble is that gcc accepts some sort of __attribute__ before the name of a function in its declarator.
  There is no obvious place to put this in the concrete syntax.
  
  For now, we've just disabled these tests and are punting on this bit of syntax. TODO
  
  This was the old solution, but it makes no sense, really:

concrete productions top::TypeQualifierList_c
| h::Attributes_c  t::TypeQualifierList_c
    { top.typeQualifiers = t.typeQualifiers;
      top.mutateTypeSpecifiers = t.mutateTypeSpecifiers;
      top.specialSpecifiers = t.specialSpecifiers;
      top.attributes = h.ast ++ t.attributes; }
| h::Attributes_c
    { top.typeQualifiers = [];
      top.mutateTypeSpecifiers = [];
      top.specialSpecifiers = [];
      top.attributes = h.ast; }
-}



-- GCC must lie. This is ambiguous with the following syntax.
--concrete productions top::StructDeclaration_c
--| sqs::SpecifierQualifierList_c sds::StructDeclaratorList_c aa::Attributes_c ';'
--    {}

concrete productions top::StructDeclarator_c
| d::Declarator_c  aa::Attributes_c
    { top.ast =
        [ast:structField(d.declaredIdent, d.ast, aa.ast)]; }
| d::Declarator_c ':' e::ConstantExpr_c  aa::Attributes_c
    { top.ast = 
        [ast:structBitfield(ast:justName(d.declaredIdent), d.ast, e.ast, aa.ast)]; }
| ':' e::ConstantExpr_c  aa::Attributes_c
    { top.ast = 
        [ast:structBitfield(ast:nothingName(), top.givenType, e.ast, aa.ast)]; }


concrete productions top::StructOrUnionSpecifier_c
| su::StructOrUnion_c aa::Attributes_c id::Identifier_c TypeLCurly_t ss::StructDeclarationList_c '}'
    { top.realTypeSpecifiers =
        case su of
        | struct_c(_) -> [ast:structTypeExpr(top.givenQualifiers, ast:structDecl(aa.ast, ast:justName(id.ast), ast:foldStructItem(ss.ast)))]
        | union_c(_) -> [ast:unionTypeExpr(top.givenQualifiers, ast:unionDecl(aa.ast, ast:justName(id.ast), ast:foldStructItem(ss.ast)))]
        end;
    }
| su::StructOrUnion_c id::Identifier_c TypeLCurly_t '}'
    { top.realTypeSpecifiers =
        case su of
        | struct_c(_) -> [ast:structTypeExpr(top.givenQualifiers, ast:structDecl(ast:nilAttribute(), ast:justName(id.ast), ast:foldStructItem([])))]
        | union_c(_) -> [ast:unionTypeExpr(top.givenQualifiers, ast:unionDecl(ast:nilAttribute(), ast:justName(id.ast), ast:foldStructItem([])))]
        end; }
| su::StructOrUnion_c TypeLCurly_t '}'
    { top.realTypeSpecifiers =
        case su of
        | struct_c(_) -> [ast:structTypeExpr(top.givenQualifiers, ast:structDecl(ast:nilAttribute(), ast:nothingName(), ast:foldStructItem([])))]
        | union_c(_) -> [ast:unionTypeExpr(top.givenQualifiers, ast:unionDecl(ast:nilAttribute(), ast:nothingName(), ast:foldStructItem([])))]
        end; }

------------------
-- Parsing conflict.  We could be at:

--  abstract-declarator:  '(' . ParameterTypeList ')'
--    direct-declarator:  '(' . attributes declarator ')'

-- Normally, these two cases are distinguished by the presence of DeclarationSpecifiers,
-- but of course, we've added attributes to that.

-- TODO: we NEED a solution to this syntax problem, because it will cause incorrect
-- recognition as an abstract rather than direct declarator
-- and that might lead to incorrect parse.

--concrete productions top::DirectDeclarator_c
--| '(' Attributes_c d::Declarator_c ')'
--    { top.declaredIdents = d.declaredIdents;
--      top.declaredParamIdents = d.declaredParamIdents;
--    }

-- Here, we might be at:

-- abstract-declarator:  '(' . ParameterTypeList ')'
-- abstract-declarator:  '(' . Attributes AbstractDeclarator ')'

-- Again, normally distinguished by presence of DeclarationSpecifiers.

--concrete productions top::DirectAbstractDeclarator_c
--| '(' Attributes_c d::AbstractDeclarator_c ')'
--    {}

-- If we forced a shift, we'd need this production to repair the parse.
--| '(' Attributes_c ptl::ParameterTypeList_c ')'
--    {}
------------------------


-- TODO: conflict with attributes in typequalifierlist above? what context?
concrete productions top::ParameterDeclaration_c
| ds::DeclarationSpecifiers_c  d::Declarator_c  aa::Attributes_c
    { top.declaredIdents = [d.declaredIdent];
      ds.givenQualifiers = ds.typeQualifiers;
      d.givenType = ast:baseTypeExpr();
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers( ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
      top.ast = ast:parameterDecl(ast:foldStorageClass(ds.storageClass), bt, d.ast, ast:justName(d.declaredIdent), ast:appendAttribute(ds.attributes, aa.ast));
      }
| ds::DeclarationSpecifiers_c  d::AbstractDeclarator_c  aa::Attributes_c
    { top.declaredIdents = [];
      ds.givenQualifiers = ds.typeQualifiers;
      d.givenType = ast:baseTypeExpr();
      local bt :: ast:BaseTypeExpr =
        ast:figureOutTypeFromSpecifiers( ds.typeQualifiers, ds.preTypeSpecifiers, ds.realTypeSpecifiers, ds.mutateTypeSpecifiers);
      top.ast = ast:parameterDecl(ast:foldStorageClass(ds.storageClass), bt, d.ast, ast:nothingName(), ast:appendAttribute(ds.attributes, aa.ast));
    }
-- wtf gcc, first declspecs have attributes and then they're supposed to appear here??
--| dspecs::DeclarationSpecifiers_c Attributes_c
--    { top.declaredIdents = []; }

