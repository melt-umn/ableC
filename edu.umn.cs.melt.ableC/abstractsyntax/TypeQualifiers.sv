grammar edu:umn:cs:melt:ableC:abstractsyntax;

nonterminal Qualifiers with mangledName, qualifiers, pps, host<Qualifiers>, typeToQualify, errors;

autocopy attribute typeToQualify :: Type;

synthesized attribute injectedQualifiers :: [Qualifier] with ++;
flowtype injectedQualifiers {op} on UnaryOp;
flowtype injectedQualifiers {lop, rop} on
  BinOp, AssignOp, BoolOp, BitOp, CompareOp, NumOp;

flowtype Qualifiers = decorate {}, qualifiers {}, errors {typeToQualify};

synthesized attribute qualifiers :: [Qualifier];

{-- Type qualifiers (cv or cvr qualifiers) -}
closed nonterminal Qualifier with location, pp, qualIsPositive, qualIsNegative, qualAppliesWithinRef, qualCompat, qualIsHost, mangledName, typeToQualify, errors;
flowtype Qualifier = decorate {}, qualIsPositive {}, qualIsNegative {}, qualAppliesWithinRef {}, qualCompat {}, qualIsHost {}, errors {typeToQualify};

synthesized attribute qualIsPositive :: Boolean;
synthesized attribute qualIsNegative :: Boolean;
-- Variables refer to memory locations and thus there is an implicit ref
--   wrapping stated types (given `int x;', the type of x is ref(int)) which is
--   implicitly dereferenced when used as an r-value. This attribute specifies
--   where the qualifier applies, e.g. `const int' should be `const ref(int)'
--   but `nonzero int' should be `ref(nonzero int)'.
synthesized attribute qualAppliesWithinRef :: Boolean;

synthesized attribute qualCompat :: (Boolean ::= Qualifier);

-- set to false to drop qualifier in generated code
synthesized attribute qualIsHost :: Boolean;

{-- Specifiers that apply to specific types.
 - e.g. Function specifiers (inline, _Noreturn)
 -      Alignment specifiers (_Alignas)
 -}
nonterminal SpecialSpecifier with pp, host<SpecialSpecifier>, lifted<SpecialSpecifier>, env, returnType, errors, globalDecls, defs;
flowtype SpecialSpecifier = decorate {env, returnType};

nonterminal SpecialSpecifiers with pps, host<SpecialSpecifiers>, lifted<SpecialSpecifiers>, env, returnType, errors, globalDecls, defs;
flowtype SpecialSpecifiers = decorate {env, returnType};

