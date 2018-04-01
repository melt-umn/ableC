grammar edu:umn:cs:melt:ableC:tools:builtins;

import edu:umn:cs:melt:ableC:abstractsyntax:host as a;
import edu:umn:cs:melt:ableC:abstractsyntax:env as a;
import silver:langutil:pp as debugging;

-- This grammar parses parts of the *.def files and translates them to something suitable for AbleC.

ignore terminal LineComment /[\/][\/].*/;
ignore terminal PreprocessorDirective /#.*/;
ignore terminal WhiteSpace /[\r\n\t\ ]+/;

-- We skip these for now.
terminal LIBBUILTIN_NotProcessed /LIBBUILTIN.*/;

terminal BUILTIN /(BUILTIN)|(ATOMIC_BUILTIN)/;
terminal LParen '(';
terminal RParen ')';
terminal Comma ',';
terminal Identifier /[A-Za-z_\$][A-Za-z_0-9\$]*/;
terminal Quote '"';

-- Parameter types
terminal Void 'v';
terminal Bool 'b';
terminal Char 'c';
terminal Short 's';
terminal Int 'i';
terminal Floating 'f';
terminal DoubleFloat 'd';
terminal Size_t 'z';
-- skipping G, H, M. ObjC only?
terminal ObjC_F 'F'; -- ignore this
terminal VaList 'a';
terminal VaListReference 'A';
terminal Vector 'V';
terminal VectorNum /[0-9]+/;
-- ditto E
terminal Complex 'X';
-- skipping Y, J, SJ, K, p
terminal FILE 'P'; -- maybe ignore this?
terminal Dots '.';

-- prefixes
terminal Long 'L';
terminal LongLong 'LL';
terminal LLLong 'LLL';
terminal Signed 'S';
terminal Unsigned 'U';
terminal ConstantRequired 'I'; -- ignore these?

-- suffixes
terminal Pointer '*';
terminal Reference '&'; -- ignore these
terminal Const 'C';
terminal Volatile 'D';

-- Extra annotations we ignore right now, so...
terminal IgnoredStuff /[nrctFfipP:NPsSeju0-9]*/;



synthesized attribute ignoredBuiltins :: [String];


nonterminal Builtins with ignoredBuiltins;

concrete production consBuiltins
top::Builtins ::= h::Builtin  t::Builtins
{
  top.ignoredBuiltins = h.ignoredBuiltins ++ t.ignoredBuiltins;
}
concrete production nilBultins
top::Builtins ::=
{
  top.ignoredBuiltins = [];
}

nonterminal Builtin with ignoredBuiltins;

concrete production builtinFunction
top::Builtin ::= BUILTIN '(' id::Identifier ',' '"' t::Types dots::MaybeDots '"' ',' '"' x::IgnoredStuff '"' ')'
{
  top.ignoredBuiltins = 
    if t.ignoreMe || indexOf("t", x.lexeme) != -1 || indexOf("u", x.lexeme) != -1 then
      ["-- Ignored " ++ id.lexeme ++ " on line " ++ toString(id.location.line)]
      --[]
    else ["d <- [valueDef(\"" ++ id.lexeme ++ "\", builtinFunctionValueItem( {- " ++ debugprint ++ " -}\n    " ++ substitute("edu:umn:cs:melt:ableC:abstractsyntax:host:", "", hackUnparse(sig)) ++ ",\n    ordinaryFunctionHandler))];" ];
  
  local debugprint :: String =
    debugging:show(80, debugging:cat(sig.a:lpp, sig.a:rpp));
  local sig :: a:Type =
    a:functionType(head(t.signature),
      a:protoFunctionType(
        tail(t.signature),
        dots.hasdots), a:nilQualifier());
}
concrete production ignoredLIBBUILTIN
top::Builtin ::= LIBBUILTIN_NotProcessed
{
  top.ignoredBuiltins = []; -- We know about this. Just the others.
}

nonterminal Types with ignoreMe, signature;

synthesized attribute ignoreMe :: Boolean;
synthesized attribute signature :: [a:Type];

concrete production consTypes
top::Types ::= h::Type  t::Types
{
  top.ignoreMe = h.ignoreMe || t.ignoreMe;
  top.signature = h.typerep :: t.signature;
}
concrete production nilTypes
top::Types ::=
{
  top.ignoreMe = false;
  top.signature = [];
}

nonterminal Type with ignoreMe, typerep;

synthesized attribute typerep :: a:Type;

concrete production typeString
top::Type ::= p::TypePrefixes  t::TypeSpecifier  s::TypeSuffixes
{
  top.ignoreMe = p.ignoreMe || t.ignoreMe || s.ignoreMe;
  t.givenSign = if p.issigned then a:signedType else a:unsignedType;
  t.givenDomain = a:realType;
  local typerep1 :: a:Type = t.specifier(s.qualifiers);
  
  top.typerep = addpointers(s.pointercount, typerep1);
}

function addpointers
a:Type ::= count::Integer  t::a:Type
{
  return if count == 0 then t else addpointers(count-1, a:pointerType(a:nilQualifier(), t));
}

nonterminal TypePrefixes with ignoreMe, issigned;

concrete production consTypePrefixes
top::TypePrefixes ::= h::TypePrefix  t::TypePrefixes
{
  top.ignoreMe = h.ignoreMe || t.ignoreMe;
  top.issigned = h.issigned && t.issigned;
}
concrete production nilTypePrefixes
top::TypePrefixes ::=
{
  top.ignoreMe = false;
  top.issigned = true;
}

nonterminal TypeSuffixes with ignoreMe, qualifiers, pointercount;

concrete production consTypeSuffixes
top::TypeSuffixes ::= h::TypeSuffix  t::TypeSuffixes
{
  top.ignoreMe = h.ignoreMe || t.ignoreMe;
  top.qualifiers = a:qualifierCat(h.qualifiers, t.qualifiers);
  top.pointercount = h.pointercount + t.pointercount;
}
concrete production nilTypeSuffixes
top::TypeSuffixes ::=
{
  top.ignoreMe = false;
  top.qualifiers = a:nilQualifier();
  top.pointercount = 0;
}

nonterminal TypePrefix with ignoreMe, issigned;

synthesized attribute issigned :: Boolean;

aspect default production
top::TypePrefix ::=
{
  top.ignoreMe = false;
  top.issigned = true;
}

concrete productions top::TypePrefix
--| 'L' {}
--| 'LL' {}
--| 'LLL' {}
| 'S' {}
| 'U' { top.issigned = false;}
| 'I' { }-- top.ignoreMe = true; } -- maybe ignore all of these? -- TODO: for now, allowing it!

nonterminal TypeSpecifier with ignoreMe, specifier, givenSign, givenDomain;

synthesized attribute specifier :: (a:Type ::= a:Qualifiers);
autocopy attribute givenSign :: (a:BuiltinType ::= a:IntegerType);
autocopy attribute givenDomain :: (a:BuiltinType ::= a:RealType);

aspect default production
top::TypeSpecifier ::=
{
  top.ignoreMe = false;
}

concrete productions top::TypeSpecifier
| 'v' {-void-} { top.specifier = a:builtinType(_, a:voidType()); }
| 'b' {-bool-} { top.specifier = a:builtinType(_, a:boolType()); }
| 'c' {-char-} { top.specifier = a:builtinType(_, top.givenSign(a:charType())); }
| 's' {-short-} { top.specifier = a:builtinType(_, top.givenSign(a:shortType())); }
| 'i' {-int-} { top.specifier = a:builtinType(_, top.givenSign(a:intType())); }
| 'L' 'i' {-long-} { top.specifier = a:builtinType(_, top.givenSign(a:longType())); }
| 'LL' 'i' {-long long-} { top.specifier = a:builtinType(_, top.givenSign(a:longlongType())); }
| 'LLL' 'i' {-int128-} { top.specifier = a:builtinType(_, top.givenSign(a:int128Type())); }

| 'f' {-float-} { top.specifier = a:builtinType(_, top.givenDomain(a:floatType())); }
| 'd' {-double-} { top.specifier = a:builtinType(_, top.givenDomain(a:doubleType())); }
| 'L' 'd' {-long double-} { top.specifier = a:builtinType(_, top.givenDomain(a:longdoubleType())); }

| 'F' {-ObjC crap-} { top.ignoreMe = true; } -- Ignore anything with this spec
| 'P' {-FILE-} { top.ignoreMe = true; } -- dunno what to do with this?
| 'z' {-size_t-} { top.specifier = a:builtinType(_, top.givenSign(a:intType())); } -- TODO: do better?
| 'a' {-valist-} { top.specifier = a:builtinType(_, a:voidType()); } -- TODO
| 'A' {-valist?pointer maybe?-} { top.specifier = a:pointerType(_, a:builtinType(a:nilQualifier(), a:voidType())); }-- TODO ALSO: underscore in wrong spot
| 'X'  more::TypeSpecifier {-_Complex-} { more.givenSign = a:complexIntegerType;
                                          more.givenDomain = a:complexType;
                                          top.specifier = more.specifier; }
| 'V'  n::VectorNum  more::TypeSpecifier { top.specifier = createVectorType(_, more.specifier, n.lexeme); }

function createVectorType
a:Type ::= qs::a:Qualifiers more::(a:Type ::= a:Qualifiers) n::String
{
  return a:vectorType(more(qs), toInt(n));
}

nonterminal TypeSuffix with ignoreMe, qualifiers, pointercount;

synthesized attribute qualifiers :: a:Qualifiers;
synthesized attribute pointercount :: Integer;

aspect default production
top::TypeSuffix ::=
{
  top.ignoreMe = false;
  top.qualifiers = a:nilQualifier();
  top.pointercount = 0;
}

concrete productions top::TypeSuffix
| '*' {-pointer-} { top.pointercount = 1; }
| '&' {-C++-} { top.ignoreMe = true; } -- ignore these
| 'C' {-const-} { top.qualifiers = a:consQualifier(a:constQualifier(location=builtinLoc("host")), a:nilQualifier()); }
| 'D' {-volatile-} { top.qualifiers = a:consQualifier(a:volatileQualifier(location=builtinLoc("host")), a:nilQualifier()); }


nonterminal MaybeDots with hasdots;

synthesized attribute hasdots :: Boolean;

concrete productions top::MaybeDots
| '.' { top.hasdots = true;}
| { top.hasdots = false; }




parser parseDef :: Builtins {
  edu:umn:cs:melt:ableC:tools:builtins;
}


function main
IOVal<Integer> ::= args::[String]  ioin::IO
{
  local file :: IOVal<String> = readFile(head(args), ioin);

  local parseresult :: ParseResult<Builtins> = parseDef(file.iovalue, head(args));

  local onerror :: IOVal<Integer> = ioval(print(parseresult.parseErrors ++ "\n", file.io), -1);
  
  local onsuccess :: IOVal<Integer> = ioval(print(
    "grammar edu:umn:cs:melt:ableC:abstractsyntax:builtins;\n" ++
    "--GENERATED FILE, DO NOT EDIT. see :tools:builtins\n" ++
    "aspect function getInitialEnvDefs [Def] ::= {\n" ++
      implode("\n", parseresult.parseTree.ignoredBuiltins) ++ "\n" ++
    "}\n", file.io), 0);

  return if parseresult.parseSuccess then onsuccess else onerror;
}



