grammar edu:umn:cs:melt:ableC:compiler;

imports edu:umn:cs:melt:ableC:host;
imports edu:umn:cs:melt:ableC:drivers:compile;

-- Not used here, but included in the artifact
imports edu:umn:cs:melt:ableC:silverconstruction;

fun main IO<Integer> ::= args::[String] = driver(args, ablecParser);

