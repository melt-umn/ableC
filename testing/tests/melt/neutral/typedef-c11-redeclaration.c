
// Initial declaration.
typedef int foo;

// C11 legal redefinition of non-variably modified type.
// This parses, but incorrectly: as 'storage-class type-spec type-spec' with no identifier.
typedef int foo;

// Again, should be legal.
// This parses *correctly*. 'storage-class type-spec ident ident'
typedef int bar, foo;

// Again, should be legal.
// This fails to parse. it sees 'storage-class type-spec type-spec' and dies at the comma
typedef int foo, bar;




