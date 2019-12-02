grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production typesCompatibleExpr
top::Expr ::= l::TypeName  r::TypeName
{
  propagate host;
  top.pp = ppConcat([text("__builtin_types_compatible_p("), l.pp, text(", "), r.pp, text(")")]);
  top.errors := l.errors ++ r.errors;
  top.globalDecls := l.globalDecls ++ r.globalDecls;
  top.functionDecls := l.functionDecls ++ r.functionDecls;
  top.defs := l.defs ++ r.defs;
  top.freeVariables := l.freeVariables ++ r.freeVariables;
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
}
abstract production vaArgExpr
top::Expr ::= e::Expr  ty::TypeName
{
  propagate host;
  top.pp = ppConcat([text("__builtin_va_arg("), e.pp, text(", "), ty.pp, text(")")]);
  top.errors := e.errors ++ ty.errors;
  top.globalDecls := e.globalDecls ++ ty.globalDecls;
  top.functionDecls := e.functionDecls ++ ty.functionDecls;
  top.defs := e.defs ++ ty.defs;
  top.freeVariables := e.freeVariables ++ ty.freeVariables;
  top.typerep = ty.typerep;
  top.isLValue = false;
}

abstract production offsetofExpr
top::Expr ::= ty::TypeName  e::MemberDesignator
{
  propagate host;
  top.pp = ppConcat([text("__builtin_offsetof("), ty.pp, text(", "), e.pp, text(")")]);
  top.errors := ty.errors ++ e.errors;
  top.globalDecls := ty.globalDecls ++ e.globalDecls;
  top.functionDecls := ty.functionDecls ++ e.functionDecls;
  top.defs := ty.defs ++ e.defs;
  top.freeVariables := ty.freeVariables ++ e.freeVariables;
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
}

nonterminal MemberDesignator with pp, host<MemberDesignator>, errors, globalDecls, functionDecls, defs, env, returnType, freeVariables;
flowtype MemberDesignator = decorate {env, returnType};

abstract production initialMemberDesignator
top::MemberDesignator ::= id::Name
{
  propagate host;
  top.pp = id.pp;
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.freeVariables := [];
}
abstract production fieldMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  id::Name
{
  propagate host;
  top.pp = ppConcat([d.pp, text("."), id.pp]);
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.functionDecls := d.functionDecls;
  top.defs := d.defs;
  top.freeVariables := d.freeVariables;
}
abstract production derefMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  id::Name
{
  propagate host;
  top.pp = ppConcat([d.pp, text("->"), id.pp]);
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.functionDecls := d.functionDecls;
  top.defs := d.defs;
  top.freeVariables := d.freeVariables;
}
abstract production arrayMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  e::Expr
{
  propagate host;
  top.pp = ppConcat([d.pp, text("["), e.pp, text("]")]);
  top.errors := d.errors;
  top.globalDecls := d.globalDecls ++ e.globalDecls;
  top.functionDecls := d.functionDecls ++ e.functionDecls;
  top.defs := d.defs ++ e.defs; -- sigh
  top.freeVariables := d.freeVariables ++ e.freeVariables;
}

abstract production isConstantExpr
top::Expr ::= e::Expr
{
  propagate host;
  top.pp = ppConcat([text("__builtin_constant_p("), e.pp, text(")")]);
  top.errors := e.errors;
  top.defs := e.defs;
  top.globalDecls := e.globalDecls;
  top.functionDecls := e.functionDecls;
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.freeVariables := e.freeVariables;
  top.isLValue = false;
}

abstract production vaArgPackExpr
top::Expr ::= 
{
  propagate host;
  top.pp = text("__builtin_va_arg_pack()");
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.typerep = builtinType(nilQualifier(), voidType());
  top.freeVariables := [];
  top.isLValue = false;
}

abstract production expectExpr
top::Expr ::= eval::Expr  expected::Expr
{
  propagate host;
  top.pp = ppConcat([text("__builtin_expect("), eval.pp, text(", "), expected.pp, text(")")]);
  top.errors := eval.errors ++ expected.errors;
  top.globalDecls := eval.globalDecls ++ expected.globalDecls;
  top.functionDecls := eval.functionDecls ++ expected.functionDecls;
  top.defs := eval.defs ++ expected.defs;
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.freeVariables := eval.freeVariables ++ expected.freeVariables;
  top.isLValue = false;
}

abstract production vaStartExpr
top::Expr ::= lastParam::Name  valist::Name
{
  propagate host;
  top.pp = ppConcat([text("__builtin_va_start("), lastParam.pp, text(", "), valist.pp, text(")")]);
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.typerep = builtinType(nilQualifier(), voidType());
  top.freeVariables := [];
  top.isLValue = false;
}
abstract production vaEndExpr
top::Expr ::= valist::Name
{
  propagate host;
  top.pp = ppConcat([text("__builtin_va_end("), valist.pp, text(")")]);
  top.errors := [];
  top.globalDecls := [];
  top.functionDecls := [];
  top.defs := [];
  top.typerep = builtinType(nilQualifier(), voidType());
  top.freeVariables := [];
  top.isLValue = false;
}

