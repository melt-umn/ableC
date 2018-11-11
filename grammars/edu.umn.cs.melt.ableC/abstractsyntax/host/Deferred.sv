grammar edu:umn:cs:melt:ableC:abstractsyntax:host;

inherited attribute givenDeferredDecls::[Pair<(Boolean ::= Decorated Env) Decorated Decl>];
synthesized attribute deferredDecls::[Pair<(Boolean ::= Decorated Env) Decorated Decl>];

flowtype deferredDecls {decorate} on Decls, Decl;

function partitionDeferredDecls
Pair<[Decorated Decl] [Pair<(Boolean ::= Decorated Env) Decorated Decl>]> ::= dds::[Pair<(Boolean ::= Decorated Env) Decorated Decl>]  env::Decorated Env
{
  return
    case dds of
    | pair(cond, d) :: rest ->
      let res::Pair<[Decorated Decl] [Pair<(Boolean ::= Decorated Env) Decorated Decl>]> = partitionDeferredDecls(rest, env)
      in
        if cond(env)
        then pair(d :: res.fst, res.snd)
        else pair(res.fst, head(dds) :: res.snd)
      end
    | [] -> pair([], [])
    end;
}

abstract production deferredDecl
top::Decl ::= cond::(Boolean ::= Decorated Env) d::Decl
{
  propagate host;
  top.pp = ppConcat([pp"deferredDecl{", d.pp, pp"}"]);
  top.lifted = decls(nilDecl());
  top.errors := [];
  top.globalDecls := [];
  top.defs := [];
  top.freeVariables = [];
  top.deferredDecls = [pair(cond, d)];
}
