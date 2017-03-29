grammar edu:umn:cs:melt:ableC:abstractsyntax;

{--
 - Functor attribute to compute the host AST corresponding to an extended AST
 - Invariant:
 - All forwarding (extension) productions should leave host undefined
 - All non-forwarding (host) productions should functor-propagate host
 - The exception to this are 'injection' productions such as defsDecl that modify host attributes,
 - but shouldn't really be considered part of the host tree.  
 -}
synthesized attribute host<a>::a;