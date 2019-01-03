# AST construction tools in ableC
As can be seen in some of the previous examples, building ASTs in ableC can be rather tedious.  It is often possible to move some otherwise-generated code into static functions in header files, but this is not always possible.  To remedy this, a set of tools is provided by ableC for building abstract syntax trees.  

## Construction helper functions
Some common patterns are often repeated when writing abstract syntax, such as declaring a variable or checking for errors.  The `edu:umn:cs:melt:ableC:abstractsyntax:construction` grammar contains a number of helper functions that are useful in constructing abstract syntax trees.  Some of the more useful ones are:
* `mkDecl :: (Stmt ::= String Type Expr Location)`: Create a statement that is the declaration of a single variable with the given type, initialized with the given expression.  
* `mkDeclGeneral :: (Stmt ::= String Type Location)`: Create a statement that is the uninitialized declaration of a single variable with the given type.  
* `mkAssign :: (Stmt ::= String Expr Location)`: Create a statement that assigns an expression to a name.
* `mkIntConst :: (Expr ::= Integer Location)`: Create an integer literal.
* `mkErrorCheck :: (Expr ::= [Message] Expr)`: If the parameter messages are empty, return the expression.  If the parameter messages contain only warnings, wrap the messages and expression in `warnExpr`.  If the parameter messages contain errors, wrap the messages in `errorExpr`.  
A number of helpers are also provided to fold various list nonterminals from lists of components, such as `foldExpr :: (Exprs ::= [Expr])` or `foldDecl :: (Decls ::= [Decl])`.  

## Parsing construction helpers
In many cases, the AST may be complex enough that writing explict C code may be preferred.  Fortunately, there is a way of doing this: a number of helper functions are provided for several nonterminals, that a string as an argument, parse it, and return the abstract syntax tree constructed from the parse tree.  This is typically combined with silver's string template syntax (see [AbstractSyntax.sv](edu.umn.cs.melt.tutorials.ableC.exponent/abstractsyntax/AbstractSyntax.sv) for an example), allowing for identifier names to be easily specified.  

If the parsed expression contains syntax errors, a fatal internal error will be raised showing the copper error and string that was parsed.  The entire text of the parsed code will be included as the file name in the location for any error messages that are produced by the generated code.  

As mentioned previously, the C language treats type names and variable names similarly, and so there are some cases where a lexical ambiguity exists between the two.  To resolve this, the list of `typedef`ed names declared so far is tracked during parsing, and used to disambiguate whether an identifier refers to a type or a value.  In a parsed block, if a name is used in a type expression that is not declared within the same block, the parser attribute would not contain this type name and a syntax error would result.  To remedy this, the syntax used by parsing helpers (but not for ableC in general) is extended to contain a new statement of the form `proto_typedef ty1, ty2, ty3;`, which simply adds the listed identifiers to the list of type names in the parser attribute, but otherwise has no semantic meaning.  

## Substitution
The parsing mechanism by itself is insufficient in most cases when an AST must somehow wrap additional ASTs.  In addition some extensions, such as the [template extension](https://github.com/melt-umn/ableC-templating), may wish to substitute new trees for names on existing ASTs.  The substitution mechanism provides a way of doing this, by using a functor attribute `substituted` to generate a tree with the rewrites specified by the `substitutions` inherited attribute.  `substitutions` is a list of Substitutions, which may be any of the following:
* `nameSubstitution :: (Substitution ::= String Name)`: Replace a name anywhere in the tree with another name.
* `typedefSubstitution :: (Substitution ::= String BaseTypeExpr)`: Replace a `typedef`ed name in a type expression with a different type expression.
* `declRefSubstitution :: (Substitution ::= String Expr)`: Replace a name in an expression with a different expression.
* `stmtSubstitution :: (Substitution ::= String Stmt)`: Replace a statement consisting of just a reference to a name with another statement.
* `exprsSubstitution :: (Substitution ::= String Exprs)`: Replace an expression list consisting just of a single name with another expression list.
* `parametersSubstitution :: (Substitution ::= String Parameters)`: Replace a parameter list consisting just of a single unnamed parameter with a `typedef`ed name as the type expression with a new parameter list.  
* `refIdSubstitution :: (Substitution ::= String Parameters)`: Replace the refId specified on a `struct` via GCC `__attribute__`s with a new refId.  This is used when generating a struct to implement a parametric type, such as in the [closure extension](https://github.com/melt-umn/ableC-closure).  

A number of helper functions are available that use the attributes to actually perform a subsititution on a nonterminal, such as `substExpr :: (Expr ::= subs::[Substitution] base::Expr)`.  These are defined in [Util.sv](../../edu.umn.cs.melt.ableC/abstractsyntax/substitution/Util.sv).  

It is important that a substitution can be performed without specifying the environment, and preferable that this transformation is performed on an AST before forwarding occurs.  To allow this, the `substituted` attribute should be propagated on all forwarding extension productions.  Note that `substituted` and `pp` are essentially the only exceptions to the rule that synthesized equations should only be written on non-forwarding productions.  

A convention when performing substitutions on an AST built by the parsing helpers is to write names to be substituted with leading and trailing underscores, such as `__foo__`, in order to distinguish these from names that are actually names.  

## Example
A simple example making use of these constructs is an exponent operator, which can be found in [AbstractSyntax.sv](edu.umn.cs.melt.tutorials.ableC.exponent/abstractsyntax/AbstractSyntax.sv).  This operator raises a numeric base to an integer power by performing repeated multiplication in a loop.  

Since the evaluation of expressions in C may have side-effects, every child expression should be included in the forward exactly once.  To avoid duplications, temporary variables are used, declared with type expressions generated from the types of the operands.  The names of these temporary variables must be specified with `toString(genInt())` prefixes; this is to ensure uniqueness such that when this operator is nested, a variable is not initialized with another variable of the same name, which would effectively be an initialization with itself.  

[Next section: Lifting](../lifting/)
