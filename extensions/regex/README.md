Regular expressions extension
=============================

This extension introduces two new pieces of syntax:

1. A binary operator `=~` that tests whether a regular expression matches somewhere within a string.
2. Regex Literals (e.g. `/[A-Z]+/`) that construct regular expressions.

It uses the POSIX `<regex.h>` library.

The purpose of this extension is

1. To ensure statically the regular expressions are syntactically correct. There is no possibility that they will fail to compile at runtime.
2. To make it more convenient to actually use them (in some cases.)

A potential third purpose, not realized by the current implementation, would be to statically compile the regex. We still defer this to runtime (by calling `regcomp`).

