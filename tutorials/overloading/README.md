# Operator overloading
Many extensions involve the use of infix operators for new extension types.  A common desire is to reuse the host operators, instead of introducing new ones only specific to that extension.  This may be done through ableC's operator overloading mechanism.

## Implementing extension types
A common pattern when writing extensions that introduce new, fixed types is to use a struct defined statically in a header file to implement the new type, and the extension to define a new type expression and type then forwards to a reference to this struct.  Since, as discussed in the [section on declarations](../declarations), a struct type is referred to by its refId, the forwarding type must know the refId of the struct in the header file in order to forward.  To solve this problem, we extend GCC's `__attribute__(())` mechanism for specifying an explicit refId for the struct from within the header file.  For example, a struct could be declared as

```c
struct __attribute__((refId("edu:umn:cs:melt:tutorials:ableC:example:foo")) _foo_s {
  double a;
  int b;
};
```

and its type referred to in a forwarding production as

```
abstract production fooType
top::Type ::= q::Qualifiers
{
  top.lpp = pp"foo";
  top.rpp = pp"";
  forwards to
    tagType(
      q,
      refIdTagType(structSEU(), "_foo_s", s"edu:umn:cs:melt:tutorials:ableC:example:foo"));
}
```

This refId should be guaranteed to be unique, thus we recommend that the full grammar name of the extension followed by the type being implemented be used for the refId.  

## Defining overloads
Operator overloading in ableC is implemented as a single-dispatch based on the module name for unary operators and expression constructs, or a choice of double-dispatch on both operands or single-dispatch on one operand for binary operators.  An overload should only be introduced for a new extension type that is not compatible with any host type (or, alternatively, extensions may implement new overloadable operators for host types, but not overload an existing operator for an existing host type - this is analogous to the 'orphaned instance' problem with typeclasses), which essentially includes structs, unions, and enums.  

To specify the module name to use for overloading on a struct, union, or enum declaration, the `module()` GCC `__attribute__` may be used, in exactly the same way as for refIds.  Note the module name and refId are specified separately because when generating structs to implement parameterized types, every struct must have a unique refId but the same module name to use for overloading.  

To specify overloads to use for a specific module name, a set of functions are available in [OpOverload.sv](../../edu.umn.cs.melt.ableC/abstractsyntax/overloadable/OpOverload.sv) that may be aspected to contribute more overloads via collection production attributes.  These `overloads` attributes consist of lists of pairs of module names and extension productions to which to dispatch.  In the case of binary operators, the `overloads` attribute is keyed by pairs of two module names, for each operand, to get an overload for two extension types.  If none of these match, then the `lOverloads` and `rOverloads` attributes are checked for an overload for an extension type and any other type.  

## Example
An example use of overloading may be found in [AbstractSyntax.sv](edu.umn.cs.melt.tutorials.ableC.interval/abstractsyntax/AbstractSyntax.sv), [Type.sv](edu.umn.cs.melt.tutorials.ableC.interval/abstractsyntax/Type.sv), and [interval.xh](include/interval.xh).  This extension provides a new `interval` type implementing a numeric interval, and overloads several unary and binary operators to provide expected arithmetic operations.  These operations are implemented by extension productions forwarding to calls to static functions defined in the header file.  

A more sophisticated use of lifting may be found in the [string extension](https://github.com/melt-umn/ableC-string).  Here several other host constructs are overloaded as well, in addition to defining new overloaded operators.  

[Next section: Extensible env](../extended_env/)
