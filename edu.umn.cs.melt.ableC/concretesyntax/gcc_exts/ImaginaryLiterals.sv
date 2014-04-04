grammar edu:umn:cs:melt:ableC:concretesyntax:gcc_exts;

terminal IDecConstant_t /
	((0)|([1-9][0-9]*)) -- Begins with 1-9 or is just 0 alone
	[IiJj]
	/ lexer classes {Cliteral};
terminal IDecConstantU_t   /((0)|([1-9][0-9]*))(([Uu][IiJj])|([IiJj][Uu]))/ lexer classes {Cliteral};
terminal IDecConstantL_t   /((0)|([1-9][0-9]*))(([Ll][IiJj])|([IiJj][Ll]))/ lexer classes {Cliteral};
terminal IDecConstantUL_t  /((0)|([1-9][0-9]*))(([Uu][Ll][IiJj])|([Ll][Uu][IiJj])|([IiJj][Uu][Ll])|([IiJj][Ll][Uu])|([Uu][IiJj][Ll])|([Ll][IiJj][Uu]))/ lexer classes {Cliteral};
terminal IDecConstantLL_t  /((0)|([1-9][0-9]*))(([Ll][Ll][IiJj])|([IiJj][Ll][Ll]))/ lexer classes {Cliteral};
terminal IDecConstantULL_t /((0)|([1-9][0-9]*))(([Uu][Ll][Ll][IiJj])|([Ll][Ll][Uu][IiJj])|([IiJj][Uu][Ll][Ll])|([IiJj][Ll][Ll][Uu])|([Uu][IiJj][Ll][Ll])|([Ll][Ll][IiJj][Uu]))/ lexer classes {Cliteral};

terminal IFloatConstant_t /
	(((([0-9]+[\.])|         -- end with do
	  ([0-9]*[\.][0-9]+))    -- has dot
	 ([Ee][\+\-]?[0-9]+)?)|  -- optional exponent
	 ([0-9]+[Ee][\+\-]?[0-9]+)) -- No dot, mandatory exponent
	[IiJj]
	/ lexer classes {Cliteral};
terminal IFloatConstantFloat_t /
	(((([0-9]+[\.])|         -- end with do
	  ([0-9]*[\.][0-9]+))    -- has dot
	 ([Ee][\+\-]?[0-9]+)?)|  -- optional exponent
	 ([0-9]+[Ee][\+\-]?[0-9]+)) -- No dot, mandatory exponent
	(([IiJj][Ff])|([Ff][IiJj]))
	/ lexer classes {Cliteral};
terminal IFloatConstantLongDouble_t /
	(((([0-9]+[\.])|         -- end with do
	  ([0-9]*[\.][0-9]+))    -- has dot
	 ([Ee][\+\-]?[0-9]+)?)|  -- optional exponent
	 ([0-9]+[Ee][\+\-]?[0-9]+)) -- No dot, mandatory exponent
	(([IiJj][Ll])|([Ll][IiJj]))
	/ lexer classes {Cliteral};

terminal IHexFloatConstant_t /
	0[xX]
	(([a-fA-F0-9]+[\.]?)|
	 ([a-fA-F0-9]*[\.][a-fA-F0-9]+))
	([Pp][\+\-]?[0-9]+) -- mandatory exponent part
	[IiJj]
	/ lexer classes {Cliteral};
terminal IHexFloatConstantFloat_t /
	0[xX]
	(([a-fA-F0-9]+[\.]?)|
	 ([a-fA-F0-9]*[\.][a-fA-F0-9]+))
	([Pp][\+\-]?[0-9]+) -- mandatory exponent part
	(([IiJj][Ff])|([Ff][IiJj]))
	/ lexer classes {Cliteral};
terminal IHexFloatConstantLongDouble_t /
	0[xX]
	(([a-fA-F0-9]+[\.]?)|
	 ([a-fA-F0-9]*[\.][a-fA-F0-9]+))
	([Pp][\+\-]?[0-9]+) -- mandatory exponent part
	(([IiJj][Ll])|([Ll][IiJj]))
	/ lexer classes {Cliteral};


-- TODO: missing oct/hex ints



concrete productions top::Constant_c
-- dec
| c::IDecConstant_t
    { top.ast = ast:imaginaryConstant(ast:integerConstant(c.lexeme, false, ast:noIntSuffix(), location=top.location), location=top.location); }
| c::IDecConstantU_t
    { top.ast = ast:imaginaryConstant(ast:integerConstant(c.lexeme, true, ast:noIntSuffix(), location=top.location), location=top.location); }
| c::IDecConstantL_t
    { top.ast = ast:imaginaryConstant(ast:integerConstant(c.lexeme, false, ast:longIntSuffix(), location=top.location), location=top.location); }
| c::IDecConstantUL_t
    { top.ast = ast:imaginaryConstant(ast:integerConstant(c.lexeme, true, ast:longIntSuffix(), location=top.location), location=top.location); }
| c::IDecConstantLL_t
    { top.ast = ast:imaginaryConstant(ast:integerConstant(c.lexeme, false, ast:longLongIntSuffix(), location=top.location), location=top.location); }
| c::IDecConstantULL_t
    { top.ast = ast:imaginaryConstant(ast:integerConstant(c.lexeme, true, ast:longLongIntSuffix(), location=top.location), location=top.location); }
-- floats
| c::IFloatConstant_t
    { top.ast = ast:imaginaryConstant(ast:floatConstant(c.lexeme, ast:doubleFloatSuffix(), location=top.location), location=top.location); }
| c::IFloatConstantFloat_t
    { top.ast = ast:imaginaryConstant(ast:floatConstant(c.lexeme, ast:floatFloatSuffix(), location=top.location), location=top.location); }
| c::IFloatConstantLongDouble_t
    { top.ast = ast:imaginaryConstant(ast:floatConstant(c.lexeme, ast:longDoubleFloatSuffix(), location=top.location), location=top.location); }
-- hex floats
| c::IHexFloatConstant_t
    { top.ast = ast:imaginaryConstant(ast:hexFloatConstant(c.lexeme, ast:doubleFloatSuffix(), location=top.location), location=top.location); }
| c::IHexFloatConstantFloat_t
    { top.ast = ast:imaginaryConstant(ast:hexFloatConstant(c.lexeme, ast:floatFloatSuffix(), location=top.location), location=top.location); }
| c::IHexFloatConstantLongDouble_t
    { top.ast = ast:imaginaryConstant(ast:hexFloatConstant(c.lexeme, ast:longDoubleFloatSuffix(), location=top.location), location=top.location); }


terminal GNU_UUReal_t '__real' lexer classes {Ckeyword};
terminal GNU_UURealUU_t '__real__' lexer classes {Ckeyword};
terminal GNU_UUImag_t '__imag' lexer classes {Ckeyword};
terminal GNU_UUImagUU_t '__imag__' lexer classes {Ckeyword};

concrete productions top::UnaryOp_c
| '__real'  { top.ast = ast:realOp(location=top.location); }
| '__real__'  { top.ast = ast:realOp(location=top.location); }
| '__imag'  { top.ast = ast:imagOp(location=top.location); }
| '__imag__'  { top.ast = ast:imagOp(location=top.location); }

