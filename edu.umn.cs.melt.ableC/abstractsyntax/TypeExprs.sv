grammar edu:umn:cs:melt:ableC:abstractsyntax;

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
 - TypeModifiersExpr are terminated by "baseTypeExpr" which provides a typerep
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

autocopy attribute baseType :: Type;

{-- The TypeExpr is upside down, so build pp from outside-in -}
synthesized attribute lpp :: Document;
synthesized attribute rpp :: Document;

{-- Resolve the TypeExpr into a Type -}
synthesized attribute typerep :: Type;
synthesized attribute typereps :: [Type];

{-- Used to transform away typeModifierTypeExpr -}
synthesized attribute typeModifiers :: [TypeModifierExpr];
autocopy attribute typeModifiersIn :: [TypeModifierExpr];

{-- Used to set the refId for a declaration via __attribute__ -}
autocopy attribute givenRefId :: Maybe<String>;

{-- Util attributes -}
synthesized attribute bty :: BaseTypeExpr;
synthesized attribute mty :: TypeModifierExpr;

nonterminal TypeName with env, typerep, bty, mty, pp, host<TypeName>, lifted<TypeName>, errors, globalDecls, defs, returnType, freeVariables;
flowtype TypeName = decorate {env, returnType}, bty {}, mty {};

{--
 - Corresponds to types obtainable from a TypeSpecifiers.
 -}
nonterminal BaseTypeExpr with env, typerep, pp, host<BaseTypeExpr>, lifted<BaseTypeExpr>, errors, globalDecls, typeModifiers, defs, givenRefId, returnType, freeVariables;
flowtype BaseTypeExpr = decorate {env, givenRefId, returnType}, typeModifiers {decorate};


{--
 - Mirrors Type somewhat, but these depend upon the environment.
 - Typically, these are just anchored somewhere to obtain the env,
 - and then turn into an environment-independent Type.
 -}
nonterminal TypeModifierExpr with env, typerep, lpp, rpp, host<TypeModifierExpr>, lifted<TypeModifierExpr>, isFunctionTypeExpr, baseType, typeModifiersIn, errors, globalDecls, returnType, freeVariables;
flowtype TypeModifierExpr = decorate {env, baseType, typeModifiersIn, returnType}, isFunctionTypeExpr {};

synthesized attribute isFunctionTypeExpr::Boolean;

nonterminal TypeNames with pps, host<TypeNames>, lifted<TypeNames>, env, typereps, count, errors, globalDecls, defs, returnType, freeVariables;
flowtype TypeNames = decorate {env, returnType}, count {};

