# Type Qualifiers
Type qualifiers such as `const` and `volatile` prohibit certain operations on
qualified types by inducing a subtyping relationship. In this section we see how
to create new type qualifiers as extensions. In addition to the subtyping
induced by tradition qualifiers, type qualifiers in AbleC can generate code to
be executed at runtime. See our GPCE '17
[paper](https://www-users.cs.umn.edu/~evw/pubs/carlson17gpce/index.html) that
first presented our formulation of type qualifiers as composable language
extensions. We build upon [Jeffrey Foster's work](https://talks.cs.umd.edu:3000/display/publications)
on type qualifiers, especially *A Theory of Type Qualifiers* (PLDI '99).

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
element corresponding to `Q1`, in other words, that all qualifiers annotating `Q1`
but not `Q2` are negative and that all qualifiers annotating `Q2` but not `Q1`
are positive.

The meaning of a variable reference in C differs depending whether the reference
is used as an l-value (on the left-hand side of an assignment) or as an r-value.
As an l-value, the reference refers to the memory location of the variable; as
an r-value, it refers to the value stored at that memory location. Thus, a
variable declared to be of type `T` can be thought of as being of type `reference T`
and of being automatically dereferenced when used as an r-value. When annotating
a type `T` with a qualifier, we may wish for the qualifier to be applied to this
implicit reference (e.g. `const`) or we may wish for the qualifier to be applied
directly on `T` (e.g. `nonnull`), but because the reference is implicit the
programmer has no means to specify this. Thus, this behavior must be specified
per qualifier. We say that a qualifier either applies at the *ref level* or at the
*value level*.


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

The following attributes on the `Qualifier` nonterminal specify the behavior of
the qualifier:
* `qualIsPositive` and `qualIsNegative` specify the sign of
  a type qualifier. Qualifiers that do not induce any subtyping restrictions
  can be specified by setting both attributes to true.
* `qualAppliesWithinRef` is set to `true` to specify that the qualifier
  applies at the value level and is set to `false` to specify that it
  applies at the reference level.
* `qualCompat` is a function-valued attribute that, given a qualifier to compare
  to, returns true if the qualifier is compatible with this qualifier. Often this
  will simply pattern match to check that both qualifiers were constructed by the
  same production, but more complex analyses are possible. For example, a dimensional
  analysis qualifier may consider qualifiers of `units(km/s^2)` to be compatible with
  `units(m^3/(s*s))`.
* `errors` is used to restrict qualifiers from annotated certain types. The `tainted`
  qualifier below raises an error if the type being qualified is also annotated with
  `untainted`. The `typeToQualify` inherited attribute on `Qualifier` is useful here.

The complete specification of the `tainted` qualifier is below.

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

