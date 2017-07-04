# Getting started
This section serves as an example of how basic extensions are organized.  The directory edu.umn.cs.melt.exts.ableC.helloworld/ is the top-level grammar containing the extension specification.  This grammar contains abstractsyntax and concretesyntax sub-grammars, containing the specifications of the abstract and concrete syntax for the extension.  

At the top-level, an artifact grammar contains a simple specification of the composed compiler, containing a specification of the parser to build and a main function that calls the compilation driver with the generated parser.  

Example programs are provided, with the extension `.xc`.  

A Makefile at the top-level will automatically compile the extension, translate, compile, and run the example programs.  

[Next section: Error checking](../error_checking/)
