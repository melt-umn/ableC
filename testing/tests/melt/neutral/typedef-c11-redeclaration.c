
// Initial declaration.
typedef int foo;

// C11 legal redefinition of non-variably modified type.
typedef int foo;

// Again, should be legal.
typedef int bar, foo;

// Again, should be legal.
typedef int foo, bar;




