nonterminal AsmStatement with location, pp, host<AsmStatement>, lifted<AsmStatement>, env, returnType, freeVariables;
flowtype AsmStatement = decorate {env, returnType};

nonterminal AsmArgument with location, pp, host<AsmArgument>, lifted<AsmArgument>, env, returnType, freeVariables;
flowtype AsmArgument = decorate {env, returnType};

synthesized attribute exists::Boolean;

nonterminal AsmClobbers with location, pp, exists, host<AsmClobbers>, lifted<AsmClobbers>;
flowtype AsmClobbers = decorate {}, exists {};

nonterminal AsmOperands with location, pp, exists, host<AsmOperands>, lifted<AsmOperands>, env, returnType, freeVariables;
flowtype AsmOperands = decorate {env, returnType}, exists {};

nonterminal AsmOperand with location, pp, host<AsmOperand>, lifted<AsmOperand>, env, returnType, freeVariables;
flowtype AsmOperand = decorate {env, returnType};

