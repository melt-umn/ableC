grammar edu:umn:cs:melt:ableC:compiler;

import edu:umn:cs:melt:ableC:host;
import edu:umn:cs:melt:ableC:drivers:compile;

fun main IO<Integer> ::= args::[String] = driver(args, ablecParser);

