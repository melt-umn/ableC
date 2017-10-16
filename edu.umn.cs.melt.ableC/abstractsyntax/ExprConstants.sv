nonterminal NumericConstant with location, pp, host<NumericConstant>, lifted<NumericConstant>, errors, env, constanttyperep;
flowtype NumericConstant = decorate {env}, constanttyperep {decorate};

synthesized attribute constanttyperep :: BuiltinType;

nonterminal IntSuffix with constinttyperep; -- nothing, L, LL
synthesized attribute constinttyperep :: IntegerType;

nonterminal FloatSuffix with constfloattyperep; -- nothing, F, L
synthesized attribute constfloattyperep :: RealType;

nonterminal CharPrefix; -- nothing, L, u, U

