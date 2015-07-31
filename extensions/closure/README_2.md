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
If a statment-expression is used in the body, direct return statments are possible, as long as they have the same type as the expression result.  

To apply a closure, special syntax is currently used:
```
int res = appclosure fn to (4);
```
This will eventually be replaced by overloading function application.  
Note that the <closure.h> header must be included to use this extension.  This is in the include folder, so the flag -I$(PATH_TO_CLOSURE_FOLDER)/include must be passed when running the generated jar.  
Functions can be included in the capture list, but they just translate to direct calls by name to the function.  This should not normally cause issues.  Struct and union variables with only a forward declaration of the struct or union cannot be captured, since the size cannot be known.  Function pointers are also ignored for now, due to bugs in other parts of ableC.  

The purpose of this extension is

1. To allow 'true' functional programming in C, there are some tasks for which passing a closure is much better than passing a function pointer.  
2. To provide an easy way of passing functions which can be used easily by other extensions without needing extra parameters to capture local scope. 

TODO items:
* Remove txtStmt and txtExprs
* Resolve issues with capturing function pointers and anonymous union fields (ableC host bug?)
* Clean up hacks with passing _closure refId
* Fix lambda expr to pass copper MDA
