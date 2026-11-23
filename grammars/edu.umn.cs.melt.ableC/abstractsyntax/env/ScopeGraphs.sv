grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

-- SG attrs

inherited attribute lexEdges::[Decorated SGNode] occurs on SGNode;
inherited attribute globEdges::[Decorated SGNode] occurs on SGNode;
inherited attribute funcEdges::[Decorated SGNode] occurs on SGNode;
inherited attribute valEdges::[Decorated SGNode] occurs on SGNode;
inherited attribute tagEdges::[Decorated SGNode] occurs on SGNode;
inherited attribute refidEdges::[Decorated SGNode] occurs on SGNode;
inherited attribute deferEdges::[Decorated SGNode] occurs on SGNode;
inherited attribute miscEdges::[Decorated SGNode] occurs on SGNode;

-- mimics `env` attribute, but passing down 1 scope graph node instead of a list
-- of different scoping structures for each namespace
-- currently won't be demanded
inherited attribute envScope::Decorated SGNode;

-- Scope prods

synthesized attribute datum::Datum;

nonterminal SGNode with datum;

production mkScope
top::SGNode ::= d::Datum
{ top.datum = d; }

production mkLexScope
top::SGNode ::= 
{ forwards to mkScope(datumNone()); }

production mkValueScope
top::SGNode ::= n::String d::ValueItem
{ forwards to mkScope(datumValue(n, d)); }

production mkTagScope
top::SGNode ::= n::String d::TagItem
{ forwards to mkScope(datumTag(n, d)); }

production mkRefIdScope
top::SGNode ::= n::String d::RefIdItem
{ forwards to mkScope(datumRefId(n, d)); }

production mkDeferredDeclScope
top::SGNode ::= n::String d::Decl
{ forwards to mkScope(datumDeferredDecl(n, ^d)); }

production mkMiscScope
top::SGNode ::= n::String d::MiscItem
{ forwards to mkScope(datumMisc(n, d)); }

-- Datum prods

data nonterminal Datum with name;

production datumNone
top::Datum ::=
{ top.name = ""; }

production datumValue
top::Datum ::= n::String d::ValueItem
{ top.name = n; }

production datumTag
top::Datum ::= n::String d::TagItem
{ top.name = n; }

production datumRefId
top::Datum ::= n::String d::RefIdItem
{ top.name = n; }

production datumDeferredDecl
top::Datum ::= n::String d::Decl
{ top.name = n; }

production datumMisc
top::Datum ::= n::String d::MiscItem
{ top.name = n; }

-- Query using Brzozowski dirivatives

{-
type Predicate = (Boolean ::= Datum);

fun resolve
[Decorated SGNode] ::= p::Predicate r::Regex s::Decorated SGNode
=
  let cont::[Decorated SGNode] =
    let validLabels::[Label] = r.first in
      foldl(
        \acc::(Maybe<Label>, [Decorated SGNode]) nextLab::Label ->
          let prevLab::Maybe<Label> = acc.1 in
            let prevRes::[Decorated SGNode] = acc.2 in
              let nextRes::[Decorated SGNode] = concat(map(resolve(p, r.deriv(nextLab), _),
                                                          nextLab.demand(s))) in
                (just(nextLab), prevRes ++ nextRes)
              end
            end
          end,
        (nothing(), []),
        validLabels
      ).2
    end
  in
    case r.simplify of
    | regexEmpty() -> []
    | _ -> if p(s.datum) && r.nullable then s::cont else cont
    end
  end;
-}