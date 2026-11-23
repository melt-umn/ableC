grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

import silver:util:treemap as tm;

--

{- Regex productions for doing scope graph queries, dumped in here as proof of
 - concept for using SGs in AbleC. Better implementation will build on/replace.
 -}

--

nonterminal Regex;

-- Transform a Regex to an equivalent fully simplified one
synthesized attribute simplify::Regex occurs on Regex;
-- Theorem 3.1 of Brzozowski (1964). Derivative with respect to a single token
synthesized attribute deriv::(Regex ::= Label) occurs on Regex;
-- Definition 3.2 of Brzozowski (1964), return epsilon if Regex contains epsilon
synthesized attribute hasEps::Regex occurs on Regex;
-- True if epsilon is a valid string in the language of the Regex
synthesized attribute nullable::Boolean occurs on Regex;
-- Compute first set of a Regex
synthesized attribute first::[Label] occurs on Regex;

production regexLabel
top::Regex ::= label::Label
{
  top.hasEps = regexEmpty();
  top.deriv = \l::Label -> if l.name == label.name 
                           then regexEpsilon() else regexEmpty();
  top.simplify = ^top;
  top.nullable = false;
  top.first = [^label];
}

production regexEpsilon
top::Regex ::=
{
  top.hasEps = regexEpsilon();
  top.deriv = \_ -> regexEmpty();
  top.simplify = ^top;
  top.nullable = true;
  top.first = [];
}

production regexEmpty
top::Regex ::=
{
  top.hasEps = regexEmpty();
  top.deriv = \_ -> regexEmpty();
  top.simplify = ^top;
  top.nullable = false;
  top.first = [];
}

production regexCat
top::Regex ::= left::Regex right::Regex
{
  top.hasEps = regexAnd(left.hasEps, right.hasEps);
  top.deriv = \l -> regexOr(regexCat(left.deriv(l), ^right),
                            regexCat(left.hasEps, right.deriv(l)));
  top.simplify = 
    let simpR1::Regex = left.simplify in
    let simpR2::Regex = right.simplify in
      case (simpR1, simpR2) of
      | (regexEmpty(), _) -> regexEmpty()
      | (_, regexEmpty()) -> regexEmpty()
      | (regexEpsilon(), regexEpsilon()) -> regexEpsilon()
      | (regexEpsilon(), _) -> simpR2
      | (_, regexEpsilon()) -> simpR1
      | (_, _) -> regexCat(simpR1, simpR2)
      end
    end end;
  top.nullable = left.nullable && right.nullable;
  top.first = if !left.nullable then left.first else union(left.first, right.first); 
}

production regexOr
top::Regex ::= left::Regex right::Regex
{
  top.hasEps = regexOr(left.hasEps, right.hasEps);
  top.deriv = \l -> regexOr(left.deriv(l), right.deriv(l));
  top.simplify =
    let simpR1::Regex = left.simplify in
    let simpR2::Regex = right.simplify in
      case (simpR1, simpR2) of
      | (regexEmpty(), _) -> simpR2
      | (_, regexEmpty()) -> simpR1
      | (regexEpsilon(), regexEpsilon()) -> regexEpsilon()
      | (regexEpsilon(), _) -> regexOr(regexEpsilon(), simpR2)
      | (_, regexEpsilon()) -> regexOr(simpR1, regexEpsilon())
      | (_, _) -> regexOr(simpR1, simpR2)
      end
    end end;
  top.nullable = left.nullable || right.nullable;
  top.first = union(left.first, right.first);
}

production regexAnd
top::Regex ::= left::Regex right::Regex
{
  top.hasEps = regexAnd(left.hasEps, right.hasEps);
  top.deriv = \l -> regexAnd(left.deriv(l), right.deriv(l));
  top.simplify =
    let simpR1::Regex = left.simplify in
    let simpR2::Regex = right.simplify in
      case (simpR1, simpR2) of
      | (regexEmpty(), _) -> regexEmpty()
      | (_ , regexEmpty()) -> regexEmpty()
      | (regexEpsilon(), sub) -> if sub.nullable then regexEpsilon() else regexEmpty()
      | (sub, regexEpsilon()) -> if sub.nullable then regexEpsilon() else regexEmpty()
      | (_, _) -> regexAnd(simpR1, simpR2)
      end
    end end;
  top.nullable = left.nullable && right.nullable;
  top.first = intersect(left.first, right.first);
}

production regexStar
top::Regex ::= sub::Regex
{
  top.hasEps = regexEpsilon();
  top.deriv = \l -> regexCat(sub.deriv(l), regexStar(^sub));
  top.simplify =
    let simpR::Regex = sub.simplify in 
      case simpR of
      | regexEmpty() -> regexEmpty()
      | regexEpsilon() -> regexEpsilon()
      | _ -> regexStar(simpR)
      end
    end;
  top.nullable = true;
  top.first = sub.first;
}

production regexPlus
top::Regex ::= sub::Regex
{ forwards to regexCat(^sub, regexStar(^sub)); }

production regexMaybe
top::Regex ::= sub::Regex
{ forwards to regexOr(regexEpsilon(), ^sub); }

--

production regexLex
top::Regex ::=
{ forwards to regexLabel(labelLex()); }

production regexFunc
top::Regex ::=
{ forwards to regexLabel(labelFunc()); }

production regexGlob
top::Regex ::=
{ forwards to regexLabel(labelGlob()); }

production regexVal
top::Regex ::=
{ forwards to regexLabel(labelVal()); }

production regexTag
top::Regex ::=
{ forwards to regexLabel(labelTag()); }

production regexRefId
top::Regex ::=
{ forwards to regexLabel(labelRefId()); }

production regexDefer
top::Regex ::=
{ forwards to regexLabel(labelDefer()); }

production regexMisc
top::Regex ::=
{ forwards to regexLabel(labelMisc()); }

--

nonterminal Label;

synthesized attribute name::String occurs on Label;

instance Eq Label {
  eq = \l::Label r::Label -> l.name == r.name;
}

production labelLex
top::Label ::=
{ top.name = "lex"; }

production labelFunc
top::Label ::=
{ top.name = "func"; }

production labelGlob
top::Label ::=
{ top.name = "glob"; }

production labelVal
top::Label ::=
{ top.name = "val"; }

production labelTag
top::Label ::=
{ top.name = "tag"; }

production labelRefId
top::Label ::=
{ top.name = "refid"; }

production labelDefer
top::Label ::=
{ top.name = "defer"; }

production labelMisc
top::Label ::=
{ top.name = "misc"; }