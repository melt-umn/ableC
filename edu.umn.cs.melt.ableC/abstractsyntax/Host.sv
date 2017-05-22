grammar edu:umn:cs:melt:ableC:abstractsyntax;

{--
 - Functor attribute to compute the host AST corresponding to an extended AST
 - Invariant:
 - All forwarding (extension) productions should leave host undefined
 - All non-forwarding (host) productions should define host
 - Productions that correspond to C should functor-propagate host, while productions
 - part of the 'extended' host language may have other semantics
 -}
synthesized attribute host<a>::a;