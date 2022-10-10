grammar edu:umn:cs:melt:ableC:concretesyntax;

{- This lexer class is a common superclass for all terminals in ableC.
   Currently the only use for this is to define the prefix seperator.

   The prefix seperator indicates a string that is written between
   transparent prefixes and the following marking terminal that has a
   lexical ambiguity with another extension.  This is used in
   generating the regular expression for the transparent prefix
   terminal symbols that are generated by the parser specifiation.

   We choose "::" becuase it is the same as the C++ scope operator and
   therefor may be more familiar to some users.  Previously this was
   ":", but the single colon is Silver's grammar separator and we
   should pick a prefix separator that is driven by syntax in object
   language (here, C) and not on Silver's syntax.
-}
lexer class AbleC
  prefix separator "::";

{--
 - Comments and whitespace
 -}
lexer class Comment extends {AbleC, lsp:Comment};

-- The C preprocessor strips these for us, but handle them here for completeness.
ignore terminal LineComment_t
  /[/][/].*/
  lexer classes {Comment};

ignore terminal BlockComment_t
  /[/][*]([^*]|[\r\n]|([*]+([^*/]|[\r\n])))*[*]+[/]/
  lexer classes {Comment};

lexer class WhiteSpace extends AbleC;

-- The following need to be separated for tables without white space
-- to work.  See edu:umn:cs:melt:exts:ableC:tablesWS.
ignore terminal Spaces_t 
  /[\t ]+/
  lexer classes {WhiteSpace};

ignore terminal NewLine_t /[\n\r]+/
  lexer classes {WhiteSpace};

{--
 - Identifiers: normal or type name.
 -}
 
lexer class Identifier extends AbleC;

-- See LexerHack.sv for code related to disambiguation of these terminals.
terminal Identifier_t /[A-Za-z_\$][A-Za-z_0-9\$]*/ lexer classes {Identifier, Scoped};
terminal TypeName_t   /[A-Za-z_\$][A-Za-z_0-9\$]*/ lexer classes {Type, Identifier, Scoped};


{--
 - Literals
 -}
lexer class NumericLiteral extends {AbleC, lsp:Number};

-- Begins with 1-9 or is just 0 alone
terminal DecConstant_t /((0)|([1-9][0-9]*))/ lexer classes {NumericLiteral};
terminal DecConstantU_t   /((0)|([1-9][0-9]*))([Uu])/ lexer classes {NumericLiteral};
terminal DecConstantL_t   /((0)|([1-9][0-9]*))([Ll])/ lexer classes {NumericLiteral};
terminal DecConstantUL_t  /((0)|([1-9][0-9]*))(([Uu][Ll])|([Ll][Uu]))/ lexer classes {NumericLiteral};
terminal DecConstantLL_t  /((0)|([1-9][0-9]*))([Ll][Ll])/ lexer classes {NumericLiteral};
terminal DecConstantULL_t /((0)|([1-9][0-9]*))(([Uu][Ll][Ll])|([Ll][Ll][Uu]))/ lexer classes {NumericLiteral};

-- Begins with 0 AND has more digits
terminal OctConstant_t /(0[0-7]+)/ lexer classes {NumericLiteral};
terminal OctConstantU_t   /(0[0-7]+)([Uu])/ lexer classes {NumericLiteral};
terminal OctConstantL_t   /(0[0-7]+)([Ll])/ lexer classes {NumericLiteral};
terminal OctConstantUL_t  /(0[0-7]+)(([Uu][Ll])|([Ll][Uu]))/ lexer classes {NumericLiteral};
terminal OctConstantLL_t  /(0[0-7]+)([Ll][Ll])/ lexer classes {NumericLiteral};
terminal OctConstantULL_t /(0[0-7]+)(([Uu][Ll][Ll])|([Ll][Ll][Uu]))/ lexer classes {NumericLiteral};
-- Specially recognize octal constants with 8 or 9 in them. (n.b. submits to, not class literal)
terminal OctConstantError_t /(0[0-9]+)[uUlL]*/ submits to {NumericLiteral};

-- Begins with 0x and has more digits
terminal HexConstant_t /(0[xX][0-9A-Fa-f]+)/ lexer classes {NumericLiteral};
terminal HexConstantU_t /(0[xX][0-9A-Fa-f]+)([Uu])/ lexer classes {NumericLiteral};
terminal HexConstantL_t /(0[xX][0-9A-Fa-f]+)([Ll])/ lexer classes {NumericLiteral};
terminal HexConstantUL_t /(0[xX][0-9A-Fa-f]+)(([Uu][Ll])|([Ll][Uu]))/ lexer classes {NumericLiteral};
terminal HexConstantLL_t /(0[xX][0-9A-Fa-f]+)([Ll][Ll])/ lexer classes {NumericLiteral};
terminal HexConstantULL_t /(0[xX][0-9A-Fa-f]+)(([Uu][Ll][Ll])|([Ll][Ll][Uu]))/ lexer classes {NumericLiteral};

{- 	(((([0-9]+[.])|         -- end with do
	  ([0-9]*[.][0-9]+))    -- has dot
	 ([Ee][-+]?[0-9]+)?)|	-- optional exponent
	 ([0-9]+[Ee][-+]?[0-9]+)) -- No dot, mandatory exponent
 -}
terminal FloatConstant_t /(((([0-9]+[.])|([0-9]*[.][0-9]+))([Ee][-+]?[0-9]+)?)|([0-9]+[Ee][-+]?[0-9]+))/ lexer classes {NumericLiteral};

{-	(((([0-9]+[.])|         -- end with do
	  ([0-9]*[.][0-9]+))    -- has dot
	 ([Ee][-+]?[0-9]+)?)|	-- optional exponent
	 ([0-9]+[Ee][-+]?[0-9]+)) -- No dot, mandatory exponent
	[Ff]
 -}
terminal FloatConstantFloat_t /(((([0-9]+[.])|([0-9]*[.][0-9]+))([Ee][-+]?[0-9]+)?)|([0-9]+[Ee][-+]?[0-9]+))[Ff]/ lexer classes {NumericLiteral};

{-	(((([0-9]+[.])|         -- end with do
	  ([0-9]*[.][0-9]+))    -- has dot
	 ([Ee][-+]?[0-9]+)?)|	-- optional exponent
	 ([0-9]+[Ee][-+]?[0-9]+)) -- No dot, mandatory exponent
	[Ll]
-}
terminal FloatConstantLongDouble_t /(((([0-9]+[.])|([0-9]*[.][0-9]+))([Ee][-+]?[0-9]+)?)|([0-9]+[Ee][-+]?[0-9]+))[Ll]/ lexer classes {NumericLiteral};

{-	0[xX]
	(([a-fA-F0-9]+[.]?)|
	 ([a-fA-F0-9]*[.][a-fA-F0-9]+))
	([Pp][-+]?[0-9]+) -- mandatory exponent part
-}
terminal HexFloatConstant_t /0[xX](([a-fA-F0-9]+[.]?)|([a-fA-F0-9]*[.][a-fA-F0-9]+))([Pp][-+]?[0-9]+)/ lexer classes {NumericLiteral};

{-	0[xX]
	(([a-fA-F0-9]+[.]?)|
	 ([a-fA-F0-9]*[.][a-fA-F0-9]+))
	([Pp][-+]?[0-9]+) -- mandatory exponent part
	[Ff]
-}
terminal HexFloatConstantFloat_t /0[xX](([a-fA-F0-9]+[.]?)|([a-fA-F0-9]*[.][a-fA-F0-9]+))([Pp][-+]?[0-9]+)[Ff]/ lexer classes {NumericLiteral};

{-	0[xX]
	(([a-fA-F0-9]+[.]?)|
	 ([a-fA-F0-9]*[.][a-fA-F0-9]+))
	([Pp][-+]?[0-9]+) -- mandatory exponent part
	[Ll]
-}
terminal HexFloatConstantLongDouble_t /0[xX](([a-fA-F0-9]+[.]?)|([a-fA-F0-9]*[.][a-fA-F0-9]+))([Pp][-+]?[0-9]+)[Ll]/ lexer classes {NumericLiteral};


lexer class StringLiteral extends {AbleC, lsp:String_};

terminal StringConstant_t      /["]([^"\\]|[\\].)*["]/ lexer classes {StringLiteral};
terminal StringConstantU8_t  /u8["]([^"\\]|[\\].)*["]/ lexer classes {StringLiteral};
terminal StringConstantL_t    /L["]([^"\\]|[\\].)*["]/ lexer classes {StringLiteral};
terminal StringConstantU_t    /u["]([^"\\]|[\\].)*["]/ lexer classes {StringLiteral};
terminal StringConstantUBig_t /U["]([^"\\]|[\\].)*["]/ lexer classes {StringLiteral};

terminal CharConstant_t      /[']([^']|[\\].)[']/ lexer classes {StringLiteral};
terminal CharConstantL_t    /L[']([^']|[\\].)[']/ lexer classes {StringLiteral};
terminal CharConstantU_t    /u[']([^']|[\\].)[']/ lexer classes {StringLiteral};
terminal CharConstantUBig_t /U[']([^']|[\\].)[']/ lexer classes {StringLiteral};


{--
 - Keywords
 -
 - Keyword = things that should be considered keywords (e.g. for IDE highlighting)
 - Reserved = things that lexically dominate identifiers
 -
 - Extensions can introduce new keywords, but generally shouldn't introduce lexical precedence
 - relations involving host terminals, such as by introducing Reserved terminals.
 -
 - Note that Reserved doesn't extend AbleC, other host languages/extensions using AbleC
 - as a DSL may define terminals in this lexer class.
 -}
lexer class Keyword extends {AbleC, lsp:Keyword};
lexer class Reserved;


-- types
lexer class Type extends {AbleC, lsp:Type};

terminal Char_t     'char'     lexer classes {Type, Reserved};
terminal Double_t   'double'   lexer classes {Type, Reserved};
terminal Float_t    'float'    lexer classes {Type, Reserved};
terminal Int_t      'int'      lexer classes {Type, Reserved};
terminal Long_t     'long'     lexer classes {Type, Reserved};
terminal Short_t    'short'    lexer classes {Type, Reserved};
terminal Signed_t   'signed'   lexer classes {Type, Reserved};
terminal Unsigned_t 'unsigned' lexer classes {Type, Reserved};
terminal Void_t     'void'     lexer classes {Type, Reserved};
terminal Bool_t     '_Bool'      lexer classes {Type, Reserved}; -- c99
terminal Complex_t  '_Complex'   lexer classes {Type, Reserved}; -- c99
terminal Imagin_t   '_Imaginary' lexer classes {Type, Reserved}; -- c99

-- Er, Specifiers?
terminal Enum_t   'enum'   lexer classes {Keyword, Reserved};
terminal Struct_t 'struct' lexer classes {Keyword, Reserved};
terminal Union_t  'union'  lexer classes {Keyword, Reserved};

-- Qualifiers
terminal Const_t    'const'    lexer classes {Keyword, Reserved, lsp:Modification};
terminal Volatile_t 'volatile' lexer classes {Keyword, Reserved, lsp:Modification};
terminal Restrict_t 'restrict' lexer classes {Keyword, Reserved, lsp:Modification}; -- c99

-- Function specifiers
terminal Inline_t   'inline'   lexer classes {Keyword, Reserved, lsp:Modification}; -- c99

-- Storage class specifiers
terminal Auto_t     'auto'     lexer classes {Keyword, Reserved, lsp:Modification};
terminal Extern_t   'extern'   lexer classes {Keyword, Reserved, lsp:Modification};
terminal Register_t 'register' lexer classes {Keyword, Reserved, lsp:Modification};
terminal Static_t   'static'   lexer classes {Keyword, Reserved, lsp:Modification};
terminal Typedef_t  'typedef'  lexer classes {Keyword, Reserved, lsp:Modification};

-- Statement keywords
terminal Break_t    'break'    lexer classes {Keyword, Reserved};
terminal Case_t     'case'     lexer classes {Keyword, Reserved};
terminal Continue_t 'continue' lexer classes {Keyword, Reserved};
terminal Default_t  'default'  lexer classes {Keyword, Reserved};
terminal Do_t       'do'       lexer classes {Keyword, Reserved};
terminal Else_t     'else'     lexer classes {Keyword, Reserved}, precedence = 2, association = left;
terminal For_t      'for'      lexer classes {Keyword, Reserved};
terminal Goto_t     'goto'     lexer classes {Keyword, Reserved};
terminal If_t       'if'       lexer classes {Keyword, Reserved};
terminal Return_t   'return'   lexer classes {Keyword, Reserved};
terminal Switch_t   'switch'   lexer classes {Keyword, Reserved};
terminal While_t    'while'    lexer classes {Keyword, Reserved};

-- Expression keywords
terminal Sizeof_t   'sizeof'   lexer classes {Keyword, Reserved};

-- Structural symbols
terminal Comma_t       ',';
terminal Semi_t        ';';
terminal LParen_t      '(';
terminal RParen_t      ')' precedence = 1, association = left; -- evidently, part of dangling-else?
terminal LBracket_t    '[';
terminal RBracket_t    ']';
terminal LCurly_t      '{'  action { context = head(context) :: context; };
terminal RCurly_t      '}'  action { context = tail(context); };

{- In the standard C grammar, '{' can never follow a type expression.
 - In C++ this is allowed, and we would like to allow the same for extensions.
 - Doing so directly results in shift/reduce conflicts between struct/enum/
 - union references and declarations that can't be resolved one way via
 - precedence.
 - Instead, we introduce a distinct TypeLCurly_t terminal to be used in these
 - declarations that is lexically ambigous with '{', and use a parser attribute
 - to control whether it is allowed to occur.
 -}
terminal TypeLCurly_t  /{/  action { context = head(context) :: context; };

parser attribute allowStructEnumUnionDecl :: Boolean
  action { allowStructEnumUnionDecl = true; };

terminal AllowSEUDecl_t '' action { allowStructEnumUnionDecl = true; };
terminal DisallowSEUDecl_t '' action { allowStructEnumUnionDecl = false; };

disambiguate LCurly_t, TypeLCurly_t {
  pluck if allowStructEnumUnionDecl then TypeLCurly_t else LCurly_t;
}

lexer class Operator extends {AbleC, lsp:Operator};

terminal Question_t    '?'    lexer classes {Operator};
terminal Colon_t       ':'    lexer classes {Operator};

-- Member operators
terminal Dot_t         '.'    lexer classes {Operator};
terminal PtrDot_t      '->'   lexer classes {Operator};

-- Assignment operators
lexer class Assignment extends Operator;

terminal Assign_t       '='     lexer classes {Assignment};
terminal RightAssign_t  '>>='   lexer classes {Assignment};
terminal LeftAssign_t   '<<='   lexer classes {Assignment};
terminal AddAssign_t    '+='    lexer classes {Assignment};
terminal SubAssign_t    '-='    lexer classes {Assignment};
terminal MulAssign_t    '*='    lexer classes {Assignment};
terminal DivAssign_t    '/='    lexer classes {Assignment};
terminal ModAssign_t    '%='    lexer classes {Assignment};
terminal AndAssign_t    '&='    lexer classes {Assignment};
terminal XorAssign_t    '^='    lexer classes {Assignment};
terminal OrAssign_t     '|='    lexer classes {Assignment};

-- Bit operators
terminal And_t         '&'    lexer classes {Operator}; -- address of
terminal Or_t          '|'    lexer classes {Operator};
terminal Tilde_t       '~'    lexer classes {Operator};
terminal Xor_t         '^'    lexer classes {Operator};
terminal RightShift_t  '>>'   lexer classes {Operator};
terminal LeftShift_t   '<<'   lexer classes {Operator};

-- Numerical operators
terminal Minus_t       '-'  precedence = 5, association = left, lexer classes {Operator}; -- negative
terminal Plus_t        '+'  precedence = 5, association = left, lexer classes {Operator}; -- positive
terminal Star_t        '*'  precedence = 6, association = left, lexer classes {Operator}; -- pointer, deref
terminal Divide_t      '/'  precedence = 6, association = left, lexer classes {Operator};
terminal Mod_t         '%'  precedence = 6, association = left, lexer classes {Operator};

-- Logical operators
terminal Not_t   '!'  lexer classes {Operator};
terminal AndOp_t '&&' precedence = 4, association = left, lexer classes {Operator};
terminal OrOp_t  '||' precedence = 4, association = left, lexer classes {Operator};

-- Comparison operators
terminal LessThan_t         '<'  precedence = 3, association = left, lexer classes {Operator};
terminal GreaterThan_t      '>'  precedence = 3, association = left, lexer classes {Operator};
terminal LessThanEqual_t    '<=' precedence = 3, association = left, lexer classes {Operator};
terminal GreaterThanEqual_t '>=' precedence = 3, association = left, lexer classes {Operator};
terminal Equality_t         '==' precedence = 3, association = left, lexer classes {Operator};
terminal NonEquality_t      '!=' precedence = 3, association = left, lexer classes {Operator};

-- *crement operators
terminal Inc_t        '++'    lexer classes {Operator};
terminal Dec_t        '--'    lexer classes {Operator};

-- Varargs syntax
terminal Elipses_t      '...';

-- High precedence empty terminal, for some reason?
terminal Cpp_Attribute_high_prec '' precedence = 20;

-- Wrappers for identifiers, as extensions may wish to introduce new syntax
-- representing an arbitrary Name
closed nonterminal Identifier_c with location, ast<ast:Name>;
concrete productions top::Identifier_c
| id::Identifier_t
    { top.ast = ast:fromId(id); }

closed nonterminal TypeIdName_c with location, ast<ast:Name>;
concrete productions top::TypeIdName_c
| t::TypeName_t
    { top.ast = ast:fromTy(t); }

-- Seed follow set with additional terminals useful for extensions
-- We include < here since it is allowed in C++
terminal TypeIdName_NEVER_t 'TypeIdName_Never!!!nevernever1234567890';
concrete productions top::Expr_c
| 'TypeIdName_Never!!!nevernever1234567890' TypeIdName_c '<'
    { top.ast = ast:errorExpr ( [ err (top.location, "Internal Error. " ++
        "Placeholder for TypeIdName_c should not appear in the tree.") ],
        location=top.location ) ; }
