grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

abstract production exprInitializer
top::host:Initializer ::= e::host:Expr
{
  propagate env, host:controlStmtContext;
  top.pp = e.pp;
  
  forwards to
    case top.host:expectedType.exprInitProd of
    | just(prod) -> prod(host:decExpr(e))
    | nothing() -> host:exprInitializer(@e)
    end;
}

abstract production objectInitializer
top::host:Initializer ::= l::host:InitList
{
  top.pp = ppConcat([text("{"), ppImplode(text(", "), l.pps), text("}")]);

  forwards to
    case top.host:expectedType.objectInitProd of
    | just(prod) -> prod(l)
    | nothing() -> host:objectInitializer(l)
    end;
}