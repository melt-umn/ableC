grammar edu:umn:cs:melt:ableC:abstractsyntax:overloadable;

abstract production exprInitializer
top::host:Initializer ::= e::host:Expr
{
  top.pp = e.pp;
  
  forwards to
    case top.host:expectedType.exprInitProd of
    | just(prod) -> prod(e, top.location)
    | nothing() -> host:exprInitializer(e, location=top.location)
    end;
}

abstract production objectInitializer
top::host:Initializer ::= l::host:InitList
{
  top.pp = ppConcat([text("{"), ppImplode(text(", "), l.pps), text("}")]);

  forwards to
    case top.host:expectedType.objectInitProd of
    | just(prod) -> prod(l, top.location)
    | nothing() -> host:objectInitializer(l, location=top.location)
    end;
}