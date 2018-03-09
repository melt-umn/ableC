
import edu:umn:cs:melt:ableC:abstractsyntax:host;
import edu:umn:cs:melt:ableC:abstractsyntax:env;
import silver:langutil;
import silver:testing;
import lib:extcore;

import edu:umn:cs:melt:exts:ableC:adt:abstractsyntax;

derive Arbitrary on ADTDecl, StmtClauses, ConstructorList, StmtClause, Constructor, Pattern, TypeNameList, PatternList;
derive Eq on ADTDecl, StmtClauses, ConstructorList, StmtClause, Constructor, Pattern, TypeNameList, PatternList;

-- Basic helpers for generating stuff

function generateArbitraryString
String ::= Integer
{
  return if genRand() < 0.5 then "x" else "y";
}
function generateArbitraryInteger
Integer ::= Integer
{
  return if genRand() < 0.5 then 0 else 1;
}
function generateArbitraryBoolean
Boolean ::= Integer
{
  return genRand() < 0.5;
}
function generateArbitraryList
[a] ::= f::(a ::= Integer) i::Integer
{
  return if i > 30 || genRand() < 0.5 then [] else f(i + 1) :: generateArbitraryList(f, i + 2);
}
function generateArbitraryMessage
Message ::= Integer
{
  return if genRand() < 0.5 then err(bogusLocation, "err1") else err(bogusLocation, "err2");
}

global bogusLocation :: Location = loc("<generated>", -1,-1,-1,-1,-1,-1);

function checkEqString
Boolean ::= l::String  r::String
{
  return l == r;
}
function checkEqInteger
Boolean ::= l::Integer  r::Integer
{
  return l == r;
}
function checkEqBoolean
Boolean ::= l::Boolean  r::Boolean
{
  return l && r || (!l && !r);
}
function checkEqMessage
Boolean ::= l::Message  r::Message
{
  -- we don't generate interesting location, so just bother with the message.
  return l.message == r.message;
}
function checkEqList
Boolean ::= f::(Boolean ::= a a) l::[a]  r::[a]
{
  return case l, r of
  | [], [] -> true
  | a::b, i::j -> f(a, i) && checkEqList(f, b, j)
  | _, _ -> false
  end;
}

-- Now for the meat!

derive Arbitrary on ArraySizeModifier, ArrayType, AsmArgument, AsmClobbers, AsmOperand, AsmOperands, AsmStatement, AssignOp, Attrib, AttribName, Attribute, BaseTypeExpr, BinOp, BitOp, BoolOp, BuiltinType, CharPrefix, CompareOp, Decl, Declarator, Declarators, Decls, Designator, EnumDecl, EnumItem, EnumItemList, Expr, ExprOrTypeName, Exprs, FloatSuffix, FunctionDecl, FunctionType, GenericAssoc, GenericAssocs, InitItem, Initializer, InitList, IntegerType, IntSuffix, MaybeExpr, MaybeInitializer, MaybeName, MemberDesignator, Name, NoncanonicalType, NumericConstant, NumOp, ParameterDecl, Parameters, Qualifier, RealType, Root, SpecialSpecifier, Stmt, StorageClass, StructDecl, StructDeclarator, StructDeclarators, StructItem, StructItemList, StructOrEnumOrUnion, TagType, Type, TypeModifierExpr, TypeName, UnaryOp, UnaryTypeOp, UnionDecl;

-- Custom stuff to make the above work!
function generateArbitraryListQualifier
[Qualifier] ::= current__depth::Integer
{
  return generateArbitraryList(generateArbitraryQualifier, current__depth);
}
function generateArbitraryListAttribute
[Attribute] ::= current__depth::Integer
{
  return generateArbitraryList(generateArbitraryAttribute, current__depth);
}
function generateArbitraryListMessage
[Message] ::= current__depth::Integer
{
  return generateArbitraryList(generateArbitraryMessage, current__depth);
}
function generateArbitraryListStorageClass
[StorageClass] ::= current__depth::Integer
{
  return generateArbitraryList(generateArbitraryStorageClass, current__depth);
}
function generateArbitraryListSpecialSpecifier
[SpecialSpecifier] ::= current__depth::Integer
{
  return generateArbitraryList(generateArbitrarySpecialSpecifier, current__depth);
}
function generateArbitraryListType
[Type] ::= current__depth::Integer
{
  return generateArbitraryList(generateArbitraryType, current__depth);
}
function generateArbitraryListAttrib
[Attrib] ::= current__depth::Integer
{
  return generateArbitraryList(generateArbitraryAttrib, current__depth);
}
function generateArbitraryListName
[Name] ::= current__depth::Integer
{
  return generateArbitraryList(generateArbitraryName, current__depth);
}



function generateArbitraryDecoratedExpr
Decorated Expr ::= current__depth::Integer
{
  -- Don't need to do a good job of this one, currently.
  return decorate generateArbitraryExpr(current__depth) with { env = emptyEnv(); };
}
function generateArbitraryDecoratedEnumDecl
Decorated EnumDecl ::= current__depth::Integer
{
  -- ditto
  return decorate generateArbitraryEnumDecl(current__depth) with { env = emptyEnv(); };
}



-- Equality checking?

derive Eq on ArraySizeModifier, ArrayType, AsmArgument, AsmClobbers, AsmOperand, AsmOperands, AsmStatement, AssignOp, Attrib, AttribName, Attribute, BaseTypeExpr, BinOp, BitOp, BoolOp, BuiltinType, CharPrefix, CompareOp, Decl, Declarator, Declarators, Decls, Designator, EnumDecl, EnumItem, EnumItemList, Expr, ExprOrTypeName, Exprs, FloatSuffix, FunctionDecl, FunctionType, GenericAssoc, GenericAssocs, InitItem, Initializer, InitList, IntegerType, IntSuffix, MaybeExpr, MaybeInitializer, MaybeName, MemberDesignator, Name, NoncanonicalType, NumericConstant, NumOp, ParameterDecl, Parameters, Qualifier, RealType, Root, SpecialSpecifier, Stmt, StorageClass, StructDecl, StructDeclarator, StructDeclarators, StructItem, StructItemList, StructOrEnumOrUnion, TagType, Type, TypeModifierExpr, TypeName, UnaryOp, UnaryTypeOp, UnionDecl;


-- Custom stuff to make the above work!
function checkEqListQualifier
Boolean ::= l::[Qualifier]  r::[Qualifier]
{
  return checkEqList(checkEqQualifier, l, r);
}
function checkEqListAttribute
Boolean ::= l::[Attribute]  r::[Attribute]
{
  return checkEqList(checkEqAttribute, l, r);
}
function checkEqListMessage
Boolean ::= l::[Message]  r::[Message]
{
  return checkEqList(checkEqMessage, l, r);
}
function checkEqListStorageClass
Boolean ::= l::[StorageClass]  r::[StorageClass]
{
  return checkEqList(checkEqStorageClass, l, r);
}
function checkEqListSpecialSpecifier
Boolean ::= l::[SpecialSpecifier]  r::[SpecialSpecifier]
{
  return checkEqList(checkEqSpecialSpecifier, l, r);
}
function checkEqListType
Boolean ::= l::[Type]  r::[Type]
{
  return checkEqList(checkEqType, l, r);
}
function checkEqListAttrib
Boolean ::= l::[Attrib]  r::[Attrib]
{
  return checkEqList(checkEqAttrib, l, r);
}
function checkEqListName
Boolean ::= l::[Name]  r::[Name]
{
  return checkEqList(checkEqName, l, r);
}



function checkEqDecoratedExpr
Boolean ::= l::Decorated Expr  r::Decorated Expr
{
  -- Don't need to do a good job of this one, currently.
  return checkEqExpr(new(l), new(r));
}
function checkEqDecoratedEnumDecl
Boolean ::= l::Decorated EnumDecl  r::Decorated EnumDecl
{
  -- ditto
  return checkEqEnumDecl(new(l), new(r));
}



mainTestSuite ablec_tests;

--equalityTest( checkEqListMessage(generateArbitraryRoot().errors, []) , true, Boolean, ablec_tests );


testFor ablec_tests: x :: Expr,
  let y :: Decorated Expr = decorate x with {env = emptyEnv();}
  in checkEqListMessage(y.errors, y.forward.errors)
  end;


--equalityTest( unsafeTrace(true, print(hackUnparse(generateArbitraryExpr(0)) ++ "\n\n", unsafeIO())), true, Boolean, ablec_tests);

-- let's find problems with defs

testFor ablec_tests: x :: Decl,
  let y :: Decorated Decl = decorate x with {env = emptyEnv();}
  in length(y.defs) == length(y.forward.defs)
  end;




