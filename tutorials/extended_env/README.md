# Extensible environment
Some extensions may wish to store new types of values in new environment namespaces.  AbleC's environment is structured to make this possible.  

## Environment representation
We must first take a look at how the environment is structured internally.  An environment is represented by the nonterminal `Env`, which has productions `emptyEnv_i`, `addEnv_i`, `openScope_i`, and `globalEnv_i`, which are used to build a hierarchical structure of scopes.  

*(Coming soon!)* [Next section: Type qualifiers](../type_qualifiers/)
