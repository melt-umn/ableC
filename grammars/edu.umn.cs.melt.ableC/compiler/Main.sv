grammar edu:umn:cs:melt:ableC:compiler;

import edu:umn:cs:melt:ableC:host;
import edu:umn:cs:melt:ableC:abstractsyntax:host;
import edu:umn:cs:melt:ableC:drivers:compile;
import edu:umn:cs:melt:ableC:drivers:codeProber as cpr;

-- Not used here, but included in the artifact
import edu:umn:cs:melt:ableC:silverconstruction only;

fun main IO<Integer> ::= args::[String] = driver(args, ablecParser);

fun codeProberParse IO<Decorated Compilation> ::= args::[String] =
  cpr:driver(args, ablecParser);
