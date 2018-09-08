# Declarations
In this section we look at how the environment and declarations in ableC are structured.  In C, declarations and type expressions are closely intertwined, since type expressions may contain declarations and vice versa.  We will look at how type expressions are represented in ableC, and then how type expressions fit into the larger structure of declarations.  We will then take a look at how the concrete syntax for declarations is structured.  

## Environment
The environment in ableC is represented by an autocopy attribute, `env`, which flows down through most nonterminals in the AST.  On some nonterminals, such as `Decl`, `Stmt`, etc., a synthesized attribute `defs` occurs, which is a list of definitions to add to the environment.  The function `addEnv` adds a list of `Def` to an environment, in the current scope.  The function `openScope` on an environment will create a new scope, in which names are allowed that already are already present in a previous scope.  

The environment in C has multiple namespaces, for things such as values, tag types (structs, unions, enums), labels, and more.  In ableC, each namespace has a corresponding 'item' nonterminal, such as `ValueItem`, `LabelItem`, etc.  Each item also has a corresponding `Def` production to insert one of these items, paired with a name, into the environment, and a function to look up an item by name.  

`ValueItem` represents a value or type in the environment.  It has attributes `typerep`, to get the type of what is in the environment, and `sourceLocation`, the original location of what was declared.  This nonterminal has several constructors, each of which wraps the original declaration:
* `declaratorValueItem`, for typedefs and simple variable definitions.  This wraps a reference to a `Declarator`, more on what that is that later.  Note that typedefs and variable definitions have the same representation, since C attempts to handle these in the same way.  
* `functionValueItem`, for function declarations.  
* `builtinFunctionValueItem`, which is used for handling some compiler extensions that look like function calls.  Don't worry about this.  
* `fieldValueItem`, for a field in a struct.  Note that the same environment representation is used for a the contents of structs as for global values.  
* `enumValueItem`, for an item value in an enum.  
* `parameterValueItem`, for a function parameter.  
* `errorValueItem`, for handling error cases when there is no valid declaration.  

`TagItem` and `RefIdItem` are used for handling struct, enum, and union declarations.  In C, a struct or union is first declared when its tag name is used, such as when writing `struct foo` in a type expression.  The actual definition of the corresponding fields may follow immediately, or later in the program.  Before this definition, the tag type refers to an "incomplete type", which may be passed around as a pointer but may not be used directly in any way.  Defining the body must somehow update the original declaration to include this information.  In a compiler written in an imperative language, this can be implemented via mutation, but Silver lacks mutation. As a consequence, we have to simulate the "updating" of a forward declaration of a struct via another namespace of unique identifiers for structures, which we refer to as refIds.
When we see the initial declaration of the struct or union, we insert a `refIdTagItem` into the into the environment.  This includes a new refId, which is represented as a string.  The specific value of this identifier does not matter, except that it must be unique.  When the actual definition of the body is seen, whether or not the tag was forward-declared, we insert a `structRefIdItem` or `unionRefIdItem` that wraps a reference to the declaration into the environment.  
Enums are a bit simpler, since these cannot be forward-declared.  `enumTagItem` simply wraps the declaration of the enum directly.  
Thus, the representation of an `extType` for a struct, enum, or union wraps an `ExtType` corresponding to a `TagItem`.  When an expression has type `extType([], refIdExtType(structSEU(), "foo", "42"))`, to resolve the type of a member access, we simply look up the refId from the refId namespace, find the original declaration, and look up the field from the `tagEnv` on the declaration.  If the struct lacks a definition, then the refId lookup comes up empty, and an error may be raised.

`LabelItem` is used to store labels in the environment, which may be used in `goto` statements.  `labelItem` simply wraps a reference to the statement that is labeled.  Since labels must be visible in the entire block in which they were declared, not just afterwards, a second synthesized attribute `functionDefs` is used to compute defs visible to the entire scope.  Note that the `functionDefs` on a production affects the `env` provided to that production, and consequently cannot depend on `env`; thus when the forward for a production depends on `env`, `functionDefs` must be defined explicitly.  

`MiscItem` is for random stuff that doesn't fit in elsewhere.  `currentFunctionItem` stores a reference to the current function under the name "this_func".  This isn't used by the host anywhere, but may be useful to extensions.  The `emptyMiscItem` production is used to simply place a name in the `MiscItem` namespace.  An `emptyMiscItem` can be placed into the initial environment via command-line arguments passed to the driver, which in turn may be checked by an extension to enable or modify certain behavior.  

## Type expressions
Type expressions in C are somewhat strangely designed, since the language was created before many modern ideas in programming languages were invented.  A type expression in C consists of two parts: Base type expression, represented by the nonterminal `BaseTypeExpr`, are things like `int`, `char`, `foo` (a typedef'ed name), `struct bar`, etc. and type modifier expressions, represented by `TypeModifierExpr`, include `*`, `[]` and functions.  As an example, look at the following declaration:
```c
int a = 0, *b, *c[4][];
```
Here `int` is the base type expression, common for all declarations, and each variable being declared (referred to as a *declarator*) has a corresponding type modifier expression.  Let's look at how these are represented in ableC, in the file [TypeExprs.sv](../../edu.umn.cs.melt.ableC/abstractsyntax/host/TypeExprs.sv).

The first nonterminal here, `TypeName`, has a single production `typeName :: (TypeName ::= BaseTypeExpr TypeModifierExpr)` that pairs together a `BaseTypeExpr` and a `TypeModifierExpr`.  This is used in contexts where a type expression is written by itself, such as in a typecast.  

`BaseTypeExpr` has the following productions:
* `errorTypeExpr :: (BaseTypeExpr ::= [Message])`: error production for when there is no valid type expression.
* `warnTypeExpr :: (BaseTypeExpr ::= [Message] BaseTypeExpr)`: error production, can be used to attach additional errors to a valid `BaseTypeExpr`.
* `directTypeExpr :: (BaseTypeExpr ::= Type)`: A forwarding helper that converts a type back into a `BaseTypeExpr`, which is commonly useful in extensions.  
* `typeModifierTypeExpr :: (BaseTypeExpr ::= BaseTypeExpr TypeModifierExpr)`: Used in contexts where a `BaseTypeExpr` needs to translate into something that includes a `TypeModiferExpr`, for example when resolving `directTypeExpr` for a pointer type.  This production is considered part of the 'host language', even though it does not have a direct translation to C.  To resolve this, the ableC driver uses some additional attributes to perform a restructuring of the AST that eliminates these productions prior to generating C code.  
* `builtinTypeExpr :: (BaseTypeExpr ::= Qualifiers BuiltinType)`: represents type expressions for built-in types, such as `int`, `float`, `char`, etc.  These share a the `BuiltinType` nonterminal also used by `Type`.  
* `tagReferenceTypeExpr :: (BaseTypeExpr ::= Qualifiers StructOrEnumOrUnion Name)`: represents a reference to a struct, enum, or union that has already been declared.  `structTypeExpr`, `unionTypeExpr`, and `enumTypeExpr` all wrap actual declarations of these.
* `extTypeExpr :: (BaseTypeExpr ::= Qualifiers ExtType)`: represents an external "new" type introduced by an extension.
* `typedefTypeExpr :: (BaseTypeExpr ::= Qualifiers Name)`: represents a name for a typedef'ed type that must be looked up from the environment.  
* `attributedTypeExpr :: (BaseTypeExpr ::= Attributes BaseTypeExpr)`: used for GCC's `__attribute__` feature that allows for types to be further customized in some ways.  This will be discussed later on.  `atomicTypeExpr`, `vaListTypeExpr`, and `typeofTypeExpr` are all related to C11 or GCC extensions to C, which you will likely not need to use.  

A `TypeModifierExpr` is structured as a nested chain of modifiers, as opposed to the more flat structure of `BaseTypeExpr`.  It has the following productions:
* `baseTypeExpr :: (TypeModifierExpr ::= )`: The "bottom level" type expression, using the type of the corresponding `BaseTypeExpr`.  
* `pointerTypeExpr :: (TypeModifierExpr ::= Qualifiers TypeModifierExpr)`: Just a pointer to another type, wraps another `BaseTypeExpr`.  
* `arrayTypeExprWithExpr :: (TypeModifierExpr ::= TypeModifierExpr Qualifiers ArraySizeModifier Expr)` and `arrayTypeExprWithoutExpr :: (TypeModifierExpr ::= TypeModifierExpr Qualifiers ArraySizeModifier)`: Array type expressions, work similar to pointers.  Not used very often when writing extensions.  
* `functionTypeExprWithArgs :: (TypeModifierExpr ::= TypeModifierExpr Parameters Boolean)` and `functionTypeExprWithoutArgs :: (TypeModifierExpr ::=TypeModifierExpr [Name])`: Function types.  Here the "base type" is the return type, and this modifier type contains futher modifiers for the return type and includes the function parameters.  `functionTypeExprWithoutArgs` is for K&R C-style functions, where the parameter types were optional.  
* `parenTypeExpr :: (TypeModifierExpr ::= TypeModifierExpr)`: This just represent parentheses written by a user, and has no semantic meaning.  Its only purpose is to improve error messages.  

As a convenience to extension writers, we also provide a `TypeNames` nonterminal, simply a list of `TypeName`s, since this pattern is commonly found in extensions.  An example of the use of this may be found in [AbstractSyntax.sv](edu.umn.cs.melt.tutorials.ableC.tuple/abstractsyntax/AbstractSyntax.sv).  

To access the type corresponding to a type expression, the `typerep` attribute may be used, similarly to an expression.  On `TypeModifierExpr`, to compute the `typerep`, the `typerep` of the corresponding `BaseTypeExpr` is required; this is passed in via the `baseType` attribute.  
A `Type` may be also be converted back to its component type expressions; the attributes `baseTypeExpr` and `typeModifierExpr` may be used for this purpose.  `directTypeExpr` serves as a helper to do this conversion while preserving the `pp` and `typerep` of the parameter type.  This production simply forwards to the `baseTypeExpr` of the parameter `Type`, wrapped in `typeModifierTypeExpr` if `typeModifierExpr` from the type is anything but `directTypeExpr`.  

It is important to note that although types and type expressions may be converted, they are not equivalent.  A type expression `te` may contain declarations, while `directTypeExpr(te.typerep)` will refer to types declared within `te` without declaring them.  (On the other hand, `directTypeExpr(ty).typerep` *is* guaranteed to be the same as `ty`.)  
As a result of this, there are several invariants that must be kept by extension writers when dealing with type expressions, to avoid introducing missing or repeated declarations:
* A `BaseTypeExpr` `te` that is a child of a forwarding production should be included in the forward in some way exactly once.  If multiple uses of that type expression are required, `directTypeExpr(te.typerep)` should be used instead.
* The use of `te` should appear before any use of `directTypeExpr(te.typerep)` in the forward tree.
* If a transformation is performed on a type expression and used in the forward, the transformed type expression should still include any declarations in the original type expression.

## Declarations
The abstract syntax for declarations in ableC is very hierarchical, and is contained in the file [Decls.sv](../../edu.umn.cs.melt.ableC/abstractsyntax/Decls.sv).  At the top level of declarations, we have `GlobalDecls`, which correspond to the list of declarations at the top level of a file.  The `Decls` nonterminal is similar, but for non-global declarations.  A single declaration is represented by the `Decl` nonterminal, which has several productions.  

The `decls` production simply wraps `Decls` into a single `Decl`.  

The `variableDecls :: (Decl ::= [StorageClass] Attributes BaseTypeExpr Declarators)` production declares a list of variables with a common `BaseTypeExpr`, but possibly different `TypeModifierExpr`s, represented via `Declarators`.  Looking back at the example before
```c
int a = 0, *b, *c[4][];
```
we have `Declarator`s `a = 0`, `*b`, and `*c[4][]`.  A `Declarator` in turn is constructed via the `declarator :: (Declarator ::= Name TypeModifierExpr Attributes MaybeInitializer)` production.  The `MaybeInitializer` here corresponds to the optional initial value given to a declarator, and is either constructed as `nothingInitializer` or `justInitializer` from an `Initializer`.  An `Initializer` is either an `exprInitializer`, or an `objectInitializer` which is used to initialize the values of a struct, for example
```c
struct foo a = {1, 2.3, "abc"};
```
`variableDecls` also takes a list of `StorageClass`es, which are specifiers such as `const`, `static`, `register`, etc.  

The `typeExprDecl :: (Decl ::= Attributes BaseTypeExpr)` production consists of a base type expression written by itself, not attached to a declaration of anything else.  This is commonly used for writing a struct declaration or definition, which is actually a type expression not attached to anything.  

Since as mentioned earlier, C attempts to treat values and types the same way, the `typedefDecls` production is structured similarly to `variableDecls`.  The only difference is that there is no storage class provided and the declarators should not have initializers, since these are not applicable for types.  

The `functionDeclaration :: (Decl ::= FunctionDecl)` production declares a function.  Since we need to reference the original declaration of a function from the environment, we have the actual internals of declaring a function factored into the `FunctionDecl` nonterminal, constructed via `functionDecl :: (FunctionDecl ::= [StorageClass] [SpecialSpecifier] BaseTypeExpr TypeModifierExpr Name Attributes Decls Stmt)` production.  Here `SpecialSpecifier`s are a list of things such as `inline` or `_Noreturn`, and the `Decls` are a list of initial function-scope declarations as specified in K&R C.  The type expressions specify the overall type of the function - the `BaseTypeExpr` gives the base type of the return type, and the `TypeModifierExpr` must be a `functionTypeExprWithArgs` or `functionTypeExprWithoutArgs`.  
The `Parameters` used in `functionTypeExprWithArgs` are represented via a structure that is a list of `ParameterDecl`.  A `ParameterDecl` is constructed via the `parameterDecl :: (ParameterDecl ::= [StorageClass] BaseTypeExpr TypeModifierExpr MaybeName Attributes)` production.

The representations of `struct`s and `union`s in ableC are similar, so we will only discuss `struct`s for now.  A `StructDecl`, as used in `structTypeExpr`, is constructed by the `structDecl :: (StructDecl ::= Attributes MaybeName StructItemList)` production, where the `MaybeName` is a tag name to optionally be declared.  `StructItemList` is a list structure of `StructItem`s, each of which is a declaration found in the body of a struct.  These are constructed via the `structItem :: (StructItem ::= Attributes BaseTypeExpr StructDeclarators)` production, which has a similar structure to `typedefDecls`.  
A `StructDeclarator` differs from an ordinary `Declarator` in a couple of ways: First, these lack an initializer, since that does not make sense when declaring a struct field.  Secondly, in addition to the `structField` production (which is similar to ordinary `declarator`), there is also `structBitfield`, which represents a bitfield item in a struct, which also includes a constant expression for the size of the bitfield.  
An example of the use of these constructs for building a struct declaration may be found in [AbstractSyntax.sv](edu.umn.cs.melt.tutorials.ableC.tuple/abstractsyntax/AbstractSyntax.sv).  

`enum` declarations in ableC work similarly to `struct`s and `union`s, but are somewhat simpler.  An `EnumDecl` is constructed by `enumDecl :: (EnumDecl ::= MaybeName EnumItemList)`, where `EnumItemList` represents a series of `EnumItem`s.  These are constructed via the `enumItem :: (EnumItem ::= Name MaybeExpr)` production, with a name and an optional constant value expression.  

## Concrete syntax
At the top level in the ableC concrete syntax for a global declaration is the `ExternalDeclaration_c` nonterminal.  This can be either a `Declaration_c` (the root nonterminal for a declaration anywhere), or a `FunctionDefinition_c`, representing the actual definition (not a prototype) of a function.  

A `Declaration_c` consists of `DeclarationSpecifiers_c`, containing the complete specification of a type, and `InitDeclaratorList_c`, representing a list of declarators.  

*TODO: Expand this section with more implementation details...*

When introducing new extension type expressions, the `TypeSpecifier_c` nonterminal is typically extended to implement a new `BaseTypeExpr`.  New kinds of declarations that don't directly fit in to the framework of type expressions may extend `Declaration_c` directly.  An example of this may be seen in the concrete syntax for the example tuple extension, in [ConcreteSyntax.sv](edu.umn.cs.melt.tutorials.ableC.tuple/concretesyntax/ConcreteSyntax.sv).  

[Next section: Embedded domain specific languages](../embedded_dsl/)
