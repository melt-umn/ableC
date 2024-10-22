grammar edu:umn:cs:melt:ableC:compiler;

import edu:umn:cs:melt:ableC:host;
import edu:umn:cs:melt:ableC:drivers:compile;

function main
IOVal<Integer> ::= args::[String] io_in::IOToken
{
  return driver(args, io_in, ablecParser);
}

