grammar edu:umn:cs:melt:ableC:compiler;

import edu:umn:cs:melt:ableC:host;
import edu:umn:cs:melt:ableC:drivers:compile;

fun main IOVal<Integer> ::= args::[String] io_in::IOToken = driver(args, io_in, ablecParser);

