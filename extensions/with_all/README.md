Composition of all extensions
=============================

Silver (Copper, really) currently lacks runtime composition of language extensions, but all we need to do at compile time is add them to the list.

There's just two changes to make: in the `build` script, we need to add the extensions to the include path, and in the `artifact/Main.sv` file, we need to add the extensions to the parser.

In `example1.xc` there is an example of using the algebraic datatypes extension together with the conditional tables extension.

