# Declarations
In this section we look at how the environment and declarations in ableC are structured.  In C, declarations and type expressions are closely intertwined, since type expressions may contain declarations and vice versa.  We will look at how type expressions are represented in ableC, and then how type expressions fit into the larger structure of declarations.  We will then take a look at how the concrete syntax for declarations is structured.  

# Environment
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
Thus, the representation of a `tagType` for a struct, enum, or union wraps a `TagType` corresponding to a `TagItem`.  When an expression has type `tagType([], refIdTagType(structSEU(), "foo", "42"))`, to resolve the type of a member access, we simply look up the refId from the refId namespace, find the original declaration, and look up the field from the `tagEnv` on the declaration.  If the struct lacks a definition, then the refId lookup comes up empty, and an error may be raised.  

`LabelItem` is used to store labels in the environment, which may be used in `goto` statements.  `labelItem` simply wraps a reference to the statement that is labeled.  Since labels must be visible in the entire block in which they were declared, not just afterwards, a second synthesized attribute `functiondefs` is used to compute defs visible to the entire scope. 

`MiscItem` is for random stuff that doesn't fit in elsewhere.  `currentFunctionItem` stores a reference to the current function under the name "this_func".  This isn't used by the host anywhere, but may be useful to extensions.  The `emptyMiscItem` production is used to simply place a name in the `MiscItem` namespace.  An `emptyMiscItem` can be placed into the initial environment via command-line arguments passed to the driver, which in turn may be checked by an extension to enable or modify certain behavior.  

# Type expressions
Type expressions in C are somewhat strangely designed, since the language was created before many modern ideas in programming languages were invented.  A type expression in C consists of two parts: Base type expression, represented by the nonterminal `BaseTypeExpr`, are things like `int`, `char`, `foo` (a typedef'ed name), `struct bar`, etc. and type modifier expressions, represented by `TypeModifierExpr`, include `*`, `[]` and functions.  As an example, look at the following declaration:
`c
int a, *b, *c[4][];
`
Here `int` is the base type expression, common for all declarations, and each variable being declared (referred to as a 'declarator') has a corresponding type modifier expression.  Let's look at how these are represented in ableC, in the file [TypeExprs.sv](../../edu.umn.cs.melt.ableC/abstractsyntax/TypeExprs.sv).  

The first nonterminal here, `TypeName`, has a single production that pairs together a `BaseTypeExpr` and a `TypeModifierExpr`.  This is used in contexts where a type expression is written by itself, such as in a typecast.  

`BaseTypeExpr` first has a couple of error productions, `errorTypeExpr` when there is no valid type expression, and `warnTypeExpr` which can be used to attach additional errors to an valid `BaseTypeExpr`.  
The `directTypeExpr` production is a forwarding helper that converts a type back into a `BaseTypeExpr`, which is commonly useful in extensions.  
`typeModifierTypeExpr` is used in contexts where a `BaseTypeExpr` needs to translate into something that includes a `TypeModiferExpr`, for example when resolving `directTypeExpr` for a pointer type.  This production is considered part of the 'host language', even though it does not have a direct translation to C.  To resolve this, the ableC driver uses some additional attributes to perform a restructuring of the AST that eliminates these productions prior to generating C code.  
`builtinTypeExpr` represents type expressions for built-in types, such as `int`, `float`, `char`, etc.  These share a the `BuiltinType` nonterminal also used by `Type`.  
`tagReferenceTypeExpr` represents a reference to a struct, enum, or union that has already been declared.  `structTypeExpr`, `unionTypeExpr`, and `enumTypeExpr` all wrap actual declarations of these.  
`typedefTypeExpr` represents a name for a typedef'ed type that must be looked up from the environment.  
`attributedTypeExpr` is used for GCC's `__attribute__` extension, that allows for types to be further customized in some ways.  This will be discussed later on.  `atomicTypeExpr`, `vaListTypeExpr`, and `typeofTypeExpr` are all related to C11 or GCC extensions to C, which you will likely not need to use.  

A `TypeModifierExpr` is structured as 

# Declarations
The abstract syntax for declarations in ableC is very hierarchical, and is contained in the file [Decls.sv](../../edu.umn.cs.melt.ableC/abstractsyntax/Decls.sv).  At the top level of declarations, we have `GlobalDecls`, which correspond to the list of declarations at the top level of a file.  The `Decls` nonterminal is similar, but for non-global declarations.  A single declaration is represented by the `Decl` nonterminal, which has several productions.  

The `decls` production simply wraps `Decls` into a single `Decl`.  

The `variableDecls` production declares a list of variables

# Concrete syntax
