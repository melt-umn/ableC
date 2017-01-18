Vector extension
================

This extension provides a nice vector list representation, similar to vectors in C++.  
Vectors are type-generic with erasure (for now).  Operator overloading is provided for basic operations such as append.  
Integration with the string extension is also provided to give a tostring for vectors that have tostring sub types.  

Overloaded operators include
* Append: v1 + v2
* Equality: v1 == v2
* Subscript: v[i]
* Subsctipt assign: v[i] = x
* To string operator: tostring(x)

TODO items:
* Struct container should be passed directly, not as an allocated pointer
* Handle generic types the right way
 * Need to implement some notion of 'templates' like in C++, probably needs to be baked into ableC.  Somehow generate a custom implementation struct and implementation functions for every instantiated type
 * Add support for generic type parameters to the ableC type checker
 * Type classes?  Probably not needed but requires some thought
