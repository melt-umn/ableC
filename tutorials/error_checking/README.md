# Error checking
An important piece of any extension is to perform error/type checking.  

## ableC type system
Types in ableC are represented by a nonterminal `Type`.  The type of an expression may be accessed via the attribute `typerep`.  The following are type productions that you may commonly use:
* `errorType :: (Type ::= )`: The type of an expression with errors, or an otherwise invalid type.  To avoid additional bogus errors, this type should be allowed in any context.  
* `builtinType :: (Type ::= Qualifiers BuiltinType)`: Basic types built in to C, such as `int`, `float`, `char`, etc.  `BuiltinType`s may be found in [TypesBuiltin.sv](../../edu.umn.cs.melt.ableC/abstractsyntax/TypesBuiltin.sv).  
* `pointerType :: (Type ::= Qualifiers Type)`: A pointer to another type, such as `int*`.
* `functionType :: (Type ::= Type FunctionType)`: A function.  Note that in many cases, you will want to use a function pointer instead of `functionType` directly.  
* `tagType :: (Type ::= Qualifiers TagType)`: A `struct`, `enum`, or `union` type.  More on these later.

Many types in ableC take `Qualifiers` as arguments.  These are things such as `const`, `volatile`, etc.  

A number of operations on `Type`s are provided by ableC, such as checking if a type can be assigned to another or performing numeric type promotions.  See [TypeOps.sv](../../edu.umn.cs.melt.ableC/abstractsyntax/TypeOps.sv) for the full list.  

Extensions should not not perform a pattern matching check on a `Type` directly, and should instead always check for equality (or compatibility) with the correct type.  The reason for this is ... *TODO: Do we want to talk about interference here?*

## Reporting errors
Extension productions on host nonterminals should generally not ever set attributes explicitly (such as `error`) with the exception of `pp`, and instead should provide values for all attributes via forwarding.  When a production needs to report errors, it may do so by forwarding to an error production.  These exist for most major nonterminals, such as `errorExpr`, `warnStmt`, and `warnDecl`.  

An example of the usual pattern for this may be found in [Average.sv](abstractsyntax/Average.sv).  Forwarding production should check for the errors created locally (not including errors on children, since this may mean that some error checks happen twice!), and report them by forwarding to an error production if the list is non-empty.  Helpers are provided to do this check automaticly, to reduce verbosity.  Note that in the case of `Stmt` and `Decl`, it may make sense to forward to a sequence of the error production and the normal AST, to avoid introducing further errors involving a missing declaration.  
