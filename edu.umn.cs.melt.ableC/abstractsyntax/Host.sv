grammar edu:umn:cs:melt:ableC:abstractsyntax;

{--
 - Functor attribute to compute the host AST corresponding to an extended AST
 - Invariant:
 - All non-forwarding (host) productions should functor-propagate host
 - All forwarding (extension) productions should leave it undefined
 -}
synthesized attribute host<a>::a;