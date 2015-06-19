Garbage collection extension
=============================

This extension introduces three new pieces of syntax:

1. An operator 'gcmalloc' (e.g. `gcmalloc (5)`) that works like malloc but returns a pointer to garbage-collected memory.
2. An operator 'gcrealloc' (e.g. `gcrealloc a to (5)`) that works like realloc but returns a pointer to garbage-collected memory.
3. An operator 'gcnew' (e.g. `gcnew int`) that allocates space for a pointer to the given type.

It uses the Boehm `<gc.h>` library.  Note that you must compile the generated code with -lgc

The purpose of this extension is

1. To provide a wrapper for the Boehm gc library macros, which can be used easily by other extensions.
2. To provide an easy way of allocating pointers to objects of given types, which can be used easily by other extensions. 