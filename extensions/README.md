Example extensions
==================

This directory previously housed example extensions. These extensions have been
updated and exist in their own repositories under github.com/melt-umn now. 

The old code is kept at github.umn.edu/melt/old-ableC-examples.



Extension development checklist
===============================

Please ensure every extension:

1. Confines itself to `extensions/${my_ext}/`
2. Places its grammar files under `edu.umn.cs.melt.exts.ableC.${my_ext}`
3. Has a grammar `artifact` that builds AbleC composed with just that extension.
4. Has the `build` script copied identically.
5. Has at least 1 positive example.xc file.
6. Has at least 1 negative example.xc file, showing error messages. (As simple test cases.)
7. Has its own `README.md` file explaining the extension briefly.
8. Has a grammar for the Copper MDA tests.
9. Passes both Copper and Silver modular analyses. (Silver `./build --clean --warn-all`)

