Lambda closure extension
=============================

This extension introduces lambda closures, implemented by a struct containing an environment and a function pointer.  
New syntax is also introduced to create a closure and for a closure type expression:
```
closure<int, int> fn = lambda {x, y, z} int a . (x + y + z + a)
```
where x, y, and z are ints in the environment.  If the captured variable list is omitted, all values in the environment are captured:
```
closure<int, int> fn = lambda int a . (x + y + z + a)
```
This is less efficent, but sometimes needed.  

To apply a closure, special syntax is currently used:
```
int res = appclosure fn to (4);
```
This will eventually be replaced by overloading function application.  
Note that the "closure.h" header must be included to use this extension.  
~~Currently, functions cannot be captured, and are ignored if included in the capture list.  This will probably never be fixed, since if you really need to capture a function, you can also create a local variable that is a closure that wraps a call to that function.~~  This has been fixed.  Struct and union variables with only a forward declaration of the struct or union cannot be captured, since the size cannot be known.  Function pointers are also ignored for now, due to bugs in other parts of ableC.  

The purpose of this extension is

1. To allow 'true' functional programming in C, there are some tasks for which passing a closure is much better than passing a function pointer.  
2. To provide an easy way of passing functions which can be used easily by other extensions without needing extra parameters to capture local scope. 