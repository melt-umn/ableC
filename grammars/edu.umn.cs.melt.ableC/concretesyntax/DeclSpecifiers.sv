grammar edu:umn:cs:melt:ableC:concretesyntax;

-- This file is separate from Declarations.sv because there are only a few
-- symbols it "exports" which hide quite a lot of syntax beneath them,
-- but only ever get referenced through the few "exported" symbols.

{--
 - Identifies whether 'typedef' appeared in the declaration specifiers.
 - We keep this separate from the other storage classes, as it's not really
 - a storage class at all, and the abstract syntax treats it differently.
 -}
synthesized attribute isTypedef :: Boolean;
{--
 - Identifies the storage class of this set of declaration specifiers.
 -}
synthesized attribute storageClass :: [ast:StorageClass];
{--
 - A list of not-yet interpreted (hence, Pre-) type specifiers
 - e.g. ["long", "long"]
 - This is mutually exclusive with realTypeSpecifiers.
 - @see interpretTypeSpecifiers in AstContructionHelpers.sv
 -}
synthesized attribute preTypeSpecifiers :: [String];
{--
 - A list of "real" type specifiers, e.g. "struct Foo"
 - where only exactly one specifier is permitted.
 - This is mutually exclusive with preTypeSpecifiers.
 -}
synthesized attribute realTypeSpecifiers :: [ast:BaseTypeExpr];
{--
 - Mutators for type specifiers, there should only ever be 0 or 1.
 - This is for C11 _Atomic, but we have to put it here.
 -}
synthesized attribute mutateTypeSpecifiers :: [ast:TypeSpecifierMutator];
{--
 - A list of type qualifiers.
 -}
synthesized attribute typeQualifiers :: ast:Qualifiers;
{--
 - A list of special specifiers (e.g. inline, noreturn, alignas)
 -}
synthesized attribute specialSpecifiers :: [ast:SpecialSpecifier];
{--
 - A list of the qualifiers attached to this declaration, somehow.
 -}
autocopy attribute givenQualifiers :: ast:Qualifiers;
{--
 - The __attribute__s that appear in the list.
 - This is a gcc extension, but we need this here.
 -}
synthesized attribute attributes :: ast:Attributes;

{-
 - This is needed to handle the ambiguity introduced by C11 repeated typedefs.
 - In typedef int a; typedef int a; the second a must be disambiguated as an
 - Identifier_t, not a TypeName_t, once we have already seen a type specifier.
 -}
parser attribute seenTypeSpecifier::Boolean action { seenTypeSpecifier = false; };

-- "Exported" symbols. These are used elsewhere in the C grammar.


closed nonterminal DeclarationSpecifiers_c with location, isTypedef, storageClass, preTypeSpecifiers, realTypeSpecifiers, typeQualifiers, specialSpecifiers, givenQualifiers, mutateTypeSpecifiers, attributes;
concrete productions top::DeclarationSpecifiers_c
| h::StorageClassSpecifier_c  t::DeclarationSpecifiers_c
    { top.isTypedef = h.isTypedef || t.isTypedef;
      top.storageClass = h.storageClass ++ t.storageClass;
      top.preTypeSpecifiers = t.preTypeSpecifiers;
      top.realTypeSpecifiers = t.realTypeSpecifiers;
      top.typeQualifiers = t.typeQualifiers;
      top.specialSpecifiers = t.specialSpecifiers;
      top.mutateTypeSpecifiers = t.mutateTypeSpecifiers;
      top.attributes = t.attributes; }
| h::StorageClassSpecifier_c
    { top.isTypedef = h.isTypedef;
      top.storageClass = h.storageClass;
      top.preTypeSpecifiers = [];
      top.realTypeSpecifiers = [];
      top.typeQualifiers = ast:nilQualifier();
      top.specialSpecifiers = [];
      top.mutateTypeSpecifiers = [];
      top.attributes = ast:nilAttribute(); }
| h::TypeSpecifierItem_c  t::DeclarationSpecifiers_c
    { top.isTypedef = t.isTypedef;
      top.storageClass = t.storageClass;
      top.preTypeSpecifiers = h.preTypeSpecifiers ++ t.preTypeSpecifiers;
      top.realTypeSpecifiers = h.realTypeSpecifiers ++ t.realTypeSpecifiers;
      top.typeQualifiers = t.typeQualifiers;
      top.specialSpecifiers = t.specialSpecifiers;
      top.mutateTypeSpecifiers = t.mutateTypeSpecifiers;
      top.attributes = t.attributes; }
    action { seenTypeSpecifier = false; }
| h::TypeSpecifierItem_c
    { top.isTypedef = false;
      top.storageClass = [];
      top.preTypeSpecifiers = h.preTypeSpecifiers;
      top.realTypeSpecifiers = h.realTypeSpecifiers;
      top.typeQualifiers = ast:nilQualifier();
      top.specialSpecifiers = [];
      top.mutateTypeSpecifiers = [];
      top.attributes = ast:nilAttribute(); }
    action { seenTypeSpecifier = false; }
| h::TypeQualifier_c  t::DeclarationSpecifiers_c
    { top.isTypedef = t.isTypedef;
      top.storageClass = t.storageClass;
      top.preTypeSpecifiers = t.preTypeSpecifiers;
      top.realTypeSpecifiers = t.realTypeSpecifiers;
      top.typeQualifiers = ast:qualifierCat(h.typeQualifiers, t.typeQualifiers);
      top.specialSpecifiers = t.specialSpecifiers;
      top.mutateTypeSpecifiers = h.mutateTypeSpecifiers ++ t.mutateTypeSpecifiers;
      top.attributes = t.attributes; }
| h::TypeQualifier_c
    { top.isTypedef = false;
      top.storageClass = [];
      top.preTypeSpecifiers = [];
      top.realTypeSpecifiers = [];
      top.typeQualifiers = h.typeQualifiers;
      top.specialSpecifiers = [];
      top.mutateTypeSpecifiers = h.mutateTypeSpecifiers;
      top.attributes = ast:nilAttribute(); }
| h::FunctionSpecifier_c  t::DeclarationSpecifiers_c
    { top.isTypedef = t.isTypedef;
      top.storageClass = t.storageClass;
      top.preTypeSpecifiers = t.preTypeSpecifiers;
      top.realTypeSpecifiers = t.realTypeSpecifiers;
      top.typeQualifiers = t.typeQualifiers; 
      top.specialSpecifiers = h.specialSpecifiers ++ t.specialSpecifiers;
      top.mutateTypeSpecifiers = t.mutateTypeSpecifiers;
      top.attributes = t.attributes; }
| h::FunctionSpecifier_c
    { top.isTypedef = false;
      top.storageClass = [];
      top.preTypeSpecifiers = [];
      top.realTypeSpecifiers = [];
      top.typeQualifiers = ast:nilQualifier();
      top.specialSpecifiers = h.specialSpecifiers;
      top.mutateTypeSpecifiers = [];
      top.attributes = ast:nilAttribute(); }

closed nonterminal InitiallyUnqualifiedDeclarationSpecifiers_c with location, isTypedef, storageClass, preTypeSpecifiers, realTypeSpecifiers, typeQualifiers, specialSpecifiers, givenQualifiers, mutateTypeSpecifiers, attributes;
concrete productions top::InitiallyUnqualifiedDeclarationSpecifiers_c
| h::StorageClassSpecifier_c  t::DeclarationSpecifiers_c
    { top.isTypedef = h.isTypedef || t.isTypedef;
      top.storageClass = h.storageClass ++ t.storageClass;
      top.preTypeSpecifiers = t.preTypeSpecifiers;
      top.realTypeSpecifiers = t.realTypeSpecifiers;
      top.typeQualifiers = t.typeQualifiers;
      top.specialSpecifiers = t.specialSpecifiers;
      top.mutateTypeSpecifiers = t.mutateTypeSpecifiers;
      top.attributes = t.attributes; }
| h::StorageClassSpecifier_c
    { top.isTypedef = h.isTypedef;
      top.storageClass = h.storageClass;
      top.preTypeSpecifiers = [];
      top.realTypeSpecifiers = [];
      top.typeQualifiers = ast:nilQualifier();
      top.specialSpecifiers = [];
      top.mutateTypeSpecifiers = [];
      top.attributes = ast:nilAttribute(); }
| h::TypeSpecifierItem_c  t::DeclarationSpecifiers_c
    { top.isTypedef = t.isTypedef;
      top.storageClass = t.storageClass;
      top.preTypeSpecifiers = h.preTypeSpecifiers ++ t.preTypeSpecifiers;
      top.realTypeSpecifiers = h.realTypeSpecifiers ++ t.realTypeSpecifiers;
      top.typeQualifiers = t.typeQualifiers;
      top.specialSpecifiers = t.specialSpecifiers;
      top.mutateTypeSpecifiers = t.mutateTypeSpecifiers;
      top.attributes = t.attributes; }
    action { seenTypeSpecifier = false; }
| h::TypeSpecifierItem_c
    { top.isTypedef = false;
      top.storageClass = [];
      top.preTypeSpecifiers = h.preTypeSpecifiers;
      top.realTypeSpecifiers = h.realTypeSpecifiers;
      top.typeQualifiers = ast:nilQualifier();
      top.specialSpecifiers = [];
      top.mutateTypeSpecifiers = [];
      top.attributes = ast:nilAttribute(); }
    action { seenTypeSpecifier = false; }
| h::FunctionSpecifier_c  t::DeclarationSpecifiers_c
    { top.isTypedef = t.isTypedef;
      top.storageClass = t.storageClass;
      top.preTypeSpecifiers = t.preTypeSpecifiers;
      top.realTypeSpecifiers = t.realTypeSpecifiers;
      top.typeQualifiers = t.typeQualifiers; 
      top.specialSpecifiers = h.specialSpecifiers ++ t.specialSpecifiers;
      top.mutateTypeSpecifiers = t.mutateTypeSpecifiers;
      top.attributes = t.attributes; }
| h::FunctionSpecifier_c
    { top.isTypedef = false;
      top.storageClass = [];
      top.preTypeSpecifiers = [];
      top.realTypeSpecifiers = [];
      top.typeQualifiers = ast:nilQualifier();
      top.specialSpecifiers = h.specialSpecifiers;
      top.mutateTypeSpecifiers = [];
      top.attributes = ast:nilAttribute(); }

closed nonterminal SpecifierQualifierList_c with location, preTypeSpecifiers, realTypeSpecifiers, typeQualifiers, givenQualifiers, mutateTypeSpecifiers, specialSpecifiers, attributes;
concrete productions top::SpecifierQualifierList_c
| h::TypeSpecifierItem_c  t::SpecifierQualifierList_c
    { top.preTypeSpecifiers = h.preTypeSpecifiers ++ t.preTypeSpecifiers;
      top.realTypeSpecifiers = h.realTypeSpecifiers ++ t.realTypeSpecifiers;
      top.typeQualifiers = t.typeQualifiers;
      top.mutateTypeSpecifiers = t.mutateTypeSpecifiers;
      top.specialSpecifiers = t.specialSpecifiers;
      top.attributes = t.attributes; }
    action { seenTypeSpecifier = false; }
| h::TypeSpecifierItem_c 
    { top.preTypeSpecifiers = h.preTypeSpecifiers;
      top.realTypeSpecifiers = h.realTypeSpecifiers;
      top.typeQualifiers = ast:nilQualifier();
      top.mutateTypeSpecifiers = [];
      top.specialSpecifiers = [];
      top.attributes = ast:nilAttribute(); }
    action { seenTypeSpecifier = false; }
| h::TypeQualifier_c  t::SpecifierQualifierList_c
    { top.preTypeSpecifiers = t.preTypeSpecifiers;
      top.realTypeSpecifiers = t.realTypeSpecifiers;
      top.typeQualifiers = ast:qualifierCat(h.typeQualifiers, t.typeQualifiers);
      top.mutateTypeSpecifiers = h.mutateTypeSpecifiers ++ t.mutateTypeSpecifiers;
      top.specialSpecifiers = t.specialSpecifiers;
      top.attributes = t.attributes; }
| h::TypeQualifier_c 
    { top.preTypeSpecifiers = [];
      top.realTypeSpecifiers = [];
      top.typeQualifiers = h.typeQualifiers;
      top.mutateTypeSpecifiers = h.mutateTypeSpecifiers;
      top.specialSpecifiers = [];
      top.attributes = ast:nilAttribute(); }

closed nonterminal TypeQualifierList_c with location, typeQualifiers, mutateTypeSpecifiers, specialSpecifiers, attributes;
concrete productions top::TypeQualifierList_c
| h::TypeQualifier_c
  operator=CPP_Attr_LowerPrec_t
    { top.typeQualifiers = h.typeQualifiers;
      top.mutateTypeSpecifiers = h.mutateTypeSpecifiers;
      top.specialSpecifiers = [];
      top.attributes = ast:nilAttribute(); }
| h::TypeQualifier_c  t::TypeQualifierList_c
    { top.typeQualifiers = ast:qualifierCat(h.typeQualifiers, t.typeQualifiers);
      top.mutateTypeSpecifiers = h.mutateTypeSpecifiers ++ t.mutateTypeSpecifiers;
      top.specialSpecifiers = t.specialSpecifiers;
      top.attributes = t.attributes; }


-- "Non-exported" symbols. These are only used directly in this file.

closed nonterminal StorageClassSpecifier_c with location, isTypedef, storageClass; 
concrete productions top::StorageClassSpecifier_c
| 'typedef'
    { top.isTypedef = true;
      top.storageClass = []; }
| 'extern'
    { top.isTypedef = false;
      top.storageClass = [ast:externStorageClass()]; }
| 'static'
    { top.isTypedef = false;
      top.storageClass = [ast:staticStorageClass()]; }
| 'auto'
    { top.isTypedef = false;
      top.storageClass = [ast:autoStorageClass()]; }
| 'register'
    { top.isTypedef = false;
      top.storageClass = [ast:registerStorageClass()]; }


-- Wrapper to set the parser attribute via reduce action
closed nonterminal TypeSpecifierItem_c with location, preTypeSpecifiers, realTypeSpecifiers, givenQualifiers;
concrete productions top::TypeSpecifierItem_c
| t::TypeSpecifier_c
    { top.realTypeSpecifiers = t.realTypeSpecifiers;
      top.preTypeSpecifiers = t.preTypeSpecifiers; }
  action { seenTypeSpecifier = true; }


closed nonterminal TypeSpecifier_c with location, preTypeSpecifiers, realTypeSpecifiers, givenQualifiers;
concrete productions top::TypeSpecifier_c
| 'void'
    { top.realTypeSpecifiers = [ast:builtinTypeExpr(top.givenQualifiers, ast:voidType())];
      top.preTypeSpecifiers = []; }
| 'char'
    { top.realTypeSpecifiers = [];
      top.preTypeSpecifiers = ["char"]; }
| 'short'
    { top.realTypeSpecifiers = [];
      top.preTypeSpecifiers = ["short"]; }
| 'int'
    { top.realTypeSpecifiers = [];
      top.preTypeSpecifiers = ["int"]; }
| 'long'
    { top.realTypeSpecifiers = [];
      top.preTypeSpecifiers = ["long"]; }
| 'float'
    { top.realTypeSpecifiers = [];
      top.preTypeSpecifiers = ["float"]; }
| 'double'
    { top.realTypeSpecifiers = [];
      top.preTypeSpecifiers = ["double"]; }
| 'signed'
    { top.realTypeSpecifiers = [];
      top.preTypeSpecifiers = ["signed"]; }
| 'unsigned'
    { top.realTypeSpecifiers = [];
      top.preTypeSpecifiers = ["unsigned"]; }
| '_Bool'
    { top.realTypeSpecifiers = [ast:builtinTypeExpr(top.givenQualifiers, ast:boolType())];
      top.preTypeSpecifiers = []; }
| '_Imaginary'
    { top.realTypeSpecifiers = [];
      top.preTypeSpecifiers = ["_Imaginary"]; }
| '_Complex'
    { top.realTypeSpecifiers = [];
      top.preTypeSpecifiers = ["_Complex"]; }
| s::StructOrUnionSpecifier_c 
    { top.realTypeSpecifiers = s.realTypeSpecifiers;
      top.preTypeSpecifiers = []; }
| e::EnumSpecifier_c
    { top.realTypeSpecifiers = e.realTypeSpecifiers;
      top.preTypeSpecifiers = []; }
| t::TypeIdName_c
    { top.realTypeSpecifiers = [ast:typedefTypeExpr(top.givenQualifiers, t.ast)];
      top.preTypeSpecifiers = []; }


closed nonterminal TypeQualifier_c with location, typeQualifiers, mutateTypeSpecifiers; 
concrete productions top::TypeQualifier_c
| 'const'
    { top.typeQualifiers = ast:foldQualifier([ast:constQualifier(location=top.location)]);
      top.mutateTypeSpecifiers = []; }
| 'volatile'
    { top.typeQualifiers = ast:foldQualifier([ast:volatileQualifier(location=top.location)]);
      top.mutateTypeSpecifiers = []; }
| 'restrict'
    { top.typeQualifiers = ast:foldQualifier([ast:restrictQualifier(location=top.location)]);
      top.mutateTypeSpecifiers = []; }


closed nonterminal FunctionSpecifier_c with location, specialSpecifiers; 
concrete productions top::FunctionSpecifier_c
| 'inline'
    { top.specialSpecifiers = [ast:inlineQualifier()]; }


closed nonterminal StructOrUnionSpecifier_c with location, realTypeSpecifiers, givenQualifiers; 
concrete productions top::StructOrUnionSpecifier_c
| su::StructOrUnion_c id::Identifier_c TypeLCurly_t ss::StructDeclarationList_c '}'
  operator=CPP_Attr_LowerPrec_t
    { top.realTypeSpecifiers =
        case su of
        | struct_c(_) -> [ast:structTypeExpr(top.givenQualifiers, ast:structDecl(ast:nilAttribute(), ast:justName(id.ast), ast:foldStructItem(ss.ast), location=top.location))]
        | union_c(_) -> [ast:unionTypeExpr(top.givenQualifiers, ast:unionDecl(ast:nilAttribute(), ast:justName(id.ast), ast:foldStructItem(ss.ast), location=top.location))]
        end; }
| su::StructOrUnion_c TypeLCurly_t ss::StructDeclarationList_c '}'
  operator=CPP_Attr_LowerPrec_t
    { top.realTypeSpecifiers =
        case su of
        | struct_c(_) -> [ast:structTypeExpr(top.givenQualifiers, ast:structDecl(ast:nilAttribute(), ast:nothingName(), ast:foldStructItem(ss.ast), location=top.location))]
        | union_c(_) -> [ast:unionTypeExpr(top.givenQualifiers, ast:unionDecl(ast:nilAttribute(), ast:nothingName(), ast:foldStructItem(ss.ast), location=top.location))]
        end; }
| su::StructOrUnion_c id::Identifier_c
    { top.realTypeSpecifiers =
        case su of
        | struct_c(_) -> [ast:tagReferenceTypeExpr(top.givenQualifiers, ast:structSEU(), id.ast)]
        | union_c(_) -> [ast:tagReferenceTypeExpr(top.givenQualifiers, ast:unionSEU(), id.ast)]
        end; }


nonterminal StructOrUnion_c with location; 
concrete productions top::StructOrUnion_c
(struct_c) | 'struct'  {}
(union_c)  | 'union'  {}


closed nonterminal StructDeclarationList_c with location, ast<[ast:StructItem]>;
concrete productions top::StructDeclarationList_c
| h::StructDeclaration_c
    { top.ast = h.ast; }
| h::StructDeclarationList_c  t::StructDeclaration_c
    { top.ast = h.ast ++ t.ast; }


closed nonterminal StructDeclaration_c with location, ast<[ast:StructItem]>;
concrete productions top::StructDeclaration_c
| sqs::SpecifierQualifierList_c  decls::StructDeclaratorList_c ';'
    { top.ast = [ast:structItem(
        sqs.attributes,
        ast:figureOutTypeFromSpecifiers(sqs.location, sqs.typeQualifiers, sqs.preTypeSpecifiers, sqs.realTypeSpecifiers, sqs.mutateTypeSpecifiers),
        ast:foldStructDeclarator(decls.ast))];
      sqs.givenQualifiers = sqs.typeQualifiers;
      decls.givenType = ast:baseTypeExpr();
    }


closed nonterminal StructDeclaratorList_c with location, ast<[ast:StructDeclarator]>, givenType;
concrete productions top::StructDeclaratorList_c
| h::StructDeclarator_c
    { top.ast = h.ast; }
| h::StructDeclaratorList_c  ','  t::StructDeclarator_c
    { top.ast = h.ast ++ t.ast; }


closed nonterminal StructDeclarator_c with location, ast<[ast:StructDeclarator]>, givenType; 
concrete productions top::StructDeclarator_c
| d::Declarator_c
    { top.ast = [ast:structField(d.declaredIdent, d.ast, d.attributes)]; }
| d::Declarator_c ':' e::ConstantExpr_c
    { top.ast = [ast:structBitfield(ast:justName(d.declaredIdent), d.ast, e.ast, d.attributes)]; }
| ':' e::ConstantExpr_c
    { top.ast = [ast:structBitfield(ast:nothingName(), top.givenType, e.ast, ast:nilAttribute())]; }


closed nonterminal EnumSpecifier_c with location, realTypeSpecifiers, givenQualifiers; 
concrete productions top::EnumSpecifier_c
| 'enum' TypeLCurly_t en::EnumeratorList_c '}'
    { top.realTypeSpecifiers = [ast:enumTypeExpr(top.givenQualifiers, ast:enumDecl(ast:nothingName(), ast:foldEnumItem(en.ast), location=top.location))]; }
| 'enum' id::Identifier_c TypeLCurly_t en::EnumeratorList_c '}'
    { top.realTypeSpecifiers = [ast:enumTypeExpr(top.givenQualifiers, ast:enumDecl(ast:justName(id.ast), ast:foldEnumItem(en.ast), location=top.location))]; }
| 'enum' TypeLCurly_t en::EnumeratorList_c ',' '}'
    { top.realTypeSpecifiers = [ast:enumTypeExpr(top.givenQualifiers, ast:enumDecl(ast:nothingName(), ast:foldEnumItem(en.ast), location=top.location))]; }
| 'enum' id::Identifier_c TypeLCurly_t en::EnumeratorList_c ',' '}'
    { top.realTypeSpecifiers = [ast:enumTypeExpr(top.givenQualifiers, ast:enumDecl(ast:justName(id.ast), ast:foldEnumItem(en.ast), location=top.location))]; }
| 'enum' id::Identifier_c
    { top.realTypeSpecifiers = [ast:tagReferenceTypeExpr(top.givenQualifiers, ast:enumSEU(), id.ast)]; }


closed nonterminal EnumeratorList_c with location, ast<[ast:EnumItem]>;
concrete productions top::EnumeratorList_c
| h::Enumerator_c
    { top.ast = h.ast; }
| h::EnumeratorList_c  ','  t::Enumerator_c
    { top.ast = h.ast ++ t.ast; }


closed nonterminal Enumerator_c with location, ast<[ast:EnumItem]>;
concrete productions top::Enumerator_c
| id::Identifier_c
    { top.ast = [ast:enumItem(id.ast, ast:nothingExpr())]; }
| id::Identifier_c '=' ce::ConstantExpr_c
    { top.ast = [ast:enumItem(id.ast, ast:justExpr(ce.ast))]; }


