Lambda closure extension
=============================

This extension introduces lambda closures, implemented by a struct containing an environment and a function pointer.  
New syntax is also introduced to create a closure and for a closure type expression:
```
closure<int, int> fn = lambda {x, y, z} int a . (x + y + z + a)
```
where x, y, and z are ints in the environment.  

To apply a closure, special syntax is currently used:
```
int res = appclosure fn to (4);
```
This will eventually be replaced by overloading function application.  
Note that the "closure.h" header must be included to use this extension.  

The purpose of this extension is

1. To allow 'true' functional programming in C, there are some tasks for which passing a closure is much better than passing a function pointer.  
2. To provide an easy way of passing functions which can be used easily by other extensions without needing extra parameters to capture local scope. 