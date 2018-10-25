# Type Qualifiers
Type qualifiers such as `const` and `volatile` prohibit certain operations on
qualified types by inducing a subtyping relationship. In this section we see how
to create new type qualifiers as extensions. In addition to the subtyping
induced by tradition qualifiers, type qualifiers in AbleC can generate code to
be executed at runtime. See our GPCE '17
[paper](https://www-users.cs.umn.edu/~evw/pubs/carlson17gpce/index.html) that
first presented our formulation of type qualifiers as composable language
extensions.

## Background
Type qualifiers are written as annotations on types. To qualify a type `T` with
qualifier `q` we write `q T`. We use the symbol `<=` to denote the subtype
relation, where `T1 <= T2` means that it is acceptable to use a value of type
`T1` in any location where `T2` would be acceptable.

Type qualifiers are associated with a sign that indicates the direction of the
induced subtype relation. A *positive* qualifier `pq` makes a type `T` become
larger, such that `T <= pq T`. A *negative* qualifier `nq` makes a type `T`
become smaller, such that `nq <= T`. The subtype relation induced by a set of
qualifiers `Q` is modeled as a lattice, where the addition of a positive
qualifier annotation (removal of a negative qualifier annotation) on a type
corresponds to a step up the lattice. The relation `Q1 T <= Q2 T` then holds if
and only if the lattice element corresponding to `Q2` dominates that lattice
element corresponding to `Q1`, in other words, that `Q2` contains all of the
positive qualifiers annotating `Q1` and that `Q1` contains all of the negative
qualifiers annotating `Q2`.

## Concrete syntax

The concrete syntax of type qualifiers is traditionally very simple, consisting
of a single keyword derived from the `TypeQualifier_c` nonterminal. The concrete
syntax specification of such a qualifier is below. Although not shown here, the
concrete syntax of type qualifiers in AbleC can be enriched with the
specification of expressive sublanguages; for example, we have developed a
dimensional analysis type qualifier that is parameterized by an arithmetic
expression over the SI units.

```
marking terminal Tainted_t 'tainted' lexer classes {Ckeyword};

concrete production taintedTypeQualifier_c
top::TypeQualifier_c ::= 'tainted'
{
  top.typeQualifiers = foldQualifier([taintedQualifier(location=top.location)]);
  top.mutateTypeSpecifiers = [];
}
```

## Abstract syntax

The sign of a type qualifier is specified by the `qualIsPositive` and
`qualIsNegative` Boolean attributes on the `Qualifier` nonterminal. Qualifiers
that do not induce any subtyping restrictions can be specified by setting both
attributes to true.

```
abstract production taintedQualifier
top::Qualifier ::=
{
  top.pp = pp"tainted";
  top.mangledName = "tainted";
  top.qualIsPositive = true;
  top.qualIsNegative = false;
  top.qualAppliesWithinRef = true;
  top.qualCompat = \qualToCompare::Qualifier ->
    case qualToCompare of
      taintedQualifier() -> true
    | _                  -> false
    end;
  top.errors :=
    if containsQualifier(untaintedQualifier(location=builtin), top.typeToQualify)
    then [err(top.location, "cannot qualify a type as both tainted and untainted")]
    else [];
}
```

*(Coming soon!)* [Next section: Modular determinism](../mda/)

