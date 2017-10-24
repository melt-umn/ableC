# Getting started
## AbleC Organization
First, a general outline of the structure of ableC.  The source code is contained in the `edu.umn.cs.melt.ableC` directory, corresponding to the top-level `edu:umn:cs:melt:ableC` grammar.  This is contains several sub-grammars:
* `abstractsyntax`: The various components of the abstract syntax for ableC, further sub-divided into several grammars:
  * `host`: The core, non-forwarding syntax of ableC containing most nonterminals and productions.  
  * `injectable`: A collection of forwarding wrappers around many of the host productions, that may be controlled by extensions to inject additional error checking or transformations to perform on standard productions.  
  * `overloadable`: A collection of forwarding wrappers around many of the injectable productions, that may be controlled by extensions to perform type-based overloading transformations into extension abstract syntax.  
  * `construction`: A utility feature for extensions that provides a number of useful tools for easier AST construction.  
  * `substitution`: A utility feature for extensions that permits portions of abstract syntax trees to be transformed via name-based substitution.  
  * `env`: The implementation of the environment for ableC.  
  * `builtins`: Handling of compiler built-in functions.  
* `concretesyntax`: The concrete syntax of ableC.  Most of what you will need to use is at the top-level, but several sub-grammars contain additional features and internal components.  
* `drivers`: Various driver functions to manage the compilation process of calling the preprocessor, reading the result, calling the parser, generating the AST, error checking, and writing the transformed result.  
* `host`: A specification of a default, non-extended host parser to use.  
* `compiler`: A default `main` function that uses the `host` parser with the `compile` driver, for testing purposes.  
* `testing`: Experimental and unfinished testing framework for interference in extensions.  

## Example
This section's example serves as an example of how basic extensions are organized.  The directory `edu.umn.cs.melt.exts.ableC.helloworld/` is the top-level grammar containing the extension specification.  This grammar contains `abstractsyntax` and `concretesyntax` sub-grammars, containing the specifications of the abstract and concrete syntax for the extension.  

At the top-level, an artifact grammar contains a simple specification of the composed compiler, containing a specification of the parser to build and a main function that calls the compilation driver with the generated parser.  

Example programs are provided, with the extension `.xc`.  

A Makefile at the top-level will automatically compile the extension, translate, compile, and run the example programs.  

[Next section: Error checking](../error_checking/)
