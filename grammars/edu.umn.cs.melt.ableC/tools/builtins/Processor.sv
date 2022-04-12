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

-- Actual builtin translation stuff
monoid attribute ignoredBuiltins :: [String];

nonterminal Builtins with ignoredBuiltins;
propagate ignoredBuiltins on Builtins;

concrete productions top::Builtins
| h::Builtin  t::Builtins  {}
| {}

nonterminal Builtin with ignoredBuiltins;

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
concrete production ignoredLIBBUILTIN
top::Builtin ::= LIBBUILTIN_NotProcessed
{
  top.ignoredBuiltins := []; -- We know about this. Just the others.
}

monoid attribute ignoreMe :: Boolean with false, ||;
synthesized attribute signature :: [a:Type];

nonterminal Types with ignoreMe, signature;
propagate ignoreMe on Types;

concrete productions top::Types
| h::Type  t::Types
  { top.signature = h.typerep :: t.signature; }
|
  { top.signature = []; }

nonterminal Type with ignoreMe, typerep;
propagate ignoreMe on Type;

synthesized attribute typerep :: a:Type;

concrete production typeString
top::Type ::= p::TypePrefixes  t::TypeSpecifier  s::TypeSuffixes
{
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

monoid attribute issigned :: Boolean with true, &&;

nonterminal TypePrefixes with ignoreMe, issigned;
propagate ignoreMe, issigned on TypePrefixes;

concrete production consTypePrefixes
top::TypePrefixes ::= h::TypePrefix  t::TypePrefixes
{}
concrete production nilTypePrefixes
top::TypePrefixes ::=
{}

monoid attribute qualifiers :: a:Qualifiers with a:nilQualifier(), a:qualifierCat;
monoid attribute pointercount :: Integer with 0, +;

nonterminal TypeSuffixes with ignoreMe, qualifiers, pointercount;
propagate ignoreMe, qualifiers, pointercount on TypeSuffixes;

concrete productions top::TypeSuffixes
| h::TypeSuffix  t::TypeSuffixes  {}
| {}

nonterminal TypePrefix with ignoreMe, issigned;

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

nonterminal TypeSpecifier with ignoreMe, specifier, size, givenSign, givenDomain;

synthesized attribute specifier :: (a:Type ::= a:Qualifiers);
synthesized attribute size :: Integer;  -- Size on X86_64 (which is all we care about for vector intrinsics, for now...) 
autocopy attribute givenSign :: (a:BuiltinType ::= a:IntegerType);
autocopy attribute givenDomain :: (a:BuiltinType ::= a:RealType);

aspect default production
top::TypeSpecifier ::=
{
  propagate ignoreMe;
}

concrete productions top::TypeSpecifier
| 'v' {-void-} { top.specifier = a:builtinType(_, a:voidType()); top.size = 0; }
| 'b' {-bool-} { top.specifier = a:builtinType(_, a:boolType()); top.size = 1; }
| 'c' {-char-} { top.specifier = a:builtinType(_, top.givenSign(a:charType())); top.size = 1; }
| 's' {-short-} { top.specifier = a:builtinType(_, top.givenSign(a:shortType())); top.size = 2; }
| 'i' {-int-} { top.specifier = a:builtinType(_, top.givenSign(a:intType())); top.size = 4; }
| 'L' 'i' {-long-} { top.specifier = a:builtinType(_, top.givenSign(a:longType())); top.size = 8; }
| 'LL' 'i' {-long long-} { top.specifier = a:builtinType(_, top.givenSign(a:longlongType())); top.size = 8; }
| 'LLL' 'i' {-int128-} { top.specifier = a:builtinType(_, top.givenSign(a:int128Type())); top.size = 16; }

| 'f' {-float-} { top.specifier = a:builtinType(_, top.givenDomain(a:floatType())); top.size = 4; }
| 'd' {-double-} { top.specifier = a:builtinType(_, top.givenDomain(a:doubleType())); top.size = 8; }
| 'L' 'd' {-long double-} { top.specifier = a:builtinType(_, top.givenDomain(a:longdoubleType())); top.size = 16; }

| 'F' {-ObjC crap-} { top.ignoreMe := true;  } -- Ignore anything with this spec
| 'P' {-FILE-} { top.ignoreMe := true; } -- dunno what to do with this?
| 'z' {-size_t-} { top.specifier = a:builtinType(_, top.givenSign(a:intType())); top.size = 8; } -- TODO: do better?
| 'a' {-valist-} { top.specifier = a:builtinType(_, a:voidType()); } -- TODO
| 'A' {-valist?pointer maybe?-} { top.specifier = a:pointerType(_, a:builtinType(a:nilQualifier(), a:voidType())); top.size = 8; }-- TODO ALSO: underscore in wrong spot
| 'X'  more::TypeSpecifier {-_Complex-} { more.givenSign = a:complexIntegerType;
                                          more.givenDomain = a:complexType;
                                          top.specifier = more.specifier;
                                          top.size = more.size * 2; }
| 'V'  n::VectorNum  more::TypeSpecifier { top.specifier = \ qs::a:Qualifiers -> a:vectorType(more.specifier(qs), top.size); top.size = toInteger(n.lexeme) * more.size; }


nonterminal TypeSuffix with ignoreMe, qualifiers, pointercount;

aspect default production
top::TypeSuffix ::=
{
  propagate ignoreMe, qualifiers, pointercount;
}

concrete productions top::TypeSuffix
| '*' {-pointer-} { top.pointercount := 1; }
| '&' {-C++-} { top.ignoreMe := true; } -- ignore these
| 'C' {-const-} { top.qualifiers := a:consQualifier(a:constQualifier(location=builtinLoc("host")), a:nilQualifier()); }
| 'D' {-volatile-} { top.qualifiers := a:consQualifier(a:volatileQualifier(location=builtinLoc("host")), a:nilQualifier()); }


nonterminal MaybeDots with hasdots;

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

