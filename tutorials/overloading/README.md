# Operator overloading
Many extensions involve the use of infix operators for new extension types.  A common desire is to reuse the host operators, instead of introducing new ones only specific to that extension.  This may be done through ableC's operator overloading mechanism.

## Implementing extension types
New types in ableC are implemented as new, non-forwarding productions on the `ExtType` nonterminal (this is a *closed nonterminal*, where we allow extensibility via new productions specifiying values for a specific set of attributes, instead of forwarding to something equivalent), wrapped in the `extType :: (Type ::= Qualifiers ExtType)` production.  Every `ExtType` must provide values for at least 4 attributes:
* `pp :: Document`: The showable representation of the type.
* `host :: Type`: The translation of this `ExtType` back into a regular type.  In computing this attribute, the inherited attribute `givenQualifiers :: Qualifiers` is provided, containing the `Qualifiers` given to the enclosing `extType`.  
* `mangledName :: String`: A string representation of the type (without qualifiers) that is a valid C identifier.  
* `isEqualTo :: (Boolean ::= ExtType)`: A function that, when given another `ExtType` as a parameter, tests if the two are equal by pattern matching on the other type.  Note that it should hold that `t1.isEqualTo(t2)` if and only if `t1.mangledName == t2.mangledName`.

To introduce a new `ExtType`, a new extension `BaseTypeExpr` may forward to `extTypeExpr :: (BaseTypeExpr ::= Qualifiers ExtType)`, which has as its `typerep` the corresponding `extType`.  By default, `extType` translates back into `extTypeExpr`, although this can be changed by overriding the `baseTypeExpr` and `typeModifierExpr` attributes on `ExtType`.

A common pattern when writing extensions that introduce new types is to implement them using a struct defined statically in a header file, using this to in constructing the value for the `host` attribute on `ExtType`.  Since, as discussed in the [section on declarations](../declarations), a struct type is referred to by its refId, the forwarding type must know the refId of the struct in the header file in order to forward.  To solve this problem, we extend GCC's `__attribute__(())` mechanism for specifying an explicit refId for the struct from within the header file.  For example, a struct could be declared as

```c
struct __attribute__((refId("edu:umn:cs:melt:tutorials:ableC:example:foo")) _foo_s {
  double a;
  int b;
};
```

and its type referred to in a forwarding production as

```
abstract production fooType
top::ExpType ::=
{
  top.pp = pp"foo";
  top.host =
    extType(
      top.givenQualifiers,
      refIdExtType(structSEU(), "_foo_s", "edu:umn:cs:melt:tutorials:ableC:example:foo"));
  top.mangledName = "edu_umn_cs_melt_tutorials_ableC_example_foo";
  top.isEqualTo = \ other::ExtType -> case other of fooType() -> true | _ -> false end;
}
```

This refId should be guaranteed to be unique, thus we recommend that the full grammar name of the extension followed by the type being implemented be used for the refId.  

## Defining overloads
Operator overloading in ableC is implemented as a single-dispatch based on type for unary operators and expression constructs, or a choice of double-dispatch on either operand for binary operators.  An overload should only be introduced for new `ExtType`s introduced by that extension (or, alternatively, extensions may implement new overloadable operators for existing host/extension types, but not overload an existing operator for an existing type - this is analogous to the 'orphaned instance' problem with typeclasses.)

To specify overloads to use for a specific `ExtType`, a set of attributes are available in [OpOverload.sv](../../edu.umn.cs.melt.ableC/abstractsyntax/overloadable/OpOverload.sv) that may be specified via a number of production attributes of type `Maybe<(Expr ::= ... Location)`, potentially containing a production to apply to compute the forward.  For unary operators and other constructs, this amounts to a single `*Prod` attribute on types, while binary operators have a pair of `l*Prod` and `r*Prod` attributes for the overload on the left and right operand, which may be computed using the `otherType :: Type` attribute containing the type of the other operand.  In addition, some combinations of constructs (such as taking the address of an array subscript or calling a member access) may be overloaded directly via additional attributes, consulted if no direct overload for the involved types is specified.  Default overloads are also automatically generated from explicitly defined overloads, such as `>=` when `<=`, `>` or `<` is explicitly overloaded, and `=` when `&` is explicitly overloaded.  In fact, there is no direct way of overloading assignment to a special construct such as a member access; this can be done automatically by providing an overload for `&` of that construct.

## Example
An example use of overloading may be found in [AbstractSyntax.sv](edu.umn.cs.melt.tutorials.ableC.interval/abstractsyntax/AbstractSyntax.sv) and [Type.sv](edu.umn.cs.melt.tutorials.ableC.interval/abstractsyntax/Type.sv).  This extension provides a new `interval` type implementing a numeric interval, and overloads several unary and binary operators to provide expected arithmetic operations.  These operations are implemented by extension productions forwarding to calls to static functions defined in the header file.  

A more sophisticated use of overloading may be found in the [string extension](https://github.com/melt-umn/ableC-string).  Here several other host constructs are overloaded as well, in addition to defining new overloaded operators.  

[Next section: Extensible env](../extended_env/)
