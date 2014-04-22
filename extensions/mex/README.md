Matlab Mex functions extension
==============================

To use this extension, you'll need to create some symlinks:

```
matrix.h -> MATLAB/R2013b/extern/include/matrix.h
mex.h -> MATLAB/R2013b/extern/include/mex.h
tmwtypes.h -> MATLAB/R2013b/extern/include/tmwtypes.h
```

is enough to make it work for us, pointing to wherever matlab is installed.

This extension introduces one new piece of syntax, Matlab-style function declarations:

```
matlab
(char out1, double out2[3][3]) = functionname(float in1, double in2[size])
{
  // C code. assign to out1, out2
}
```

This declaration automates dynamic type checking and extracting values from the Matlab FFI.

This extension also augments the matrix extension, by making the matrix index expression understand Matlab FFI matrix types.

```
matrix out(0,0) = 1;
```

Use of this extension requires including `mex.h`.

Once compiled, the result should be built using the `mex` shell script provided by Matlab.

