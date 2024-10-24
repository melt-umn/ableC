grammar edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

-- Begins with 1-9 or is just 0 alone
terminal IDecConstant_t /((0)|([1-9][0-9]*))[IiJj]/ lexer classes {NumericLiteral};
terminal IDecConstantU_t   /((0)|([1-9][0-9]*))(([Uu][IiJj])|([IiJj][Uu]))/ lexer classes {NumericLiteral};
terminal IDecConstantL_t   /((0)|([1-9][0-9]*))(([Ll][IiJj])|([IiJj][Ll]))/ lexer classes {NumericLiteral};
terminal IDecConstantUL_t  /((0)|([1-9][0-9]*))(([Uu][Ll][IiJj])|([Ll][Uu][IiJj])|([IiJj][Uu][Ll])|([IiJj][Ll][Uu])|([Uu][IiJj][Ll])|([Ll][IiJj][Uu]))/ lexer classes {NumericLiteral};
terminal IDecConstantLL_t  /((0)|([1-9][0-9]*))(([Ll][Ll][IiJj])|([IiJj][Ll][Ll]))/ lexer classes {NumericLiteral};
terminal IDecConstantULL_t /((0)|([1-9][0-9]*))(([Uu][Ll][Ll][IiJj])|([Ll][Ll][Uu][IiJj])|([IiJj][Uu][Ll][Ll])|([IiJj][Ll][Ll][Uu])|([Uu][IiJj][Ll][Ll])|([Ll][Ll][IiJj][Uu]))/ lexer classes {NumericLiteral};

{-	(((([0-9]+[.])|         -- end with do
	  ([0-9]*[.][0-9]+))    -- has dot
	 ([Ee][-+]?[0-9]+)?)|  -- optional exponent
	 ([0-9]+[Ee][-+]?[0-9]+)) -- No dot, mandatory exponent
	[IiJj]
 -}
terminal IFloatConstant_t /(((([0-9]+[.])|([0-9]*[.][0-9]+))([Ee][-+]?[0-9]+)?)|([0-9]+[Ee][-+]?[0-9]+))[IiJj]/ lexer classes {NumericLiteral};

{-	(((([0-9]+[.])|         -- end with do
	  ([0-9]*[.][0-9]+))    -- has dot
	 ([Ee][-+]?[0-9]+)?)|  -- optional exponent
	 ([0-9]+[Ee][-+]?[0-9]+)) -- No dot, mandatory exponent
	(([IiJj][Ff])|([Ff][IiJj]))
 -}
terminal IFloatConstantFloat_t /(((([0-9]+[.])|([0-9]*[.][0-9]+))([Ee][-+]?[0-9]+)?)|([0-9]+[Ee][-+]?[0-9]+))(([IiJj][Ff])|([Ff][IiJj]))/ lexer classes {NumericLiteral};

{-	(((([0-9]+[.])|         -- end with do
	  ([0-9]*[.][0-9]+))    -- has dot
	 ([Ee][-+]?[0-9]+)?)|  -- optional exponent
	 ([0-9]+[Ee][-+]?[0-9]+)) -- No dot, mandatory exponent
	(([IiJj][Ll])|([Ll][IiJj]))
 -}
terminal IFloatConstantLongDouble_t /(((([0-9]+[.])|([0-9]*[.][0-9]+))([Ee][-+]?[0-9]+)?)|([0-9]+[Ee][-+]?[0-9]+))(([IiJj][Ll])|([Ll][IiJj]))/ lexer classes {NumericLiteral};

{-	0[xX]
	(([a-fA-F0-9]+[.]?)|
	 ([a-fA-F0-9]*[.][a-fA-F0-9]+))
	([Pp][-+]?[0-9]+) -- mandatory exponent part
	[IiJj]
 -}
terminal IHexFloatConstant_t /0[xX](([a-fA-F0-9]+[.]?)|([a-fA-F0-9]*[.][a-fA-F0-9]+))([Pp][-+]?[0-9]+)[IiJj]/ lexer classes {NumericLiteral};

{-	0[xX]
	(([a-fA-F0-9]+[.]?)|
	 ([a-fA-F0-9]*[.][a-fA-F0-9]+))
	([Pp][-+]?[0-9]+) -- mandatory exponent part
	(([IiJj][Ff])|([Ff][IiJj]))
 -}
terminal IHexFloatConstantFloat_t /0[xX](([a-fA-F0-9]+[.]?)|([a-fA-F0-9]*[.][a-fA-F0-9]+))([Pp][-+]?[0-9]+)(([IiJj][Ff])|([Ff][IiJj]))/ lexer classes {NumericLiteral};

{-	0[xX]
	(([a-fA-F0-9]+[.]?)|
	 ([a-fA-F0-9]*[.][a-fA-F0-9]+))
	([Pp][-+]?[0-9]+) -- mandatory exponent part
	(([IiJj][Ll])|([Ll][IiJj]))
 -}
terminal IHexFloatConstantLongDouble_t /0[xX](([a-fA-F0-9]+[.]?)|([a-fA-F0-9]*[.][a-fA-F0-9]+))([Pp][-+]?[0-9]+)(([IiJj][Ll])|([Ll][IiJj]))/ lexer classes {NumericLiteral};


-- TODO: missing oct/hex ints



concrete productions top::Constant_c
-- dec
| c::IDecConstant_t
    { top.ast = ast:imaginaryConstant(ast:integerConstant(c.lexeme, false, ast:noIntSuffix())); }
| c::IDecConstantU_t
    { top.ast = ast:imaginaryConstant(ast:integerConstant(c.lexeme, true, ast:noIntSuffix())); }
| c::IDecConstantL_t
    { top.ast = ast:imaginaryConstant(ast:integerConstant(c.lexeme, false, ast:longIntSuffix())); }
| c::IDecConstantUL_t
    { top.ast = ast:imaginaryConstant(ast:integerConstant(c.lexeme, true, ast:longIntSuffix())); }
| c::IDecConstantLL_t
    { top.ast = ast:imaginaryConstant(ast:integerConstant(c.lexeme, false, ast:longLongIntSuffix())); }
| c::IDecConstantULL_t
    { top.ast = ast:imaginaryConstant(ast:integerConstant(c.lexeme, true, ast:longLongIntSuffix())); }
-- floats
| c::IFloatConstant_t
    { top.ast = ast:imaginaryConstant(ast:floatConstant(c.lexeme, ast:doubleFloatSuffix())); }
| c::IFloatConstantFloat_t
    { top.ast = ast:imaginaryConstant(ast:floatConstant(c.lexeme, ast:floatFloatSuffix())); }
| c::IFloatConstantLongDouble_t
    { top.ast = ast:imaginaryConstant(ast:floatConstant(c.lexeme, ast:longDoubleFloatSuffix())); }
-- hex floats
| c::IHexFloatConstant_t
    { top.ast = ast:imaginaryConstant(ast:hexFloatConstant(c.lexeme, ast:doubleFloatSuffix())); }
| c::IHexFloatConstantFloat_t
    { top.ast = ast:imaginaryConstant(ast:hexFloatConstant(c.lexeme, ast:floatFloatSuffix())); }
| c::IHexFloatConstantLongDouble_t
    { top.ast = ast:imaginaryConstant(ast:hexFloatConstant(c.lexeme, ast:longDoubleFloatSuffix())); }


terminal GNU_UUReal_t '__real' lexer classes {Keyword, Reserved};
terminal GNU_UURealUU_t '__real__' lexer classes {Keyword, Reserved};
terminal GNU_UUImag_t '__imag' lexer classes {Keyword, Reserved};
terminal GNU_UUImagUU_t '__imag__' lexer classes {Keyword, Reserved};

concrete productions top::UnaryOp_c
| '__real'  { top.ast = ast:realExpr(top.expr); }
| '__real__'  { top.ast = ast:realExpr(top.expr); }
| '__imag'  { top.ast = ast:imagExpr(top.expr); }
| '__imag__'  { top.ast = ast:imagExpr(top.expr); }

