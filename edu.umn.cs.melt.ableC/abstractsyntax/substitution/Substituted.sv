grammar edu:umn:cs:melt:ableC:abstractsyntax:substitution;

imports silver:langutil;
imports silver:langutil:pp with implode as ppImplode;

imports edu:umn:cs:melt:ableC:abstractsyntax;
imports edu:umn:cs:melt:ableC:abstractsyntax:env;
imports edu:umn:cs:melt:ableC:abstractsyntax:construction;
imports edu:umn:cs:melt:ableC:abstractsyntax:overload as ovrld;

{--
 - Framework for performing substitutions on ASTs
 -
 - The functor attribute 'substituted' computes a transformation to generate a tree with the
 - rewrites specified by the 'substitutions' attribute.  substitutions is a list of Substitutions,
 - which each can recive inherited attributes to see what is being substituted, and synthesised
 - attributes corresponding to the result of performing a substitution.  
 -
 - In every production that would potenitally want to perform a substitution, the incoming
 - subsitutions are decorated with the relavent parameters and the corresponding Maybe attribute
 - is accessed, to possibly find a value for substituted different than the current node.  
 -
 - Since this transformation is env-independant, productions that forward based on the env must
 - propagate substituted.  It is recommended, however, that all productions do this anyway, similar
 - to pp.  
 - 
 - Substitution is a closed nonterminal in the same way as Def, as extensions may wish to specify
 - new substitutions to perform on extension prodctions.  However, extensions cannot specify a new
 - substitution for a host production, since there is no way of specifying a new equation for the
 - substituted attribute on a host production.   
 -}

autocopy attribute substitutions::Substitutions;
synthesized attribute substituted<a>::a;

autocopy attribute nameIn::String;
synthesized attribute nameSub::Maybe<Name>;
synthesized attribute typedefSub::Maybe<Type>;
synthesized attribute declRefSub::Maybe<Expr>;
synthesized attribute stmtSub::Maybe<Stmt>;

nonterminal Substitutions with nameIn, nameSub, typedefSub, declRefSub, stmtSub;

abstract production consSubstitution
top::Substitutions ::= h::Substitution t::Substitutions
{
  top.nameSub = orElse(h.nameSub, t.nameSub);
  top.typedefSub = orElse(h.typedefSub, t.typedefSub);
  top.declRefSub = orElse(h.declRefSub, t.declRefSub);
  top.stmtSub = orElse(h.stmtSub, t.stmtSub);
}

abstract production nilSubstitution
top::Substitutions ::= 
{
  top.nameSub = nothing();
  top.typedefSub = nothing();
  top.declRefSub = nothing();
  top.stmtSub = nothing();
}

closed nonterminal Substitution with nameIn, nameSub, typedefSub, declRefSub, stmtSub;

aspect default production
top::Substitution ::= 
{
  top.nameSub = nothing();
  top.typedefSub = nothing();
  top.declRefSub = nothing();
  top.stmtSub = nothing();
}

-- Substitutes a name for another name in all places
abstract production nameSubstitution
top::Substitution ::= name::String sub::Name
{
  top.nameSub = if top.nameIn == name then just(sub) else nothing();
}

-- Substitutes a typedef name for a type
abstract production typedefSubstitution
top::Substitution ::= name::String type::Type
{
  top.typedefSub = if top.nameIn == name then just(type) else nothing();
}

-- Substitutes a value name for an expression
abstract production declRefSubstitution
top::Substitution ::= name::String sub::Expr
{
  top.declRefSub = if top.nameIn == name then just(sub) else nothing();
}

-- Substitutes an exprStmt that is a declRefExpr for another statment
abstract production stmtSubstitution
top::Substitution ::= name::String sub::Stmt
{
  top.stmtSub = if top.nameIn == name then just(sub) else nothing();
}

-- 'occurs on' definitions for every nonterminal
attribute substitutions occurs on
  AsmStatement, AsmArgument, AsmClobbers, AsmOperands, AsmOperand,
  Attribute, Attribs, Attrib, AttribName,
  Decls, Decl, Declarators, Declarator, FunctionDecl, Parameters, ParameterDecl,
    StructDecl, UnionDecl, EnumDecl, StructItemList, EnumItemList,
    StructItem, StructDeclarators, StructDeclarator, EnumItem,
  Expr, GenericAssocs, GenericAssoc,
  BinOp, AssignOp, BoolOp, BitOp, CompareOp, NumOp,
  MemberDesignator,
  NumericConstant,
  MaybeExpr, Exprs, ExprOrTypeName,
  UnaryOp, UnaryTypeOp,
  MaybeInitializer, Initializer, InitList, Init, Designator,
  Name, MaybeName,
  Stmt,
  TypeName, BaseTypeExpr, TypeModifierExpr, TypeNames,
  Qualifier, SpecialSpecifier,
  Type, ArrayType, FunctionType, TagType, NoncanonicalType,
  BuiltinType, RealType, IntegerType;

attribute substituted<AsmStatement> occurs on AsmStatement;
attribute substituted<AsmArgument> occurs on AsmArgument;
attribute substituted<AsmClobbers> occurs on AsmClobbers;
attribute substituted<AsmOperands> occurs on AsmOperands;
attribute substituted<AsmOperand> occurs on AsmOperand;
attribute substituted<Attribute> occurs on Attribute;
attribute substituted<Attribs> occurs on Attribs;
attribute substituted<Attrib> occurs on Attrib;
attribute substituted<AttribName> occurs on AttribName;
attribute substituted<Decls> occurs on Decls;
attribute substituted<Decl> occurs on Decl;
attribute substituted<Declarators> occurs on Declarators;
attribute substituted<Declarator> occurs on Declarator;
attribute substituted<FunctionDecl> occurs on FunctionDecl;
attribute substituted<Parameters> occurs on Parameters;
attribute substituted<ParameterDecl> occurs on ParameterDecl;
attribute substituted<StructDecl> occurs on StructDecl;
attribute substituted<UnionDecl> occurs on UnionDecl;
attribute substituted<EnumDecl> occurs on EnumDecl;
attribute substituted<StructItemList> occurs on StructItemList;
attribute substituted<EnumItemList> occurs on EnumItemList;
attribute substituted<StructItem> occurs on StructItem;
attribute substituted<StructDeclarators> occurs on StructDeclarators;
attribute substituted<StructDeclarator> occurs on StructDeclarator;
attribute substituted<EnumItem> occurs on EnumItem;
attribute substituted<Expr> occurs on Expr;
attribute substituted<GenericAssocs> occurs on GenericAssocs;
attribute substituted<GenericAssoc> occurs on GenericAssoc;
attribute substituted<BinOp> occurs on BinOp;
attribute substituted<AssignOp> occurs on AssignOp;
attribute substituted<BoolOp> occurs on BoolOp;
attribute substituted<BitOp> occurs on BitOp;
attribute substituted<CompareOp> occurs on CompareOp;
attribute substituted<NumOp> occurs on NumOp;
attribute substituted<MemberDesignator> occurs on MemberDesignator;
attribute substituted<NumericConstant> occurs on NumericConstant;
attribute substituted<MaybeExpr> occurs on MaybeExpr;
attribute substituted<Exprs> occurs on Exprs;
attribute substituted<ExprOrTypeName> occurs on ExprOrTypeName;
attribute substituted<UnaryOp> occurs on UnaryOp;
attribute substituted<UnaryTypeOp> occurs on UnaryTypeOp;
attribute substituted<MaybeInitializer> occurs on MaybeInitializer;
attribute substituted<Initializer> occurs on Initializer;
attribute substituted<InitList> occurs on InitList;
attribute substituted<Init> occurs on Init;
attribute substituted<Designator> occurs on Designator;
attribute substituted<Name> occurs on Name;
attribute substituted<MaybeName> occurs on MaybeName;
attribute substituted<Stmt> occurs on Stmt;
attribute substituted<TypeName> occurs on TypeName;
attribute substituted<BaseTypeExpr> occurs on BaseTypeExpr;
attribute substituted<TypeModifierExpr> occurs on TypeModifierExpr;
attribute substituted<TypeNames> occurs on TypeNames;
attribute substituted<Qualifier> occurs on Qualifier;
attribute substituted<SpecialSpecifier> occurs on SpecialSpecifier;
attribute substituted<Type> occurs on Type;
attribute substituted<ArrayType> occurs on ArrayType;
attribute substituted<FunctionType> occurs on FunctionType;
attribute substituted<TagType> occurs on TagType;
attribute substituted<NoncanonicalType> occurs on NoncanonicalType;
attribute substituted<BuiltinType> occurs on BuiltinType;
attribute substituted<RealType> occurs on RealType;
attribute substituted<IntegerType> occurs on IntegerType;
