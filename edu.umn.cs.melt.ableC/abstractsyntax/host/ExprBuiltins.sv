grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production typesCompatibleExpr
top::Expr ::= l::TypeName  r::TypeName
{
  propagate host, lifted;
  top.pp = ppConcat([text("__builtin_types_compatible_p("), l.pp, text(", "), r.pp, text(")")]);
  top.errors := l.errors ++ r.errors;
  top.globalDecls := l.globalDecls ++ r.globalDecls;
  top.defs := l.defs ++ r.defs;
  top.freeVariables = l.freeVariables ++ r.freeVariables;
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
}
abstract production vaArgExpr
top::Expr ::= e::Expr  ty::TypeName
{
  propagate host, lifted;
  top.pp = ppConcat([text("__builtin_va_arg("), e.pp, text(", "), ty.pp, text(")")]);
  top.errors := e.errors ++ ty.errors;
  top.globalDecls := e.globalDecls ++ ty.globalDecls;
  top.defs := e.defs ++ ty.defs;
  top.freeVariables = e.freeVariables ++ ty.freeVariables;
  top.typerep = ty.typerep;
  top.isLValue = false;
}

abstract production offsetofExpr
top::Expr ::= ty::TypeName  e::MemberDesignator
{
  propagate host, lifted;
  top.pp = ppConcat([text("__builtin_offsetof("), ty.pp, text(", "), e.pp, text(")")]);
  top.errors := ty.errors ++ e.errors;
  top.globalDecls := ty.globalDecls ++ e.globalDecls;
  top.defs := ty.defs ++ e.defs;
  top.freeVariables = ty.freeVariables ++ e.freeVariables;
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.isLValue = false;
}

nonterminal MemberDesignator with pp, host<MemberDesignator>, lifted<MemberDesignator>, errors, globalDecls, defs, env, labelEnv, returnType, freeVariables;
flowtype MemberDesignator = decorate {env, labelEnv, returnType};

abstract production initialMemberDesignator
top::MemberDesignator ::= id::Name
{
  propagate host, lifted;
  top.pp = id.pp;
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
}
abstract production fieldMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  id::Name
{
  propagate host, lifted;
  top.pp = ppConcat([d.pp, text("."), id.pp]);
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.defs := d.defs;
  top.freeVariables = d.freeVariables;
}
abstract production derefMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  id::Name
{
  propagate host, lifted;
  top.pp = ppConcat([d.pp, text("->"), id.pp]);
  top.errors := d.errors;
  top.globalDecls := d.globalDecls;
  top.defs := d.defs;
  top.freeVariables = d.freeVariables;
}
abstract production arrayMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  e::Expr
{
  propagate host, lifted;
  top.pp = ppConcat([d.pp, text("["), e.pp, text("]")]);
  top.errors := d.errors;
  top.globalDecls := d.globalDecls ++ e.globalDecls;
  top.defs := d.defs ++ e.defs; -- sigh
  top.freeVariables = d.freeVariables ++ e.freeVariables;
}

abstract production isConstantExpr
top::Expr ::= e::Expr
{
  propagate host, lifted;
  top.pp = ppConcat([text("__builtin_constant_p("), e.pp, text(")")]);
  top.errors := e.errors;
  top.defs := e.defs;
  top.globalDecls := e.globalDecls;
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.freeVariables = e.freeVariables;
  top.isLValue = false;
}

abstract production vaArgPackExpr
top::Expr ::= 
{
  propagate host, lifted;
  top.pp = text("__builtin_va_arg_pack()");
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.typerep = builtinType(nilQualifier(), voidType());
  top.freeVariables = [];
  top.isLValue = false;
}

abstract production expectExpr
top::Expr ::= eval::Expr  expected::Expr
{
  propagate host, lifted;
  top.pp = ppConcat([text("__builtin_expect("), eval.pp, text(", "), expected.pp, text(")")]);
  top.errors := eval.errors ++ expected.errors;
  top.globalDecls := eval.globalDecls ++ expected.globalDecls;
  top.defs := eval.defs ++ expected.defs;
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  top.freeVariables = eval.freeVariables ++ expected.freeVariables;
  top.isLValue = false;
}

abstract production vaStartExpr
top::Expr ::= lastParam::Name  valist::Name
{
  propagate host, lifted;
  top.pp = ppConcat([text("__builtin_va_start("), lastParam.pp, text(", "), valist.pp, text(")")]);
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.typerep = builtinType(nilQualifier(), voidType());
  top.freeVariables = [];
  top.isLValue = false;
}
abstract production vaEndExpr
top::Expr ::= valist::Name
{
  propagate host, lifted;
  top.pp = ppConcat([text("__builtin_va_end("), valist.pp, text(")")]);
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.typerep = builtinType(nilQualifier(), voidType());
  top.freeVariables = [];
  top.isLValue = false;
}

