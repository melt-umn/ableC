grammar edu:umn:cs:melt:ableC:compiler;

import edu:umn:cs:melt:ableC:host;
import edu:umn:cs:melt:ableC:drivers:compile;

-- Not used here, but included in the artifact
import edu:umn:cs:melt:ableC:silverconstruction only;

fun main IO<Integer> ::= args::[String] = driver(args, ablecParser);

