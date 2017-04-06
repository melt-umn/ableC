Lambda closure extension
=============================

This extension introduces lambda closures, implemented by a struct containing an environment and a function pointer.  
New syntax is also introduced to create a closure and for a closure type expression:
```
closure<(int) -> int> fn = lambda {x, y, z} (int a) -> (x + y + z + a)
```
where x, y, and z are ints in the environment.  If the captured variable list is omitted, all free variables in the expression not defined globally are captured:
```
closure<(int) -> int> fn = lambda (int a) -> (x + y + z + a)
``` 
If a statment-expression is used in the body, direct return statments are possible, as long as they have the same type as the expression result.
The closure type expression also supports syntax for curried functions:
```
closure<(float, char*) -> (int) -> float> = ...;
```

To apply a closure, the function call syntax is overloaded:
```
int res = fn(1, 2, 3);
```

Functions and arrays can be captured by a closure, but they are decayed into function pointers or pointers to the base type, as with lvalues in C.  Since capture works by copying data, all captured variables are const.  If some form of mutation is required, then a pointer to that variable should be captured.  

The purpose of this extension is

1. To allow 'true' functional programming in C, there are some tasks for which passing a closure is much better than passing a function pointer.  
2. To provide an easy way of passing functions which can be used easily by other extensions without needing extra parameters to capture local scope. 
