import edu:umn:cs:melt:ableC:abstractsyntax:injectable;

autocopy attribute lop :: Decorated Expr;
autocopy attribute rop :: Decorated Expr;

nonterminal BinOp with location, lop, rop, opName, pp, host<BinOp>, lifted<BinOp>, typerep, errors, injectedQualifiers, lhsRhsRuntimeMods;
flowtype lhsRhsRuntimeMods {lop, rop} on BinOp;

-- function from temporary variable to code to be inserted
synthesized attribute lhsRhsRuntimeMods :: [LhsOrRhsRuntimeMod] with ++;
flowtype BinOp = decorate {lop, rop}, opName {};

nonterminal AssignOp with location, lop, rop, pp, host<AssignOp>, lifted<AssignOp>, injectedQualifiers;
flowtype AssignOp = decorate {lop, rop};

nonterminal BoolOp with location, lop, rop, pp, host<BoolOp>, lifted<BoolOp>, injectedQualifiers, errors;
flowtype BoolOp = decorate {lop, rop};

nonterminal BitOp with location, lop, rop, pp, host<BitOp>, lifted<BitOp>, injectedQualifiers, errors;
flowtype BitOp = decorate {lop, rop};


nonterminal CompareOp with location, lop, rop, pp, host<CompareOp>, lifted<CompareOp>, injectedQualifiers, errors;
flowtype CompareOp = decorate {lop, rop};

nonterminal NumOp with location, lop, rop, pp, host<NumOp>, lifted<NumOp>, typerep, injectedQualifiers, errors;
flowtype NumOp = decorate {lop, rop};

