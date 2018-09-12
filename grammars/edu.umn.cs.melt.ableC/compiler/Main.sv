grammar edu:umn:cs:melt:ableC:compiler;

import edu:umn:cs:melt:ableC:host;
import edu:umn:cs:melt:ableC:drivers:parseAndPrint;

function main
IOVal<Integer> ::= args::[String] io_in::IO
{
  return driver(args, io_in, ablecParser);
}

