# Extensible environment
Some extensions may wish to store new types of values in new environment namespaces.  AbleC's environment is structured in a way to make this possible.  

See [here](../declarations#environment) for a general description of how the environment is structured - this section assumes that you have read that first.  

## Environment representation
We must first take a look at how the environment is represented internally.  An environment is represented by the type `Decorated Env`, the decorated form of the `Env` nonterminal.  Since `Env` has no inherited attributes, values of this type are always stored in their `Decorated` form.  This is done purely for performance reasons, to avoid needless redecoration whenever a lookup occurs.  
`Env` essentially represents a stack of operations that were performed to build the environment.  It has the following productions that are used by their similarly-named functions to implement these operations:
* `emptyEnv_i :: (Env ::= )`: Simply construct the empty environment.  
* `addEnv_i :: (Env ::= Defs  Decorated Env)`: Add `Defs`, a 'list' nonterminal containing `Def`s, to the environment.  
* `openScope_i :: (Env ::= Decorated Env)`: Create a new scope into which further `Defs` will be added, that will be considered in lookup before the existing scopes.  
* `globalEnv_i :: (Env ::= Decorated Env)`: Create the environment containing only the global scope in the given environment.  This is an important feature that is used by the [lifting mechanism](../lifting/).  

The `Env` nonterminal has attributes such as `labels`, `tags`, `values`, etc. that are used to build up the actual scope representation of a namespace, to be used for lookup.  These are implemented by the type `Scope<a>` which is simply a type alias for `[tm:Map<String a>]`, where a is an item nonterminal such as `LabelItem`, `TagItem`, `ValueItem`, etc.  Note that `tm:Map` here is simply a tree map, implemented in Java with a Silver interface for performance reasons.  Each element of a `Scope` is an individual scope level in the environment for that namespace, so the lookup process works by iteratively checking each map in order until the item is found or the list is empty.  These lists all initially contain one empty map, for the global scope, in the `emptyEnv_i` production.  

The `addEnv_i` production must be able to compute an environment with the added contributions from `Defs`.  These contributions are implemented by the `Contribs<a>` type, which is a type alias for `[Pair<String a>]`, a list of pairs of names and items.  The `Def` and `Defs` nonterminals have attributes such as `labelContribs`, `tagContribs`, `valueContribs`, etc. to compute the contributions to each namespace.  `addEnv_i` then adds the contributions from each namespace to the first map on each scope attribute.  

In addition to the standard `Def` productions defined in [the section on declarations](../declarations#environment), we also have a `Def` production, `globalDefsDef :: (Def ::= [Def])`, that wraps a list of `Def`s to be placed in the global environment.  This must also be handled by the `addEnv_i` production.  This works in a way similar to accumulating `Contribs` on the `Def` and `Defs` nonterminals, except in this case we use the `globalDefs` attribute to accumulate a list of `Def`s to be placed at the global level.  `addEnv_i` folds these `Def` lists into a `Defs` nonterminal, accesses the contribs for each namespace, and inserts them into the last map in each scope list.  

The `openScope_i` production starts a new innermost scope by simply cons'ing a new empty map to the front of the scope lists, and the `globalEnv_i` production accesses the outermost scope by stripping all but the last scope from the lists.  

## Extending the environment
Adding additional namespaces to the environment is a fairly straightforward task; we essentially just need to copy the implementation of an existing namespace, adding a new item nonterminal, new `Def` production, new contribs and scope attributes, and aspects for the `Env` productions.  

Note that the new `Def` production does not have a forward defined.  With normal nonterminals, this usually runs afoul of the modular well definedness analysis, since extensions are usually allowed to introduce new attributes on a nonterminal which would be computed via the forward.  However, `Def` is a closed nonterminal, that instead of restricting productions to be expressed in terms of host production and allowing arbitrary attributes, restricts attributes to be expressed in terms of host attributes and allows arbitrary new productions.  These new attributes must have default equations, which can in turn rely on other host attributes.  However, in the case of `Def`, the defaults for the contribs attributes are empty lists, and individual `Def` productions can override these equations explicitly.  See the MELT website (here)[http://melt.cs.umn.edu/silver/doc/ref/decl/nonterminals/] for further explaination of closed nonterminals.  

Another issue is how to actually introduce new `Def`s from an extension production, for example a `Decl` that does not otherwise have a C translation.  The most obvious way would be to simply set the value of the `defs` attribute to include the new `Def` and forward to `decls(nilDecl())`.  However, this is interfering because it violates the coherence property that `defs` must be the same both on the original and forward trees.  To get around this issue, we introduce the `defsDecl :: (Decl ::= [Def])` production, that sets `defs` to an arbitrary list, and transforms away to `decls(nilDecl())` in the host tree.  Note that the extension writer must be careful not to introduce host `Def`s here, which could lead to errors in the host tree once the extension layer is transfomed away.  

## Example
An example of extending the environment with a new namespace can be found in [Env.sv](edu.umn.cs.melt.tutorials.ableC.intconst/abstractsyntax/Env.sv).  This example extension adds macro-like, compile-time integer constants, utilizing a new and seperate namespace.  

This mechanism is also used in practice by the [template extension](https://github.com/melt-umn/ableC-templating) to store information about template function and type declarations in a seperate namespace.  

*(Coming soon!)* [Next section: Type qualifiers](../type_qualifiers/)
