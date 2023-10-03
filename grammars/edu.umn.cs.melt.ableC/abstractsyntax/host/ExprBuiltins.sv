grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production typesCompatibleExpr
top::Expr ::= l::TypeName  r::TypeName
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([text("__builtin_types_compatible_p("), l.pp, text(", "), r.pp, text(")")]);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
}
abstract production vaArgExpr
top::Expr ::= e::Expr  ty::TypeName
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables,controlStmtContext;
  top.pp = ppConcat([text("__builtin_va_arg("), e.pp, text(", "), ty.pp, text(")")]);
  top.typerep = ty.typerep;
  top.isLValue = false;
}

abstract production offsetofExpr
top::Expr ::= ty::TypeName  e::MemberDesignator
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([text("__builtin_offsetof("), ty.pp, text(", "), e.pp, text(")")]);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
  top.isSimple = true;
}

tracked nonterminal MemberDesignator with pp, host, errors, globalDecls, functionDecls,
  defs, env, freeVariables, controlStmtContext;
flowtype MemberDesignator = decorate {env, controlStmtContext};

propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext on MemberDesignator;

abstract production initialMemberDesignator
top::MemberDesignator ::= id::Name
{
  top.pp = id.pp;
}
abstract production fieldMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  id::Name
{
  top.pp = ppConcat([d.pp, text("."), id.pp]);
}
abstract production derefMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  id::Name
{
  top.pp = ppConcat([d.pp, text("->"), id.pp]);
}
abstract production arrayMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  e::Expr
{
  top.pp = ppConcat([d.pp, text("["), e.pp, text("]")]);
}

abstract production isConstantExpr
top::Expr ::= e::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([text("__builtin_constant_p("), e.pp, text(")")]);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
}

abstract production vaArgPackExpr
top::Expr ::=
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = text("__builtin_va_arg_pack()");
  top.typerep = builtinType(nilQualifier(), voidType());
  top.isLValue = false;
}

abstract production expectExpr
top::Expr ::= eval::Expr  expected::Expr
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([text("__builtin_expect("), eval.pp, text(", "), expected.pp, text(")")]);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
}

abstract production vaStartExpr
top::Expr ::= lastParam::Name  valist::Name
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([text("__builtin_va_start("), lastParam.pp, text(", "), valist.pp, text(")")]);
  top.typerep = builtinType(nilQualifier(), voidType());
  top.isLValue = false;
}
abstract production vaEndExpr
top::Expr ::= valist::Name
{
  propagate env, host, errors, globalDecls, functionDecls, defs, freeVariables, controlStmtContext;
  top.pp = ppConcat([text("__builtin_va_end("), valist.pp, text(")")]);
  top.typerep = builtinType(nilQualifier(), voidType());
  top.isLValue = false;
}

