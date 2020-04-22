grammar edu:umn:cs:melt:ableC:abstractsyntax:env;

{-- 
 - Silver lacks mutation. As a consequence, we have to simulate the "updating"
 - of a forward declaration of a struct via another namespace of unique
 - tags identifying structures.
 -
 - RefId works as follows: 
 - 'struct foo' forward declaration will resolve to nothing, as so add a
 -  refIdTagItem (note: TAG item) creating a refid(struct, "some key")
 -  N.B. the key doesn't matter except that uniqueness is assured, so perhaps
 -    "struct foo line 2 column 4 unique 37"
 - later, 'struct foo' again will look up and resolve to that refid.
 - later, 'struct foo { ... }' defining the struct will, instead of altering
 - the tag to point to this definition, will instead add the
 - refIdItem that points to the actual definition of this struct.
 -
 - N.B. that if we start with 'struct foo { ... }' with no forward declarations
 - this (1) still creates a refIdTagItem (for the inside of the struct body!)
 - and then (2) creates the structRefIdItem afterward. This is how we distinguish
 - incomplete/complete structs.
 -
 - This unfortunately complicates the types a bit, since
 -}
closed nonterminal RefIdItem with tagEnv, hasConstField;

{-- Name resolves to a full struct declaration -}
abstract production structRefIdItem
top::RefIdItem ::= s::Decorated StructDecl
{
  top.tagEnv = s.tagEnv;
  top.hasConstField := s.hasConstField;
}

{-- Name resolves to a full union declaration -}
abstract production unionRefIdItem
top::RefIdItem ::= s::Decorated UnionDecl
{
  top.tagEnv = s.tagEnv;
  top.hasConstField := s.hasConstField;
}

