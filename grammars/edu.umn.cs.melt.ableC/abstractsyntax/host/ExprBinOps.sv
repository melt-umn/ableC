grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

abstract production eqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ assignErrors(lhs, rhs, top.location) ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production mulEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("*="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ assignErrors(lhs, rhs, top.location) ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production divEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("/="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ assignErrors(lhs, rhs, top.location) ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production modEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("%="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ assignErrors(lhs, rhs, top.location) ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production addEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("+="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ assignErrors(lhs, rhs, top.location) ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production subEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("-="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ assignErrors(lhs, rhs, top.location) ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production lshEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ assignErrors(lhs, rhs, top.location) ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production rshEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ assignErrors(lhs, rhs, top.location) ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production andEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("&="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ assignErrors(lhs, rhs, top.location) ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production xorEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("^="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ assignErrors(lhs, rhs, top.location) ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production orEqExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("|="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ assignErrors(lhs, rhs, top.location) ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = lhs.typerep.defaultLvalueConversion;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

function assignErrors
[Message] ::= lhs::Decorated Expr  rhs::Decorated Expr  loc::Location
{
	return
    (if typeAssignableTo(lhs.typerep, rhs.typerep)
     then
       (if containsQualifier(constQualifier(location=bogusLoc()), lhs.typerep)
        then [err(loc, "Assignment of read-only variable")]
        else []) ++
       case lhs.typerep of
         extType(_, refIdExtType(_, _, refId)) ->
           case lookupRefId(refId, lhs.env) of
             item :: _ ->
               if item.hasConstField
               then [err(loc, s"Assignment of read-only variable (${show(80, lhs.pp)} has const fields)")]
               else []
           | [] -> []
           end 
       | _ -> []
       end
     else [err(loc, "Incompatible type in rhs of assignment, expected " ++ showType(lhs.typerep) ++ " but found " ++ showType(rhs.typerep))]) ++
    if lhs.isLValue then []
      else [err(lhs.location, "lvalue required as left operand of assignment")];
}

abstract production andExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("&&"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production orExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("||"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production andBitExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("&"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production orBitExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("|"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production xorExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("^"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production lshExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("<<"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production rshExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text(">>"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production equalsExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("=="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production notEqualsExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("!="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production gtExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text(">"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production ltExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("<"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production gteExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text(">="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production lteExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("<="), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = builtinType(nilQualifier(), signedType(intType()));
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production addExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("+"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualAdditiveConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production subExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("-"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualSubtractiveConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production mulExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("*"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production divExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("/"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production modExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), text("%"), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = usualArithmeticConversionsOnTypes(lhs.typerep, rhs.typerep);
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

abstract production commaExpr
top::Expr ::= lhs::Expr rhs::Expr
{
  propagate host, lifted;
  top.pp = parens( ppConcat([lhs.pp, space(), comma(), space(), rhs.pp]) );
  top.errors := lhs.errors ++ rhs.errors;
  top.globalDecls := lhs.globalDecls ++ rhs.globalDecls;
  top.functionDecls := lhs.functionDecls ++ rhs.functionDecls;
  top.defs := lhs.defs ++ rhs.defs;
  top.freeVariables :=
    lhs.freeVariables ++
    removeDefsFromNames(lhs.defs, rhs.freeVariables);
  top.typerep = rhs.typerep;
  rhs.env = addEnv(lhs.defs, lhs.env);
  top.isLValue = false;
}

