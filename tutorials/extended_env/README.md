# Extensible environment
Some extensions may wish to store new types of values in new environment namespaces.  AbleC's environment is structured in a way to make this possible.  

See [here](../declarations#environment) for a general description of how the environment is structured - this section assumes that you have read that first.  

## Environment representation
We must first take a look at how the environment is represented internally.  An environment is represented by the type `Decorated Env`, the decorated form of the `Env` nonterminal.  Since `Env` has no inherited attributes, values of this type are always stored in their `Decorated` form.  This is done purely for performance reasons, to avoid needless redecoration whenever a lookup occurs.  
`Env` essentially represents a stack of operations that were performed to build the environment.  It has the following productions that are used by their similarly-named functions to implement these operations:
* `emptyEnv_i :: (Env ::= )`: Simply construct the empty environment.  
* `addEnv_i :: (Env ::= Defs  Decorated Env)`: Add `Defs`, a 'list' nonterminal containing `Def`s, to the environment.  
* `openScope_i :: (Env ::= Decorated Env)`: Create a new scope into which further `Defs` will be added, that will be considered in lookup before the previous scopes.  
* `globalEnv_i :: (Env ::= Decorated Env)`: Create the environment containing only the global scope in the given environment.  This is an important feature that is used by the [lifting mechanism](../lifting/).  

The `Env` nonterminal has attributes such as `labels`, `tags`, `values`, etc. that are used to build up the actual scope representation of a namespace used for lookup.  These are implemented by the type `Scope<a>` which is simply a type alias for `[tm:Map<String a>]`, where a is an item nonterminal such as `LabelItem`, `TagItem`, `ValueItem`, etc. (`tm:Map` is simply a tree map, implemented in Java with a Silver interface for performance reasons.)  Each element of a `Scope` is an individual scope level in the environment for that namespace, so the lookup process works by iteratively checking each map in order until the item is found or the list is empty.  These lists all initially contain one empty map, for the global scope, in the `emptyEnv_i` production.  

The `addEnv_i` production must be able to compute an environment with the added contributions from `Defs`.  These contributions are implemented by the `Contribs<a>` type, which is a type alias for `[Pair<String a>]`, a list of pairs of names and items.  The `Def` and `Defs` nonterminals have attributes such as `labelContribs`, `tagContribs`, `valueContribs`, etc. to compute the contributions to each namespace.  `addEnv_i` then adds the contributions from each namespace to the first map on each scope attribute.  

In addition to the standard `Def` productions defined in [the section on declarations](../declarations#environment), we also have a `Def` production, `globalDefsDef :: (Def ::= [Def])`, that wraps a list of `Def`s to be placed in the global environment.  This must also be handled by the `addEnv_i` production.  This works in a way similar to accumulating `Contribs` on the `Def` and `Defs` nonterminals, except in this case we use the `globalDefs` attribute to accumulate a list of `Def`s to be placed at the global level.  `addEnv_i` folds these `Def` lists into a `Defs` nonterminal, accesses the contribs for each namespace, and inserts them into the last map in each scope list.  

The `openScope_i` production starts a new innermost scope by simply cons'ing a new empty map to the front of the scope lists, and the `globalEnv_i` production accesses the outermost scope by stripping all but the last scope from the lists.  

*(Coming soon!)* [Next section: Type qualifiers](../type_qualifiers/)
