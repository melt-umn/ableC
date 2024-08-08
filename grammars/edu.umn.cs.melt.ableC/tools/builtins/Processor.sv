grammar edu:umn:cs:melt:ableC:tools:builtins;

import edu:umn:cs:melt:ableC:abstractsyntax:host as a;
import edu:umn:cs:melt:ableC:abstractsyntax:env as a;
import silver:langutil:pp as debugging;
import silver:reflect;

-- This grammar parses parts of the *.def files and translates them to something suitable for AbleC.

ignore terminal LineComment /[\/][\/].*/;
ignore terminal PreprocessorDirective /#.*/;
ignore terminal WhiteSpace /[\r\n\t\ ]+/;

-- We skip these for now.
terminal LIBBUILTIN_NotProcessed /LIBBUILTIN.*/;

terminal BUILTIN /(BUILTIN)|(ATOMIC_BUILTIN)/;
terminal TARGET_BUILTIN 'TARGET_BUILTIN';
terminal TARGET_HEADER_BUILTIN 'TARGET_HEADER_BUILTIN';
terminal LANGBUILTIN 'LANGBUILTIN';
terminal LParen '(';
terminal RParen ')';
terminal Comma ',';
terminal Identifier /[A-Za-z_\$][A-Za-z_0-9\$]*/;
terminal Quote '"';

-- Parameter types
terminal Void 'v';
terminal Bool 'b';
terminal Char 'c';
terminal WChar 'w';
terminal Short 's';
terminal Int 'i';
terminal HalfFloat 'h'; -- AKA fp16
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
terminal NSize 'N'; -- int if LP64, else long
terminal OpenCLLong 'O'; -- long on opencl
terminal LLLong 'LLL';
terminal Int32_t 'Z';
terminal Int64_t 'W';
terminal Signed 'S';
terminal Unsigned 'U';
terminal ConstantRequired 'I'; -- ignore these?

-- suffixes
terminal Pointer '*';
terminal Reference '&'; -- ignore these
terminal Const 'C';
terminal Volatile 'D';

-- languages
terminal ALL_LANGUAGES 'ALL_LANGUAGES';
terminal ALL_OCLC_LANGUAGES 'ALL_OCLC_LANGUAGES';
terminal ALL_MS_LANGUAGES 'ALL_MS_LANGUAGES';
terminal CXX_LANG 'CXX_LANG';
terminal OCLC20_LANG 'OCLC20_LANG'; -- OpenCL C 2.0
terminal OMP_LANG 'OMP_LANG';

-- Extra annotations we ignore right now, so...
terminal IgnoredStuff /[A-Za-z0-9:,.|]*/;

-- Actual builtin translation stuff
monoid attribute ignoredBuiltins :: [String];

tracked nonterminal Builtins with ignoredBuiltins;
propagate ignoredBuiltins on Builtins;

concrete productions top::Builtins
| h::Builtin  t::Builtins  {}
| {}

tracked nonterminal Builtin with ignoredBuiltins;

concrete production builtinFunction
top::Builtin ::= BUILTIN '(' id::Identifier ',' '"' t::Types dots::MaybeDots '"' ',' '"' x::IgnoredStuff '"' ')'
{
  top.ignoredBuiltins := 
    if t.ignoreMe || indexOf("t", x.lexeme) != -1 || indexOf("u", x.lexeme) != -1 then
      ["-- Ignored " ++ id.lexeme ++ " on line " ++ toString(id.location.line)]
      --[]
    else ["d <- [valueDef(\"" ++ id.lexeme ++ "\", builtinFunctionValueItem( {- " ++ debugprint ++ " -}\n    " ++ reflect(new(sig)).translation ++ ",\n    ordinaryFunctionHandler))];" ];
  
  local debugprint :: String =
    debugging:show(80, debugging:cat(sig.a:lpp, sig.a:rpp));
  local sig :: a:Type =
    a:functionType(head(t.signature),
      a:protoFunctionType(
        tail(t.signature),
        dots.hasdots), a:nilQualifier());
}
concrete production targetBuiltinFunction
top::Builtin ::= 'TARGET_BUILTIN' '(' id::Identifier ',' '"' types::Types
  dots::MaybeDots '"' ',' '"' attrs::IgnoredStuff '"' ',' '"'
  feature::IgnoredStuff '"' ')'
{
  forwards to builtinFunction(terminal(BUILTIN, "BUILTIN"), '(', id, ',', '"',
    @types, @dots, '"', ',', '"', attrs, '"', ')');
}
concrete production targetHeaderBuiltinFunction
top::Builtin ::= 'TARGET_HEADER_BUILTIN' '(' id::Identifier ',' '"'
  types::Types dots::MaybeDots '"' ',' '"' attrs::IgnoredStuff '"' ',' '"'
  header::IgnoredStuff '"' ',' lang::Languages ',' '"' feature::IgnoredStuff
  '"' ')'
{
  forwards to builtinFunction(terminal(BUILTIN, "BUILTIN"), '(', id, ',', '"',
    @types, @dots, '"', ',', '"', attrs, '"', ')');
}
concrete production langBuiltinFunction
top::Builtin ::= 'LANGBUILTIN' '(' id::Identifier ',' '"' types::Types
  dots::MaybeDots '"' ',' '"' attrs::IgnoredStuff '"' ',' lang::Languages ')'
{
  forwards to builtinFunction(terminal(BUILTIN, "BUILTIN"), '(', id, ',', '"',
    @types, @dots, '"', ',', '"', attrs, '"', ')');
}
concrete production ignoredLIBBUILTIN
top::Builtin ::= LIBBUILTIN_NotProcessed
{
  top.ignoredBuiltins := []; -- We know about this. Just the others.
}

monoid attribute ignoreMe :: Boolean with false, ||;
synthesized attribute signature :: [a:Type];

tracked nonterminal Types with ignoreMe, signature;
propagate ignoreMe on Types;

concrete productions top::Types
| h::Type  t::Types
  { top.signature = h.typerep :: t.signature; }
|
  { top.signature = []; }

tracked nonterminal Type with ignoreMe, typerep;
propagate ignoreMe on Type;

synthesized attribute typerep :: a:Type;

concrete production typeString
top::Type ::= p::TypePrefixes  t::TypeSpecifier  s::TypeSuffixes
{
  t.givenSign = if p.issigned then a:signedType else a:unsignedType;
  t.givenDomain = a:realType;
  nondecorated local typerep1::a:Type = t.specifier(s.qualifiers);
  
  top.typerep = addpointers(s.pointercount, typerep1);
}

fun addpointers a:Type ::= count::Integer  t::a:Type =
  if count == 0 then t else addpointers(count-1, a:pointerType(a:nilQualifier(), t));

monoid attribute issigned :: Boolean with true, &&;

tracked nonterminal TypePrefixes with ignoreMe, issigned;
propagate ignoreMe, issigned on TypePrefixes;

concrete production consTypePrefixes
top::TypePrefixes ::= h::TypePrefix  t::TypePrefixes
{}
concrete production nilTypePrefixes
top::TypePrefixes ::=
{}

monoid attribute qualifiers :: a:Qualifiers with a:nilQualifier(), a:qualifierCat;
monoid attribute pointercount :: Integer with 0, +;

tracked nonterminal TypeSuffixes with ignoreMe, qualifiers, pointercount;
propagate ignoreMe, qualifiers, pointercount on TypeSuffixes;

concrete productions top::TypeSuffixes
| h::TypeSuffix  t::TypeSuffixes  {}
| {}

tracked nonterminal TypePrefix with ignoreMe, issigned;

aspect default production
top::TypePrefix ::=
{
  propagate ignoreMe, issigned;
}

concrete productions top::TypePrefix
--| 'L' {}
--| 'LL' {}
--| 'LLL' {}
| 'S' {}
| 'U' { top.issigned := false;}
| 'I' { }-- top.ignoreMe = true; } -- maybe ignore all of these? -- TODO: for now, allowing it!

tracked nonterminal TypeSpecifier with ignoreMe, specifier, size, givenSign, givenDomain;

synthesized attribute specifier :: (a:Type ::= a:Qualifiers);
synthesized attribute size :: Integer;  -- Size on X86_64 (which is all we care about for vector intrinsics, for now...) 
inherited attribute givenSign :: (a:BuiltinType ::= a:IntegerType);
inherited attribute givenDomain :: (a:BuiltinType ::= a:RealType);

propagate givenSign, givenDomain on TypeSpecifier excluding complexTypeSpec;

aspect default production
top::TypeSpecifier ::=
{
  top.ignoreMe := false;
}

concrete productions top::TypeSpecifier
| 'v' {-void-} { top.specifier = a:builtinType(_, a:voidType()); top.size = 0; }
| 'b' {-bool-} { top.specifier = a:builtinType(_, a:boolType()); top.size = 1; }
| 'c' {-char-} { top.specifier = a:builtinType(_, top.givenSign(a:charType())); top.size = 1; }
| 'w' {-wchar-} { top.specifier = a:builtinType(_, top.givenSign(a:intType())); top.size = 4; } -- TODO: is this right?
| 's' {-short-} { top.specifier = a:builtinType(_, top.givenSign(a:shortType())); top.size = 2; }
| 'i' {-int-} { top.specifier = a:builtinType(_, top.givenSign(a:intType())); top.size = 4; }
| 'L' 'i' {-long-} { top.specifier = a:builtinType(_, top.givenSign(a:longType())); top.size = 8; }
| 'O' 'i' {-long long-} { top.specifier = a:builtinType(_, top.givenSign(a:longlongType())); top.size = 8; }
| 'LL' 'i' {-long long-} { top.specifier = a:builtinType(_, top.givenSign(a:longlongType())); top.size = 8; }
| 'N' 'i' {-whatever this is-} { top.ignoreMe := true; } -- TODO
| 'LLL' 'i' {-int128-} { top.specifier = a:builtinType(_, top.givenSign(a:int128Type())); top.size = 16; }

| 'Z' 'i' {-int32-} { top.specifier = a:builtinType(_, top.givenSign(a:intType())); top.size = 4; }
| 'W' 'i' {-int64-} { top.specifier = a:builtinType(_, top.givenSign(a:longlongType())); top.size = 8; }

| 'h' {-half-float/fp16-} { top.ignoreMe := true; } -- TODO
| 'f' {-float-} { top.specifier = a:builtinType(_, top.givenDomain(a:floatType())); top.size = 4; }
| 'd' {-double-} { top.specifier = a:builtinType(_, top.givenDomain(a:doubleType())); top.size = 8; }
| 'L' 'd' {-long double-} { top.specifier = a:builtinType(_, top.givenDomain(a:longdoubleType())); top.size = 16; }
| 'LL' 'd' {-fp128-} { top.ignoreMe := true; } -- TODO

| 'F' {-ObjC crap-} { top.ignoreMe := true;  } -- Ignore anything with this spec
| 'P' {-FILE-} { top.ignoreMe := true; } -- dunno what to do with this?
| 'z' {-size_t-} { top.specifier = a:builtinType(_, top.givenSign(a:intType())); top.size = 8; } -- TODO: do better?
| 'a' {-valist-} { top.specifier = a:builtinType(_, a:voidType()); } -- TODO
| 'A' {-valist?pointer maybe?-} { top.specifier = a:pointerType(_, a:builtinType(a:nilQualifier(), a:voidType())); top.size = 8; }-- TODO ALSO: underscore in wrong spot
(complexTypeSpec)
| 'X'  more::TypeSpecifier {-_Complex-} { more.givenSign = a:complexIntegerType;
                                          more.givenDomain = a:complexType;
                                          top.specifier = more.specifier;
                                          top.size = more.size * 2; }
| 'V'  n::VectorNum  more::TypeSpecifier
  { top.specifier = \ qs::a:Qualifiers -> a:vectorType(more.specifier(qs), top.size); top.size = toInteger(n.lexeme) * more.size; }


nonterminal Languages with ignoreMe;

concrete productions top::Languages
| 'ALL_LANGUAGES' {}
| 'ALL_OCLC_LANGUAGES' {}
| 'ALL_MS_LANGUAGES' {}
| 'CXX_LANG' {}
| 'OCLC20_LANG' {}
| 'OMP_LANG' {}

tracked nonterminal TypeSuffix with ignoreMe, qualifiers, pointercount;

aspect default production
top::TypeSuffix ::=
{
  propagate ignoreMe, qualifiers, pointercount;
}

concrete productions top::TypeSuffix
| '*' {-pointer-} { top.pointercount := 1; }
| '&' {-C++-} { top.ignoreMe := true; } -- ignore these
| 'C' {-const-} { top.qualifiers := a:consQualifier(a:constQualifier(), a:nilQualifier()); }
| 'D' {-volatile-} { top.qualifiers := a:consQualifier(a:volatileQualifier(), a:nilQualifier()); }


tracked nonterminal MaybeDots with hasdots;

synthesized attribute hasdots :: Boolean;

concrete productions top::MaybeDots
| '.' { top.hasdots = true;}
| { top.hasdots = false; }


-- Reflection helper stuff
synthesized attribute translation<a>::a;

attribute translation<String> occurs on AST;
aspect production nonterminalAST
top::AST ::= prodName::String children::ASTs annotations::NamedASTs
{
  local prodShortName::String = last(explode(":", prodName));
  top.translation = 
    s"${prodShortName}(${implode(", ", children.translation ++ annotations.translation)})";
}
aspect production listAST
top::AST ::= vals::ASTs
{ top.translation = s"[${implode(", ", vals.translation)}]"; }
aspect production stringAST
top::AST ::= s::String
{ top.translation = s"\"${escapeString(s)}\""; }
aspect production integerAST
top::AST ::= i::Integer
{ top.translation = toString(i); }
aspect production floatAST
top::AST ::= f::Float
{ top.translation = toString(f); }
aspect production booleanAST
top::AST ::= b::Boolean
{ top.translation = toString(b); }
aspect production anyAST
top::AST ::= x::a
{
  top.translation =
    case reflectTypeName(x) of
      just(n) -> error(s"Can't translate anyAST (type ${n})")
    | nothing() -> error("Can't translate anyAST")
    end;
}

attribute translation<[String]> occurs on ASTs;
aspect production consAST
top::ASTs ::= h::AST t::ASTs
{ top.translation = h.translation :: t.translation; }
aspect production nilAST
top::ASTs ::=
{ top.translation = []; }

attribute translation<[String]> occurs on NamedASTs;
aspect production consNamedAST
top::NamedASTs ::= h::NamedAST t::NamedASTs
{ top.translation = h.translation :: t.translation; }
aspect production nilNamedAST
top::NamedASTs ::=
{ top.translation = []; }

attribute translation<String> occurs on NamedAST;
aspect production namedAST
top::NamedAST ::= n::String v::AST
{ top.translation = s"${last(explode(":", n))}=${v.translation}"; }

-- Main driver
parser parseDef :: Builtins {
  edu:umn:cs:melt:ableC:tools:builtins;
}

function main
IOVal<Integer> ::= args::[String]  ioin::IOToken
{
  local file :: IOVal<String> = readFileT(head(args), ioin);

  local parseresult :: ParseResult<Builtins> = parseDef(file.iovalue, head(args));

  local onerror :: IOVal<Integer> = ioval(printT(parseresult.parseErrors ++ "\n", file.io), -1);
  
  local onsuccess :: IOVal<Integer> = ioval(printT(
    "grammar edu:umn:cs:melt:ableC:abstractsyntax:builtins;\n" ++
    "--GENERATED FILE, DO NOT EDIT. see edu:umn:cs:melt:ableC:tools:builtins\n" ++
    "aspect function getInitialEnvDefs [Def] ::= {\n" ++
      implode("\n", parseresult.parseTree.ignoredBuiltins) ++ "\n" ++
    "}\n", file.io), 0);

  return if parseresult.parseSuccess then onsuccess else onerror;
}

