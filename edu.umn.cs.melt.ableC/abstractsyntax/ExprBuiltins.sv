

abstract production typesCompatibleExpr
top::Expr ::= l::TypeName  r::TypeName
{
  top.pp = concat([text("__builtin_types_compatible_p("), l.pp, text(", "), r.pp, text(")")]);
  top.errors := l.errors ++ r.errors;
  top.defs = l.defs ++ r.defs;
  top.typerep = builtinType([], signedType(intType()));
}
abstract production vaArgExpr
top::Expr ::= e::Expr  ty::TypeName
{
  top.pp = concat([text("__builtin_va_arg("), e.pp, text(", "), ty.pp, text(")")]);
  top.errors := e.errors ++ ty.errors;
  top.defs = e.defs ++ ty.defs;
  top.typerep = builtinType([], voidType());
}

abstract production offsetofExpr
top::Expr ::= ty::TypeName  e::MemberDesignator
{
  top.pp = concat([text("__builtin_offsetof("), ty.pp, text(", "), e.pp, text(")")]);
  top.errors := ty.errors ++ e.errors;
  top.defs = ty.defs ++ e.defs;
  top.typerep = builtinType([], signedType(intType()));
}

nonterminal MemberDesignator with pp, errors, defs, env, returnType;

abstract production initialMemberDesignator
top::MemberDesignator ::= id::Name
{
  top.pp = id.pp;
  top.errors := [];
  top.defs = [];
}
abstract production fieldMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  id::Name
{
  top.pp = concat([d.pp, text("."), id.pp]);
  top.errors := d.errors;
  top.defs = d.defs;
}
abstract production derefMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  id::Name
{
  top.pp = concat([d.pp, text("->"), id.pp]);
  top.errors := d.errors;
  top.defs = d.defs;
}
abstract production arrayMemberDesignator
top::MemberDesignator ::= d::MemberDesignator  e::Expr
{
  top.pp = concat([d.pp, text("["), e.pp, text("]")]);
  top.errors := d.errors;
  top.defs = d.defs ++ e.defs; -- sigh
}

abstract production isConstantExpr
top::Expr ::= e::Expr
{
  top.pp = concat([text("__builtin_constant_p("), e.pp, text(")")]);
  top.errors := e.errors;
  top.defs = e.defs;
  top.typerep = builtinType([], signedType(intType()));
}

abstract production vaArgPackExpr
top::Expr ::= 
{
  top.pp = text("__builtin_va_arg_pack()");
  top.errors := [];
  top.defs = [];
  top.typerep = builtinType([], voidType());
}

abstract production expectExpr
top::Expr ::= eval::Expr  expected::Expr
{
  top.pp = concat([text("__builtin_expect("), eval.pp, text(", "), expected.pp, text(")")]);
  top.errors := eval.errors ++ expected.errors;
  top.defs = eval.defs ++ expected.defs;
  top.typerep = builtinType([], signedType(intType()));
}

abstract production vaStartExpr
top::Expr ::= lastParam::Name  valist::Name
{
  top.pp = concat([text("__builtin_va_start("), lastParam.pp, text(", "), valist.pp, text(")")]);
  top.errors := [];
  top.defs = [];
  top.typerep = builtinType([], voidType());
}
abstract production vaEndExpr
top::Expr ::= valist::Name
{
  top.pp = concat([text("__builtin_va_end("), valist.pp, text(")")]);
  top.errors := [];
  top.defs = [];
  top.typerep = builtinType([], voidType());
}

