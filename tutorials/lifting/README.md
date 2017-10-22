# Lifting declarations to the global level
A common pattern when writing extensions is to wish to generate a global declaration for a local piece of code, for example in the case of the [closure extension](https://github.com/melt-umn/ableC-closure).  This can be accomplished via the lifting mechanism.

## Semantics
Lifiting can be performed from the three most-commonly extended nonterminals, `Expr`, `Stmt` and `TypeExpr`.  Productions `injectGlobalDeclsExpr`, `injectGlobalDeclsStmt` and `injectGlobalDeclsTypeExpr` each wrap `Decls` to lift to the global scope, and the base AST of the appropriate type that relies on the lifted item.  Definitions from the `Decls` to be lifted are inserted into the global environment of what is wrapped, and are passed up the tree to be included in the environment for any later definitions.  These productions will then be transformed away by ableC during later phases of translation.  

A common pattern is where multiple locations wish to lift the same declaration to the global level, but to avoid re-defining this if it has already been declared.  To assist in this, the production `maybeDecl :: (Decl ::= (Boolean ::= Decorated Env) Decl)` is provided, taking a function to look at the environment to check for an existing declaration (in which case the production forwards to `nilDecl()`), and a `Decl` to declare otherwise.  Several further helpers are provided, `maybeValueDecl`, `maybeTagDecl` and `maybeRefIdDecl`, that take a name and a `Decl`, checking to see if the name is declared in the respective namespace.  

## How does this work?
The ableC translation process consists of three essential phases:
* During the first phase, the freshly-constructed extension AST is decorated with attributes and checked for errors.  A second AST is then constructed from the first containing only non-forwarding constructs, using the `host` attribute on the extended AST.  Note that this AST still contains constructs such as `injectGlobalDeclsExpr` that are not forwarding, but also do not have a direct C translation.  
* This host AST is then decorated as well, and used to construct a third, 'lifted' AST, using the `lifted` attribute.  This AST uses a number of synthesized and inherited attributes to relocate portions of the AST, resulting in a tree that only contains productions with a C translation.  
* The final, lifted AST can then simply be pretty-printed and written to a file.  

In order to avoid generating duplicate global declarations, a lifted declaration must be immediately visible at every point in the AST to the right of the initial declaration.  This is accomplished by inserting definitions from global declarations being passed up the tree into the global environment at every point in the tree where a new scope is opened.  More details on this may be found documented in the source code, in [Lifted.sv](../../edu.umn.cs.melt.ableC/abstractsyntax/host/Lifted.sv) and the files in the [abstractsyntax:env grammar](../../edu.umn.cs.melt.ableC/abstractsyntax/env).  

## Example
An example use of lifting may be found in [AbstractSyntax.sv](edu.umn.cs.melt.tutorials.ableC.globalint/abstractsyntax/AbstractSyntax.sv).  This extension provides an expression that refers to an int variable that may be accessed from anywhere within a program.  The `injectGlobalDeclsExpr` and `maybeValueDecl` productions are used to lift a parsed expression to the global level, the first time that this name is used.  This extension may be useful for some types of macro programming, such as shown in [log.xc](log.xc).  

[Next section: Operator overloading](../overloading/)
