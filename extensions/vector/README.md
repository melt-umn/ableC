Vector extension
================

This extension provides a nice vector list representation, similar to vectors in C++.  
Vectors are implemented as a garbage-collected pointer to a templated struct, containing a garbage-collected array of elements.  Due to our current implementation of lifting/templating, typedef'ed template parameters must be declared globally.  
Operator overloading is provided for basic operations such as append.  
Integration with the string extension is also provided to implement show for vectors that have showable sub types.

### Vector construction

| Method                  | Example |
| ----------------------- | ------- |
| Initialized constructor | vector<int> v = vec<int>[1, 2, 3, 4]; |
| Size constructor        | vector<int> v = vec<int>(8); |
| Copy constructor        | vector<int> v = copy_vector(v1); |

### Overloaded operators

| Name                    | Example |
| ----------------------- | ------- |
| Append                  | v1 + v2 |
| Update assign           | v1 += v2 |
| Equality                | v1 == v2 |
| Subscript               | v[i] |
| Subscript assign        | v[i] = x |
| Show operator           | show(x) |

### TODO items
* Instead of allocating the contents pointer seperately, it could instead be set to point to itself so that the entire vector is stored in a single block of memory.  
* Figure out a better way of doing templating to replace explicit ASTs of lifted functions
