grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

-- SG attrs

inherited attribute lexEdge::Maybe<Decorated SGNode> occurs on SGNode;
inherited attribute funcEdge::Maybe<Decorated SGNode> occurs on SGNode;
inherited attribute globEdge::Maybe<Decorated SGNode> occurs on SGNode;

inherited attribute tagsSG::Contribs<TagItem> occurs on SGNode;
inherited attribute valsSG::Contribs<ValueItem> occurs on SGNode;
inherited attribute miscsSG::Contribs<MiscItem> occurs on SGNode;
inherited attribute refIdsSG::Contribs<RefIdItem> occurs on SGNode;
inherited attribute defersSG::Contribs<RefIdItem> occurs on SGNode;

-- mimics `env` attribute, but passing down 1 scope graph node instead of a list
-- of different scoping structures for each namespace
-- currently won't be demanded
inherited attribute envScope::Decorated SGNode;


-- Scope prods

nonterminal SGNode;

production mkScope
top::SGNode ::= 
{}

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

-- Helpful declarations

fun placeholderScope Decorated SGNode ::= =
  decorate mkScope() with {
    lexEdge = nothing(); funcEdge = nothing(); globEdge = nothing();
    tagsSG = []; valsSG = []; miscsSG = []; refIdsSG = []; defersSG = [];
  };