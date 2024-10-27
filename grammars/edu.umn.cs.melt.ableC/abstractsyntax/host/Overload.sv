grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

synthesized attribute arraySubscriptProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype arraySubscriptProd {decorate} on Type, ExtType;

dispatch Call = Expr ::= @fn::Expr args::Exprs;

production bindFnCall implements Call
top::Expr ::= @fn::Expr args::Exprs result::Expr
{
  forwards to letExpr(
    consDecl(bindExprDecl(freshName("f"), @fn),
      consDecl(bindExprsDecls(freshName("a"), @args), nilDecl())),
    @result);
}

synthesized attribute callProd::Maybe<Call> occurs on Type, ExtType;
flowtype callProd {decorate} on Type, ExtType;

dispatch MemberAccess = Expr ::= @e::Expr deref::Boolean name::Name;

production bindMemberAccess implements MemberAccess
top::Expr ::= @e::Expr deref::Boolean name::Name result::Expr
{
  forwards to letExpr(
    consDecl(bindExprDecl(freshName("e"), @e), nilDecl()),
    @result);
}

production callMemberAccess implements MemberAccess
top::Expr ::= @e::Expr deref::Boolean name::Name fn::Name extraArgs::Exprs
{
  forwards to directCallExpr(@fn, consExpr(@e, @extraArgs));
}

-- Helper to supply an overload of -> for pointers when . is overloaded for the base type.
production derefMemberAccess implements MemberAccess
top::Expr ::= @e::Expr deref::Boolean name::Name prod::MemberAccess
{
  production derefE::Expr = if deref then dereferenceExpr(@e) else @e;
  derefE.env = top.env;
  derefE.controlStmtContext = top.controlStmtContext;
  forwards to prod(derefE, false, @name);
}

synthesized attribute memberProd::Maybe<MemberAccess> occurs on Type, ExtType;
flowtype memberProd {decorate} on Type, ExtType;

dispatch MemberCall = Expr ::= @e::Expr deref::Boolean name::Name args::Exprs;

production bindMemberCall implements MemberCall
top::Expr ::= @e::Expr deref::Boolean name::Name args::Exprs result::Expr
{
  forwards to letExpr(
    consDecl(bindExprDecl(freshName("e"), @e),
      consDecl(bindExprsDecls(freshName("a"), @args), nilDecl())),
    @result);
}

-- Helper to supply an overload of -> for pointers when . is overloaded for the base type.
production derefMemberCallAccess implements MemberCall
top::Expr ::= @e::Expr deref::Boolean name::Name args::Exprs prod::MemberCall
{
  production derefE::Expr = if deref then dereferenceExpr(@e) else @e;
  derefE.env = top.env;
  derefE.controlStmtContext = top.controlStmtContext;
  forwards to prod(derefE, false, @name, @args);
}

synthesized attribute memberCallProd::Maybe<MemberCall> occurs on Type, ExtType;
flowtype memberCallProd {decorate} on Type, ExtType;

dispatch ExprInitializer = Initializer ::= e::Expr;

production bindExprInitializer implements ExprInitializer
top::Initializer ::= e::Expr result::Expr
{
  forwards to defaultExprInitializer(letExpr(
    consDecl(bindExprDecl(freshName("e"), @e), nilDecl()),
    @result));
}

production transformExprInitializer implements ExprInitializer
top::Initializer ::= e::Expr result::Initializer
{
  e.env = top.env;
  e.controlStmtContext = top.controlStmtContext;
  forwards to @result;
}

synthesized attribute exprInitProd::Maybe<ExprInitializer> occurs on Type, ExtType;
flowtype exprInitProd {decorate} on Type, ExtType;

dispatch ObjectInitializer = Initializer ::= l::InitList;

production bindObjectInitializer implements ObjectInitializer
top::Initializer ::= l::InitList result::Expr
{
  top.pp = ppConcat([text("{"), ppImplode(text(", "), l.pps), text("}")]);
  forwards to defaultExprInitializer(letExpr(
    consDecl(bindInitListDecls(top.expectedType, freshName("l"), @l), nilDecl()),
    @result));
}

synthesized attribute objectInitProd::Maybe<ObjectInitializer> occurs on Type, ExtType;
flowtype objectInitProd {decorate} on Type, ExtType;

dispatch UnaryUpdateOp = Expr ::= @e::Expr;

production bindUnaryUpdateOp implements UnaryUpdateOp
top::Expr ::= @e::Expr prod::(Expr ::= Expr)
{
  nondecorated local tmp::Name = freshName("e");
  forwards to
    if e.isSimple then prod(^e)
    else stmtExpr(
      declStmt(autoDecl(tmp, hostAddressOfExpr(@e))),
      prod(dereferenceExpr(declRefExpr(tmp))));
}

production callUnaryUpdateOp implements UnaryUpdateOp
top::Expr ::= @e::Expr fn::Name extraArgs::Exprs
{
  forwards to directCallExpr(@fn, consExpr(hostAddressOfExpr(@e), @extraArgs));
}

synthesized attribute preIncProd::Maybe<UnaryUpdateOp> occurs on Type, ExtType;
flowtype preIncProd {decorate} on Type, ExtType;

synthesized attribute preDecProd::Maybe<UnaryUpdateOp> occurs on Type, ExtType;
flowtype preDecProd {decorate} on Type, ExtType;

synthesized attribute postIncProd::Maybe<UnaryUpdateOp> occurs on Type, ExtType;
flowtype postIncProd {decorate} on Type, ExtType;

synthesized attribute postDecProd::Maybe<UnaryUpdateOp> occurs on Type, ExtType;
flowtype postDecProd {decorate} on Type, ExtType;

dispatch UnaryOp = Expr ::= @e::Expr;

production bindUnaryOp implements UnaryOp
top::Expr ::= @e::Expr result::Expr
{
  forwards to letExpr(
    consDecl(bindExprDecl(freshName("op"), @e), nilDecl()),
    @result);
}

production callUnaryOp implements UnaryOp
top::Expr ::= @e::Expr fn::Name extraArgs::Exprs
{
  forwards to directCallExpr(@fn, consExpr(@e, @extraArgs));
}

production transformUnaryOp implements UnaryOp
top::Expr ::= @e::Expr result::Expr
{
  forwards to @result;
}

synthesized attribute addressOfProd::Maybe<UnaryOp> occurs on Type, ExtType;
flowtype addressOfProd {decorate} on Type, ExtType;

synthesized attribute addressOfArraySubscriptProd::Maybe<(Expr ::= Expr Expr)> occurs on Type, ExtType;
flowtype addressOfArraySubscriptProd {decorate} on Type, ExtType;

synthesized attribute addressOfCallProd::Maybe<(Expr ::= Expr Exprs)> occurs on Type, ExtType;
flowtype addressOfCallProd {decorate} on Type, ExtType;

synthesized attribute addressOfMemberProd<a>::Maybe<a>;
attribute addressOfMemberProd<(Expr ::= Expr Name)> occurs on Type;
attribute addressOfMemberProd<(Expr ::= Expr Boolean Name)> occurs on ExtType;
flowtype addressOfMemberProd {decorate} on Type, ExtType;

synthesized attribute dereferenceProd::Maybe<UnaryOp> occurs on Type, ExtType;
flowtype dereferenceProd {decorate} on Type, ExtType;

synthesized attribute positiveProd::Maybe<UnaryOp> occurs on Type, ExtType;
flowtype positiveProd {decorate} on Type, ExtType;

synthesized attribute negativeProd::Maybe<UnaryOp> occurs on Type, ExtType;
flowtype negativeProd {decorate} on Type, ExtType;

synthesized attribute bitNegateProd::Maybe<UnaryOp> occurs on Type, ExtType;
flowtype bitNegateProd {decorate} on Type, ExtType;

synthesized attribute notProd::Maybe<UnaryOp> occurs on Type, ExtType;
flowtype notProd {decorate} on Type, ExtType;

inherited attribute otherType::Type occurs on Type, ExtType;

dispatch AssignOp = Expr ::= @lhs::Expr @rhs::Expr;

inherited attribute bindLhsRefExpr::Expr occurs on Expr;

production bindAssignOp implements AssignOp
top::Expr ::= @lhs::Expr @rhs::Expr result::Expr
{
  local bindLhs::Expr = addressOfExpr(@lhs);
  lhs.bindLhsRefExpr = dereferenceExpr(bindLhs.bindRefExpr);
  forwards to letExpr(
    consDecl(bindExprDecl(freshName("lhs"), @bindLhs),
      consDecl(bindExprDecl(freshName("rhs"), @rhs), nilDecl())),
    @result);
}

production updateAssignOp implements AssignOp
top::Expr ::= @lhs::Expr @rhs::Expr prod::(Expr ::= Expr Expr)
{
  top.pp = forwardParent.pp;
  forwards to bindAssignOp(lhs, rhs,
    eqExpr(lhs.bindLhsRefExpr, prod(lhs.bindLhsRefExpr, rhs.bindRefExpr)));
}

production callAssignOp implements AssignOp
top::Expr ::= @lhs::Expr @rhs::Expr fn::Name extraArgs::Exprs
{
  forwards to directCallExpr(@fn, consExpr(hostAddressOfExpr(@lhs), consExpr(@rhs, @extraArgs)));
}

synthesized attribute eqProd::Maybe<AssignOp> occurs on Type, ExtType;
flowtype eqProd {decorate, otherType} on Type, ExtType;

synthesized attribute eqArraySubscriptProd::Maybe<(Expr ::= Expr Expr Expr)> occurs on Type, ExtType;
flowtype eqArraySubscriptProd {decorate} on Type, ExtType;

synthesized attribute eqCallProd::Maybe<(Expr ::= Expr Exprs Expr)> occurs on Type, ExtType;
flowtype eqCallProd {decorate} on Type, ExtType;

synthesized attribute eqMemberProd<a>::Maybe<a>;
attribute eqMemberProd<(Expr ::= Expr Name Expr)> occurs on Type;
attribute eqMemberProd<(Expr ::= Expr Boolean Name Expr)> occurs on ExtType;
flowtype eqMemberProd {decorate} on Type, ExtType;

synthesized attribute mulEqProd::Maybe<AssignOp> occurs on Type, ExtType;
flowtype mulEqProd {decorate, otherType} on Type, ExtType;

synthesized attribute divEqProd::Maybe<AssignOp> occurs on Type, ExtType;
flowtype divEqProd {decorate, otherType} on Type, ExtType;

synthesized attribute modEqProd::Maybe<AssignOp> occurs on Type, ExtType;
flowtype modEqProd {decorate, otherType} on Type, ExtType;

synthesized attribute addEqProd::Maybe<AssignOp> occurs on Type, ExtType;
flowtype addEqProd {decorate, otherType} on Type, ExtType;

synthesized attribute subEqProd::Maybe<AssignOp> occurs on Type, ExtType;
flowtype subEqProd {decorate, otherType} on Type, ExtType;

synthesized attribute lshEqProd::Maybe<AssignOp> occurs on Type, ExtType;
flowtype lshEqProd {decorate, otherType} on Type, ExtType;

synthesized attribute rshEqProd::Maybe<AssignOp> occurs on Type, ExtType;
flowtype rshEqProd {decorate, otherType} on Type, ExtType;

synthesized attribute andEqProd::Maybe<AssignOp> occurs on Type, ExtType;
flowtype andEqProd {decorate, otherType} on Type, ExtType;

synthesized attribute xorEqProd::Maybe<AssignOp> occurs on Type, ExtType;
flowtype xorEqProd {decorate, otherType} on Type, ExtType;

synthesized attribute orEqProd::Maybe<AssignOp> occurs on Type, ExtType;
flowtype orEqProd {decorate, otherType} on Type, ExtType;

dispatch BinaryOp = Expr ::= @lhs::Expr @rhs::Expr;

production bindBinaryOp implements BinaryOp
top::Expr ::= @lhs::Expr @rhs::Expr result::Expr
{
  forwards to letExpr(
    consDecl(bindExprDecl(freshName("lhs"), @lhs),
      consDecl(bindExprDecl(freshName("rhs"), @rhs), nilDecl())),
    @result);
}

production callBinaryOp implements BinaryOp
top::Expr ::= @lhs::Expr @rhs::Expr fn::Name extraArgs::Exprs
{
  forwards to directCallExpr(@fn, consExpr(@lhs, consExpr(@rhs, @extraArgs)));
}

production transformBinaryOp implements BinaryOp
top::Expr ::= @lhs::Expr @rhs::Expr result::Expr
{
  forwards to @result;
}

synthesized attribute lAndProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lAndProd {decorate, otherType} on Type, ExtType;
synthesized attribute rAndProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rAndProd {decorate, otherType} on Type, ExtType;

synthesized attribute lOrProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lOrProd {decorate, otherType} on Type, ExtType;
synthesized attribute rOrProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rOrProd {decorate, otherType} on Type, ExtType;

synthesized attribute lAndBitProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lAndBitProd {decorate, otherType} on Type, ExtType;
synthesized attribute rAndBitProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rAndBitProd {decorate, otherType} on Type, ExtType;

synthesized attribute lOrBitProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lOrBitProd {decorate, otherType} on Type, ExtType;
synthesized attribute rOrBitProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rOrBitProd {decorate, otherType} on Type, ExtType;

synthesized attribute lXorProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lXorProd {decorate, otherType} on Type, ExtType;
synthesized attribute rXorProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rXorProd {decorate, otherType} on Type, ExtType;

synthesized attribute lLshProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lLshProd {decorate, otherType} on Type, ExtType;
synthesized attribute rLshProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rLshProd {decorate, otherType} on Type, ExtType;

synthesized attribute lRshProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lRshProd {decorate, otherType} on Type, ExtType;
synthesized attribute rRshProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rRshProd {decorate, otherType} on Type, ExtType;

synthesized attribute lEqualsProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lEqualsProd {decorate, otherType} on Type, ExtType;
synthesized attribute rEqualsProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rEqualsProd {decorate, otherType} on Type, ExtType;

synthesized attribute lNotEqualsProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lNotEqualsProd {decorate, otherType} on Type, ExtType;
synthesized attribute rNotEqualsProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rNotEqualsProd {decorate, otherType} on Type, ExtType;

synthesized attribute lLtProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lLtProd {decorate, otherType} on Type, ExtType;
synthesized attribute rLtProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rLtProd {decorate, otherType} on Type, ExtType;

synthesized attribute lGtProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lGtProd {decorate, otherType} on Type, ExtType;
synthesized attribute rGtProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rGtProd {decorate, otherType} on Type, ExtType;

synthesized attribute lLteProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lLteProd {decorate, otherType} on Type, ExtType;
synthesized attribute rLteProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rLteProd {decorate, otherType} on Type, ExtType;

synthesized attribute lGteProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lGteProd {decorate, otherType} on Type, ExtType;
synthesized attribute rGteProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rGteProd {decorate, otherType} on Type, ExtType;

synthesized attribute lAddProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lAddProd {decorate, otherType} on Type, ExtType;
synthesized attribute rAddProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rAddProd {decorate, otherType} on Type, ExtType;

synthesized attribute lSubProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lSubProd {decorate, otherType} on Type, ExtType;
synthesized attribute rSubProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rSubProd {decorate, otherType} on Type, ExtType;

synthesized attribute lMulProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lMulProd {decorate, otherType} on Type, ExtType;
synthesized attribute rMulProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rMulProd {decorate, otherType} on Type, ExtType;

synthesized attribute lDivProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lDivProd {decorate, otherType} on Type, ExtType;
synthesized attribute rDivProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rDivProd {decorate, otherType} on Type, ExtType;

synthesized attribute lModProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype lModProd {decorate, otherType} on Type, ExtType;
synthesized attribute rModProd::Maybe<BinaryOp> occurs on Type, ExtType;
flowtype rModProd {decorate, otherType} on Type, ExtType;

aspect default production
top::Type ::=
{
  top.arraySubscriptProd = nothing();
  top.callProd = nothing();
  top.memberCallProd = nothing();
  top.memberProd = nothing();
  top.exprInitProd = nothing();
  top.objectInitProd = nothing();
  top.preIncProd = nothing();
  top.preDecProd = nothing();
  top.postIncProd = nothing();
  top.postDecProd = nothing();
  top.addressOfProd = nothing();
  top.addressOfArraySubscriptProd = nothing();
  top.addressOfCallProd = nothing();
  top.addressOfMemberProd = nothing();
  top.dereferenceProd = nothing();
  top.positiveProd = nothing();
  top.negativeProd = nothing();
  top.bitNegateProd = nothing();
  top.notProd = nothing();
  top.eqProd = nothing();
  top.eqArraySubscriptProd = nothing();
  top.eqCallProd = nothing();
  top.eqMemberProd = nothing();
  top.mulEqProd = nothing();
  top.divEqProd = nothing();
  top.modEqProd = nothing();
  top.addEqProd = nothing();
  top.subEqProd = nothing();
  top.lshEqProd = nothing();
  top.rshEqProd = nothing();
  top.andEqProd = nothing();
  top.xorEqProd = nothing();
  top.orEqProd = nothing();
  top.lAndProd = nothing();
  top.rAndProd = nothing();
  top.lOrProd = nothing();
  top.rOrProd = nothing();
  top.lAndBitProd = nothing();
  top.rAndBitProd = nothing();
  top.lOrBitProd = nothing();
  top.rOrBitProd = nothing();
  top.lXorProd = nothing();
  top.rXorProd = nothing();
  top.lLshProd = nothing();
  top.rLshProd = nothing();
  top.lRshProd = nothing();
  top.rRshProd = nothing();
  top.lEqualsProd = nothing();
  top.rEqualsProd = nothing();
  top.lNotEqualsProd = nothing();
  top.rNotEqualsProd = nothing();
  top.lLtProd = nothing();
  top.rLtProd = nothing();
  top.lGtProd = nothing();
  top.rGtProd = nothing();
  top.lLteProd = nothing();
  top.rLteProd = nothing();
  top.lGteProd = nothing();
  top.rGteProd = nothing();
  top.lAddProd = nothing();
  top.rAddProd = nothing();
  top.lSubProd = nothing();
  top.rSubProd = nothing();
  top.lMulProd = nothing();
  top.rMulProd = nothing();
  top.lDivProd = nothing();
  top.rDivProd = nothing();
  top.lModProd = nothing();
  top.rModProd = nothing();
}

aspect production pointerType
top::Type ::= q::Qualifiers target::Type
{
  top.memberCallProd = map(derefMemberCallAccess, target.memberCallProd);
  top.memberProd = map(derefMemberAccess, target.memberProd);
  --top.addressOfMemberProd = if top.isDeref then target.addressOfMemberProd else nothing();
  --top.eqMemberProd = if top.isDeref then target.eqMemberProd else nothing();
  
  target.otherType = top.otherType;
}

aspect production extType
top::Type ::= q::Qualifiers  sub::ExtType
{
  top.arraySubscriptProd = sub.arraySubscriptProd;
  top.callProd = sub.callProd;
  top.memberCallProd = sub.memberCallProd;
  top.memberProd = sub.memberProd;
  top.exprInitProd = sub.exprInitProd;
  top.objectInitProd = sub.objectInitProd;
  
  top.preIncProd = sub.preIncProd;
  top.preDecProd = sub.preDecProd;
  top.postIncProd = sub.postIncProd;
  top.postDecProd = sub.postDecProd;
  top.addressOfProd = sub.addressOfProd;
  top.addressOfArraySubscriptProd = sub.addressOfArraySubscriptProd;
  top.addressOfCallProd = sub.addressOfCallProd;
  --top.addressOfMemberProd = sub.addressOfMemberProd;
  top.dereferenceProd = sub.dereferenceProd;
  top.positiveProd = sub.positiveProd;
  top.negativeProd = sub.negativeProd;
  top.bitNegateProd = sub.bitNegateProd;
  top.notProd = sub.notProd;
  
  sub.otherType = top.otherType;
  top.eqProd = sub.eqProd;
  top.eqArraySubscriptProd = sub.eqArraySubscriptProd;
  top.eqCallProd = sub.eqCallProd;
  --top.eqMemberProd = sub.eqMemberProd;
  top.mulEqProd = sub.mulEqProd;
  top.divEqProd = sub.divEqProd;
  top.modEqProd = sub.modEqProd;
  top.addEqProd = sub.addEqProd;
  top.subEqProd = sub.subEqProd;
  top.lshEqProd = sub.lshEqProd;
  top.rshEqProd = sub.rshEqProd;
  top.andEqProd = sub.andEqProd;
  top.xorEqProd = sub.xorEqProd;
  top.orEqProd = sub.orEqProd;
  
  top.lAndProd = sub.lAndProd;
  top.rAndProd = sub.rAndProd;
  top.lOrProd = sub.lOrProd;
  top.rOrProd = sub.rOrProd;
  top.lAndBitProd = sub.lAndBitProd;
  top.rAndBitProd = sub.rAndBitProd;
  top.lOrBitProd = sub.lOrBitProd;
  top.rOrBitProd = sub.rOrBitProd;
  top.lXorProd = sub.lXorProd;
  top.rXorProd = sub.rXorProd;
  top.lLshProd = sub.lLshProd;
  top.rLshProd = sub.rLshProd;
  top.lRshProd = sub.lRshProd;
  top.rRshProd = sub.rRshProd;
  top.lEqualsProd = sub.lEqualsProd;
  top.rEqualsProd = sub.rEqualsProd;
  top.lNotEqualsProd = sub.lNotEqualsProd;
  top.rNotEqualsProd = sub.rNotEqualsProd;
  top.lLtProd = sub.lLtProd;
  top.rLtProd = sub.rLtProd;
  top.lGtProd = sub.lGtProd;
  top.rGtProd = sub.rGtProd;
  top.lLteProd = sub.lLteProd;
  top.rLteProd = sub.rLteProd;
  top.lGteProd = sub.lGteProd;
  top.rGteProd = sub.rGteProd;
  top.lAddProd = sub.lAddProd;
  top.rAddProd = sub.rAddProd;
  top.lSubProd = sub.lSubProd;
  top.rSubProd = sub.rSubProd;
  top.lMulProd = sub.lMulProd;
  top.rMulProd = sub.rMulProd;
  top.lDivProd = sub.lDivProd;
  top.rDivProd = sub.rDivProd;
  top.lModProd = sub.lModProd;
  top.rModProd = sub.rModProd;
}

aspect default production
top::ExtType ::=
{
  top.arraySubscriptProd = nothing();
  top.callProd = nothing();
  top.memberCallProd = nothing();
  top.memberProd = nothing();
  top.exprInitProd = nothing();
  top.objectInitProd = nothing();
  top.preIncProd = nothing();
  top.preDecProd = nothing();
  top.postIncProd = nothing();
  top.postDecProd = nothing();
  top.addressOfProd = nothing();
  top.addressOfArraySubscriptProd = nothing();
  top.addressOfCallProd = nothing();
  top.addressOfMemberProd = nothing();
  top.dereferenceProd = nothing();
  top.positiveProd = nothing();
  top.negativeProd = nothing();
  top.bitNegateProd = nothing();
  top.notProd = nothing();
  top.eqProd = nothing();
  top.eqArraySubscriptProd = nothing();
  top.eqCallProd = nothing();
  top.eqMemberProd = nothing();
  top.mulEqProd = nothing();
  top.divEqProd = nothing();
  top.modEqProd = nothing();
  top.addEqProd = nothing();
  top.subEqProd = nothing();
  top.lshEqProd = nothing();
  top.rshEqProd = nothing();
  top.andEqProd = nothing();
  top.xorEqProd = nothing();
  top.orEqProd = nothing();
  top.lAndProd = nothing();
  top.rAndProd = nothing();
  top.lOrProd = nothing();
  top.rOrProd = nothing();
  top.lAndBitProd = nothing();
  top.rAndBitProd = nothing();
  top.lOrBitProd = nothing();
  top.rOrBitProd = nothing();
  top.lXorProd = nothing();
  top.rXorProd = nothing();
  top.lLshProd = nothing();
  top.rLshProd = nothing();
  top.lRshProd = nothing();
  top.rRshProd = nothing();
  top.lEqualsProd = nothing();
  top.rEqualsProd = nothing();
  top.lNotEqualsProd = nothing();
  top.rNotEqualsProd = nothing();
  top.lLtProd = nothing();
  top.rLtProd = nothing();
  top.lGtProd = nothing();
  top.rGtProd = nothing();
  top.lLteProd = nothing();
  top.rLteProd = nothing();
  top.lGteProd = nothing();
  top.rGteProd = nothing();
  top.lAddProd = nothing();
  top.rAddProd = nothing();
  top.lSubProd = nothing();
  top.rSubProd = nothing();
  top.lMulProd = nothing();
  top.rMulProd = nothing();
  top.lDivProd = nothing();
  top.rDivProd = nothing();
  top.lModProd = nothing();
  top.rModProd = nothing();
}
