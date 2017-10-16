
nonterminal UnaryOp with location, op, opName, pp, host<UnaryOp>, lifted<UnaryOp>, preExpr, noLvalueConversion, typerep, errors, injectedQualifiers, isLValue;

flowtype UnaryOp = decorate {op}, opName {}, preExpr {}, noLvalueConversion {};

autocopy attribute op :: Decorated Expr;
synthesized attribute opName :: String;
synthesized attribute preExpr :: Boolean;
synthesized attribute noLvalueConversion :: Boolean;

autocopy attribute typeop :: Type;

nonterminal UnaryTypeOp with location, typeop, pp, host<UnaryTypeOp>, lifted<UnaryTypeOp>, errors;
flowtype UnaryTypeOp = decorate {typeop};

