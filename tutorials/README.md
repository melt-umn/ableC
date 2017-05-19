# ableC Tutorials
This folder contains a series of examples and explanations illustrating how to write extensions in ableC.  Within each folder here is a README.md file explaining what is going on, a simple example extension, some extended C programs, and a Makefile to compile them.  It is expected that the user understands some concepts of programming languages, such as parsing and attribute grammars, and has a basic knowlage of the Silver language.  A more detailed starting guide to Silver and a refrence manual may be found [on the MELT website](http://melt.cs.umn.edu/silver/doc/).

## Organization
*note to self: Add links to the next section in each README file*

This tutorial is composed of 3 sections.  It is expected that you complete the first section in order before the second two, but the second and third sections do not depend on each other.  

### ableC basics
1. [Getting started](getting_started/): Writting a very simple 'Hello world' example extension
2. [Error checking](error_checking/): An introduction to the type system of ableC, and implementing error checking for a new binary operator that computes an average
3. [Declarations](declarations/): A look at how declarations and type expressions work in C, writing a new struct declaration syntax for tuples
4. [Embedded domain spesific languages](embedded_dsl/): Writting a simple embedded DSL, postfix arithmetic expressions

*TODO: Add a section discussing concrete syntax in more detail (which nonterminals to extend, what lexer classes to use, tricks for resolving lexer conflicts, etc.)*

### Advanced ableC features
1. [Construction helpers](construction/): Using the parsing and substitution mechanisms in ableC, implement an exponent operator
2. [Lifting](lifting/): Define a new statment to declare a global int constant
3. [Operator overloading](overloading/): Define a new 'interval' type with overloads for host operators
4. [Extensible env](extended_env/): TODO, figure out an example for this

### Developing complete extensions
1. [Modular determinism](mda/): Apply the modular determinism analysis to the previously-defined tuple extension
2. [Modular well-definedness](mwda/): Apply the modular well-definedness analysis to the previously-defined postfix arithmetic extension
3. [Organizing extensions](organization/): A look at the skeleton extension, and how to set up an extension for distribution
4. [Utility extensions](util/): A look at several generally-useful extensions, including string, vector, templating, and closure.  