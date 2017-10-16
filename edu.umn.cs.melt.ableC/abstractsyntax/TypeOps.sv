
-- Some attributes for Type and BuiltinType.

-- RULE for using these: it must *ALWAYS* be the case than an error occurs if
-- the is* flag is FALSE.
-- i.e. if you need it both ways, there should be two attributes:
--   isTrue and isNotTrue.
-- Why? Because both of those will be true for *errorType*.
synthesized attribute isIntegerType :: Boolean; -- enum or integer builtin
synthesized attribute isArithmeticType :: Boolean; -- integer or floating (incl complex)
synthesized attribute isScalarType :: Boolean; -- pointers or arithmetic

